import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';
import FormContainer from './ReviewFormContainer';

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
      user: []
    }
    this.addNewReview = this.addNewReview.bind(this)
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
      console.log(responseData)
      this.setState({ reviews: [...this.state.reviews, responseData.review] })
    })
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewShow
          id={review.id}
          body={review.body}
          key={"review" + review.id}
          rating={review.rating}
          author={review.username}
         />
      )
    })
    console.log(this.state.user)
    let formShow = this.state.user.map((thing, index) => {
      if (thing) {
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
      <div className="small-9 small-centered columns">
        {reviews.reverse()}
        {formShow}
      </div>
    )
  }
}

export default ReviewShowContainer;
