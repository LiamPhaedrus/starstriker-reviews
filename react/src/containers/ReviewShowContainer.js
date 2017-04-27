import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';
import FormContainer from './ReviewFormContainer';
import Notifications, { notify } from 'react-notify-toast';

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
      user: []
    }
    this.addNewReview = this.addNewReview.bind(this)
    this.handleVote = this.handleVote.bind(this)
    this.hasUserVoted = this.hasUserVoted.bind(this)
  }

  componentDidMount() {
    let gameId = this.props.params.id;
    fetch(`/api/v1/games/${gameId}`, {
      credentials: 'include',
      method: 'GET'
    })
      .then(response => response.json())
      .then(responseData => {
        this.setState({
          reviews: [...this.state.reviews, ...responseData.reviews],
          user: [responseData.user]
        })
      })
  }
  addNewReview(payload) {
    fetch('/api/v1/reviews', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    })
    .then(response => response.json())
    .then(responseData => {
      this.setState({ reviews: [...this.state.reviews, responseData.review] })
    })
  }

  handleVote(payload){
    fetch(`/api/v1/reviews/${payload.id}`, {
      credentials: 'include',
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({updown: payload})
    })
    .then(response => response.json())
    .then(responseData => {
      if (responseData.status !== 201) {
        notify.show(responseData.error, 'error', 1800)
      } else {
        notify.show(responseData.message, 'success', 1800)
        this.setState({ reviews: responseData.reviews })
      }
    })
  }

  hasUserVoted(reviewers) {
    if (reviewers.includes(this.state.user[0])) {
      return 'review-show voted'
    } else {
      return 'review-show'
    }
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      let reviewers = []
      review.votes.forEach(vote => {
        reviewers.push(vote.reviewer)
      })

      return(
        <ReviewShow
          id={review.id}
          body={review.body}
          key={"review" + review.id}
          rating={review.rating}
          author={review.username}
          votes={review.votes}
          handleVote={this.handleVote}
          thisUser={this.state.user[0]}
          hasVoted={this.hasUserVoted(reviewers)}
         />
      )
    })

    let formShow = this.state.user.map((user, index) => {
      if (user) {
        return(
          <FormContainer
            key={index}
            addNewReview={this.addNewReview}
            gameId={this.props.params.id}
          />
        )
      }
    })
    return(
      <div className="small-9 small-centered columns main">
        <Notifications />
        {reviews.reverse()}
        {formShow}
      </div>
    )
  }
}

export default ReviewShowContainer;
