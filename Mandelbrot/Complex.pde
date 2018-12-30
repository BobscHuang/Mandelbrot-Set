class Complex{
  float a;
  float b;
  float magnituide;
  
  Complex(float a_, float b_){
    this.a = a_;
    this.b = b_;
    this.magnituide = sqrt(pow(a_, 2) + pow(b_, 2));
  }
  
  void display(){
    String aNew;
    String bNew;
    
    if (int(this.a) == this.a){
      aNew = str(int(this.a));
    }
    else{
      aNew = str(this.a);
    }
    
    if (int(this.b) == this.b){
      bNew = str(int(this.b));
    }
    else{
      bNew = str(this.b);
    }
    
    if (this.a == 0){
      println(bNew + "i");
    }
    else if (this.b == 0){
      println(aNew);
    }
    else if (this.a == 0 && this.b == 0){
      println(0);
    }
    else{
      
      if (this.b < 0){
        bNew = bNew.substring(1);
        println(aNew + " - " + bNew + "i");
      }
      else{
        println(aNew + " + " + bNew + "i");
      }
    }
  }
  
  Complex add(Complex other){
    float newA = this.a + other.a;
    float newB = this.b + other.b;
    return new Complex(newA, newB);
  }
  
  Complex subtract(Complex other){
    float newA = this.a - other.a;
    float newB = this.b - other.b;
    return new Complex(newA, newB);
  }
  
  Complex mutiByComplexNum(Complex other){
    float newA = this.a * other.a - this.b * other.b;
    float newB = this.b * other.a + this.a * other.b;
    return new Complex(newA, newB);
  }
  
  Complex mutiByRealNum(float realNum){
    float newA = this.a * realNum;
    float newB = this.b * realNum;
    return new Complex(newA, newB);
  }
  
  Complex power(int exponent){
    Complex result = this;
    for (int i = 0; i < exponent - 1; i++){
      result = this.mutiByComplexNum(result);
    }
    return result;
  }
  
  float absoluteValue(){
    return this.magnituide;
  }
  
  Complex conjugate(){
    float newA = pow(this.a, 2) + pow(this.b, 2);
    float newB = 0;
    return new Complex(newA, newB);
  }
  
  Complex divide(Complex other){
    Complex numerator = this.mutiByComplexNum(new Complex(other.a, other.b * -1));
    Complex denominator = other.conjugate();
    float newA = numerator.a / denominator.a;
    float newB = numerator.b / denominator.a;
    return new Complex(newA, newB);
  }
  
}