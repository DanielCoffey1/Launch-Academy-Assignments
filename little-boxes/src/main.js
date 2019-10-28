import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

import style from './styles/app.scss'

import Wrapper from './components/Wrapper';
import Picture from './components/Picture';
import List from './components/List';
import Numbers from './components/Numbers';

let wrapperParagraph = 'Lorem ipsum dolor sit amet...'
let listedInfo = ["Asteroids", "Comets", "Moon", "Planets", "Stars", "Sun"]

<div>
  <Wrapper
    header='I Am the Wrapper'
    paragraph={wrapperParagraph}
    />
  <Picture
    headerTwo='Look at This Picture'
    pictureSrc='https://s3.amazonaws.com/horizon-production/images/react-clever-ees.png'
    pictureAlt='Clever EEs'
    />
  <List
    title='Here Is a List'
    list={space}
    />
  <Numbers
    header='Todays Date and Random Number'/>
</div>,
document.getElementById('app')
);
