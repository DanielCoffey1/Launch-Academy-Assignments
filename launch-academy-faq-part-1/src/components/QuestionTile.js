import React from 'react';

const QuestionTile = props => {
  let question = props.question
  let handleClick = props.handleClick
  let showAnswer = props.showAnswer
  let clicked = props.clicked


  let answer
  let answerIcon = "fas fa-plus-square fa-2x"
  if(showAnswer) {
    answer = props.answer
    answerIcon = "fas fa-minus-square fa-2x"
  }

  return(
    <div>
      <i className={answerIcon}> </i>
      <div onClick={handleClick}> {question}</div>
       <div> {answer} </div>
    </div>
  )
}

export default QuestionTile;
