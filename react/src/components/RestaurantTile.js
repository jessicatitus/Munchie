import React from 'react';
import { Link } from 'react-router-dom';

const RestaurantTile = (props) => {
  let image;
  if (props.img_url === null) {
    image = ""
  } else {
    image = props.img_url
  }

  return(
    <div>
      <Link to={`/restaurants/${props.id}`}>
            <div className='large-2 medium-4 small-6 columns'>
              <img className='index-image' src={image} alt={props.name}></img>
              <div className="text">{props.restaurant.name}</div>
            </div>
      </Link>
    </div>
  )
}

export default RestaurantTile;
