import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import RestaurantsIndexContainer from './RestaurantsIndexContainer';

const App = props => {
  return (
    <Router>
      <div>
        <Route path='/' component={RestaurantsIndexContainer}/>
        <Route path='/restaurants' component={RestaurantsIndexContainer}/>
      </div>
    </Router>
  )
}

export default App;
