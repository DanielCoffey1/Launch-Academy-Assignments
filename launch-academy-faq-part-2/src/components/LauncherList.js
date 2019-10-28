import React, { Component } from 'react';
import {Link} from 'react-router'


class LauncherList extends Component {
  constructor(props){
    super(props)
    this.state = {
      launchers: []
    }
  }

  componentDidMount(){
    fetch('/api/v1/launchers')
      .then(response => response.json())
      .then(body => {
        this.setState({ launchers: body })
      })
  }

  render(){
    let launcherList = this.state.launchers.map((launcher) => {
      return(
        <div key={launcher.id}>
          <Link to = {`/launchers/${launcher.id}`}>{launcher.name}
          </Link>
        </div>
      )
    })

    return(
      <div>
          {launcherList}
      </div>
    )
  }
}

export default LauncherList;
