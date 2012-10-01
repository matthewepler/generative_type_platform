import geomerative.*;
import controlP5.*;
import java.io.File.*;

float _weight;
float _length;
int lines = 0;
int setFrame = 0;
int tracer = 0;
int roughness = 1;
float scalar = 1.0;
int fontSize = 200;
int xSpacing = 20;
int yOffset = 0;
float scatter = 0;
int save_tiff = 0;

PImage frameGrab;

ControlP5 controlP5;
int sliderWidth = 100;
int sliderHeight = 15;
int sliderSpacer = 20;
int controlmargT = 50;
int stroke_on = 1;
int fill_on = 1;
int margin = 100;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~COLORS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

color fillColor = color ( 0 );
color strokeColor = color ( 0 );
color backgroundColor = color( 72, 165, 119 );
color drawColor = color( 72, 165, 119 );


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SETUP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void setup() {
  size( 1280, 800 );
  colorMode( HSB, 1, 1, 1 );
  smooth();

  RG.init( this );  
  initControls();
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DRAW~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void draw() {

  if ( setFrame == 0 ) {
    background( backgroundColor );
    if ( fill_on == 1 ) {
      fill( fillColor );
    }
    if ( stroke_on == 1 ) { 
      stroke( strokeColor );
    }

    RFont font = new RFont( "FreeSans.ttf", fontSize, RFont.LEFT );
    RCommand.setSegmentLength( roughness );
    RGroup grp; 
    RGroup pGrp;

    String textString = "Hi there";
    String[] letterArray = textString.split("");
    //pushMatrix();
    translate( xSpacing, height/3 * 2 );

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
          if ( tracer == 1 ) {
            if ( dist( pnts[i].x, pnts[i].y, pnts[i-1].x, pnts[i-1].y ) > roughness*1.5 ) {
              //noStroke() ;
              pnts[i].scale( scalar );
              pnts[i].x = pnts[i].x + random( -scatter, scatter );
              pnts[i].y = pnts[i].y + random( -scatter, scatter );
              curveVertex( pnts[i].x, pnts[i].y );
            }
          }
          pnts[i].scale( scalar );  
          pnts[i].x = pnts[i].x + random( -scatter, scatter );
          pnts[i].y = pnts[i].y + random( -scatter, scatter );
          curveVertex( pnts[i].x, pnts[i].y );
        }
        endShape(CLOSE);
        if ( fill_on == 1 ) {
          fill( fillColor );
        }
        if ( stroke_on == 1 ) { 
          stroke( strokeColor );
        }
      } 
      else if ( prevLetter.contentEquals(" ") ) {
        prevLetter = ".";
        grp = font.toGroup( letter ) ;
        pGrp = font.toGroup( prevLetter );
        RPoint[] pnts = grp.getPoints();
        translate( pGrp.getWidth() + xSpacing, yOffset );
        beginShape();
        //vertex( pnts[0].x, pnts[0].y );
        for ( int i = 1; i < pnts.length; i++ ) {
          if ( tracer == 1 ) {
            if ( dist( pnts[i].x, pnts[i].y, pnts[i-1].x, pnts[i-1].y ) > roughness*1.5 ) {
              //noStroke() ;
              pnts[i].scale( scalar );
              pnts[i].x = pnts[i].x + random( -scatter, scatter );
              pnts[i].y = pnts[i].y + random( -scatter, scatter );
              curveVertex( pnts[i].x, pnts[i].y );
            }
          }
          pnts[i].scale( scalar );
          pnts[i].x = pnts[i].x + random( -scatter, scatter );
          pnts[i].y = pnts[i].y + random( -scatter, scatter );
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
          if ( tracer == 1 ) {
            if ( dist( pnts[i].x, pnts[i].y, pnts[i-1].x, pnts[i-1].y ) > roughness*1.5 ) {
              //noStroke() ;
              pnts[i].scale( scalar );
              pnts[i].x = pnts[i].x + random( -scatter, scatter );
              pnts[i].y = pnts[i].y + random( -scatter, scatter );
              curveVertex( pnts[i].x, pnts[i].y );
            }
          }
          pnts[i].scale( scalar );
          pnts[i].x = pnts[i].x + random( -scatter, scatter );
          pnts[i].y = pnts[i].y + random( -scatter, scatter );
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
        for ( int i = 1; i < pnts.length; i++ ) {
          if ( tracer == 1 ) {
            if ( dist( pnts[i].x, pnts[i].y, pnts[i-1].x, pnts[i-1].y ) > roughness*1.5 ) {
              //noStroke() ;
              pnts[i].scale( scalar );
              pnts[i].x = pnts[i].x + random( -scatter, scatter );
              pnts[i].y = pnts[i].y + random( -scatter, scatter );
              curveVertex( pnts[i].x, pnts[i].y );
            }
          }
          pnts[i].scale( scalar );
          pnts[i].x = pnts[i].x + random( -scatter, scatter );
          pnts[i].y = pnts[i].y + random( -scatter, scatter );
          curveVertex( pnts[i].x, pnts[i].y );
        }
        endShape(CLOSE);
      }
    }
    //popMatrix();
  } 
  else if( setFrame == 1 ){
    sketch();
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FRAME_GRAB~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void set(int v) {  
    setFrame = v;
    if( setFrame == 1 ) {
      PImage frameGrab = get();     
      image( frameGrab, 0, 0 );
      //this.mask(frameGrab);
    }
  }
  
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SAVE_FRAME~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void ssave_tiff( int v ) {
  println("I SEE YOU");
    save_tiff = v;
    if( save_tiff == 1 ) {
      PImage printFrame = get();
      image( printFrame, 0, 0 );
      save( "output.tif" );
      save_tiff = 0;
      println( "Saved!" );
    } else {
       save_tiff = 0; 
    }
}  

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SKETCH_TOOLS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void sketch() {
  if( lines == 1 ) {
  pushMatrix();
    stroke( drawColor );
    strokeWeight( _weight );
    PVector one = new PVector( random( -_length, _length ), random( -_length, _length ) );
    PVector two = new PVector( random( -_length, _length ), random( -_length, _length ) );
    translate( mouseX, mouseY );
    line( one.x, one.y, two.x, two.y )  ;
  popMatrix(); 
  }
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CONTROLS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void initControls() {
  controlP5 = new ControlP5( this) ;
  ControlWindow cw = controlP5.addControlWindow( "win", 250, 350 ) ;
  cw.setLocation( 10, 10) ;
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
  Slider scatter = controlP5.addSlider( "scatter", 0, 25 );
  scatter.linebreak();
  Toggle stroke_on = controlP5.addToggle( "stroke_on" );
  Toggle fill_on = controlP5.addToggle( "fill_on" );
  Toggle tracer = controlP5.addToggle( "tracer" );
  tracer.linebreak();
  Toggle setFrame = controlP5.addToggle( "set" );
  setFrame.setColorLabel( #F00505 ); 
  setFrame.setColorActive( #F00505 );
  setFrame.setColorBackground( #360D0D );
  setFrame.setPosition( 160, 90 );
  
  ControlGroup sketch_tools = controlP5.addGroup( "sketch_tools" , 30, 225);
  sketch_tools.moveTo( cw );
  Toggle lines = controlP5.addToggle( "lines" );
  lines.linebreak();
  sketch_tools.add( lines );
  lines.moveTo( sketch_tools );
  lines.setPosition( 0, 10);
  lines.setHeight( 30 );
  Slider _length = controlP5.addSlider( "_length", 15, 50 );
  sketch_tools.add( _length );
  _length.moveTo( sketch_tools );
  _length.setPosition( 50, 10 );
  _length.setWidth( 90 );
  _length.linebreak();
  Slider _weight = controlP5.addSlider( "_weight", 1, 3 );
  sketch_tools.add( _weight );
  _weight.moveTo( sketch_tools );
  _weight.setPosition( 50, 30 );
  _weight.setWidth( 90 );
  
  Button save_tiff = controlP5.addButton( "save_tiff" );
  save_tiff.setWidth( 180 );
  save_tiff.setPosition( 0, 280 );
  save_tiff.setColorForeground( #F00505 );
  save_tiff.setColorLabel( #FFFFFF ); 
  save_tiff.setColorActive( #F00505 );
  save_tiff.setColorBackground( #360D0D );  

  controlP5.end();

}


