import geomerative.*;

int segLen = 6;
int fontSize = 200;
int xSpacing = 20;
int yOffset = 0;
color fillColor = color ( 0 );
color strokeColor = color ( 0 );

void setup() {
  size( 1280, 800 );
  background( 255 );
  smooth();
  fill( fillColor );
  stroke( strokeColor );
  
  // initialize the geomerative library
  RG.init( this );
  
  translate( 100, height/2 );

  String textString = "Hi there";
  String[] letterArray = textString.split("");

  for ( int c = 1; c < letterArray.length; c++ ) {
    String letter = letterArray[c];
    String prevLetter = letterArray[c - 1];
    if( letter.contentEquals(" ") ) {
      letter = "a";
      noFill();
      noStroke();
      drawShape( letter, prevLetter );
      fill( fillColor );
      stroke( strokeColor );
    } else if( prevLetter.contentEquals(" ") ) {
      prevLetter = "..";
      drawShape( letter, prevLetter );
      fill( fillColor );
      stroke( strokeColor );
    } else if( c == 1 ){
      prevLetter = "a";
      drawShape(letter, prevLetter);          
    }  else {
     drawShape(letter, prevLetter);
    }        
  }
}

void draw() {
  
}

void drawShape(String l, String pl) {
      println("drawing shape" );
      String letter = l;
      String prevLetter = pl;
      RFont font = new RFont( "FreeSans.ttf", fontSize, RFont.LEFT );

      // tell library we want 11px between each point on the font path
      RCommand.setSegmentLength(segLen);

      RGroup grp; 
      RGroup pGrp;
      grp = font.toGroup( letter ) ;
      pGrp = font.toGroup( prevLetter );
      RPoint[] pnts = grp.getPoints();
      translate( pGrp.getWidth() + xSpacing, yOffset );
      
      font.draw( letter );
//  
//      beginShape();
//      vertex( pnts[0].x, pnts[0].y );
//      for ( int i = 1; i < pnts.length; i++ ) {
//        curveVertex( pnts[i].x, pnts[i].y );
//      }
//      endShape(CLOSE); 
}

void mouseReleased() {
  fillColor = color( random( 0, 255 ), random( 0, 255 ), random( 0, 255 ) );
  strokeColor = fillColor;
  setup();
}
