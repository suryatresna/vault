import React, { PropTypes } from 'react';

import BaseComponent from 'libs/components/BaseComponent';

import UserBox from '../UserBox/UserBox';
import css from './UserScreen.scss';

export default class UserScreen extends BaseComponent {

  static propTypes = {
    actions: PropTypes.object.isRequired,
    data: PropTypes.object.isRequired,
    locationState: PropTypes.object,
  };

  renderNotification() {
    const { locationState } = this.props;

    if (!locationState || !locationState.redirectFrom) return null;

    return (
      <div className={`bg-success ${css.notification}`}>
        You have been redirected from
        <strong>
          {locationState.redirectFrom}
        </strong>
      </div>
    );
  }

  render() {
    const { data, actions } = this.props;

    return (
      <div>
        {this.renderNotification()}
        <div>
          <UserBox
            pollInterval={60000}
            data={data}
            actions={actions}
            ajaxCounter={data.get('ajaxCounter')}
          />
        </div>
      </div>
    );
  }
}
