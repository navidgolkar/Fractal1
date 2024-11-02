float c1=0,c2=0;
float size;
int theta=60;
int n=4;
int m=0;
int z=0;
String text;
boolean flag=false;

void setup() {
  size(1000, 1000);
  size=height*9/10;
  stroke(0, 0, 0);
}

void draw() {
  background(0);
  n+=m;
  theta+=z;
  uds(width/2, height/2, size, n);
  if (flag) {
    String name="fractal_final_angle="+theta+"_n="+n+".png";
    text="";
    saveFrame(name);
    flag=false;
  }
  text="angle = "+theta+"\nn = "+n;
  textSize(20);
  fill(255);
  text(text,20,20);
  z=0;
  m=0;
}

void uds(float x, float y, float d, int iter) {
  c1=((float)iter/n);
  c2=(((float)n-iter)/n);
  //stroke(c1*255,c2*255,(c1+c2)*255/2,c2*100);
  stroke(c2*255,255,(c1+c2)*255/2,10+c1*90);
  noFill();
  circle(x, y, d);
  if (iter>1) {
    for (int i=0; i<360; i=i+theta) {
      uds(x+(d/4)*cos(PI*i/180), y-(d/4)*sin(PI*i/180), d/2, iter-1);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && n<10) {
      m=1;
    }
    else if (keyCode == DOWN && n>1) {
      m=-1;
    }
    if (keyCode == RIGHT && theta<360) {
      z=1;
    }
    else if (keyCode == LEFT && theta>1) {
      z=-1;
    }
  }
}

void mouseClicked() {
  flag=true;
}
