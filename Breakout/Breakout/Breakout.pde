
int p;                  //posizione iniziale barra
int i=25;             //velocità barra
int l=75;             //lunghezza sbarra
int x;               //posizione pallina x
int y;            //posizione pallina y
int vx=-3;       //velocità pallina x
int vy=-2;      //velocità pallina y
int score=0;       //punteggio
int timem=2;      //tempo minuti
int times=30;      //tempo secondi
int t;                 //variabile tempo
long tl=1000;     //limite tempo
int life=3;                //vite extra
int[] r1={1,1,1,1,1,1,1,1,1,1};   //array rettangoli 1
int[] r2={1,1,1,1,1,1,1,1,1,1};   //array rettangoli 2
int[] r3={1,1,1,1,1,1,1,1,1,1};   //array rettangoli 3
int[] r4={1,1,1,1,1,1,1,1,1,1};   //array rettangoli 4
int[] r5={1,1,1,1,1,1,1,1,1,1};   //array rettangoli 5
int[] r6={1,1};                   //array rettangoli 6
int j,xr,yr;   //indici rettangoli
int c1=0;      //variabile controllo vite extra
int c2=0;      //variabile controllo malus verde (aumenta vx)
int c3=0;      //variabile controllo malus giallo (aumenta vy)
int c4=0;      //variabile controllo malus-bonus arancione (effetto random)
int c5=0;      //variabile controllo  malus rosso (accorciamento sbarra)
int c7=1;      //variabile controllo bonus blu (vita extra ai 5 soffitti)
int c8;        //variabile controllo rimbalzo
int c9=1;      //variabile vittoria
int r;         //variabile random
int cont;      //contenitore sbarra
PFont f; 



void setup(){
  
  size (700,400);
  background(0);
  fill(180);
  p=350;
  x=p+(l/2);
  y=height-60;
  cont=i/2;
  strokeWeight(5);
  f=createFont("Arial",20);
  textFont(f);
  randomSeed(second());
    
  }
  
  
  void draw(){
    
    //gameobjects
    background(0);
    rect(30,50,20,height);               //muro sinistro
    rect(width-50,50,20,height);         //muro destro
    rect(30,45,width-60,20);             //soffitto
    rect(p,height-50,l,5);               //sbarra  
    stroke(255);  
    rect(x,y,5,5);                                                      //pallina
    text("Score: "+score,(width/2)-250,30);                              //punteggio
    text("Lifes: "+life,(width/2)-30,30);                                 //vite extra
    if (times<10) text("Time : "+timem+":0"+times,(width/2)+150,30);        //tempo
    else text("Time : "+timem+":"+times,(width/2)+150,30);
    stroke(180);
    t=(int)millis();                            // acquisizione tempo
    
 
      for(j=0;j<10;j++){
        if(j==0) c9=0;
        c9=c9+r1[j];
        c9=c9+r2[j];
        c9=c9+r3[j];
        c9=c9+r4[j];
        c9=c9+r5[j];
       } 
       c9=c9+r6[0];
       c9=c9+r6[1];
      if((life==0)||((timem==0)&&(times==0))||(c9==0)){         //game over-vittoria
   
      vx=-3;
      vy=-2;
      x=p+(l/2);
      y=height-60;                                                  //reset status
      timem=2;
      times=30;
      life=3;
      i=25;
      l=75;
      c1=0;
      c2=0;
      c3=0;
      c4=0;
      c5=0;
      c7=1;
      c9=1;
      score=0;
      
      resetRettangoli();
       
      }
    
    
      setFilaRettangoli(1);   
      setFilaRettangoli(2);
      setFilaRettangoli(3);
      setFilaRettangoli(4);
      setFilaRettangoli(5);
      setFilaRettangoli(6);
  
     
    stroke(180);
    x=x+vx;                //movimento pallina
    y=y+vy;
    
    if((x<=55)&&(x>=50)){                                                              //collider detector muro sinistro
      vx=-vx ;                        
      }
    if ((x>=(width-60))&&(x<=(width-40))){                                                           //collider detector muro destro
      vx=-vx;     
      }     
    if ((y>=height)||(y<=70)){                                                         //collider detector alto-basso
      vy=-vy;    
      if(y>=height){
        life--;  
        c1=0; 
        x=p+(l/2);
        y=height-70;
        vy=-2;                                                                    //ripristino valori
       if(vx<0) vx=-3;
       else vx=3;
       }
      if(y<=70){                                                                       //opzioni collider
        if((c1==8)&&(c7!=0)){
            life++;
            c1=0;
            }
           c1++;         
          }  
     
    }
    if((y>=340)&&(y<=350)&&((x>=p)&&(x<=p+l))){        //collider detector sbarra
     
     if (x<=(width/2)) c8=1;
     else c8=2;
     if((x>=p+(l/2))&&(c8==1)){
     vy=-vy;
     vx=-vx;
     c8=3;
     }
     if((x<=p+(l/2))&&(c8==2)){
     vy=-vy;
     vx=-vx;
     c8=3;
     }
     if(c8<=2) vy=-vy;  
      }
            
     
             
    //collider fila rettangoli 1
    
    if(((y<=203)&&(y>=193))&&((x>=55)&&(x<55+59))&&(r1[0]==1)){       //rettangolo 1
      
      vy=-vy;
      r1[0]=0;
      score++;

      }
      if(((y<=203)&&(y>=193))&&((x>=114)&&(x<114+59))&&(r1[1]==1)){       //rettangolo 2
      
      vy=-vy;
      r1[1]=0;
      score++;

      }
      if(((y<=203)&&(y>=193))&&((x>=173)&&(x<173+59))&&(r1[2]==1)){       //rettangolo 3
      
      vy=-vy;
      r1[2]=0;
      score++;

      }
      if(((y<=203)&&(y>=193))&&((x>=232)&&(x<232+59))&&(r1[3]==1)){       //rettangolo 4
      
      vy=-vy;
      r1[3]=0;
      score++;
 
      }
      if(((y<=203)&&(y>=193))&&((x>=291)&&(x<291+59))&&(r1[4]==1)){       //rettangolo 5
      
      vy=-vy;
      r1[4]=0;
      score++;

      }
      if(((y<=203)&&(y>=193))&&((x>=350)&&(x<350+59))&&(r1[5]==1)){       //rettangolo 6
      
      vy=-vy;
      r1[5]=0;
      score++;

      }
       if(((y<=203)&&(y>=193))&&((x>=409)&&(x<409+59))&&(r1[6]==1)){       //rettangolo 7
      
      vy=-vy;
      r1[6]=0;
      score++;
      }
       if(((y<=203)&&(y>=193))&&((x>=468)&&(x<468+59))&&(r1[7]==1)){       //rettangolo 8
      
      vy=-vy;
      r1[7]=0;
      score++;

      }
       if(((y<=203)&&(y>=193))&&((x>=527)&&(x<527+59))&&(r1[8]==1)){       //rettangolo 9
      
      vy=-vy;
      r1[8]=0;
      score++;

      }
       if(((y<=203)&&(y>=193))&&((x>=586)&&(x<586+59))&&(r1[9]==1)){       //rettangolo 10
      
      vy=-vy;
      r1[9]=0;
      score++;

      }
      
      //collider rettangoli fila 2
      
       if(((y<=193)&&(y>=183))&&((x>=55)&&(x<55+59))&&(r2[0]==1)){       //rettangolo 1
      
      vy=-vy;
      r2[0]=0;
      score=score+3;
       c2++;
      }
      if(((y<=193)&&(y>=183))&&((x>=114)&&(x<114+59))&&(r2[1]==1)){       //rettangolo 2
      
      vy=-vy;
      r2[1]=0;
      score=score+3;
       c2++;
      }
      if(((y<=193)&&(y>=183))&&((x>=173)&&(x<173+59))&&(r2[2]==1)){       //rettangolo 3
      
      vy=-vy;
      r2[2]=0;
      score=score+3;
       c2++;
      }
      if(((y<=193)&&(y>=183))&&((x>=232)&&(x<232+59))&&(r2[3]==1)){       //rettangolo 4
      
      vy=-vy;
      r2[3]=0;
      score=score+3;
      c2++; 
      }
      if(((y<=193)&&(y>=183))&&((x>=291)&&(x<291+59))&&(r2[4]==1)){       //rettangolo 5
      
      vy=-vy;
      r2[4]=0;
      score=score+3;
      c2++; 
      }
      if(((y<=193)&&(y>=183))&&((x>=350)&&(x<350+59))&&(r2[5]==1)){       //rettangolo 6
      
      vy=-vy;
      r2[5]=0;
      score=score+3;
     c2++;  
      }
      if(((y<=193)&&(y>=183))&&((x>=409)&&(x<409+59))&&(r2[6]==1)){       //rettangolo 7
      
      vy=-vy;
      r2[6]=0;
      score=score+3;
     c2++;  
      }
      if(((y<=193)&&(y>=183))&&((x>=468)&&(x<468+59))&&(r2[7]==1)){       //rettangolo 8
      
      vy=-vy;
      r2[7]=0;
      score=score+3; 
       c2++;
      }
      if(((y<=193)&&(y>=183))&&((x>=527)&&(x<527+59))&&(r2[8]==1)){       //rettangolo 9
      
      vy=-vy;
      r2[8]=0;
      score=score+3;
      c2++; 
      }
      if(((y<=193)&&(y>=183))&&((x>=586)&&(x<586+59))&&(r2[9]==1)){       //rettangolo 10
      
      vy=-vy;
      r2[9]=0;
      score=score+3;
      c2++; 
      }
      //collider fila rettangoli 3
      
      if(((y<=183)&&(y>=173))&&((x>=55)&&(x<55+59))&&(r3[0]==1)){       //rettangolo 1
      
      vy=-vy;
      r3[0]=0;
      score=score+5;
      c3++; 
      }
      if(((y<=183)&&(y>=173))&&((x>=114)&&(x<114+59))&&(r3[1]==1)){       //rettangolo 2
      
      vy=-vy;
      r3[1]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=173)&&(x<173+59))&&(r3[2]==1)){       //rettangolo 3
      
      vy=-vy;
      r3[2]=0;
      score=score+5;

     c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=232)&&(x<232+59))&&(r3[3]==1)){       //rettangolo 4
      
      vy=-vy;
      r3[3]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=291)&&(x<291+59))&&(r3[4]==1)){       //rettangolo 5
      
      vy=-vy;
      r3[4]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=350)&&(x<350+59))&&(r3[5]==1)){       //rettangolo 6
      
      vy=-vy;
      r3[5]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=409)&&(x<409+59))&&(r3[6]==1)){       //rettangolo 7
      
      vy=-vy;
      r3[6]=0;
      score=score+5;
      c3++;  
      }
      if(((y<=183)&&(y>=173))&&((x>=468)&&(x<468+59))&&(r3[7]==1)){       //rettangolo 8
      
      vy=-vy;
      r3[7]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=527)&&(x<527+59))&&(r3[8]==1)){       //rettangolo 9
      
      vy=-vy;
      r3[8]=0;
      score=score+5;
      c3++;   
      }
      if(((y<=183)&&(y>=173))&&((x>=586)&&(x<586+59))&&(r3[9]==1)){       //rettangolo 10
      
      vy=-vy;
      r3[9]=0;
      score=score+5;
      c3++;  
      }
      
      //collider fila rettangoli 4
      if(((y<=173)&&(y>=163))&&((x>=55)&&(x<55+59))&&(r4[0]==1)){       //rettangolo 1
      
      vy=-vy;
      vx=-vx;
      r4[0]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=114)&&(x<114+59))&&(r4[1]==1)){       //rettangolo 2
      
      vy=-vy;
      vx=-vx;
      r4[1]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=173)&&(x<173+59))&&(r4[2]==1)){       //rettangolo 3
      
      vy=-vy;
      vx=-vx;
      r4[2]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=232)&&(x<232+59))&&(r4[3]==1)){       //rettangolo 4
      
      vy=-vy;
      vx=-vx;
      r4[3]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=291)&&(x<291+59))&&(r4[4]==1)){       //rettangolo 5
      
      vy=-vy;
      vx=-vx;
      r4[4]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=350)&&(x<350+59))&&(r4[5]==1)){       //rettangolo 6
      
      vy=-vy;
      vx=-vx;
      r4[5]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=409)&&(x<409+59))&&(r4[6]==1)){       //rettangolo 7
      
      vy=-vy;
      vx=-vx;
      r4[6]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=468)&&(x<468+59))&&(r4[7]==1)){       //rettangolo 8
      
      vy=-vy;
      vx=-vx;
      r4[7]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=527)&&(x<527+59))&&(r4[8]==1)){       //rettangolo 9
      
      vy=-vy;
      vx=-vx;
      r4[8]=0;
      score=score+7;
      c4++; 
      }
      if(((y<=173)&&(y>=163))&&((x>=586)&&(x<586+59))&&(r4[9]==1)){       //rettangolo 10
      
      vy=-vy;
      vx=-vx;
      r4[9]=0;
      score=score+7;
      c4++; 
      }
      
      //collider fila rettangoli 5
      if(((y<=163)&&(y>=153))&&((x>=55)&&(x<55+59))&&(r5[0]==1)){       //rettangolo 1
           
      vy=-vy;
      r5[0]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=114)&&(x<114+59))&&(r5[1]==1)){       //rettangolo 2
           
      vy=-vy;
      r5[1]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=173)&&(x<173+59))&&(r5[2]==1)){       //rettangolo 3
           
      vy=-vy;
      r5[2]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=232)&&(x<232+59))&&(r5[3]==1)){       //rettangolo 4
           
      vy=-vy;
      r5[3]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=291)&&(x<291+59))&&(r5[4]==1)){       //rettangolo 5
           
      vy=-vy;
      r5[4]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=350)&&(x<350+59))&&(r5[5]==1)){       //rettangolo 6
           
      vy=-vy;
      r5[5]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=409)&&(x<409+59))&&(r5[6]==1)){       //rettangolo 7
           
      vy=-vy;
      r5[6]=0;
      score=score+10;
      c5++; 
      }
      
      if(((y<=163)&&(y>=153))&&((x>=468)&&(x<468+59))&&(r5[7]==1)){       //rettangolo 8
           
      vy=-vy;
      r5[7]=0;
      score=score+10;
      c5++; 
      }
      
      if(((y<=163)&&(y>=153))&&((x>=527)&&(x<527+59))&&(r5[8]==1)){       //rettangolo 9
           
      vy=-vy;
      r5[8]=0;
      score=score+10;
      c5++; 
      }
      if(((y<=163)&&(y>=153))&&((x>=586)&&(x<586+59))&&(r5[9]==1)){       //rettangolo 10
           
      vy=-vy;
      r5[9]=0;
      score=score+10;
      c5++; 
      }
      
      //collider fila rettangoli 6
      
      if((x>=55)&&(x<=95)&&(y<=80)&&(y>=70)&&(r6[0]==1)){           //rettangolo 1
        
        vy=-vy;
        r6[0]=0;
        score=score+20;     
        }
         if((x>=605)&&(x<=645)&&(y<=80)&&(y>=70)&&(r6[1]==1)){           //rettangolo 2
        
        vy=-vy;
        r6[1]=0;
        score=score+20;      
        }
        
        for(j=0;j<10;j++){                     //controllo presenza blocchi blu 
          
          if(j==0) c7=0;
          c7=c7+r1[j];
         } 
      if(c2==3){                      //velocità extra X
        if(vx<0) vx--;
        else vx++;
        c2=0;
        }
        if(c3==3){                    //velocità extra Y
         if(vy<0) vy--;
         else vy++;
          c3=0;
          }
          if((c4%2==0)&&(c4!=0)){        //effetto random
          
         r=(int)random(1,6);
          
          switch(r){
            
          case 1: {                     //aumento velocità
            if(vx<0) vx=vx--;
            else vx=vx++;
            if(vy<0) vy=vy--;
            else vy=vy++; 
            break;            
          }
          case 2: {             //allungamento sbarra sbarra
          l=l+10;
          break;
          }
           
          case 3:{             //ricomparsa blocchi 
          
          for(j=0;j<10;j++){
            if(r1[j]==0){
              r1[j]=1;                   //prima fascia
              break;
              }
            }
              
          for(j=0;j<10;j++){
            if(r2[j]==0){
              r2[j]=1;                   //seconda fascia
              break;
              }
            }
                
            for(j=0;j<10;j++){
            if(r3[j]==0){
              r3[j]=1;                   //terza fascia
              break;
              }
            }
          
            break;
            }
            
            case 4: {                            //variazione velocità sbarra
            r=(int)random(-5,6);
            i=i+r;
            if(r<0) cont=cont-(r/2);
            else cont=cont+(r/2);
            break;
            }
            
          
          case 5: {                  //vita extra
            life++;
            break;
            }          
          }
          c4=0;
        }
         
      if(c5==5){               //accorciamento sbarra
        l=l-10;
        c5=0; 
        } 
       //countdown tempo
       
      if(t>=tl) {
        if(times==0) times=59;
        else times--;
        if(times==59) timem--;
        tl=tl+1000;
        }
    
    }
    
    void setFilaRettangoli(int numfila){
      
      int j=0;
      
      if(numfila==1) {
        
      // primo livello rettangoli
      
    for(j=0;j<10;j++){
       
      stroke(0,0,255);
      if(j==0){
      yr=(height/2)-5;
      xr=55;
      }
      if(r1[j]==1){
        rect(xr,yr,59,5);
        }
      xr=xr+59;    
      }
      
        
      }
      
      if(numfila==2){
        
        //secondo livello rettangoli
      
    for(j=0;j<10;j++){
      
      if(j==0){
      yr=(height/2)-15;
      xr=55;
      stroke(0,255,0);
      }
      if(r2[j]==1){
        rect(xr,yr,59,5);
        }
      xr=xr+59;    
      } 
        
        
      }
      
      if(numfila==3){
        
        //terzo livello rettangoli
  
  for(j=0;j<10;j++){
      
      if(j==0){
      yr=(height/2)-25;
      xr=55;
      stroke(255,255,0);
      }
      if(r3[j]==1){
        rect(xr,yr,59,5);
        }
      xr=xr+59;    
      }
        
      }
      
      if(numfila==4){
        
       //quarta fila rettangoli
      
   for(j=0;j<10;j++){
      
      if(j==0){
      yr=(height/2)-35;
      xr=55;
      stroke(255,200,0);
      }
      if(r4[j]==1){
        rect(xr,yr,59,5);
        }
      xr=xr+59;    
      }
      
      }
      
      if(numfila==5){
        
        //quinta fila rettangoli
        
      for(j=0;j<10;j++){
      
      if(j==0){
      yr=(height/2)-45;
      xr=55;
      stroke(255,0,0);
      }
      if(r5[j]==1){
        rect(xr,yr,59,5);
        }
      xr=xr+59;    
      }
      
      }
      
      if(numfila==6){
        
           //sesta fila rettangoli
      
  for(j=0;j<2;j++){
       stroke(150,0,255);
       if((j==0)&&(r6[j]==1)){
         yr=70;
         xr=55;
         rect(xr,yr,40,5);
         }
         if((j==1)&&(r6[j]==1)){
        xr=605;
        yr=70;
        rect(xr,yr,40,5);
        }   
    } 
    
      }
    
      
      
    }
    
    //reset blocchi
    
    void resetRettangoli(){
      
       for (j=0;j<10;j++){
        
        r1[j]=1;
        r2[j]=1;                                      
        r3[j]=1;
        r4[j]=1;
        r5[j]=1;
        }
        r6[0]=1;
        r6[1]=1;
      
      
      
    }
    void keyPressed(){             //gestione tasti
      
      if(key=='a'){
        if(p<=50+(cont/2)) p=p+i;
        else p=p-i; 
        }                                    //contenimento sbarra
        if(key=='s'){
          if(p+l>=645-(cont/2)) p=p-i;
          else p=p+i;
          }
          
          }
            
          
        
        
      
      