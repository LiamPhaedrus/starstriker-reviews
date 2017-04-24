import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewShow = (props) => {
  const { body, rating } = props
  return(
    <div className="review-show">
      <p className="review-body">{body}</p>
      <p className="review-rating">{rating} stars</p>
      <p className="review-author">By: </p>
    </div>
)}

export default ReviewShow;
