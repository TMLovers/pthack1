class StartScreen {

    PImage image;

    private int textColor = 255;
    private int dc = -2;

    StartScreen() {
        this.image = loadImage("startscreen.jpg");
    }

    void show() {
        background(this.image);
        this.showPressKeyText();
    }

    void showPressKeyText() {
        fill(this.textColor);
        textMode(CENTER);
        textSize(80);
        textAlign(CENTER, CENTER);
        text("Press Any Key", width / 2, (height / 2) + 250);
        this.textColor += dc;
        if (this.textColor < 0) this.dc = 3;
        else if (this.textColor > 256) this.dc = -2;
    }

}