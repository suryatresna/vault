import BaseComponent from 'libs/components/BaseComponent';
import React, { PropTypes } from 'react';

import UserList, { UserPropTypes } from './UserList/UserList';
import css from './UserBox.scss';

export default class UserBox extends BaseComponent {
  static propTypes = {
    pollInterval: PropTypes.number.isRequired,
    actions: PropTypes.shape({
      fetchUsers: React.PropTypes.function,
    }),
    data: PropTypes.shape({
      isFetching: React.PropTypes.boolean,
      isSaving: React.PropTypes.boolean,
      submitUserError: React.PropTypes.string,
      $$users: React.PropTypes.arrayOf(UserPropTypes)
    }).isRequired
  };

  componentDidMount() {
    const { fetchUsers } = this.props.actions;
    fetchUsers();
    this.intervalId = setInterval(fetchUsers, this.props.pollInterval);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  render() {
    const { actions, data } = this.props;
    const cssTransitionGroupClassNames = {
      enter: css.elementEnter,
      enterActive: css.elementEnterActive,
      leave: css.elementLeave,
      leaveActive: css.elementLeaveActive,
    };

    return (
      <div className="userBox container">
        <UserList
          $$users={data.get('$$users')}
          error={data.get('fetchUserError')}
          cssTransitionGroupClassNames={cssTransitionGroupClassNames}
          isFetching={data.get('isFetching') && 'Loading...'}
        />
      </div>
    );
  }
}
