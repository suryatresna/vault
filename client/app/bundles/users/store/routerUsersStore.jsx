import { applyMiddleware, compose, createStore, combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import thunkMiddleware from 'redux-thunk';

import loggerMiddleware from 'libs/middlewares/loggerMiddleware';

import reducers, { initialStates } from '../reducers';

// import DevTools from '../containers/DevTools';

export default (props, railsContext) => {
  const initialUsers = props.users;
  const { $$usersState } = initialStates;
  const initialState = {
    $$usersStore: $$usersState.merge({
      $$users: initialUsers,
    }),
    railsContext
  };

  // https://github.com/reactjs/react-router-redux
  const reducer = combineReducers({
    ...reducers,
    routing: routerReducer,
  });

  // Sync dispatched route actions to the history
  const finalCreateStore = compose(
    applyMiddleware(thunkMiddleware, loggerMiddleware)
    // DevTools.instrument()
  )(createStore);

  return finalCreateStore(reducer, initialState);
};