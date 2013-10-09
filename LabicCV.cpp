//
//  LabicCV.cpp
//  LabicKinect
//
//  Created by Mario Cecchi on 8/22/13.
//
//

#include <ctime>
#include "LabicCV.h"
#include "opencv2/nonfree/features2d.hpp"
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "RGBDImage.h"

using namespace std;
using namespace cv;
using namespace labic;

const string LabicCV::input_window = "Kinect Input";

LabicCV::LabicCV(KinectController *_kinect, bool* _stop, FrameQueue& q)
: kinect(_kinect),  initialized(false), windowClosed(false), currentSet(false), stop(_stop), captureInterval(-1), queue(q) {
    for (unsigned int i=0; i<2048; i++) {
		float v = i/2048.0;
		v = pow(v, 3)* 6;
		t_gamma[i] = v*6*256;
	}
    
    cameras = Mat(height, width*2, CV_8UC3);
    currentSet = false;

    namedWindow(input_window);
    initialized = true;
}

void LabicCV::display() {
    Mat rgbMat(Size(width, height), CV_8UC3, Scalar(0));
	Mat depthMat(Size(width, height), CV_8UC3, Scalar(0));
    Mat left(cameras, Rect(0, 0, width, height));
    Mat right(cameras, Rect(width, 0, width, height));
    RGBDImage frame;

    uint32_t timestampPrevious = 0;
    time_t start, end, lastCap = 0;
    int clicks = 0;
    double fps;
    
	cout << "[LabicCV] Display started" << endl;

    if (!initialized) {
        cerr << "[LabicCV] ERROR: OpenCV wasn't properly initialized" << endl;
        return;
    }

    time(&start);
    time(&lastCap);

    do {
        kinect->grabRGBDImage(frame);
        
        // Skip redrawing if there was no change
        if (frame.timestamp() == timestampPrevious) continue;

        generateDepthImage(frame.depth(), depthMat);
        
        frame.rgb().copyTo(left);
        depthMat.copyTo(right);
        
        //putText(cameras, "W,S,X -> ADJUST TILT", Point(20,30), CV_FONT_HERSHEY_PLAIN, 0.8f, Scalar::all(0), 1, 8);
        
        timestampPrevious = frame.timestamp();

        time(&end);
        clicks++;
        fps = clicks / difftime(end, start);

        if (captureInterval > 0 && difftime(end, lastCap)*1000 > captureInterval) {
        	lastCap = end;
        	saveFrame();
        }

        ostringstream fps_str;
        fps_str << "OpenCV FPS: " << fps;
        putText(cameras, fps_str.str(), Point(20,30), CV_FONT_HERSHEY_PLAIN, 1.0f, Scalar::all(0));
    } while (!*stop);
    
    windowClosed = true;

	cout << "[LabicCV] Display finished" << endl;
}

void LabicCV::generateDepthImage(const Mat1f& depth, Mat depthMat) {
    int x, y;
    int depthValue;

    clock_t t = clock();

    for (y=0; y<height; y++) {
    	for (x=0; x<width; x++) {
    		depthValue = mmToRaw(depth(y,x));
    		depthMat.at<Vec3b>(y,x) = depthToColor(depthValue);
    	}
    }

    t = clock() - t;
    //cout << "[LabicCV] generateDepthImage time: " << 1000*((float)t)/CLOCKS_PER_SEC << " ms " << endl;
}

void LabicCV::saveFrame() {
	RGBDImage tmp;
	while (!kinect->grabRGBDImage(tmp)) {}
	cout << "[LabicCV] Pushed frame " << tmp.timestamp() << " to queue" << endl;
	queue.push(tmp);
}

Vec3b LabicCV::depthToColor(float rawDepthValue) {
    double r,g,b;
	int pval = t_gamma[(int)rawDepthValue];
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
        	if (captureInterval > 0) break;
			saveFrame();
            break;
        default:
        	break;

    }
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
