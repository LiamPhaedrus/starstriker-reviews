import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewShow = (props) => {
  return(
    <div className="review-show">
      <p>{props.body}</p>
      <p>{props.rating} stars</p>
      <p>By: </p>
    </div>
)}

export default ReviewShow;
