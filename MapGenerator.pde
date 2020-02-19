class MapGenerator { //<>//
  int scl=step, border=0;
  int rows, columns;
  float heightNoiseScale=0.009, varianceNoiseScale=0.009;
  int DEEP_OCEAN=#0244c9, WATER=#4b88ff, SAND=#fcd90c, GRASS=#6cfc0d, ROCK=#bbbbbb, SNOW=#ffffff;

  MapGenerator() {
    rows=floor(height/scl)+border*2;
    columns=floor(width/scl)+border*2;
    println(rows, columns);
  }

  PGraphics createMap(PVector offset) {
    PGraphics map=createGraphics(width+scl*border*2, height+scl*border*2);
    map.beginDraw();
    map.rectMode(CORNER);
    for (int i=0; i<rows; i++) {
      for (int j=0; j<columns; j++) {
        map.noStroke();
        float heightVal=noise((offset.y+i*scl)*heightNoiseScale+5000, (offset.x+j*scl)*heightNoiseScale+5000);
        float moistVal=noise((offset.y+i*scl)*varianceNoiseScale+10000, (offset.x+j*scl)*varianceNoiseScale+5000);
        map.fill(calculateFill(heightVal, moistVal));
        map.rect(j*scl, i*scl, scl, scl);
      }
    }
    map.endDraw();
    return map;
  }

  int calculateFill(float hVal, float mVal) {
    color res;
    //println(hVal, mVal);
    float brightness= map(mVal, 0, 1, .65, 1);
    if (hVal<.05) {
      res=DEEP_OCEAN;
    } else if (hVal<map(mouseX, 0, width, 0.05, .5)) {
      res = WATER;
    } else if (hVal<map(mouseX, 0, width, .15, 0.55)) {
      res=SAND;
    } else if (hVal<.65) {
      res = GRASS;
    } else if (hVal<.7) {
      res=ROCK;
    } else {
      res=SNOW;
    }

    int red=floor(((res>>16)&0xFF)*brightness);
    int green=floor(((res>>8)&0xFF)*brightness);
    int blue=floor(((res) & 0xFF)*brightness);

    return color(red, green, blue);
    //return res;
  }
}
