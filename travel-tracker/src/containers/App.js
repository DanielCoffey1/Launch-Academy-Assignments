import React, { Component } from 'react';
import data from '../constants/data'
import styles from '../stylesheets/index.css'
import Destination from '../components/Destination'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedId: null
    }
  }

  handleClick(newId) {
    let setId;
    if(this.state.selectedId !== newId)
      setId = newId;
  }
  this.setState

  render() {
    console.log(this.state)

    return(
      <Places
      key={place.id}
      name={place.name}
      />
    )

    return (
      <div id="wishlist-div">
        <div className="row">
          <div className="small-12 small-centered columns text-center">
            <h3>Wanderlust Wishlist</h3>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
