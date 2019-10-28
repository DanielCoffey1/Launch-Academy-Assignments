import React, { Component } from 'react'
import ReviewForm from '../components/ReviewForm'

class ReviewsFormsContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: "",
      rating: "0",
      content: ""
    }
    this.handleNameChange = this.handleNameChange.bind(this)
    this.handleContentChange = this.handleContentChange.bind(this)
    this.handleRatingChange = this.handleRatingChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleNameChange(event) {
    this.setState({name: event.target.value})
  }

  handleContentChange(event) {
    this.setState({content: event.target.value})
  }

  handleRatingChange(event) {
    this.setState({rating: event.target.value})
  }

  handleSubmit(event) {
    event.preventDefault()
    this.props.handleAddReview(this.state)
    this.setState({
      name: "",
      rating: "0",
      content: ""
    })
  }

  render() {
    return(
      <ReviewForm
        name={this.state.name}
        rating={this.state.rating}
        content={this.state.content}
        handleNameChange={this.handleNameChange}
        handleRatingChange={this.handleRatingChange}
        handleContentChange={this.handleContentChange}
        handleSubmit={this.handleSubmit}
      />
    )
  }
}

export default ReviewsFormsContainer
