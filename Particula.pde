class Particula{
  //estos son los atributos de mi partícula
  float x,y,dx,dy;
  int t;
  color c;
  
  //este es su constructor
  Particula(float x_, float y_, float dx_, float dy_, int t_, color c_){
    x = x_;
    y= y_;
    dx = dx_;
    dy = dy_;
    t = t_;
    c = c_;
  }
  
  //para mover mi particula altero su posición por sus deltas
  void movimiento(){
    x += dx;
    y += dy;
  }
  
  //dibujo mi particula en su posición, con su color y tamaño
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,t,t);
  }
  
  //verifico que si mi partícula está en los límites y altero sus deltas
  void rebota(){
    if (x > width){
      x = width;
      dx= dx* -1;
    }
    if (x<0){
      x = 0;
      dx= dx* -1;
    }
    if (y<0){
      y = 0;
      dy*= -1;
    }
    if (y>height){
      y = height;
      dy*= -1;
    }
  }
  
  
    void dada()
  {
    x = 1200;
    y = 0;
    dx = 0;
    dy = 0;
  }
  
}
