class TextController {

    TextView textView = new TextView();
    TextBox textBox = new TextBox();
    Selector selector = new Selector();

    TextController() {
    }

    void showText(String text) {
        textBox.show();
        textView.show(text);
    }

    void showName(String text){
        textBox.name_show();
        fill(255);
        text(text, 40, 410, 350, 100);
    }

    void refreshText() {
        textView.refresh();
    }

    void showChoice(String text[]) {
        textBox.show();
        textView.showChoice(text);
        selector.setChoiceNum(text.length);
        selector.show();
    }

    int getChoiceSelection() {
        return selector.getSelection();
    }

    void changeChoiceSelection(int selection) {
        selector.changeSelection(selection);
    }
}