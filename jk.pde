PImage jk;
int cnt = 0;
int rimit = 0;
float refuse  = 0;
float decrease = 0;
boolean TF = false;

void setup() {
  jk  = loadImage( "jk.png");
  size(1366, 768);
}

void mousePressed() {
  if (mouseX >= 590 && mouseX <= 840 && mouseY >= 400 && mouseY <= 600) {
    cnt++;
  }
}

void draw() {

  background(255);
  fill(255);
  image( jk, 1366/3, 0 );

  rimit = 30 - millis()/1000;

  rect(900, 500, 50, 180);
  fill(255, 0, 0);
  rect(900, 680 - refuse, 50, refuse);

  if (millis() <= 30 * 1000 && cnt >= 60) {
    cnt = 0;
    rimit = 0;
    refuse  = 0;
    decrease = 0;
    TF = true;
  } else if (millis() > 30 * 1000) {
    cnt = 0;
    rimit = 0;
    if (cnt < 60) {
      cnt = 0;
      rimit = 0;
      refuse  = 0;
      decrease = 0;
      TF = false;
    }
  }

  if (refuse >= 180) {
    cnt = 0;
    rimit = 0;
    refuse  = 0;
    decrease = 0;
    TF  = false;
  }

  if (refuse > 0) {
    refuse  = refuse - 0.2;
    decrease -= 0.2;
  }

  refuse = cnt * 8 + decrease;
  fill(0);
  textSize(20);
  text("【残り"+ rimit +"秒】", 850, 450);
  text("おさわりあと" + (60 - cnt) + "回", 850, 470);
  text("制限時間内にJKのお尻をおさわりしまくるパゴス！！", 250, 380);
  text("早く！！意味は考えちゃだめパゴス！！！！↘↘↘", 250, 400);
  fill(255, 0, 0);
  textSize(12);
  text("DANGER", 960, 505);
  
  println(cnt);
}