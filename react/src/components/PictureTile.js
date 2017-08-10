import React from 'react';

const PictureTile = (props) => {
  return(
      <img className='show-image' src={props.src} alt={props.alt}></img>
)
}

export default PictureTile;
