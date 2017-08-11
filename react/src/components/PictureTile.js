import React from 'react';

const PictureTile = (props) => {
  return(
    <div className="small-4 columns">
      <img className='show-image-pics' src={props.src} alt={props.alt}></img>
    </div>
)
}

export default PictureTile;
