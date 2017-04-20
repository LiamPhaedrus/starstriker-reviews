import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/games`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ reviews: [...this.state.reviews, ...responseData] })
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
         />
      )
    })
    return(
      <div className="reviews">
        {reviews}
      </div>
    )
  }
}

export default ReviewShowContainer;
