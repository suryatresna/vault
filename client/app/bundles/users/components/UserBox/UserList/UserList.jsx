import Alert from 'react-bootstrap/lib/Alert';
import BaseComponent from 'libs/components/BaseComponent';
import Immutable from 'immutable';
import React, { PropTypes } from 'react';
import ReactCSSTransitionGroup from 'react/lib/ReactCSSTransitionGroup';
import _ from 'lodash';

import User from './User/User';

export const userPropTypes = {
  $$users: PropTypes.instanceOf(Immutable.List).isRequired,
  error: PropTypes.any,
  cssTransitionGroupClassNames: PropTypes.object.isRequired,
  isFetching: PropTypes.any
};

export default class UserList extends BaseComponent {
  static propTypes = userPropTypes;

  constructor(props, context) {
    super(props, context);
    this.state = {};
    _.bindAll(this, 'errorWarning');
  }

  errorWarning() {
    // If there is no error, there is nothing to add to the DOM
    if (!this.props.error) return null;
    return (
      <Alert bsStyle="danger" key="userFetchError">
        <strong>Users could not be retrieved. </strong>
        A server error prevented loading users. Please try again.
      </Alert>
    );
  }

  render() {
    const { $$users, cssTransitionGroupClassNames } = this.props;
    const userNodes = $$users.map(($$user, index) =>

      // `key` is a React-specific concept and is not mandatory for the
      // purpose of this tutorial. if you're curious, see more here:
      // http://facebook.github.io/react/docs/multiple-components.html#dynamic-children
      <User
        key={$$user.get('id') || index}
        email={$$user.get('email')}
        cssTransitionGroupClassNames={cssTransitionGroupClassNames}
      />
    );

    return (
      <div className="row">
        <div className="col-sm-12"> 
          <ReactCSSTransitionGroup
            transitionName={cssTransitionGroupClassNames}
            transitionEnterTimeout={500}
            transitionLeaveTimeout={500}
          >
            {this.errorWarning()}
          </ReactCSSTransitionGroup>

          <div className="panel panel-white no-radius">
            <div className="panel-body">
              <h1>User#index {this.props.isFetching}</h1>
              <table className="table table-bordered">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {userNodes}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
