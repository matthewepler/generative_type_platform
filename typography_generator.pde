import geomerative.*;
import controlP5.*;


int roughness = 1;
float scalar = 1.0;
int fontSize = 200;
int xSpacing = 20;
int yOffset = 0;
color fillColor = color ( 0 );
color strokeColor = color ( 255, 0, 0 );

int margin = 100;

ControlP5 controlP5;
int sliderWidth = 100;
int sliderHeight = 15;
int sliderSpacer = 20;
int controlmargT = 50;
int stroke_on = 1;
int fill_on = 1;


void setup() {
  size( 1280, 800 );
  background( 255 );
  smooth();
  
  RG.init( this );
  
  controlP5 = new ControlP5( this) ;
  ControlWindow cw = controlP5.addControlWindow( "win", 250, 250 ) ;
  cw.setLocation( 10,10) ;
  ControlGroup cg = controlP5.addGroup( "Adjustments", 30, 30 );
  cg.moveTo( cw );
  controlP5.begin( cg, 10, 10 );
  Slider roughness = controlP5.addSlider( "roughness", 1, 12 );
  roughness.setNumberOfTickMarks(11);
  roughness.showTickMarks(false);
  roughness.linebreak();
  Slider scalar = controlP5.addSlider( "scalar", 0, 2 );
  scalar.linebreak();
  Slider xSpacing = controlP5.addSlider( "xSpacing", 0, 100 );
  xSpacing.setValue( 20 );
  xSpacing.linebreak();
  controlP5.addToggle( "stroke_on" );
  controlP5.addToggle( "fill_on" );
  controlP5.end();
  
}

void draw() {
  background(255);
  if( fill_on == 1 ) {fill( fillColor ); }
  if( stroke_on == 1 ) { stroke( strokeColor ); }
  
  RFont font = new RFont( "FreeSans.ttf", fontSize, RFont.LEFT );
  RCommand.setSegmentLength( roughness );
  RGroup grp; 
  RGroup pGrp;

  String textString = "Hi there";
  String[] letterArray = textString.split("");
  
  translate( margin, height/3 * 2 );

  for ( int c = 1; c < letterArray.length; c++ ) {
    String letter = letterArray[c];
    String prevLetter = letterArray[c - 1];
    if ( letter.contentEquals(" ") ) {
      letter = "a";
      noFill();
      noStroke();
      grp = font.toGroup( letter ) ;
      pGrp = font.toGroup( prevLetter );
      RPoint[] pnts = grp.getPoints();
      translate( pGrp.getWidth() + xSpacing, yOffset );
      beginShape();
      //vertex( pnts[0].x, pnts[0].y );
      for ( int i = 1; i < pnts.length; i++ ) {
        pnts[i].scale( scalar );  
        curveVertex( pnts[i].x, pnts[i].y );
        }
      endShape(CLOSE);
      if( fill_on == 1 ) {fill( fillColor ); }
      if( stroke_on == 1 ) { stroke( strokeColor ); }
    } 
    else if ( prevLetter.contentEquals(" ") ) {
      prevLetter = "..";
      grp = font.toGroup( letter ) ;
      pGrp = font.toGroup( prevLetter );
      RPoint[] pnts = grp.getPoints();
      translate( pGrp.getWidth() + xSpacing, yOffset );
      beginShape();
      //vertex( pnts[0].x, pnts[0].y );
      for ( int i = 1; i < pnts.length; i++ ) {
          pnts[i].scale( scalar );
          curveVertex( pnts[i].x, pnts[i].y );
        }
      endShape(CLOSE);
    } 
    else if ( c == 1 ) {
      prevLetter = "a";
      grp = font.toGroup( letter ) ;
      pGrp = font.toGroup( prevLetter );
      RPoint[] pnts = grp.getPoints();
      translate( pGrp.getWidth() + xSpacing, yOffset );
      beginShape();
     // vertex( pnts[0].x, pnts[0].y );
      for ( int i = 1; i < pnts.length; i++ ) {
          pnts[i].scale( scalar );
          curveVertex( pnts[i].x, pnts[i].y );
        }
      endShape(CLOSE);
    }  
    else {
      grp = font.toGroup( letter ) ;
      pGrp = font.toGroup( prevLetter );
      RPoint[] pnts = grp.getPoints();
      translate( pGrp.getWidth() + xSpacing, yOffset ); 
      beginShape();
      //vertex( pnts[0].x, pnts[0].y );
      for ( int i = 0; i < pnts.length; i++ ) {
          pnts[i].scale( scalar );
          curveVertex( pnts[i].x, pnts[i].y );
        }
      endShape(CLOSE);
    }
  }
  
}

  
  


//void roughness( int v ) { 
//  roughness = v; 
//}



