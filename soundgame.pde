import ddf.minim.*;  //minimライブラリのインポート

class SoundGame {

    PImage background;
    int[] score = {1,0,0,2,0,1,1,0,0,0,1,0,0,1,0,0,2,0,0,1,0,2,0,1,2,1,1,0,2,0,1,1,0,1,0,2,1,2,1,0,0,0,0,1,2,0,0,0,0,2,0,2,1,0,0,1,0,2,2,2,2,0,1,1,0};
    int[] scoreX = new int[score.length];
    private int gaugeX = 650;
    private int gaugeY = 90;
    private int gaugeWidth = 0;
    private int gaugeHeight = 128 - this.gaugeY;

    SoundGame(){
        background = loadImage("soundgamebackground.png");
        for(int scoreNum = 0; scoreNum < score.length; scoreNum++) {
            if(score[scoreNum] != 0) {
                scoreX[scoreNum] = 1366 + ( 90 * (scoreNum + 1));
            }
        }
    }

    void show() {
        background(background);
        showGauge();
        showScore();
        musicPlayer.play();
    }

    void showScore() {
        for(int scoreNum = 0; scoreNum < score.length; scoreNum++){
            if(scoreX[scoreNum] >= 300) {
                String text = "";
                if(score[scoreNum] == 1){
                    fill(255,0,0);
                    text = "でゅ";
                }else if(score[scoreNum] == 2){
                    fill(0,0,255);
                    text = " ふ";
                }
            ellipse(scoreX[scoreNum], 300, 80, 80);

            fill(0);
            textSize(30);
            text(text, scoreX[scoreNum] - 30, 400, 80, 80);
            scoreX[scoreNum] -= 10;
            }else {
                scoreX[scoreNum] = 0;
            }
        }
    }

    boolean isHit(int id) {
        for(int scoreNum = 0; scoreNum < score.length; scoreNum++){
            if(scoreX[scoreNum] + 40 > 300 && scoreX[scoreNum] + 40 < 400) {
                if(score[scoreNum] == id){
                    scoreX[scoreNum] = 0;
                    changeGauge(5);
                    return true;
                }
            }
        }
        return false;
    }

    void showGauge() {
        fill(255,0,0);
        rect(gaugeX, gaugeY, gaugeWidth, gaugeHeight);
    }

    void changeGauge(int dx){
        if(gaugeWidth + dx <= 1150 - gaugeX && gaugeWidth + dx >= 0){
            gaugeWidth += dx;
        }
    }
}