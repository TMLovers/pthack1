Background background = new Background();
BackgroundImageName backgroundImageName;
TextController textController;
CsvPurser csvPureser = new CsvPurser();

Character otaku = new Character(CharactersName.OTAKU);

int index = 0;

void setup() {
    size(1366, 768);
    background.loadImages();
    otaku.loadImages();
    csvPureser.loadStoryFiles();
    textController = new TextController();
    
}

void draw() {
    background(0);
    background.show(backgroundImageName.GRADUATION);
    otaku.show(Emotion.JOY2);

    String[] texts = csvPureser.getText(CSVFileName.INTRO);
    if (index == texts.length - 1) {
        showChoice();
    }else{
        showText(texts[index]);
    }
    
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
    index = 0;
  } else if (key == ENTER){
    textController.refreshText();
     index++;
  }
}
