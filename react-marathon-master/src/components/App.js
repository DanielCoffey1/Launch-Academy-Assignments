import React from 'react';
import PlaylistCollection from '../containers/PlaylistCollection'
import SongCollection from '../containers/SongCollection'

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let data = this.props.data
    let songs = data.songs
    let playlists = data.playlists

    return (
      <div className="app row callout">
        <h2 className="title">React Music Player</h2>
        <PlaylistCollection
          playlists = {playlists}
        />
        <SongCollection
          songs={songs}
        />
      </div>
    );
  }
}

export default App;
