class CsvPurser {
    final int STORY_FILE_NUM = 42;
    final int CHOICE_FILE_NUM = 7;
    final int GAME_FILE_NUM = 2;
    Table storyDatas[] = new Table[STORY_FILE_NUM];
    Table choiceDatas[] = new Table[CHOICE_FILE_NUM];
    Table gameDatas[] = new Table[GAME_FILE_NUM];

    CsvPurser () {
    }

    void loadStoryFiles() {
        for(int csvNum = 0; csvNum < STORY_FILE_NUM; csvNum++) {
            storyDatas[csvNum] = loadTable("./csv/story/story" + str(csvNum) + ".csv");   
        }         
    }

    void loadChoiceFiles() {
        for(int csvNum = 0; csvNum < CHOICE_FILE_NUM; csvNum++) {
            choiceDatas[csvNum] = loadTable("./csv/choice/choice" + str(csvNum) + ".csv");   
        }         
    }

    void loadGameFiles() {
        for(int csvNum = 0; csvNum < GAME_FILE_NUM; csvNum++) {
            gameDatas[csvNum] = loadTable("./csv/game/game" + str(csvNum) + ".csv");   
        }         
    }

    String[] getName(StoryFileName file) {
        String[] names = {};
        for(int i = 1; i < storyDatas[file.ordinal()].getRowCount(); i++) {
            names = append(names, storyDatas[file.ordinal()].getString(i,0));
        }  
        return names;
    }

    String[] getText(StoryFileName file) {
        String[] texts = {};
        for(int i = 1; i < storyDatas[file.ordinal()].getRowCount(); i++) {
            texts = append(texts, storyDatas[file.ordinal()].getString(i,1));
        }  
        return texts;
    }

    String[] getBack(StoryFileName file) {
        String[] backs = {};
        for(int i = 1; i < storyDatas[file.ordinal()].getRowCount(); i++) {
            backs = append(backs, storyDatas[file.ordinal()].getString(i,2));
        }  
        return backs;
    }

    String[] getFace(StoryFileName file) {
        String[] faces = {};
        for(int i = 1; i < storyDatas[file.ordinal()].getRowCount(); i++) {
            faces = append(faces, storyDatas[file.ordinal()].getString(i,3));
        }  
        return faces;
    }
}

public enum StoryFileName {
    INTRO,
    SEKIGAE,
    SEKIGAE1,
    SEKIGAE2,
    SEKIGAE3,
    ZYUGYOU,
    ZYUGYOU1,
    ZYUGYOU2,
    ZYUGYOU3,
    TAIKUSAI,
    TAIKUSAI1,
    TAIKUSAI2,
    TAIKUSAI3,
    GAKUSAI,
    GAKUSAI1,
    GAKUSAI2,
    GAKUSAI3,
    HIRUYASUMI,
    HIRUYASUMI1,
    HIRUYASUMI2,
    HIRUYASUMI3,
    HIRUYASUMI4,
    SYUGAKURYOKO,
    SYUGAKURYOKO1,
    SYUGAKURYOKO2,
    SYUGAKURYOKO3,
    KURISUMASU,
    KURISUMASU1,
    KURISUMASU2,
    KURISUMASU3,
    KURISUMASU4,
    SYOGATU,
    SYOGATU1,
    SYOGATU2,
    SYOGATU3,
    ZYUKEN,
    ZYUKEN1,
    ZYUKEN2,
    ZYUKEN3,
    SOTUGYOUSIKI,
    LAST,
    LAST1
}

public enum ChoiceFileName{
    CHOICE1,
    CHOICE2,
    CHOICE3,
    CHOICE4,
    CHOICE5,
    CHOICE6,
    CHOICE7
}

public enum GameFileName{
    GAME1,
    GAME2
}