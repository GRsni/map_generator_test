class MapGenerator {
  int scl=5, border=5;
  int rows, columns;
  float noiseScale=0.01;
  int WATER=#4b88ff, SAND=#fcd90c, GRASS=#6cfc0d, SNOW=#ffffff;

  MapGenerator() {
    rows=floor(height/scl)+border*2*scl;
    columns=floor(width/scl)+border*2*scl;
  }

  PGraphics createMap(PVector offset) {
    PGraphics map=createGraphics(width+scl*border*2, height+scl*border*2);
    map.beginDraw();
    for (int i=0; i<rows; i++) {
      for (int j=0; j<columns; j++) {
        //map.colorMode(HSB, 360, 1, 1);
        map.noStroke();
        float heightVal=noise(i*scl*noiseScale, j*scl*noiseScale);
        float moistVal=noise(i*scl*noiseScale+10000, j*scl*noiseScale+5000);
        map.fill(calculateFill(heightVal, moistVal));
        map.rect(i*scl, j*scl, scl, scl);
      }
    }
    map.endDraw();
    return map;
  }

  color calculateFill(float hVal, float mVal) {
    color res;
    //println(hVal, mVal);
    float brightness= map(mVal, 0, 1, 0, 1);
    if (hVal<.3) {
      res = WATER;
    } else if (hVal<.4) {
      res=SAND;
    } else if (hVal<.7) {
      res = GRASS;
    } else {
      res=SNOW;
    }
    return res;
  }
}
