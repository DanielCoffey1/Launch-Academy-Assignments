import React, { Component } from 'react';

class LauncherShow extends Component {
  constructor(props){
    super(props)
    this.state = {
      info: {}

    }
  }

  componentDidMount(){
    fetch(`/api/v1/launcher/${this.props.params.id}`)
    .then(response => response.json())
    .then(body => {
      this.setState({ info: body })
    })
  }
    render(){
      return(
        <div>
          <h3>{this.state.info.name}</h3>
          <p>{this.state.info.bio}</p>
        </div>
      )
    }


}

export default LauncherShow
