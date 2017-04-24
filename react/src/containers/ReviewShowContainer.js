import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';
import FormContainer from './ReviewFormContainer';

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
    this.trackReviews = this.trackReviews.bind(this);
  }

  componentDidMount() {
    let gameId = this.props.params.id;
    fetch(`/api/v1/games/${gameId}`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ reviews: [...this.state.reviews, ...responseData] })
      })
  }

  trackReviews(submission) {
    this.setState({ reviews: this.state.reviews.concat(submission) })
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
    return(
      <div className="small-9 small-centered columns">
        {reviews}
        <FormContainer trackReviews={this.trackReviews} />
      </div>
    )
  }
}

export default ReviewShowContainer;
