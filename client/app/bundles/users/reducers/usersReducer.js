/* eslint new-cap: 0 */

import Immutable from 'immutable';

import * as actionTypes from '../constants/usersConstants';

export const $$initialState = Immutable.fromJS({
  $$users: [],
  fetchUserError: null,
  submitUserError: null,
  isFetching: false,
  isSaving: false,
});

export default function usersReducer($$state = $$initialState, action = null) {
  const { type, user, users, error } = action;

  switch (type) {

    case actionTypes.FETCH_USERS_SUCCESS: {
      return $$state.merge({
        $$users: users,
        fetchUserError: null,
        isFetching: false,
      });
    }

    case actionTypes.FETCH_USERS_FAILURE: {
      return $$state.merge({
        fetchUserError: error,
        isFetching: false,
      });
    }

    case actionTypes.SUBMIT_USER_SUCCESS: {
      return $$state.withMutations(state => (
        state
          .updateIn(
            ['$$users'],
            $$users => $$users.unshift(Immutable.fromJS(user))
          )
          .merge({
            submitUserError: null,
            isSaving: false,
          })
      ));
    }

    case actionTypes.SUBMIT_USER_FAILURE: {
      return $$state.merge({
        submitUserError: error,
        isSaving: false,
      });
    }

    case actionTypes.SET_IS_FETCHING: {
      return $$state.merge({
        isFetching: true,
      });
    }

    case actionTypes.SET_IS_SAVING: {
      return $$state.merge({
        isSaving: true,
      });
    }

    default: {
      return $$state;
    }
  }
}
