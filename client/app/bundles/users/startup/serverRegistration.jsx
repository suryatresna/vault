// Example of React + Redux
import ReactOnRails from 'react-on-rails';

import RouterApp from './ServerRouterApp';
import routerUsersStore from '../store/routerUsersStore';

ReactOnRails.register(
  {
    RouterApp
  }
);

ReactOnRails.registerStore({
  routerUsersStore
});
