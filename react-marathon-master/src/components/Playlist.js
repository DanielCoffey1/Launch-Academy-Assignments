import React  from 'react';

const Playlist = props => {
  return(
    <p onClick={props.handleClick} className={props.className}> {props.name}</p>
  )
}


export default Playlist;
