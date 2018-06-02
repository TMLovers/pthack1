import ddf.minim.*; // minimライブラリのインポート
Minim minim;
AudioPlayer player;
Background background = new Background();
BackgroundImageName backgroundImageName;
TextController textController;
CsvPurser csvPureser = new CsvPurser();
SoundGame soundgame;

Character otaku = new Character(CharactersName.OTAKU);

int index = 0;
int skip_order = 0;

int speak_count = 0;
int game1_point = 0;
int game1_result = 2;
boolean flag = false;

int s_order = StoryFileName.INTRO.ordinal();
StoryFileName[] s_values = StoryFileName.values();

int c_order = ChoiceFileName.CHOICE1.ordinal();
ChoiceFileName[] c_values = ChoiceFileName.values();

int g_order = GameFileName.GAME1.ordinal();
GameFileName[] g_values = GameFileName.values();

String[] texts, names, backs, faces, voices;

String backimg = "GRADUATION";

void setup() {
  size(1366, 768);
  background.loadImages();
  otaku.loadImages();
  csvPureser.loadStoryFiles();
  csvPureser.loadChoiceFiles();
  csvPureser.loadGameFiles();
  textController = new TextController();
  soundgame = new SoundGame();
  minim = new Minim(this);
  setupSoundGameAudio();
}

void draw() {
  background(0);

  names = csvPureser.getStoryDatas(s_values[s_order], 0);
  texts = csvPureser.getStoryDatas(s_values[s_order], 1);
  backs = csvPureser.getStoryDatas(s_values[s_order], 2);
  faces = csvPureser.getStoryDatas(s_values[s_order], 3);
  voices = csvPureser.getStoryDatas(s_values[s_order], 4);

  showBackground(backs[index]);
  showOtaku(faces[index]);

    if (names[index].indexOf("choice") != -1) {
      showChoice();
      
      }else if(names[index].indexOf("game1") != -1){
        soundgame.show();

        if (soundgame.isFinished() == true) {
         game1_point = soundgame.getResult();

         if(game1_point >= 0 && game1_point < 51){
           game1_result = 2;
         }else if (game1_point >= 51 && game1_point < 121) {
           game1_result = 1;
         }else if (game1_point >= 121){
           game1_result = 0;
         }
        }

      }else{
        showText(texts[index]);

        switch(names[index]){
          case "my":
          showName("わたし");
          break;

          case "ota":
          showName("家畜");
          break;

          default:
          showName(names[index]);
          break;
        }
      }

        if(voices[index].length() != 0 && speak_count == 0){
          player = minim.loadFile("./voice/" + voices[index]);
          player.play();
          speak_count++;
        }
      }

      void showChoice() {
        String[] texts = csvPureser.getChoice(c_values[c_order]);
        textController.showChoice(texts);
      }

      void showText(String text) {
        textController.showText(text);
      }

      void showName(String text) {
        textController.showName(text);
      }

      void showBackground(String img){
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
            break;
          }
        }   
      }

      void showOtaku(String faces){
        switch(faces){
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
          break;
        }
      }

      void keyPressed() {
        if (keyCode == UP) {
          textController.changeChoiceSelection(-1);
          } else if (keyCode == DOWN) {
            textController.changeChoiceSelection(1);
            } else if (key == ENTER){
              textController.refreshText();

              speak_count = 0;

              if (index == texts.length -1) {

                /* 選択肢を表示する場合 */
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
                    break;
                  }

                  index = 0;
                  skip_order = csvPureser.getChoiceFileSize(c_values[c_order]) - textController.getChoiceSelection();
                  c_order++;
                  flag = true;
                /* ここまで選択肢を表示する場合 */  

                /* ゲームを表示する場合 */
                }else if (names[index].indexOf("game1") != -1) {
                  stopSoundGameAudio();
                  textSize(48);
                  switch(game1_result){
                    case 0:
                    s_order++;
                    break;

                    case 1:
                    s_order = s_order + 2;
                    break;

                    case 2:
                    s_order = s_order + 3;
                    break;

                    default:
                    break;
                  }

                  index = 0;
                  skip_order = csvPureser.getGameFileSize(g_values[g_order]) - game1_result;
                  g_order++;
                  flag = true;
              /* ここまでゲームを表示する場合 */

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
