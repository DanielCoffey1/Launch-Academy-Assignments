import React, { Component } from 'react';
import Tweet from '../components/Tweet'

class TwitterFeed extends Component {
  constructor(props) {
    super(props)
    this.state = {
      tweets: props.tweets
    }
  }

  componentDidMount() {
    fetch("http://localhost:4567/api/v1/tweets")
    .then(response => {
      if response
    })
  }

  render() {
    let tweets = this.state.tweets.map(tweet => {
      return <Tweet key={tweet.id_str} tweet={tweet} />
    })

    return (
      <div className="row columns small-12 medium-9 large-6">
        <div className="twitter-feed">
          {tweets}
        </div>
      </div>
    );
  }
}

export default TwitterFeed;
