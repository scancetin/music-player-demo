class PlayerModel {
  int playingSoundPlaylistId;
  int playingSoundId;
  bool isPlaying;
  int timerDuration;
  int currentDuration;

  PlayerModel({
    this.playingSoundPlaylistId = -1,
    this.playingSoundId = -1,
    this.isPlaying = false,
    this.timerDuration = 10,
    this.currentDuration = 0,
  });
}
