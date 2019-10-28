import React from 'react'

const ReviewForm = props => {
  return(
    <form onSubmit={props.handleSubmit}>
      <label htmlFor="name">Name</label>
      <input onChange={props.handleNameChange} value={props.name} id="name" type="text" name="name" placeholder="Name"/>
      <label htmlFor="rating">Rating</label>
      <select onChange={props.handleRatingChange} value={props.rating} id="rating" name="rating">
        <option value="0">0</option>
        <option value="20">1</option>
        <option value="40">2</option>
        <option value="60">3</option>
        <option value="80">4</option>
        <option value="100">5</option>
      </select>
      <label htmlFor="content">Review</label>
      <textarea onChange={props.handleContentChange} value={props.content} id="content" name="content"></textarea>
      <input type="submit" />
    </form>

  )
}

export default ReviewForm
