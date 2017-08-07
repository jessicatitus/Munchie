import React, { Component } from 'react';
import RestaurantTile from '../components/RestaurantTile';

class RestaurantsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurants: []
    }
    this.addNewRestaurant = this.addNewRestaurant.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/restaurants')
    .then(response => response.json())
    .then(body => {
      this.setState({ restaurants: body.restaurants })
    })
  }

  addNewRestaurant(formPayload) {
    fetch('/api/v1/restaurants', {
      method: 'POST',
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(responseData => {
      this.setState({ restaurants: [...this.state.restaurants, responseData] })
    })
  }

  render() {
    let addNewRestaurant = (formPayload) => this.addNewRestaurant(formPayload)



    let restaurants = this.state.restaurants.map(restaurant => {
      return(

          <RestaurantTile
            key={restaurant.id}
            id={restaurant.id}
            img_url={restaurant.img_url.url}
          />

      )
    })


    return (
      <div className="row">
        {restaurants}
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
