class Selector {

    int x = 10;
    int y = 510;
    int choiceNum = 0;
    int currentSelection = 0;

    Selector() {
    }

    void setChoiceNum(int num) {
        this.choiceNum = num;
    }

    void show() {
        fill(256, 256, 0, 90);
        rect(x + 60, y + (this.currentSelection * 65), width - x - 60, 50);
    }

    int getSelection() {
        return currentSelection;
    }

    void changeSelection(int selection) {
        if(this.currentSelection + selection >= 0 && this.currentSelection + selection < choiceNum) {
            this.currentSelection += selection;
        }
    }
}