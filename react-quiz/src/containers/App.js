import React from 'react';
import AnswerTile from '../components/AnswerTile';


class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedId: null,

    }
    this.setSelectedId = this.setSelectedId.bind(this);
  }

  setSelectedId(newId) {
    this.setState({selectedId: newId})
  }

  render(){
    let answerTiles = this.props.data.question.answers.map((answer) => {

      let handleClick = () => {
        this.setSelectedId(answer.id)
      }

      let className;
      if (this.state.selectedId === answer.id) {
        className = "selected"
      }

      return(
        <AnswerTile
          key={answer.id}
          body={answer.body}
          handleClick={handleClick}
          className={className}
        />
      )
    })

    let correctMessage;
    if (this.state.selectedId === this.props.data.question.correctAnswerId) {
      correctMessage = "Correct!"
    } else if (this.state.selectedId != null){
      correctMessage = "Incorrect!"
    }

    return(
      <div>
        <h1>{this.props.data.question.body}</h1>
        <ul>{answerTiles}</ul>
        <p>{correctMessage}</p>
      </div>
    )
  }
}

export default App
