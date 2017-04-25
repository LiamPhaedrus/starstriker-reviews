import ReviewFormContainer from 'containers/ReviewFormContainer';
import Select from 'components/Select';
import BodyField from 'components/BodyField';

describe('ReviewFormContainer', () => {
  let image,
      text,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <ReviewFormContainer />
    );
  });

  it('should render a new review component will class callout', () => {
    expect(wrapper.find('.callout')).toBePresent();
  });

  it('should render a select drop down on the form', () => {
    expect(wrapper.find(Select)).toBePresent();
  });

  it('should render a text field for the body on the form', () => {
    expect(wrapper.find(BodyField)).toBePresent();
  });

  it('should render a submit button', () => {
    expect(wrapper.find('.button')).toBePresent();
  });
});
