import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Pong extends PApplet {


//Pong Game


int x =width/2; //posizione pallina
int y =height/2;
int vx = 5;   // velocit\u00e0 pallina asse x
int vy = 2;   //velocit\u00e0 pallina asse y
int l=65;     //lunghezza racchette
int p1  = 0;  // punteggo player 1
int p2  = 0;  //punteggio player 2
int r1 = 250; // posizione racchetta 1
int r2 = 250; // posizione racchetta 2
int inc = 30; // incremento posizione racchette
PFont f;


public void setup() {
  
  background(0);
  stroke(255);
  fill(255);
  f = createFont("Arial",30);
  textFont(f);
  

}

public void draw() {
  //gameobjects
  background(0);
  line(width/2,0,width/2,height); //linea
  rect(x,y, 10,10);   //pallina
  rect(20,r1,10,l);          //racchetta 1
  rect(width - 30,r2,10,l);  //racchetta 2
  text(p1, (width/2) -60, 30);   //punteggi
  text(p2, (width/2) +50, 30);

  
  x = x + vx;
  y = y + vy;
  
  //rimbalzo alto-basso
  if ((y < 0) || (y > height-10)) {
    vy =-vy;
  }
  
  //Goal destro-sinistro
  if (x > width) {
    p1 = p1 + 1;
    x = width / 2;
    y = height / 2; 
    vx=-vx; 
    resetRacchette();

  }
  if (x < 0) {
    p2 = p2 + 1; 
    x = width / 2;
    y = height / 2;
    vx=-vx;
    resetRacchette();

  }

  // collision detection player 1
  if ((x<= 30) && (x >=20) && (y >= r1) && (y <= (r1 +l)))
  {
    vx=-vx;

  }  
  // collision detection player 2
  if (((x<= width - 30)) && (x >=(width - 40)) && (y >= r2) && (y <= (r2 +l)))
  {
    vx =-vx;

  }  
}

public void resetRacchette(){
  
  r1=250;
  r2=250;
  
 }

public void keyPressed() {

  if (key == 'a') {
    if((r1-inc)>-45)r1 = r1 - inc;
  } 
  if (key == 'z') {
    if((r1+inc)<height-37) r1 = r1 + inc;
  } 
  if (key == 'k') {
   if((r2-inc)>-45) r2 = r2 - inc;
  } 
  if (key == 'm') {
   if((r2+inc)<height-37) r2 = r2 + inc;
  }
}
  public void settings() {  size(700,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
