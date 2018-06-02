AudioPlayer dhuPlayer;
AudioPlayer huPlayer;
AudioPlayer musicPlayer;

void setupSoundGameAudio(){
    dhuPlayer = minim.loadFile("dhu.mp3");
    huPlayer = minim.loadFile("hu.mp3");
    musicPlayer = minim.loadFile("music.mp3");
}

void refreshSoundGameAudio(){
    dhuPlayer.rewind();
    huPlayer.rewind();
}

void stopSoundGameAudio(){
    musicPlayer.close();
}