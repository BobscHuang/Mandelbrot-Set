int aMin = -2;
int aMax = 1;
int bMin = -1;
int bMax = 1;
float aDelta = aMax - aMin;
float bDelta = bMax - bMin;
float incrementX;
float incrementY;
float sizeX;
float sizeY;
boolean draw = true;

void setup() {
  size(1000, 700);
  background(255);
  incrementX = 0.002;
  incrementY = height / (width / incrementX);
  sizeX = width / (aDelta / incrementX);
  sizeY = height / (bDelta / incrementY);
}

void draw(){
  if (draw == true){
    for (float a = aMin; a <= aMax; a += incrementX){
      for (float b = bMin; b <= bMax; b += incrementY){
        
        Complex c = new Complex(a, b);
        Complex z = c;
        int n = 1;
        
        while (z.magnituide < 2 && n < 255){
          z = z.power(2).add(c);
          n++;
        } 
        float xVal = getScreenXvalue(a);
        float yVal = getScreenYvalue(b);
        stroke(map(log(n), 0, log(255), 0, 255));
        ellipse(xVal, yVal, sizeX, sizeY);  
      }
    }
  }
draw = false;
}

float getScreenXvalue(float a){
  float screenXvalue = (width * (a - aMin)) / aDelta;
  return screenXvalue;
}

float getScreenYvalue(float b){
  float screenYvalue = (height * (b - bMin)) / bDelta;
  return screenYvalue;
}