import React, { Component } from 'react';
import Playlist from '../components/Playlist'

class PlaylistCollection extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedPlaylistId: null
    }
    this.changeSelectedId = this.changeSelectedId.bind(this)
  }

  changeSelectedId(newId) {
    this.setState({selectedPlaylistId: newId})
  }

  render() {
    let mappedPlaylists = this.props.playlists.map(playlist => {

      let handleClick = () => {
        this.changeSelectedId(playlist.id)
      }

      let className
      if(this.state.selectedPlaylistId === playlist.id) {
        className = "selected"
      }
      
      return(
        <Playlist
          key = {playlist.id}
          name = {playlist.name}
          handleClick={handleClick}
          className={className}
        />
      )
    })

    return(
      <div className="small-6 columns">
        <h3> Playlist </h3>
        {mappedPlaylists}
      </div>

    )
  }
}

export default PlaylistCollection;
