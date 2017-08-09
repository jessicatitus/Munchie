import React from 'react';

const PictureTile = (props) => {
  return(
    <div className='large-2 medium-4 small-6 columns'>
      <img className='show-image' src={props.src} alt={props.alt}></img>
    </div>
  )
}

export default PictureTile;
