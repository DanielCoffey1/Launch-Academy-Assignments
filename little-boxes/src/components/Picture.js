import React from 'react';

const Picture = props => {
  return (
    <div className='box picture'>
      <h1>{props.header}</h1>
      <img alt={props.pictureAlt} src={props.pictureSrc}/>
    </div>
  )
}

export default Picture;
