// class myAudioPlayer{
//
//
//   static String audiAasset = "assets/sound/Ringtone.mp3";
//   static AudioPlayer assetsAudioPlayer;
//
//   static AudioPlayer getAssetsAudioPlayer() {
//     if (assetsAudioPlayer == null) {
//       assetsAudioPlayer =  AudioPlayer();
//       print("created a new instance of play"+ assetsAudioPlayer?.hashCode?.toString());
//     }
//     return assetsAudioPlayer;
//   }
//
//   static void playAssetsAudioPlayer() async{
//     if(assetsAudioPlayer == null){
//       myAudioPlayer.getAssetsAudioPlayer();
//     }
//     ByteData bytes = await rootBundle.load(audiAasset); //load audio from assets
//     Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//     await assetsAudioPlayer.playBytes(audiobytes);
//   }
//
//   // static _playAudio() async{
//   //   await assetsAudioPlayer.play("assets/sound/Ringtone.mp3",isLocal: true,volume: 1);
//   // }
//
//
//   static void stopAssetsAudioPlayer() async{
//     if(assetsAudioPlayer != null) {
//       await assetsAudioPlayer.stop();
//       // await assetsAudioPlayer.dispose();
//     }
//   }
// }
