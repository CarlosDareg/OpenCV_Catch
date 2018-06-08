import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

OpenCV opencv;
Rectangle[] faces;
Capture video;

Particula una;

int count;

ArrayList <Particula> Particulas;

int pp;

void setup() 
{
  size(640, 480);
  video = new Capture(this,width,height);
  opencv = new OpenCV(this,width,height);

  video.start();
  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  color c = color(random(255),random(255),random(255));
  
  una = new Particula(random(400),random(400),random(-1,10),random(-1,10), ceil(random(10,30)), c);
  
  Particulas = new ArrayList<Particula>();
  for (int i=0; i<90; i++){
     c = color(random(255),random(255),random(255));
    Particulas.add(new Particula(random(width),random(height),random(-1,7),random(-1,7), ceil(random(10,30)), c));
  }
  
  pp = 0;
  count = 0;
}


void draw() 
{
  
  switch(pp)
  {
    case 0:
    background(255);
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("OpenCV Catch",width/2,200);
    textSize(25);
    text("ENTER para continuar",width/2,300);
    break;
    
    case 1:
    background(0);
    textSize(20);
    fill(255);
    text("Tu cara es tu area de acción",width/2,100);
    text("Debes conseguir 70 pelotas",width/2,150);
    text("OpenCV puede llegar a tener",width/2,200);
    text("algunos errores al reconocerte",width/2,230);
    text("La area roja es mas exacta",width/2,300);
    text("a la zona de acción",width/2,330);
    text("Algunas pelotas no entran en juego",width/2,430);
    text("ENTER para continuar",width/2,460);
    break;
    
    case 2:
      opencv.loadImage(video);
      Rectangle[] faces = opencv.detect();
      
      noFill();
      stroke(0, 255, 0);
      strokeWeight(3);
      
      for (int i = 0; i < faces.length; i++) 
      {
        rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    
        for(Particula p:Particulas)
        {
          if(p.x > faces[i].x && p.x < faces[i].width + 250 && p.y > faces[i].y && p.y < faces[i].height + 250)
          {
            count += 1;
            p.dada();
          }
        }
        fill(255,0,0,50);
        rect(faces[i].x, faces[i].y, faces[i].width - 50 ,faces[i].height - 50);
      }
      fill(255);
      textSize(100);
      textAlign(LEFT);
      text(count,10,200);
      
      if(count == 70)
      {
        pp = 5;
      }
  
      una.movimiento();
      una.rebota();
      una.display();
  
      for(Particula p:Particulas)
      {
        p.display();
        p.movimiento();
        p.rebota();
      }
    break;
    
    default:
    background(#7EF5EE);
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text("Felicidades :D",width/2,100);
    text("Gracias por jugar",width/2,200);
    fill(random(255),random(255),random(255));
    text("ENTER para salir",width/2,250);
    
    if(keyPressed)
    {
      if(key == ENTER)
      {
        exit();
      }
    }
    break;
  }
  
}


void keyReleased() 
{
  if(key == ENTER || key == ENTER)
    {
        pp ++;
    }
}


void captureEvent(Capture c) {
  c.read();
}
