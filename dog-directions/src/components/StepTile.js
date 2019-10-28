import React from 'react';

const StepTile = props => {
debugger;
  return(
    <li onClick={props.handleClick} className={props.className}>{props.step}</li>
  )
}

export default StepTile;
