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
String[] backs;
String[] faces;

String backimg = "GRADUATION";

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
    //background.show(backgroundImageName.GRADUATION);

    texts = csvPureser.getText(s_values[s_order]);
    names = csvPureser.getName(s_values[s_order]);
    backs = csvPureser.getBack(s_values[s_order]);
    faces = csvPureser.getFace(s_values[s_order]);

    if (backs[index].length() == 0) {
        switch(backimg){
        case "GROUND":
            background.show(backgroundImageName.GROUND);
            break;
        case "XMAS":
            background.show(backgroundImageName.XMAS);
            break;
        case "CLASSROOM":
            background.show(backgroundImageName.CLASSROOM);
            break;
        case "GRADUATION":
            background.show(backgroundImageName.GRADUATION);
            break;
        case "SHRINE":
            background.show(backgroundImageName.SHRINE);
            break;
        default:
            println( "無理無理" ); // 実行されない
            break;
    }
    }else{
        switch(backs[index]){
        case "GROUND":
            background.show(backgroundImageName.GROUND);
            backimg = "GROUND";
            break;
        case "XMAS":
            background.show(backgroundImageName.XMAS);
            backimg = "XMAS";
            break;
        case "CLASSROOM":
            background.show(backgroundImageName.CLASSROOM);
            backimg = "CLASSROOM";
            break;
        case "GRADUATION":
            background.show(backgroundImageName.GRADUATION);
            backimg = "GRADUATION";
            break;
        case "SHRINE":
            background.show(backgroundImageName.SHRINE);
            backimg = "SHRINE";
            break;
        default:
            println( "ほれほれ" ); // 実行されない
            break;
    }
    }

    println(backs[index] + "***********");

    /* otakuの表情 */
    switch(faces[index]){
        case "otaku.jpg":
            otaku.show(Emotion.OTAKU);
            break;
        case "otakuRaku-1.jpg":
            otaku.show(Emotion.ENJOY1);
            break;
        case "otakuRaku-2.jpg":
            otaku.show(Emotion.ENJOY2);
            break;
        case "otakuKi-1.jpg":
            otaku.show(Emotion.JOY1);
            break;
        case "otakuKi-2.jpg":
            otaku.show(Emotion.JOY2);
            break;
        case "otakuDo-1.jpg":
            otaku.show(Emotion.ANGER1);
            break;
        case "otakuDo-2.jpg":
            otaku.show(Emotion.ANGER2);
            break;
        case "otakuAi-1.jpg":
            otaku.show(Emotion.SAD1);
            break;
        case "otakuAi-2.jpg":
            otaku.show(Emotion.SAD2);
            break;
        default:
            println( "message 5" ); // 実行されない
            break;
    }

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

    s_order++;
        c_order++;
    index = 0;
  } else if (key == ENTER){
    textController.refreshText();

    if (index == texts.length -1) {
       if (names[index].indexOf("choice") != -1) {
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
    }else{
        index++;
    }
    
  }
}
