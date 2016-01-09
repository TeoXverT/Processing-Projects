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

public class Robot extends PApplet {


int e;           //illuminazione occhi
int m;         //movimento attivo-disattivo
float ar,al;   //variabili rotazione manuale
int anim,i,dir1,dir2,j;    //variabili animazione
int ts1,ts2,t;      //variabili temporali
int rocket;
int x,y,sx,sy;
int ch;

//Robot by Matteo Bellati
//il riferimento a destra-sinistra \u00e8 fatto rispetto all'utente
public void setup(){
  
  size(400,400);
  e=0;
  rocket=0;
  i=10;
  j=10;
  al=0;
  ar=0;
  ch=0;
  dir1=0;
  dir2=0;
  x=170;
  y=150;
  sx=(int)random(-8,8);
  sy=(int)random(-8,8);
  randomSeed(second());
  ts1=(int)millis();
  ts2=(int)millis();
  smooth();
   }
   
   
   
   public void draw(){
     
     background(255);
     stroke(255);
     t=(int)millis();
     
     fill(38,38,200);
     rect(x,y,38,30);   //testa
     rect(x-6,y+32,50,50);   //corpo
     
      drawRightArm();     //braccio destro
      drawLeftArm();      //braccio sinistro
     
     rect(x,y+83,15,50);        //gamba sinistra
     rect(x+23,y+83,15,50);     //gamba destra
     
     if(e==0)  fill(222,222,249);
     else fill(222,222,20);
     ellipse(x+9,y+12,10,10);  //occhio sinistro
     ellipse(x+28,y+12,10,10);  //occhio destro
     fill(38,38,200);
     fly();
     }
   
   //disegno braccio sinistro
   public void drawLeftArm(){
     
        pushMatrix();
        //movimento manuale
        if(anim==0){
        translate(x-6,y+32);
       if((m==1)&&(mouseX<=189)&&(radians(-mouseY-60)<radians(-250))&&(radians(-mouseY-60)>radians(-360))) al=radians(-mouseY-60);
       if((radians(-mouseY-60)>=radians(-250)&&(m==1))&&(mouseX<=189)) al=radians(-250);
       if((m==1)&&(radians(-mouseY-60)<=radians(-360))&&(mouseX<=189)) al=radians(-360);
        rotate(al);
        rect(-15,0,15,40);
        }
        //animazione
        else{
          translate(x-6,y+32);
          rotate(al);
          rect(-15,0,15,40);
          if(t-ts1>=50){
           if(dir1==0) al=al+radians(i);
           else al=al-radians(i);
            ts1=ts1+50;
            }
          if(al+radians(i)>=radians(-250)) dir1=1;
          if(al-radians(i)<=radians(-360)) dir1=0;                  
        }
        popMatrix();
        
       }
       
         //disegno braccio destro
   public void drawRightArm(){
     
        pushMatrix();
        //movimento manuale
        if(anim==0){
        translate(x+44,y+32);
       if((m==1)&&(mouseX>189)&&(radians(mouseY+60)>radians(253))&&(radians(mouseY+60)<radians(360))) ar=radians(mouseY+60);
       if((m==1)&&(mouseX>189)&&(radians(mouseY+60)<=radians(253))) ar=radians(253);
       if((m==1)&&(radians(mouseY+60)>=radians(360))&&(mouseX>189)) ar=radians(360);
       rotate(ar);
        rect(0,0,15,40); 
        }
       //animazione
        else {
          translate(x+44,y+32);
          rotate(ar);
          rect(0,0,15,40);
          if(t-ts2>=50){
           if(dir2==1) ar=ar+radians(j);
           else ar=ar-radians(j);
            ts2=ts2+50;
            }
          if(ar-radians(j)<=radians(253)) dir2=1;
          if(ar+radians(j)>=radians(360)) dir2=0;                  
        } 
        popMatrix();
       }
       
       //robot in volo
       
       public void fly(){
         
         if(rocket==1){
          
              //disegno jet
              fill(255,0,0); 
              noStroke();             
              ellipse(x+7,y+137,12,12);
              ellipse(x+30,y+137,12,12);
              fill(255,100,0);
              rect(x+2,y+139,10,20);
              rect(x+25,y+139,10,20);
              fill(255,180,0);
              triangle(x+2,y+159,x+7,y+164,x+12,y+159);
              triangle(x+25,y+159,x+30,y+164,x+35,y+159);

              
              //calcolo spostamento
              x=x+sx;
              y=y+sy;
              if((x-6<=0)||(x+44>=width)) sx=-sx;
              if((y<=0)||(y+133>=height)) sy=-sy;
              ch++;
              if(ch==50){                
                if(e==0) e=1;
                else e=0;                
                }
              if(ch==100){                
                sx=(int)random(-8,8);
                sy=(int)random(-8,8);
                if(e==0) e=1;
                else e=0; 
                ch=0;
              }  
            }  
        } 
         
       
       public void keyPressed(){
                
         if((key=='a')||(key=='A')){
         
           if(e==0) e=1;
           else e=0;
           }
           if((key=='s')||(key=='S')){
             
             if(rocket==0) rocket=1;
             else rocket=0;
            } 
         }
         
         
           public void mousePressed(){
             
             if(mouseButton==LEFT){
               
               if(m==0) m=1;
               else m=0;
               anim=0;
              }
              if(mouseButton==RIGHT){
               
               if(anim==0) anim=1;
               else anim=0;
               m=0;
              }
             }
        
         
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Robot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
