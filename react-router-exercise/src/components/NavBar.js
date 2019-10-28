import React, { Component } from 'react';
import { Link } from 'react-router';

class NavBar extends Component{
  constructor(props){
    super(props);
    this.state = {

    }
  }

  render(){
    return(
      <div>
      <div className="navbar">
        <Link to='/'>Home</Link>
      </div>
      <div className="content">
        {this.props.children}
      </div>
    </div>
    )
  }
}

export default NavBar;
