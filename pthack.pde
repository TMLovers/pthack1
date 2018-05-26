Background background = new Background();
BackgroundImageName backgroundImageName;

Character otaku = new Character(CharactersName.OTAKU);

void setup() {
    size(1366, 768);
    background.loadImages();
    otaku.loadImages();
}

void draw() {
    background(0);

    background.show(backgroundImageName.TEST);
    otaku.show(Emotion.JOY2);
}