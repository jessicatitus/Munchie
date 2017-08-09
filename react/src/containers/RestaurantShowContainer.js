import React, { Component } from 'react';
import { Route, Redirect } from 'react-router';
import ImageForm from '../components/ImageForm';
import PictureTile from '../components/PictureTile';


class RestaurantShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: {},
      pictures: []
    }
    this.deleteRestaurant = this.deleteRestaurant.bind(this);
  }

  componentDidMount() {
    let restaurantId = this.props.match.params.id
    fetch(`/api/v1/restaurants/${restaurantId}`, {
      credentials: 'same-origin'
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        restaurant: body.restaurant,
        pictures: body.pictures
      })
    })
  }

  deleteRestaurant() {
    let restaurantId = this.props.match.params.id
    fetch(`/api/v1/bakeries/${restaurantId}`, {
      method: "DELETE"
    })
  }

  render() {
    let showImage
    if (this.state.restaurant.img_url) {
      showImage = <img className='show-image' src={this.state.restaurant.img_url.url} alt={this.state.restaurant.name}></img>
    }

    let pictures = this.state.pictures.map(picture => {
      return(
          <PictureTile
            key={picture.id}
            id={picture.id}
            src={picture.img_url.url}
            alt={picture.name}
          />
      )
    })

    return (
      <div className="row restaurant-description">
      <div className="columns small-12">
        <h1>{this.state.restaurant.name}</h1>
        <h5>{this.state.restaurant.address}, {this.state.restaurant.city}, {this.state.restaurant.state} {this.state.restaurant.zip}</h5>
      </div>
      <div>
      <a href={`/restaurants/${this.state.restaurant.id}/pictures/new`} className="picLink">Upload an Image</a>
      </div>
          <div className="columns small-4">
            {showImage}
            {pictures}
          </div>
        </div>
    )
  }
}

export default RestaurantShowContainer;
