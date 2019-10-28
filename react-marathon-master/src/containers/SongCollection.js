import React from 'react'
import Song from '../components/Song'

class SongCollection extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      selectedSongId: null
    }

    this.changeSelectedId = this.changeSelectedId.bind(this)
  }

  changeSelectedId(newId) {
    this.setState({ selectedSongId: newId })
  }

  render() {
    let mappedSongs = this.props.songs.map(song => {
      let handleClick = () => {
        this.changeSelectedId(song.id)
      }

      let className;

      if(this.state.selectedSongId === song.id) {
        className = 'selected'
      }

      return(
        <Song
          key={song.id}
          name={song.name}
          artist={song.artist}
          handleClick={handleClick}
          className={className}
        />
      )
    })

    return (
      <div className="small-6 columns">
        <h3> Song </h3>
        {mappedSongs}
      </div>
    )
  }
}

export default SongCollection;
