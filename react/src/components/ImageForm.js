import React from 'react';

const ImageForm = (props) => {
  return(
    <div>
    <label>{props.label}
      <input
        name={props.name}
        onChange={props.handlerFunction}
        type='file'
        value={props.content}
      />
      <input type="hidden" value={props.id}/>
    </label>
    <button className="submitButton"
           type="submit"
           onClick={(e)=>this._handleSubmit(e)}><i className="fa fa-cloud-upload" aria-hidden="true"></i></button>
  </div>
  )
}

export default ImageForm;
