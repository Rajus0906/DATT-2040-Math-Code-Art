/** 
 * Penrose Snowflake L-System 
 * by Geraldine Sarmiento. 
 * 
 * This example was based on Patrick Dwyer's L-System class. 
 */

PenroseSnowflakeLSystem ps;

void setup() {
  size(640, 360);
  stroke(#172FFA);
  noFill();
  ps = new PenroseSnowflakeLSystem();
  ps.simulate(4);
}

void draw() {
  background(#FFA0A0);
  ps.render();
}
