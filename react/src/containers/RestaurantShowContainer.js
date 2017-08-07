import React, { Component } from 'react';
import { Route, Redirect } from 'react-router';

class RestaurantShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: {}
    }
    this.deleteRestaurant = this.deleteRestaurant.bind(this)
  }

  componentDidMount() {
    let restaurantId = this.props.params.id
    fetch(`/api/v1/restaurants/${restaurantId}`, {
      credentials: 'same-origin'
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        restaurant: body.restaurant
      })
    })
  }

  deleteRestaurant() {
    let restaurantId = this.props.params.id
    fetch(`/api/v1/bakeries/${restaurantId}`, {
      method: "DELETE"
    })
  }

  render() {

    return (
        <div className="row restaurant-description">
          <div className="columns small-4">
            <img className='show-image' src={this.state.restaurant.img_url} alt={this.state.restaurant.name}></img>
          </div>

          <div className="columns small-8 callout">
              <h1>{this.state.restaurant.name}</h1>
              <h5>{this.state.restaurant.address}, {this.state.restaurant.city}, {this.state.restaurant.state} {this.state.restaurant.zip}</h5> </div>
        </div>
    )
  }
}

export default RestaurantShowContainer;
