private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
  size(640, 480);  
  noLoop();
} 

public void draw() 
{   
  background(0); 
  strokeWeight(1);
  stroke((int)(Math.random()*256)); 
  for(int i=-300; i<=300;i+=20){
  line(320+i, 480, 320+i, 380);
  drawBranches(320+i, 380, 100, 3*Math.PI/2);
  }
} 

public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if (branchLength > smallestBranch) {
  drawBranches(endX1, endY1, branchLength, angle1);
  drawBranches(endX2, endY2, branchLength, angle2);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  }
  int diam = 0;
  float r = 255;
  noFill();
  while (diam < 30) {
    strokeWeight(1);
    stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    diam++;
    r = r - 255/30.0;
  }
}
