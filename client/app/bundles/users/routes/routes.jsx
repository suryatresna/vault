import React from 'react';
import { Route, IndexRoute } from 'react-router';
import Layout from '../layout/Layout';
import RouterUsersContainer from '../containers/RouterUsersContainer';

export default (
  <Route path="/user" component={Layout}>
    <IndexRoute
      component={RouterUsersContainer}
    />
  </Route>
);
