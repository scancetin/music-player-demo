const List<String> playlists = ["Rain", "Water", "Forest", "Fire", "Birds"];
const List<List<Map>> playlistSounds = [rainSounds, waterSounds, forestSounds, fireSounds, birdSounds];

const List<Map> rainSounds = [
  {"id": 0, "name": "Soft Rain", "location": "assets/sounds/rain/rain.mp3", "image": "assets/images/rain/rain.jpg"},
  {"id": 1, "name": "Rain and Thunder", "location": "assets/sounds/rain/rain-and-thunder.mp3", "image": "assets/images/rain/rain-and-thunder.jpg"},
  {"id": 2, "name": "Rain at Rainforest", "location": "assets/sounds/rain/rain-at-rainforest.mp3", "image": "assets/images/rain/rain-at-rainforest.jpg"},
  {"id": 3, "name": "Rain Drops", "location": "assets/sounds/rain/rain-drops.mp3", "image": "assets/images/rain/rain-drops.jpg"},
  {"id": 4, "name": "Thunder", "location": "assets/sounds/rain/thunder.mp3", "image": "assets/images/rain/thunder.jpg"},
];

const List<Map> waterSounds = [
  {"id": 0, "name": "Calm Waves", "location": "assets/sounds/water/calm-waves.mp3", "image": "assets/images/water/calm-waves.jpg"},
  {"id": 1, "name": "Ocean Waves", "location": "assets/sounds/water/ocean-waves.mp3", "image": "assets/images/water/ocean-waves.jpg"},
  {"id": 2, "name": "River With Whirls", "location": "assets/sounds/water/river-with-whirls.mp3", "image": "assets/images/water/river-with-whirls.jpg"},
  {"id": 3, "name": "Stream at Forest", "location": "assets/sounds/water/stream-at-forest.mp3", "image": "assets/images/water/stream-at-forest.jpg"},
  {"id": 4, "name": "Water Trickling", "location": "assets/sounds/water/water-trickling.mp3", "image": "assets/images/water/water-trickling.jpg"},
  {"id": 5, "name": "Beach Waves", "location": "assets/sounds/water/beach-waves.mp3", "image": "assets/images/water/beach-waves.jpg"},
];

const List<Map> forestSounds = [
  {"id": 0, "name": "Crickets", "location": "assets/sounds/forest/crickets.mp3", "image": "assets/images/forest/crickets.jpg"},
  {"id": 1, "name": "Heavy Crickets", "location": "assets/sounds/forest/heavy-crickets.mp3", "image": "assets/images/forest/heavy-crickets.jpg"},
];

const List<Map> fireSounds = [
  {"id": 0, "name": "Fireplace", "location": "assets/sounds/fire/fireplace.mp3", "image": "assets/images/fire/fireplace.jpg"},
  {"id": 1, "name": "Fire crackles", "location": "assets/sounds/fire/fire-crackles.mp3", "image": "assets/images/fire/fire-crackles.jpg"},
];

const List<Map> birdSounds = [
  {"id": 0, "name": "Birds Singing", "location": "assets/sounds/birds/birds-singing.mp3", "image": "assets/images/birds/birds-singing.jpg"},
  {"id": 1, "name": "Frogs and Birds", "location": "assets/sounds/birds/frogs-and-birds.mp3", "image": "assets/images/birds/frogs-and-birds.jpg"},
  {"id": 2, "name": "Nightingale", "location": "assets/sounds/birds/nightingale.mp3", "image": "assets/images/birds/nightingale.jpg"},
  {"id": 3, "name": "Birds in a Forest", "location": "assets/sounds/birds/birds-in-a-forest.mp3", "image": "assets/images/birds/birds-in-a-forest.jpg"},
];










// const List<List<Map>> playlistSounds = [natureSounds, animalSounds, sampleSounds];

// const List<Map> natureSounds = [
//   {"id": 0, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 1, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 2, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 3, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 4, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 5, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 6, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 7, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 8, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 9, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 10, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 11, "name": "Sound2", "location": "assets/sounds/sample1.wav", "image": "assets/images/sample.jpg"},
//   {"id": 12, "name": "Sound3", "location": "assets/sounds/sample2.wav", "image": "assets/images/sample.jpg"},
//   {"id": 13, "name": "Sound4", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 14, "name": "Sound5", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
// ];

// const List<Map> animalSounds = [
//   {"id": 0, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 1, "name": "Sound2", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 2, "name": "Sound3", "location": "assets/sounds/sample1.wav", "image": "assets/images/sample.jpg"},
//   {"id": 3, "name": "Sound4", "location": "assets/sounds/sample2.wav", "image": "assets/images/sample.jpg"},
//   {"id": 4, "name": "Sound5", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
// ];
// const List<Map> sampleSounds = [
//   {"id": 0, "name": "Sound1", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   {"id": 1, "name": "Sound2", "location": "assets/sounds/sample.wav", "image": "assets/images/sample.jpg"},
//   // {"id": 22, "name": "Sound3", "location": "sounds/sample1.wav", "image": "assets/images/sample.jpg"},
//   // {"id": 23, "name": "Sound4", "location": "sounds/sample2.wav", "image": "assets/images/sample.jpg"},
//   // {"id": 24, "name": "Sound5", "location": "sounds/sample.wav", "image": "assets/images/sample.jpg"},
// ];

