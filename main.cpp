//
//  LabicKinect
//  Author: Mario Cecchi <macecchi@gmail.com>
//  Laboratorio de Inteligencia Computacional
//  www.labic.nce.ufrj.br
//

#define LABIC_ENABLE_CV      1
#define LABIC_ENABLE_PCL 	 0
#define LABIC_ENABLE_MATCHER 1
#define REFRESH_INTERVAL     1

#include "common.h"
#include <ctime>
#include "KinectController.h"
#include "LabicCV.h"
#include "LabicPCL.h"
#include "Reconstructor.h"
#include "RGBDImage.h"
#include "queue.h"
#include "arg.h"

using namespace std;
using namespace labic;

namespace opt {
	ntk::arg<int> 	kinect_id("--kinect-id", "Kinect id", 0);
	ntk::arg<bool> 	enable_pcl("--pcl", "Enable PCL Visualizer", false);
	ntk::arg<bool>	enable_reconstructor("--reconstructor", "Enable reconstructor", true);
	ntk::arg<int>	capture_interval("--interval", "Time between frame grabbing to reconstruction (milliseconds)", -1);
	ntk::arg<bool>	hold("--hold", "Wait for spacebar to start automatic frame grabbing", false);
}

int main(int argc, char **argv) {
    // Parse command line options
    ntk::arg_base::set_help_option("-h");
    ntk::arg_parse(argc, argv);

    // Set debugger level
    debug_set_level(DebugLevel::INFO);

	Freenect::Freenect freenect;
	Queue<RGBDImage> queue;
	KinectController *kinect;
	LabicCV *cv;
	LabicPCL *pcl;
	Reconstructor *recon;
	bool stop;

	cout << "[main] Initializing Kinect with id " << opt::kinect_id() << "... ";

	try {
		kinect = &freenect.createDevice<KinectController>(opt::kinect_id());

		cout << "Done" << endl << "[main] Starting streams... ";

		kinect->startVideo();
		kinect->startDepth();

		cout << "Done" << endl;
	} catch (runtime_error &e) {
		cout << "Connection error: " << e.what() << endl;
		return 1;
	}

	// OpenCV thread
	cv = new LabicCV(kinect, &stop, queue);
	if (opt::capture_interval() >= 0) {
		cout << "[main] Automatic mode: new frames will be saved each " << opt::capture_interval() << " milliseconds" << endl;
		if (opt::hold()) cout << "[main] Waiting for <<SPACEBAR>> to start automatic mode" << endl;
		cv->setCaptureInterval(opt::capture_interval());
		cv->setCaptureHold(opt::hold());
	} else {
		cout << "[main] Manual mode: press <<SPACEBAR>> to save a frame" << endl;
	}
	cv->start();

	// PCL thread
	if (opt::enable_pcl()) {
		pcl = new LabicPCL(kinect, &stop, queue);
		pcl->start();
	}
	
    // Reconstructor thread
	if (opt::enable_reconstructor()) {
		recon = new Reconstructor(&stop, queue);
		recon->start();
	}

	while (!stop) {
		cv->mainLoopPart(REFRESH_INTERVAL);
	}

	cout << "[main] Stop requested. Waiting for threads to finish..." << endl;

	// Wait for threads to finish
	cv->close();
	cv->printStats();
	if (opt::enable_pcl()) pcl->close();
	if (opt::enable_reconstructor()) {
		recon->close();
		recon->printStats();
	}

	cout << "[main] Done. Closing Kinect..." << endl;

	kinect->stopVideo();
	kinect->stopDepth();
	kinect->close();

	cout << "[main] Done. Bye!" << endl;
	
	return 0;
}
