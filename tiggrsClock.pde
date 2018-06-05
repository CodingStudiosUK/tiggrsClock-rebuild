int minute = 10;
int hour = 10;
void setup() {
  size(800, 800);
  frameRate(5);
  noStroke();
  PFont font = createFont("digital.ttf", 32);
  textFont(font, 32);
  textSize(50);
  textAlign(CENTER, CENTER);
}
void arc(float small, float large) {
  if (small < large) {
    arc(width/2, height/2, width*0.8, height*0.8, radians(small-90), radians(large-90));
  } else {
    arc(width/2, height/2, width*0.8, height*0.8, radians(small-90), radians(360-90));
    arc(width/2, height/2, width*0.8, height*0.8, radians(0-90), radians(large-90));
  }
}
void draw() {
  minute = minute();
  hour = hour();
  float small = (minute+second()/60.0)/(60.0)*(360);
  float large = second()/(60.0)*(360);
  fill(230, 0, 0);
  if (small < large) {
    arc(width/2, height/2, width, height, radians(small-90), radians(large-90));
  } else {
    arc(width/2, height/2, width, height, radians(small-90), radians(360-90));
    arc(width/2, height/2, width, height, radians(0-90), radians(large-90));
  }
  small = ((hour%12)*60+minute)/(12*60.0)*(360);
  large = (minute+second()/60.0)/(60.0)*(360);
  background(20);
  //FROM HOUR TO MINUTE
  fill(0, 230, 0);
  arc(small, large);
  fill(20);
  ellipse(width/2, height/2, width/2, height/2);
  fill(30, 30, 90);
  text("88 88 88", width/2, height/2);
  fill(75, 75, 255);
  String time = ""+nfs(hour(), 2)+":"+nfs(minute(), 2)+":"+nfs(second(), 2);
  text(time.trim().replaceAll("\\s+", ""), width/2, height/2);
  fill(0);
  //text(hour+":"+minute+"\n"+int(small)+":"+int(large),width/2,height/2);
  if (++minute == 60) {
    minute = 0;
    if (++hour == 24) {
      hour = 0;
    }
  }
}