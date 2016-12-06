import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import BaseComponent from 'libs/components/BaseComponent';

import UserScreen from '../components/UserScreen/UserScreen';
import * as usersActionCreators from '../actions/usersActionCreators';

function select(state) {
  // Which part of the Redux global state does our component want to receive as props?
  return { data: state.$$usersStore };
}

class RouterUsersContainer extends BaseComponent {
  static propTypes = {
    dispatch: PropTypes.func.isRequired,
    data: PropTypes.object.isRequired,
    location: PropTypes.shape({
      state: PropTypes.object,
    }).isRequired,
  };

  render() {
    const { dispatch, data } = this.props;
    const actions = bindActionCreators(usersActionCreators, dispatch);
    const locationState = this.props.location.state;

    return (
      <UserScreen {...{ actions, data, locationState }} />
    );
  }
}

// Don't forget to actually use connect! => select mapStateToProps
export default connect(select)(RouterUsersContainer);