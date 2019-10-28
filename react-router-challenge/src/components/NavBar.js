import React from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton';
import Resume from './Resume';
import ProjectsIndexContainer from '../containers/ProjectsIndexContainer'

const NavBar = props => {
  return(
    <div>
      <div className="navbar">
        <BackButton />
        <Link to='/'> Home </Link>
        <Link to='/resume'> Resume </Link>
        <Link to='/projects'> Projects </Link>
      </div>
        { props.children }
      </div>
  )
}

export default NavBar;
