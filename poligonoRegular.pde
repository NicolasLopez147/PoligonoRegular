void setup() {
  size(800, 600);
  //maquina de estados
  println("Aviso "+frameCount);
}
void draw() {
  background(255,255,255);
  fill(#761F1F);
  /*
  println("Aviso "+frameCount);
  strokeWeight(3);
  stroke(#18A785);
  //atributo global
  fill(#761F1F);
  ellipse(80, 200, 100, 55);
  rect(100, 100, 100, 100);
  //ellipse(int(mouseX), int(mouseY), 100, 55);
  */
  polignoRegular(mouseX,mouseY,11,120,#203895);
}
//prototipo de funcion
void polignoRegular(int  x,int  y,int l,int tamano,int cl){
  //line(100,100,100+tamano,100);
  //pinta un poligno regular debajo del mouse
  //float angulo_interno = 180*(l-2)/l;
  float angulo_central = radians(360/l);
  float apotema = tamano/(2*tan(angulo_central/2));
  float coseno_angulo = cos(angulo_central);
  float seno_angulo = sin(angulo_central);
  float [][]vertices = new float [l][2];
  float [] vertice = {(tamano/2),apotema};
  float [] aux = {(coseno_angulo*vertice[0])-(seno_angulo*vertice[1]),seno_angulo*vertice[0]+coseno_angulo*vertice[1]};
  for (int i = 0 ; i< l ; i ++){
    vertice[0] = aux[0];
    vertice[1] = aux[1];
    aux[0] = (coseno_angulo*vertice[0])-(seno_angulo*vertice[1]);
    aux[1] = seno_angulo*vertice[0]+coseno_angulo*vertice[1];
    vertices[i][0] = x+aux[0];
    vertices[i][1] = y+aux[1];
  }
  fill(cl);
  beginShape();
  for (int i = 0 ; i <l ; i ++){
    vertex(vertices[i][0],vertices[i][1]);
  }
  endShape(CLOSE);
  
}
//  el juego de la vida
