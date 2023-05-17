class character  {
  character(){
  a=100; b=200; c=300;
  }
  character(float p,float q,float r){
    a=p; b=q; c=r;
  }
  float a,b,c;
  void kirby(float x, float y, float z){
    fill(244,176,199);
    circle(x,y,z);
    eye(x,y,z);
    mouth(x,y,z);
    pink(x,y,z);
}
void eye(float x,float y,float z){
  float a,b;
  x=x-(0.13*z) ;
  y=y-(0.08*z);
  a=0.12*z;
  b=0.29*z;
  fill(5,115,192);
  strokeWeight(4);
  ellipse(x,y,a,b);
  x=x+(0.26*z);
  ellipse(x,y,a,b);
  fill(0,0,0);
  strokeWeight(1);
  y=y-(0.03*z);
  a=0.11*z; b=0.2*z;
  ellipse(x,y,a,b);
  x=x-(0.26*z);
  ellipse(x,y,a,b);
  fill(255,255,255);
  y=y-(0.05*z);
  a=0.07*z; b=0.12*z;
  ellipse(x,y,a,b);
  x=x+(0.26*z);
  ellipse(x,y,a,b);
}
void mouth(float x,float y,float z){
  float a,b;
  strokeWeight(2);
  fill(244,176,199);
  y=y+(0.12*z); a=0.14*z; b=0.08*z; 
  arc(x,y,a,b,radians(20),radians(160));
}
void pink(float x,float y,float z){
  float a,b;
  fill(235,105,151);
  strokeWeight(0);
  x=x+(0.32*z); y=y+(0.06*z);
  a=0.19*z; b=0.11*z;
  ellipse(x,y,a,b);
  x=x-(0.64*z);
  ellipse(x,y,a,b);
}
void squarecat(float x, float y,float z){
  fill(100,100,200);
  square(x,y,z);
  fill(255,255,255);
  circle(x+z/4,y+z*3/10,z*4/15);
  circle(x+z*3/4,y+z*3/10,z*4/15);
  line(x,y,x+z/4,y-z/3);
  line(x+z/4,y-z/3,x+z/2,y);
  line(x+z/2,y,x+z*3/4,y-z/3);
  line(x+z*3/4,y-z/3,x+z,y);
}
void villain(float x, float y,float z){
  strokeWeight(1);
  fill(255,220,170);
  circle(x,y,z);
  strokeWeight(1);
  stroke(0);
  fill(255,0,0);
  ellipse(x,y+0.05*z,0.3*z,0.25*z);
  noStroke();
  fill(255,100,50);
  ellipse(x+0.275*z,y+0.075*z,0.25*z,0.25*z);
  ellipse(x-0.275*z,y+0.075*z,0.25*z,0.25*z);
  fill(255);
  rect(x+0.2*z,y+0.025*z,0.05*z,0.05*z);
  rect(x-0.25*z,y+0.025*z,0.05*z,0.05*z);
  strokeWeight(1);
  stroke(0);
  noFill();
  arc(x-0.275*z,y+0.075*z,0.25*z,0.25*z,radians(270),radians(450));
  arc(x+0.275*z,y+0.075*z,0.25*z,0.25*z,radians(90),radians(270));
  bezier(x-0.275*z,y-0.2*z,x-0.225*z,y-0.425*z,x-0.075*z,y-0.4*z,x-0.025*z,y-0.225*z);
  bezier(x-0.175*z,y+0.2*z,x-0.125*z,y+0.3*z,x+0.125*z,y+0.3*z,x+0.175*z,y+0.2*z);
  bezier(x+0.025*z,y-0.225*z,x+0.075,y-0.4*z,x+0.225*z,y-0.425*z,x+0.275*z,y-0.2*z);
  fill(0);
  ellipse(x-0.15*z,y-0.125*z,0.075*z,0.15*z);
  ellipse(x+0.15*z,y-0.125*z,0.075*z,0.15*z);
}
}
class keymoving extends character{
  keymoving(float p, float q, float r){
    super(p,q,r);
  }
  void keyboard(int k,float speed){
    if(keyPressed){ 
    if (key == 'd') a+=speed;
    else if (key== 'a') a-=speed;
    else if (key == 'w') b-=speed;
    else if (key == 's') b+=speed;
    }
    if (a>width) a=0;
  else if (a<0) a=width; 
  if (b>height) b=0;
  else if (b<0) b=height;
  if(k==1){kirby(a,b,c);}
  if(k==2){squarecat(a,b,c);}
  if(k==3){villain(a,b,c);}
}
}
class mousemoving extends character{
  mousemoving(float p,float q,float r){
    super(p,q,r);
  }
  void mouse(int k){
  if(k==1){kirby(mouseX,mouseY,c);}
  if(k==2){squarecat(mouseX,mouseY,c);}
  if(k==3){villain(mouseX,mouseY,c);}
}
}
class justmoving extends character{
  justmoving(float p, float q, float r){
    super(p,q,r); n=random(-15,15); m=random(-15,15);
  }
  float n,m;
  void wallmove(int k){
    a+=n; b+=m;
    if (a>width) a=0;
    else if (a<0) a=width; 
    if (b>height) b=0;
    else if (b<0) b=height;
  if(k==1){kirby(a,b,c);}
  if(k==2){squarecat(a,b,c);}
  if(k==3){villain(a,b,c);}
  }
  void collidemove(int k){
    a+=n; b+=m;
    if (a>width) n=-n;
    else if (a<0) n=-n;
    if (b>height) m=-m;
    else if (b<0) m=-m;
  if(k==1){kirby(a,b,c);}
  if(k==2){squarecat(a,b,c);}
  if(k==3){villain(a,b,c);}
  }
}
keymoving a;
mousemoving b;
justmoving[]c;
void setup(){
  size(1600,900);
  a=new keymoving(300,400,200);
  b=new mousemoving(200,100,300);
  c=new justmoving[9];
  for(int i=0; i<9; i++) c[i]=new justmoving(100*i,100*i,100);
}
void draw(){
  background(150,255,160);
  a.keyboard(2,15);
  b.mouse(1);
  for(int i=0; i<3; i++){
    c[i].wallmove(i+1);
    c[i+3].collidemove(i+1);
    c[i+6].wallmove(i+1);
  }
  
}
