class HealthRecognition{

  String predict(double bmi){
    if(bmi<18.5) {
      return "UnderWeight";
    }else if(bmi>=18.5 && bmi<=24.9){
      return "Healthy Weight";
    }else if(bmi>=25.0 && bmi<=29.9){
      return "OverWeight";
    }else{
      return "Obesity";
    }
  }

}