Background background = new Background();
BackgroundImageName backgroundImageName;
void setup() {
    size(1366, 768);
    background.loadImages();
}

void draw() {
    background(0);
    background.show(backgroundImageName.TEST);
}