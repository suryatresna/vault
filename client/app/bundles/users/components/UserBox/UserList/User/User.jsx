import BaseComponent from 'libs/components/BaseComponent';
import React, { PropTypes } from 'react';
import ReactCSSTransitionGroup from 'react/lib/ReactCSSTransitionGroup';

import css from './User.scss';

export default class User extends BaseComponent {
  static propTypes = {
    email: PropTypes.string.isRequired,
    cssTransitionGroupClassNames: PropTypes.object.isRequired
  };

  render() {
    const { email, cssTransitionGroupClassNames } = this.props;

    /* eslint-disable react/no-danger */
    return (
      <ReactCSSTransitionGroup
        transitionName={cssTransitionGroupClassNames}
        transitionEnterTimeout={500}
        transitionLeaveTimeout={500}
        className={css.user}
        component="tr"
      >
        <td></td>
        <td className={`${css.userEmail} js-user-email`}>{email}</td>
        <td></td>
      </ReactCSSTransitionGroup>
    );
  }
}
