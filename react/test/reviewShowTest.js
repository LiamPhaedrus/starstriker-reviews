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

  it('should render p tags', () => {
    expect(wrapper.find('p')).toBePresent();
  });

  it('should render a p tag with the body property value', () => {
    expect(wrapper.find('p')).toIncludeText('words');
  });
});
