import React from 'react';
import NameForm from './NameForm';
import KarmaButton from './KarmaButton';

const App = (props) => {
  let karmaAlert = (event) => {
    alert("You have leveled up! (Karma: 1)");
  }

  return (
    <div className="main-div">
      <NameForm />
      <KarmaButton
      karmaAlertProp={karmaAlert}
      />
    </div>
  );
}

export default App;
