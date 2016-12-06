import requestsManager from 'libs/requestsManager';
import * as actionTypes from '../constants/usersConstants';

export function setIsFetching() {
  return {
    type: actionTypes.SET_IS_FETCHING,
  };
}

export function setIsSaving() {
  return {
    type: actionTypes.SET_IS_SAVING,
  };
}

export function fetchUsersSuccess(data) {
  return {
    type: actionTypes.FETCH_USERS_SUCCESS,
    users: data.users,
  };
}

export function fetchUsersFailure(error) {
  return {
    type: actionTypes.FETCH_USERS_FAILURE,
    error,
  };
}

export function submitUserSuccess(user) {
  return {
    type: actionTypes.SUBMIT_USER_SUCCESS,
    user,
  };
}

export function submitUserFailure(error) {
  return {
    type: actionTypes.SUBMIT_USER_FAILURE,
    error,
  };
}

export function fetchUsers() {
  return (dispatch) => {
    dispatch(setIsFetching());
    return (
      requestsManager
        .fetchEntities('user.json')
        .then(res => dispatch(fetchUsersSuccess(res.data)))
        .catch(error => dispatch(fetchUsersFailure(error)))
    );
  };
}

export function submitUser(user) {
  return (dispatch) => {
    dispatch(setIsSaving());
    return (
      requestsManager
        .submitEntity({ user }, 'user.json')
        .then(res => dispatch(submitUserSuccess(res.data)))
        .catch(error => dispatch(submitUserFailure(error)))
    );
  };
}