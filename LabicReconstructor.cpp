#include "LabicReconstructor.h"

using namespace std;
using namespace pcl;
using namespace cv;
using namespace labic;

LabicReconstructor::LabicReconstructor(int _minFeature, int _maxFeature) {
	
	ID = 0;
	
	minFeatures     = _minFeature;
	maxFeatures     = _maxFeature;
	maxDetectionIte = 100;
	minMatches      = 10;
	maxMatchDistance = 10;
	
	adjuster  = new FastAdjuster(100, true);
	extractor = new BriefDescriptorExtractor();
	matcher   = new BFMatcher(NORM_HAMMING, true); // gives infinite distance between matchings
	matcher2  = new BFMatcher(NORM_HAMMING, false);
	
	RANSACDist = 2.0;
	RANSACConf = .99;
};

bool LabicReconstructor::mainLoopPart(const int t) {
    if (cv->isReady()) {
        cout << endl << "[LabicReconstructor] Reconstructor got frames. Reconstructing..." << endl;
        
        performLoop(cv->rgbCurrent, cv->rgbPrevious, cv->depthCurrent, cv->depthPrevious);
        
        cout << "[LabicReconstructor] Finished reconstruction loop" << endl << endl;
        
        cv->restartState();
    }
    
    return true;
}

void LabicReconstructor::reconstruct() {
    cout << "[LabicReconstructor] Reconstructor initialized" << endl;
    /*
    while (!cv->isReady()) {
        // wait...
    }*/
    
    //cout << "[LabicReconstructor] Ready! Starting reconstructor" << endl;
}

void LabicReconstructor::performLoop(const Mat& rgbCurrent,
								  const Mat& rgbPrevious,
								  const uint16_t* depthCurrent,
								  const uint16_t* depthPrevious) {
	
	vector<KeyPoint> featuresCurrent, featuresPrevious;
	Mat descriptorsCurrent, descriptorsPrevious;
	vector<DMatch> relatedFeatures;
    vector<Point2f> featurePointsCurrent, featurePointsPrevious;
	PointCloud<PointXYZRGB> cloudCurrent, cloudPrevious, featureCloudCurrent, featureCloudPrevious, transformedCloudCurrent;
	//pcl::registration::TransformationEstimationSVD<PointXYZRGB, PointXYZRGB, float> estimator;
	Eigen::Matrix4f transform = Eigen::Matrix4f::Zero();
    vector<int> consensusSetIndexes;
	
	// 1. Extract features from both images
	extractRGBFeatures(rgbPrevious, featuresPrevious, descriptorsPrevious);
	extractRGBFeatures(rgbCurrent, featuresCurrent, descriptorsCurrent);
	
	// 2. Get relationship (matches) between features from both images
	matchFeatures(featuresPrevious, descriptorsPrevious, featuresCurrent, descriptorsCurrent, relatedFeatures);
    cv->showMatchesPreview(rgbCurrent, featuresCurrent, rgbPrevious, featuresPrevious, relatedFeatures);
    featurePointsPrevious.reserve(relatedFeatures.size());
    featurePointsCurrent.reserve(relatedFeatures.size());
    for (int i=0; i<relatedFeatures.size(); i++) {
        int previousIndex = relatedFeatures[i].trainIdx;
        int currentIndex = relatedFeatures[i].queryIdx;
        featurePointsPrevious.push_back(featuresPrevious[previousIndex].pt);
        featurePointsCurrent.push_back(featuresCurrent[currentIndex].pt);
    }
	
	// 3. Generate PointClouds of related features (pointcloudsrc, pointcloudtgt)
    Kinect::frameToPointCloud(rgbPrevious, depthPrevious, featureCloudPrevious, 1, featurePointsPrevious);
    Kinect::frameToPointCloud(rgbCurrent, depthCurrent, featureCloudCurrent, 1, featurePointsCurrent);
    
    cout << "[LabicReconstructor::performLoop] cloudPrevious with " << featureCloudPrevious.size() << " points" << endl
    << "[LabicReconstructor::performLoop] cloudCurrent with " << featureCloudCurrent.size() << " points" << endl;
    /*
    pcl::io::savePLYFileASCII("cloudPrevious.ply", featureCloudPrevious);
    pcl::io::savePLYFileASCII("cloudCurrent.ply", featureCloudCurrent);
	*/
	// 4. Alignment detection
	// TODO ransac loop
    cout << "[LabicReconstructor::performLoop] transformation matrix before estimate:" << endl << transform << endl;

	//estimator.estimateRigidTransformation(featureCloudPrevious, featureCloudCurrent, transform);
    performRansacAlignment(featureCloudPrevious, featureCloudCurrent, consensusSetIndexes, transform);
	
    cout << "[LabicReconstructor::performLoop] final transformation matrix:" << endl << transform << endl;
	
	// 5. Apply transformation to all frame points
    Kinect::frameToPointCloud(rgbPrevious, depthPrevious, cloudPrevious);
    Kinect::frameToPointCloud(rgbCurrent, depthCurrent, cloudCurrent);
    transformPointCloud(cloudCurrent, transformedCloudCurrent, transform);
    
    pcl::visualization::PCLVisualizer vissvd;
    vissvd.addPointCloud(cloudPrevious.makeShared(),"previous");
    vissvd.addPointCloud(transformedCloudCurrent.makeShared(),"transformedCurrent");
    vissvd.resetCamera();
    vissvd.spin();
    
	// return updated world pointcloud
	
}

void LabicReconstructor::extractRGBFeatures(const Mat& img, vector<KeyPoint>& keypoints, Mat& descriptors) {
	cout << "[LabicReconstructor::extractRGBFeatures] computing features" << endl;
	
    Mat imgBlackWhite;
    cvtColor(img, imgBlackWhite, CV_RGB2GRAY);
    
	for (int i=0; i<maxDetectionIte; i++) {
		adjuster->detect(imgBlackWhite, keypoints);
		extractor->compute(imgBlackWhite, keypoints, descriptors);
		
		if ( keypoints.size() < minFeatures){
			adjuster->tooFew (minFeatures, keypoints.size());
		} else if ( keypoints.size() > maxFeatures) {
			adjuster->tooMany(maxFeatures, keypoints.size());
		} else {
			cout << "[LabicReconstructor::extractRGBFeatures] the number of features: " << keypoints.size()
			<< "(target range: " << minFeatures << " to " << maxFeatures
			<< ", iteration: " << i << ")" << endl;
			return;
		}
	}
};

void LabicReconstructor::matchFeatures(vector<KeyPoint>&   _keypoints_q,
									   const Mat&               _descriptors_q,
									   vector<KeyPoint>&   _keypoints_t,
									   const Mat&               _descriptors_t,
									   vector<DMatch>&     _matches) const {
	
	cout << "[LabicReconstructor::matchFeatures] matching features\n";
	vector<DMatch> matches;
	
	matcher2->match(_descriptors_q, _descriptors_t, matches);
	cout << "[LabicReconstructor::matchFeatures] Inital matched features: " << matches.size() << endl;
		
	_matches.clear();
	
	// Distance filter
	for (int i=0; i<matches.size(); i++) {
		if (matches[i].distance < maxMatchDistance) {
			_matches.push_back(matches[i]);
		}
	}
	
	cout << "[LabicReconstructor::matchFeatures] Final matched features after threshold: " << _matches.size() << endl;
	
	if (_matches.size() < minMatches){
		cout << "[LabicReconstructor::matchFeatures] IMAGES DO NOT MATCH!" << endl;
	}
}

void LabicReconstructor::performRansacAlignment(const PointCloud<PointXYZRGB>& cloudCurrent,
											   const PointCloud<PointXYZRGB>& cloudPrevious,
											   vector<int>& _inliersIndexes,
                                               Eigen::Matrix4f& _bestTransform) {
	
	// RANSAC initial parameters
	int maxIterations = 5; // k
	int nSamples = 3; // number of maybe_inliers (random samples)
	float threshold = 3.0; // max error
    int minInliers = 10;
	
	double bestError = INFINITY, thisError;
    Eigen::Matrix4f bestTransform, maybeTransform, thisTransform;
	vector<int> maybeIndexes, notMaybeIndexes, bestConsensusSetIndexes, consensusSetIndexes;
    
    pcl::registration::TransformationEstimationSVD<PointXYZRGB, PointXYZRGB, float> estimatorSVD;
    pcl::registration::TransformationEstimationLM<PointXYZRGB, PointXYZRGB, float> estimatorLM;
	
	srand(time(NULL));
	
    int iterations = 0;

	while (iterations < maxIterations) {
        cout << ">>> RANSAC iteration " << iterations+1 << endl;
        
        maybeIndexes.clear();
        notMaybeIndexes.clear();
        consensusSetIndexes.clear();
        maybeTransform = Eigen::Matrix4f::Zero();
		
		// Determine random sample (maybe)
        cout << "       maybeIndexes/consensusSetIndexes = [";
		for (int i=0; i<nSamples; i++) {
            int randomSample = rand() % cloudCurrent.size();
            cout << randomSample << ", ";
            maybeIndexes.push_back(randomSample);
			consensusSetIndexes.push_back(randomSample);
		}
        cout << "]" << endl;
        
        // Estimate transformation from maybe set (size = nSamples)
        estimatorLM.estimateRigidTransformation(cloudCurrent, maybeIndexes, cloudPrevious, maybeIndexes, maybeTransform);
        
        cout << "       maybeTransform = " << endl << maybeTransform << endl;
        
        // Create vector of points that are not in maybeInliers
        // notMaybeIndexes = cloudCurrent \ maybeIndexes
        //cout << "       notMaybeIndexes = [";
        for (int i=0; i<cloudCurrent.size(); i++) {
            bool isInMaybeIndexes = false;
            for (int j=0; j<maybeIndexes.size(); j++) {
                if (i == maybeIndexes[j]) {
                    isInMaybeIndexes = true;
                    break;
                }
            }
            if (isInMaybeIndexes) continue;
            //cout << i << ", ";
            notMaybeIndexes.push_back(i);
        }
        //cout << "]" << endl;

		// Test transformation with other points that are not in maybeIndexes
		for (int i=0; i<notMaybeIndexes.size(); i++) {
            int pointIndex = notMaybeIndexes[i];
            PointCloud<PointXYZRGB> transformedPoint;
            transformedPoint.push_back(cloudCurrent.points[pointIndex]);
            transformPointCloud(transformedPoint, transformedPoint, maybeTransform);
            double transformedDistance = euclideanDistance(transformedPoint.points[0], cloudPrevious.points[pointIndex]);
            
            cout << "       Point " << i << " distance = " << transformedDistance;
			if (transformedDistance <= threshold) {
				consensusSetIndexes.push_back(pointIndex);
                cout << " (added to consensus set!)";
			}
            cout << endl;
		}
		
        cout << "       consensusSet has " << consensusSetIndexes.size() << " points" << endl;
		if (consensusSetIndexes.size() >= minInliers) {
            cout << "           (ok! we may have found a good transformation. comparing to the best..." << endl;
            
			// Recalculate transformation from new consensus set
            estimatorLM.estimateRigidTransformation(cloudPrevious, consensusSetIndexes, cloudCurrent, consensusSetIndexes, thisTransform);
            
            cout << "       thisTransform = " << endl << thisTransform << endl;
            
            // Generate the transformed cloud using thisTransform
            // Note that this cloud will include points that are not in consensus set, be careful
            PointCloud<PointXYZRGB> transformedCloudCurrent;
            transformPointCloud(cloudCurrent, transformedCloudCurrent, thisTransform);
            thisError = getAlignmentError(transformedCloudCurrent, cloudPrevious, consensusSetIndexes);
			
            cout << "       thisError = " << thisError;
			if (thisError < bestError) {
                cout << " (great! best error so far. updating best parameters)";
				bestTransform = thisTransform;
				bestError = thisError;
				bestConsensusSetIndexes = consensusSetIndexes;
			}
            cout << endl;
		}
		
		// TODO test to stop if found error < ok_error
		cout << endl;
		iterations++;
	}
	
    _inliersIndexes = bestConsensusSetIndexes;
    _bestTransform = bestTransform;

}

double LabicReconstructor::getAlignmentError(const PointCloud<PointXYZRGB>& cloud1,
                                             const PointCloud<PointXYZRGB>& cloud2,
                                             const vector<int> inliersIndexes) {
    // Check if two clouds have the same size
    assert(cloud1.size() == cloud2.size());
    double error = 0;
    
    for (int i=0; i<inliersIndexes.size(); i++) {
        int inlierIndex = inliersIndexes[i];
        
        error += squaredEuclideanDistance(cloud1.points[inlierIndex], cloud2.points[inlierIndex]);
    }
    
    error /= inliersIndexes.size();
    return error;
}

Mat LabicReconstructor::filterMatches(vector<KeyPoint>&   _keypoints_q,
									  vector<KeyPoint>&   _keypoints_t,
									  vector<DMatch>&     _matches,
									  bool                         _giveID) {
	
	vector<Point2d>    imgPoints_q, imgPoints_t;
	
	for (vector<DMatch>::const_iterator it = _matches.begin();
		 it != _matches.end(); it++) {
		imgPoints_q.push_back(_keypoints_q[(*it).queryIdx].pt);
		imgPoints_t.push_back(_keypoints_t[(*it).trainIdx].pt);
	}
	
	// execute RANSAC to detect outliers
	vector<uchar> inliers(imgPoints_q.size(), 0);
	findFundamentalMat(imgPoints_t, imgPoints_q, CV_FM_RANSAC,
					   RANSACDist, RANSACConf, inliers);
	
	// remove outliers
	vector<uchar>::const_iterator itI = inliers.begin();
	vector<DMatch>::iterator  itM = _matches.begin();
	vector<Point2d>::iterator itQ = imgPoints_q.begin();
	vector<Point2d>::iterator itT = imgPoints_t.begin();
	if (_giveID) {
		int count1 = 0;
		int count2 = 0;
		for (; itI != inliers.end(); itI++){
			if (!*itI){
				// remove outlier
				itM = _matches.erase(itM);
				itQ = imgPoints_q.erase(itQ);
				itT = imgPoints_t.erase(itT);
			} else {
				// add ID to inlier
				if (_keypoints_t[itM->trainIdx].class_id == -1) {
					// newly mathced points
					_keypoints_q[itM->queryIdx].class_id = _keypoints_t[itM->trainIdx].class_id = ID++;
					count1++;
				} else if ( _keypoints_t[itM->trainIdx].class_id > -1 ) {
					// training keypoint has already been given ID
					_keypoints_q[itM->queryIdx].class_id = _keypoints_t[itM->trainIdx].class_id;
					count2++;
				}
				itM++;
				itQ++;
				itT++;
			}
		}
		cout << "[LabicReconstructor::matchImages] survived matched features: "
		<< _matches.size() << endl;
		cout << "[LabicReconstructor::matchImages] merged object points: " << count2 << endl;
		cout << "[LabicReconstructor::matchImages] new object points: " << count1 << endl;
	} else {
		for (; itI != inliers.end(); itI++){
			if (!*itI){
				itM = _matches.erase(itM);
				itQ = imgPoints_q.erase(itQ);
				itT = imgPoints_t.erase(itT);
			} else {
				itM++;
				itQ++;
				itT++;
			}
		}
		cout << "[LabicReconstructor::matchImages] survived matched features: "
		<< _matches.size() << endl;
	}
	
	return findFundamentalMat(imgPoints_t, imgPoints_q, CV_FM_8POINT);

};

void LabicReconstructor::start() {
    m_Thread = boost::thread(&LabicReconstructor::reconstruct, this);
}

void LabicReconstructor::join() {
    m_Thread.join();
}

void LabicReconstructor::close() {
    // Extra code if need to 
    join();
}