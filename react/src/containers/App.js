import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import RestaurantsIndexContainer from './RestaurantsIndexContainer';
import RestaurantShowContainer from './RestaurantShowContainer';

const App = props => {
  return (
    <Router>
      <div>
        <Route path='/' component={RestaurantsIndexContainer}/>
        <Route path='/restaurants' component={RestaurantsIndexContainer}/>
        <Route path='/restaurants/:id' component={RestaurantShowContainer}/>
      </div>
    </Router>
  )
}

export default App;
