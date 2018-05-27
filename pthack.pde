Background background = new Background();
BackgroundImageName backgroundImageName;
TextController textController;
CsvPurser csvPureser = new CsvPurser();

Character otaku = new Character(CharactersName.OTAKU);

int index = 0;
int skip_order = 0;

boolean flag = false;

int s_order = StoryFileName.INTRO.ordinal();
StoryFileName[] s_values = StoryFileName.values();

int c_order = ChoiceFileName.CHOICE1.ordinal();
ChoiceFileName[] c_values = ChoiceFileName.values();

String[] texts;
String[] names;

void setup() {
    size(1366, 768);
    background.loadImages();
    otaku.loadImages();
    csvPureser.loadStoryFiles();
    csvPureser.loadChoiceFiles();
    textController = new TextController();
    

    }

void draw() {
    background(0);
    background.show(backgroundImageName.GRADUATION);
    otaku.show(Emotion.JOY2);

    texts = csvPureser.getText(s_values[s_order]);
    names = csvPureser.getName(s_values[s_order]);

    if (names[index].indexOf("choice") != -1) {
        showChoice();
    }else{
        showText(texts[index]);
    }
    // println(s_order + "*********************");
    // println("***************" + skip_order );
}

void showChoice() {
    String[] texts = csvPureser.getChoice(c_values[c_order]);
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

    s_order++;
        c_order++;
    index = 0;
  } else if (key == ENTER){
    textController.refreshText();
    if (index == texts.length -1) {
        
       if (names[index].indexOf("choice") != -1) {
           println(textController.getChoiceSelection());
           println(csvPureser.getChoiceFileSize(c_values[c_order]) + "でっっせ");
            switch(textController.getChoiceSelection()){
                case 0:
                    s_order++;
                    break;
                case 1:
                    s_order = s_order + 2;
                    break;
                case 2:
                    s_order = s_order + 3;
                    break;
                case 3:
                    s_order = s_order + 4;
                    break;
                default:
                    println( "message 5" ); // 実行されない
                    break;
            }
        index = 0;
        skip_order = csvPureser.getChoiceFileSize(c_values[c_order]) - textController.getChoiceSelection();
        c_order++;
        flag = true;
        
        }else{
            index = 0;
            if (flag == true) {
                s_order = s_order + skip_order;
                flag = false;
                
            }else{
                s_order++; 
                
            }
        skip_order = 0;     
       }
        println(textController.getChoiceSelection());       
    }else{
        index++;
    }
    
  }
}
