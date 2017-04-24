import ReviewShow from 'components/ReviewShow';

describe('ReviewShow', () => {
  let image,
      text,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <ReviewShow
        body="words go here"
        rating="5"
      />
    );
  });

  it('should render the review-body', () => {
    expect(wrapper.find('.review-body')).toBePresent();
  });

  it('should render review-body with the value of body', () => {
    expect(wrapper.find('.review-body').text()).toBe('words go here');
  });

  it('should render the rating with the value of rating', () => {
    expect(wrapper.find('.review-rating').text()).toBe('5 stars');
  });



});
