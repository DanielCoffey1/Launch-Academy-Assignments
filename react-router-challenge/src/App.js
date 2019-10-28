import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import Resume from './components/Resume';
import NavBar from './components/NavBar';
import About from './components/About';
import ProjectsIndexContainer from './containers/ProjectsIndexContainer';
import ProjectShowContainer from './containers/ProjectShowContainer';
import SkillsContainer from './containers/SkillsContainer';
import WorkExperienceContainer from './containers/WorkExperienceContainer';
import EducationExperienceContainer from './containers/EducationExperienceContainer';
import VolunteerExperienceContainer from './containers/VolunteerExperienceContainer';


class App extends Component {
  constructor(props){
    super(props)
    this.state = {

    }
  }

  render() {
    return(
      <Router history={browserHistory}>
        <Route path='/' component={NavBar} >
          <IndexRoute component={About} />
          <Route path="/resume" component={Resume} />
          <Route path="/projects" component={ProjectsIndexContainer} />
          <Route path="/projects/:id" component={ProjectShowContainer} />
          <Route path="/skills" component={SkillsContainer} />
          <Route path="/work_experiences" component={WorkExperienceContainer} />
          <Route path="/education_experiences" component={EducationExperienceContainer} />
          <Route path="/volunteer_experiences" component={VolunteerExperienceContainer} />
        </Route>
      </Router>


    )
  }
}

export default App;
