#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxOpenALSoundPlayer.h"
#include "ofxOsc.h"
#define HOST "192.168.1.131"  //"10.0.2.4" //"localhost"
#define PORT 7000
#define PORTR 12000


class testApp : public ofxiPhoneApp{
	
public:
	void setup();
	void update();
	void draw();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);
	
	ofxOpenALSoundPlayer player;
	ofxOpenALSoundPlayer player1;
    ofxOpenALSoundPlayer player2;
   
    ofxOscSender sender;
	ofxOscReceiver receiver;
	float 			counter;
    string report; 
    
    int whichClip;
};
