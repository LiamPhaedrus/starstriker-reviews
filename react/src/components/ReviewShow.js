import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewShow = (props) => {
  const { body, rating, author, handleVote, votes, id, current_user } = props

  let onVoteClick = () =>{
    handleVote(id, current_user)
  }

  let upCount = () => {
    let count = 0
    votes.forEach((vote) => {
      if (vote.votes === true ) {
        count++;
      }
    })
    return count;
  }

  let downCount = () => {
    let count = 0
    votes.forEach((vote) => {
      if (vote.votes === false ) {
        count++;
      }
    })
    return count;
  }

  return(
    <div className="review-show">
      <p className="review-body">{body}</p>
      <p className="review-rating">{rating} stars</p>
      <p className="review-author">By: {author}</p>
      <span className="upvote" onClick={onVoteClick}>
        ⬆{upCount()}
      </span>
      <span className="downvote" onClick={onVoteClick}>
        ⬇{downCount()}
      </span>
    </div>
)}

export default ReviewShow;
