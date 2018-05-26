class CsvPurser {
    final int CSVFILE_NUM = 1;
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
    SEKIGAE
}