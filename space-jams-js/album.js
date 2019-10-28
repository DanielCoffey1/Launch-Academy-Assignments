class Album {
 constructor (id, name, artists) {
   this.id = id;
   this.name = name;
   this.artists = artists;
   this.tracks = [];
 }

  summary() {
    let album_Summary = "";
    album_Summary += `Name: ${this.name} \n`;
    album_Summary += `Artist(s): ${this.artists} \n`;
    let total_ms = 0;
    this.tracks.forEach((track) =>{
      total_ms += +track.duration_ms;
    });
    let minutes = total_ms/60000;
    album_Summary += `Duration (min.): ${minutes.toFixed(2)} \n`;
    album_Summary += "Tracks: \n";
    this.tracks.forEach((track) =>{
      album_Summary += `- ${track.title} \n`
    });
    return album_Summary;
  }
}

module.exports = Album;
