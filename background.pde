class Background {
    final int IMAGE_NUM = 2;
    PImage images[] = new PImage[IMAGE_NUM];

    Background() { 
    }

    void loadImages() {
        for(int imageNum = 0; imageNum < IMAGE_NUM; imageNum++) {
            images[imageNum] = loadImage("./background/background" + str(imageNum) + ".jpg");   
        }      
    }

    void show(BackgroundImageName name) {
        background(images[name.ordinal()]);
    }
}

public enum BackgroundImageName {
    TEST,
    HACK
}