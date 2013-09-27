//
//  LabicCV.cpp
//  LabicKinect
//
//  Created by Mario Cecchi on 8/22/13.
//
//

#include "LabicCV.h"

using namespace std;
using namespace cv;
using namespace labic;

const string LabicCV::input_window = "Kinect Input";
const string LabicCV::rgb_window = "RGB camera";
const string LabicCV::rgb_t_window = "Target RGB camera";
const string LabicCV::rgb_s_window = "Source RGB camera";
const string LabicCV::depth_window = "Depth camera";
const string LabicCV::rgbd_window = "RGBD Video";

LabicCV::LabicCV(Kinect *_kinect, bool* _stop, int _width, int _height) : kinect(_kinect), stop(_stop), width(_width), height(_height) {
    window_closed = false;
    initialized = false;
    
    for (unsigned int i=0; i<2048; i++) {
		float v = i/2048.0;
		v = pow(v, 3)* 6;
		t_gamma[i] = v*6*256;
	}
    
    depthPrevious = (uint16_t*) malloc(sizeof(uint16_t)*width*height);
    depthCurrent = (uint16_t*) malloc(sizeof(uint16_t)*width*height);
    rgbPrevious = Mat(Size(width, height), CV_8UC3, Scalar(0));
    rgbCurrent = Mat(Size(width, height), CV_8UC3, Scalar(0));
    cameras = Mat(height, width*2, CV_8UC3);
    previousSet = currentSet = false;

    namedWindow(input_window);
    initialized = true;
    framesSaved = 0;
}

void LabicCV::init() {
}

void LabicCV::display() {
    Mat rgbMat(Size(width, height), CV_8UC3, Scalar(0));
	Mat depthMat(Size(width, height), CV_8UC3, Scalar(0));
    Mat left(cameras, Rect(0, 0, width, height));
    Mat right(cameras, Rect(width, 0, width, height));

    uint16_t *depth = NULL;
    
	cout << "[LabicCV] Display started" << endl;
    if (!initialized) {
        cout << "[LabicCV] ERROR: did not call init(). Display finished" << endl;
        return;
    }

    do {
		if (depth != NULL) free(depth);
        depth = (uint16_t*) malloc(sizeof(uint16_t)*width*height);
        
		kinect->getFrame(rgbMat, depth);
        
        generateDepthImage(depth, depthMat);
        
        rgbMat.copyTo(left);
        depthMat.copyTo(right);
        
        //putText(cameras, "W,S,X -> ADJUST TILT", Point(20,30), CV_FONT_HERSHEY_PLAIN, 0.8f, Scalar::all(0), 1, 8);
        
        //imshow(input_window, cameras);
        //waitKey(1);
        //keyboardHandler(waitKey(1));

    } while (!*stop);
    
    window_closed = true;

	cout << "[LabicCV] Display finished" << endl;
}

void LabicCV::generateDepthImage(uint16_t *depth, Mat depthMat) {
    int x, y, i;
    int depthValue;
    
    clock_t t = clock();
    
    for (i=0; i<width*height; i++) {
        y = i/width;
        x = i%width;
        
        depthValue = kinect->mmToRaw(depth[i]);
        
        depthMat.at<Vec3b>(y,x) = depth_to_color(depthValue);
    }
    
    t = clock() - t;
    //cout << "[LabicCV] generateDepthImage time: " << 1000*((float)t)/CLOCKS_PER_SEC << " ms " << endl;
}

Vec3b LabicCV::depth_to_color(float raw_depth_value) {
    double r,g,b;
	int pval = t_gamma[(int)raw_depth_value];
    int lb = pval & 0xff;
    switch (pval>>8) {
        case 0:
            r = 255;
            g = 255-lb;
            b = 255-lb;
            break;
        case 1:
            r = 255;
            g = lb;
            b = 0;
            break;
        case 2:
            r = 255-lb;
            g = 255;
            b = 0;
            break;
        case 3:
            r = 0;
            g = 255;
            b = lb;
            break;
        case 4:
            r = 0;
            g = 255-lb;
            b = 255;
            break;
        case 5:
            r = 0;
            g = 0;
            b = 255-lb;
            break;
        default:
            r = 0;
            g = 0;
            b = 0;
            break;
    }
    
    return Vec3b(b,g,r);
}

void LabicCV::keyboardHandler(int key) {
    switch (key) {
        case 27:
            *stop = true;
            destroyAllWindows();
            break;
        case '1':
            while (!previousSet) {
            	previousSet = kinect->getFrame(rgbPrevious, depthPrevious);
            }

            if (previousSet) cout << "[LabicCV] Previous state set" << endl;
            cout << "previousSet=" << previousSet << " currentSet=" << currentSet << " isReady=" << isReady() << endl;
            /*
            FILE *f;
            f = fopen("rgbPrevious.bin", "wb");
            if (f == NULL) cerr << "Error opening rgbPrevious file" << endl;
            fwrite(&rgbPrevious, sizeof(Mat),sizeof(rgbPrevious), f);
            fclose(f);
            f = fopen("depthPrevious.bin", "wb");
            if (f == NULL) cerr << "Error opening depthPrevious file" << endl;
            fwrite(depthPrevious, sizeof(uint16_t),sizeof(uint16_t)*640*480, f);
            fclose(f);*/
            break;
        case '2':
        	while (!currentSet) {
        		currentSet = kinect->getFrame(rgbCurrent, depthCurrent);
        	}

            if (currentSet) cout << "[LabicCV] Current state set" << endl;
            cout << "previousSet=" << previousSet << " currentSet=" << currentSet << " isReady=" << isReady() << endl;
            /*
            f = fopen("rgbCurrent.bin", "wb");
            if (f == NULL) cerr << "Error opening rgbCurrent file" << endl;
            fwrite(&rgbCurrent, sizeof(Mat),sizeof(rgbCurrent), f);
            fclose(f);
            f = fopen("depthCurrent.bin", "wb");
            if (f == NULL) cerr << "Error opening depthCurrent file" << endl;
            fwrite(depthCurrent, sizeof(uint16_t),sizeof(uint16_t)*640*480, f);
            fclose(f);*/
            break;
        case 'w':
            kinect->setTilt(+1.0);
            break;
        case 's':
            kinect->setTilt(0.0);
            break;
        case 'x':
            kinect->setTilt(-1.0);
            break;
        case ' ':
			while (!currentSet) {
				currentSet = kinect->getFrame(rgbCurrent, depthCurrent);
			}
			framesSaved++;
			cout << "[LabicCV] " << framesSaved << " frames saved" << endl;
            break;
        default:
        	break;

    }
}

void LabicCV::showMatchesPreview(const Mat& img1, const vector<KeyPoint>& keypoints1, const Mat& img2, const vector<KeyPoint>& keypoints2, const vector<DMatch>& matches1to2) {
    Mat outImg;
    namedWindow("RGB matched features");
    drawMatches(img1, keypoints1, img2, keypoints2, matches1to2, outImg);
    imshow("RGB matched features", outImg);
    //while (waitKey() != 27);
    //destroyWindow("RGB matched features");
}

void LabicCV::start() {
	m_Thread = boost::thread(&LabicCV::display, this);
}

void LabicCV::mainLoopPart(const int t) {
	if (*stop) return ;
	imshow(input_window, cameras);
    keyboardHandler(waitKey(t));
}

void LabicCV::join() {
    m_Thread.join();
}

void LabicCV::close() {
    *stop = true;
    destroyAllWindows();
    join();
}
