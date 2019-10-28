import React, {Component} from 'react'

class FAQform extends Component {
  constructor(props){
    super(props);
    this.state = {
      id: this.props.id,
      question: "",
      answer: ""
    }
    this.handleQuestionChange = this.handleQuestionChange.bind(this);
    this.handleAnswerChange = this.handleAnswerChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleClear = this.handleClear.bind(this)
  }

  handleQuestionChange(event) {
    this.setState({ question: event.target.value})
  }

  handleAnswerChange(event) {
    this.setState({ answer: event.target.value})
  }

  handleSubmit(event) {
    event.preventDefault()
    let payload = {
    id: this.state.id,
    answer: this.state.answer,
    question: this.state.question
    }
    this.props.handleAddQuestion(payload)
    this.handleClear(event)
  }

  handleClear(event){
    this.setState({ question: "", answer: "" })
  }


render() {
  return(
    <div className ='row'>
    <form className="text-center small-6 columns" onSubmit={this.handleSubmit}>
      <label>Question</label>
      <input type="text" name="question" id="question" value={this.state.question} onChange={this.handleQuestionChange} />
      <label>Answer</label>
      <input type="text" name="answer" id="answer" value={this.state.answer} onChange={this.handleAnswerChange} />
      <input type="submit" value="submit" />
    </form>
  </div>
    )
  }
}

export default FAQform;
