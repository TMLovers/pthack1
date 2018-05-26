Background background = new Background();
BackgroundImageName backgroundImageName;
TextController textController;

Character otaku = new Character(CharactersName.OTAKU);

void setup() {
    size(1366, 768);
    background.loadImages();
    otaku.loadImages();
    textController = new TextController();
}

void draw() {
    background(0);
    background.show(backgroundImageName.GRADUATION);
    otaku.show(Emotion.JOY2);
}

void showChoice() {
    String[] texts = {"きめぇ","きもい","もいもい"};
    textController.showChoice(texts);
}

void showText(String text) {
    textController.showText(text);
}

void keyPressed() {
  if (keyCode == UP) {
    textController.changeChoiceSelection(-1);
  } else if (keyCode == DOWN) {
    textController.changeChoiceSelection(1);
  } else if (key == ' ') {
    println(textController.getChoiceSelection());
  }
}
