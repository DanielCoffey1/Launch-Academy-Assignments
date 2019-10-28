import React, {Component} from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import FAQContainer from './FAQContainer'
import LauncherList from '../components/LauncherList'
import LauncherShow from '../components/LauncherShow'
import NavBar from './NavBar'

const App = props => {

  return(
    <div>
    <Router history = {browserHistory}>
      <Route path = '/' component = {NavBar} >
        <IndexRoute component = {FAQContainer} />
        <Route path = '/launchers' component = {LauncherList} />
        <Route path = '/launchers/:id' component = {LauncherShow} />
      </Route>
    </Router>

    </div>

  )

}


export default App;
