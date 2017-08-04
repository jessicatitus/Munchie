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
        <div className="callout">
          <div className='row'>
            <div className='small-4 columns'>
              <img className='index-image' src={image} alt={props.name}></img>
            </div>
          </div>
        </div>
      </Link>
    </div>
  )
}

export default RestaurantTile;
