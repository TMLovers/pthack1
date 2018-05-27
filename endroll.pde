import processing.video.*; 

Movie movie;
    
void endrollInit() {
    movie = new Movie(this, "endroll.mp4");
    movie.play();
}

void endrollShow() {
    image(movie, 0, 0, width, height);
}

//映像フレーム毎に自動呼び出しされるイベント
void movieEvent( Movie m ) {
    //カレント位置の画像を取得
    m.read();
}