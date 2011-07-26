#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// register touch events
	ofRegisterTouchEvents(this);

	ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	player.loadSound("out.caf");
    player1.loadSound("out1.caf");
    player2.loadSound("out2.caf");
    sender.setup( HOST, PORT );
	receiver.setup( PORTR );
    report="waiting";
    whichClip=6;

   
   }
//--------------------------------------------------------------
void testApp::update(){
    ofBackground(255,255,255);	
	counter += 1.0f;
  
   
}

//--------------------------------------------------------------
void testApp::draw(){
	
//draw awful buttons    
    ofSetColor(50, 0, 100);
    ofRect(0,0,ofGetWidth(),ofGetHeight()/3);
    ofSetColor(150, 0, 100);
    ofRect(0,ofGetHeight()/3,ofGetWidth(),ofGetHeight()/3);
    ofSetColor(50, 200, 0);
    ofRect(0,ofGetHeight()/3*2,ofGetWidth(),ofGetHeight()/3);
    ofSetColor(0, 0, 255);
    ofLine(0, ofGetHeight()/2, ofGetWidth(), ofGetHeight()/2);
    
    //map circle to playhead
    if (whichClip==0) {
        ofCircle(ofMap(player.getPosition(),0,1,0,ofGetWidth()), ofGetHeight()/2, 15);
    }
    if (whichClip==1) {
       ofCircle(ofMap(player1.getPosition(),0,1,0,ofGetWidth()), ofGetHeight()/2, 15);
    }
    if (whichClip==2) {
        ofCircle(ofMap(player2.getPosition(),0,1,0,ofGetWidth()), ofGetHeight()/2, 15);
    }
}
//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
       
    
    
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){
    
    float playHead=ofMap(touch.x,0,ofGetWidth(),0.0,1.0);
    
    if (whichClip==0) {
        player.setPosition(playHead);
    }
    if (whichClip==1) {
        player1.setPosition(playHead);
    }
    if (whichClip==2) {
        player2.setPosition(playHead);
    }
    

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){
    if(touch.y<ofGetHeight()/3 && touch.y>0){
        player1.stop();
        player2.stop();
        player.play();
        ofxOscMessage m;
        m.addStringArg("test_message");
        sender.sendMessage(m);
        whichClip=0;
    }
    if(touch.y<2*(ofGetHeight()/3) && touch.y>ofGetHeight()/3){
        
        player.stop();
        player2.stop();
        player1.play();
        ofxOscMessage m;
        m.addStringArg("test_message2");
        sender.sendMessage(m);
        whichClip=1;
    }
    if(touch.y<ofGetHeight() && touch.y>2*(ofGetHeight()/3)){
        player1.stop();
        player.stop();
        player2.play();
        ofxOscMessage m;
        m.addStringArg("test_message3");
        sender.sendMessage(m);
        whichClip=2;
        
    }
}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}

