class Character {

    final int IMAGE_NUM = 2;
    PImage images[] = new PImage[IMAGE_NUM];
    CharactersName name;

    //Todo キャラクターを，真ん中に配置
    int x = 0;
    int y = 1;

    Character(CharactersName name) {
        this.name = name;
    }

    void loadImages() {
        for(int imageNum = 0; imageNum < IMAGE_NUM; imageNum++) {
            images[imageNum] = loadImage("./character/" + this.name.getName() + "/" + this.name.getName() + str(imageNum) + ".jpg"); 
        }
    }

    void show(Emotion emotion) {
        image(images[emotion.ordinal()], x, y);
    }
}

public enum Emotion {
    JOY1,
    JOY2,
    ANGER1,
    ANGER2,
    SAD1,
    SAD2,
    ENJOY1,
    ENJOY2
}

public enum CharactersName {
    OTAKU("otaku"),
    KURISU("kurisu");

    private String name;

    private CharactersName(String name) {
        this.name = name;
    }

    String getName() {
        return name;
    }
}