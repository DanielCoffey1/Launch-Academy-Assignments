import React from 'react';
import { Link } from 'react-router';
import SkillsContainer from '../containers/SkillsContainer';
import VolunteerExperienceContainer from '../containers/VolunteerExperienceContainer';
import WorkExperienceContainer from '../containers/WorkExperienceContainer';
import EducationExperienceContainer from '../containers/EducationExperienceContainer';

const Resume = (props) => {
 return(
   <div className="small-12 small-centered columns">
     <div className="small-3 columns">
      <h3><Link to="/skills">Skills</Link></h3> //Use THESE OVER HREF
     </div>
     <div className="small-3 columns">
      <h3><a href="/education_experiences">Education</a></h3>
     </div>
     <div className="small-3 columns">
      <h3><Link to="/work_experiences">Past Work</Link></h3>
     </div>
     <div className="small-3 columns">
      <h3><a href="/volunteer_experiences">Volunteer Experience</a></h3>
     </div>

     <div className="resume-section" id="skills"><SkillsContainer /></div>
     <div className="resume-section" id="education"><EducationExperienceContainer /></div>
     <div className="resume-section" id="past-work"><WorkExperienceContainer /></div>
     <div className="resume-section" id="volunteer-experience"><VolunteerExperienceContainer /></div>
   </div>
 )
}

export default Resume;
