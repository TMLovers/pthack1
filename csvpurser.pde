class CsvPurser {
    final int STORY_FILE_NUM = 41;
    final int CHOICE_FILE_NUM = 8;
    final int GAME_FILE_NUM = 2;
    Table storyDatas[] = new Table[STORY_FILE_NUM];
    Table choiceDatas[] = new Table[CHOICE_FILE_NUM];
    Table gameDatas[] = new Table[GAME_FILE_NUM];

    CsvPurser () {
    }

    /* ファイルの読み込み系関数群 */
    void loadStoryFiles() {
        for(int csvNum = 0; csvNum < STORY_FILE_NUM; csvNum++) {
            storyDatas[csvNum] = loadTable("./csv/story/" + str(csvNum) + ".csv");   
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
    /* ここまでファイルの読み込み系関数群 */

    /*
    * Storyフォルダをパースする
    * @param:file ストーリーファイルの名前（列挙型のやつ）
    * @param:column_number 0->名前、1->文章、2->背景画像、3->おたくの表情、4->音声
    * return 指定したカラムのデータ
    */
    String[] getStoryDatas(StoryFileName file, int column_number) {
        String[] datas = {};
        for(int i = 1; i < storyDatas[file.ordinal()].getRowCount(); i++) {
            datas = append(datas, storyDatas[file.ordinal()].getString(i,column_number));
        }  
        return datas;
    }

    String[] getChoice(ChoiceFileName file) {
        String[] choices = {};
        for(int i = 0; i < choiceDatas[file.ordinal()].getRowCount(); i++) {
            choices = append(choices, choiceDatas[file.ordinal()].getString(i,0));
        }  
        return choices;
    }

    String[] getPoint(GameFileName file) {
        String[] points = {};
        for(int i = 0; i < choiceDatas[file.ordinal()].getRowCount(); i++) {
            points = append(points, choiceDatas[file.ordinal()].getString(i,0));
        }  
        return points;
    }

    int getChoiceFileSize(ChoiceFileName file){
        return choiceDatas[file.ordinal()].getRowCount();
    }

    int getGameFileSize(GameFileName file){
        return gameDatas[file.ordinal()].getRowCount();
    }
}