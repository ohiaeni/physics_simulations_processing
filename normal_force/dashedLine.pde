void dashedLine(float aX, float aY, float bX, float bY, float w) {
  float  bx, by;
  int    j = 0;
  String hasen = "0101";
  stroke(0);
  strokeWeight(w);
  bx = aX;
  by = aY;
  for ( int i = 0; i <= dist(aX, aY, bX, bY)/5.0; i++ ) {
    float px = lerp( aX, bX, i/(dist(aX, aY, bX, bY)/5.0) );
    float py = lerp( aY, bY, i/(dist(aX, aY, bX, bY)/5.0) );
    String ptn = hasen.substring(j, j+1);
    j++;
    if ( j >= hasen.length() ) {
      j = 0;
    }
    if ( ptn.equals("1") == true ) {
      line( bx, by, px, py );
    } else {
      point( px, py );
    }
    bx = px;
    by = py;
  }
  strokeWeight(5);
}
