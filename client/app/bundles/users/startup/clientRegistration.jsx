import ReactOnRails from 'react-on-rails';

import RouterApp from './ClientRouterApp';
import routerUsersStore from '../store/routerUsersStore';

ReactOnRails.setOptions({
  traceTurbolinks: TRACE_TURBOLINKS, // eslint-disable-line no-undef
});

ReactOnRails.register({
  RouterApp,
});

ReactOnRails.registerStore({
  routerUsersStore
});