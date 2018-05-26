class TextBox {

    private int x = 0;
    private int y = 500;

    TextBox() {
    }

    void show() {
        fill(0, 200);
        noStroke();
        rect(x, y, width - x, height - this.y);
    }
}