import React from 'react';

const Song = props => {
  return(
    <p onClick={props.handleClick} className={props.className}> {props.name} - {props.artist} </p>
  )
}

export default Song;
