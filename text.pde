class TextView {

    String text = "";
    String showText = "";
    int charNum = 0;

    private int x = 10;
    private int y = 510;

    private int delay = 2;
    private int delayCount = 0;

    PFont font;

    TextView() {
        font = createFont("MS Mincho", 48, true);
        textFont(font, 48);
    } 

    void show(String text) {
        this.text = text;

        if (showText.equals(text)) {
            showFullText(text);
            delayCount = 0;
            charNum = 0;
            return;
        }

        if(delayCount % delay == 0) {
            //Todo 文字数によって改行
            this.showText += text.charAt(charNum);
            charNum++;
        }
        
        fill(255);
        text(this.showText, x, y, width - x, height - y);
        delayCount++;
    }

    void refresh() {
        this.showText = "";
    }
    
    void showFullText(String text) {
        fill(255);
        text(this.text, x, y, width - x, height - y);
    }

    void showChoice(String text[]) {
        fill(255);
        for(int textCount = 0; textCount < text.length; textCount++) {
            text(text[textCount], x + 60, y + (textCount * 65), width - x, height - y);
        }
    } 
}