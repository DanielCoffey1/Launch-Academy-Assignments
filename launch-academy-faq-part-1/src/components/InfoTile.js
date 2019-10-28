import React from 'react'

const InfoTile = props => {
  return(
    <div className="text-center">
      <i className={props.icon} onClick={props.handleClick}></i>
      <h3>{props.question}</h3>
      <h5 className={props.classString}>{props.answer}</h5>
    </div>
  )
}

export default InfoTile;
