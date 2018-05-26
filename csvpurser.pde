class CsvPurser {
    final int CSVFILE_NUM = 51;
    Table csvDatas[] = new Table[CSVFILE_NUM];

    CsvPurser () {
    }

    void loadCSVFiles() {
        for(int csvNum = 0; csvNum < CSVFILE_NUM; csvNum++) {
            csvDatas[csvNum] = loadTable("./csv/story" + str(csvNum) + ".csv");   
        }         
    }

    String[] getName(CSVFileName file) {
        String[] names = {};
        for(int i = 1; i < csvDatas[file.ordinal()].getRowCount(); i++) {
            names = append(names, csvDatas[file.ordinal()].getString(i,0));
        }  
        return names;
    }

    String[] getText(CSVFileName file) {
        String[] texts = {};
        for(int i = 1; i < csvDatas[file.ordinal()].getRowCount(); i++) {
            texts = append(texts, csvDatas[file.ordinal()].getString(i,1));
        }  
        return texts;
    }

    String[] getBack(CSVFileName file) {
        String[] backs = {};
        for(int i = 1; i < csvDatas[file.ordinal()].getRowCount(); i++) {
            backs = append(backs, csvDatas[file.ordinal()].getString(i,2));
        }  
        return backs;
    }

    String[] getFace(CSVFileName file) {
        String[] faces = {};
        for(int i = 1; i < csvDatas[file.ordinal()].getRowCount(); i++) {
            faces = append(faces, csvDatas[file.ordinal()].getString(i,3));
        }  
        return faces;
    }
}

public enum CSVFileName {
    INTRO,
    SEKIGAE,
    CHOICE1,
    SEKIGAE1,
    SEKIGAE2,
    SEKIGAE3,
    ZYUGYOU,
    CHOICE2,
    ZYUGYOU1,
    ZYUGYOU2,
    ZYUGYOU3,
    TAIKUSAI,
    GAME1,
    TAIKUSAI1,
    TAIKUSAI2,
    TAIKUSAI3,
    GAKUSAI,
    GAME2,
    GAKUSAI1,
    GAKUSAI2,
    GAKUSAI3,
    HIRUYASUMI,
    CHOICE3,
    HIRUYASUMI1,
    HIRUYASUMI2,
    HIRUYASUMI3,
    HIRUYASUMI4,
    SYUGAKURYOKO,
    CHOICE4,
    SYUGAKURYOKO1,
    SYUGAKURYOKO2,
    SYUGAKURYOKO3,
    KURISUMASU,
    CHOICE5,
    KURISUMASU1,
    KURISUMASU2,
    KURISUMASU3,
    KURISUMASU4,
    SYOGATU,
    CHOICE6,
    SYOGATU1,
    SYOGATU2,
    SYOGATU3,
    ZYUKEN,
    CHOICE7,
    ZYUKEN1,
    ZYUKEN2,
    ZYUKEN3,
    SOTUGYOUSIKI,
    LAST,
    LAST1
}