import React, { Component } from 'react';
import BodyField from '../components/BodyField'
import Select from '../components/Select'
class FormContainer extends Component {
constructor(props) {
  super(props);
  this.state = {
    errors: {},
    bodyConsumed: '',
    ratingOptions: ['1', '2', '3', '4', '5'],
    ratingSelected: ''
  }
    this.handleClearForm = this.handleClearForm.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleRatingSelection = this.handleRatingSelection.bind(this);
    this.validateRatingSelection = this.validateRatingSelection.bind(this);
  }
  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      errors: {},
      bodyConsumed: '',
      ratingSelected: ''
    })
  }
  handleFormSubmit(event) {
    event.preventDefault();
    if (
      this.validateRatingSelection(this.state.ratingSelected)
    ) {
      let formPayload = {
        body: this.state.bodyConsumed,
        rating: this.state.ratingSelected,
        game_id: this.props.gameId
      };
      this.props.addNewReview(formPayload);
      this.handleClearForm(event);
    }
  }
  handleBodyChange(event) {
    this.setState({ bodyConsumed: event.target.value })
  }

  handleRatingSelection(event) {
    this.validateRatingSelection(event.target.value)
    this.setState({ ratingSelected: event.target.value })
  }

  validateRatingSelection(selection) {
    if (selection === '') {
      let newError = { ratingSelected: 'You must select a rating.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.ratingSelected
      this.setState({ errors: errorState })
      return true
    }
  }
  render() {
    let errorDiv;
    let errorItems;
    if (Object.keys(this.state.errors).length > 0) {
      errorItems = Object.values(this.state.errors).map(error => {
        return(<li key={error}>{error}</li>)
      })
      errorDiv = <div className="callout alert">{errorItems}</div>
    }
  return (
    <form className="callout" onSubmit={this.handleFormSubmit}>
        {errorDiv}
        <BodyField
          content={this.state.bodyConsumed}
          label='Body'
          name='body'
          handlerFunction={this.handleBodyChange}
        />
        <Select
          handlerFunction={this.handleRatingSelection}
          name='rating'
          label='Rating'
          options={this.state.ratingOptions}
          selectedOption={this.state.ratingSelected}
        />
        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    );
  }
}
export default FormContainer;
