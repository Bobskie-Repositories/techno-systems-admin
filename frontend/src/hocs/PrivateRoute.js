import PropTypes from 'prop-types';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import GLOBALS from '../app_globals';

export function PrivateRoute({ forUserType, children }) {
  const { refreshToken } = useAuth();

  if (!refreshToken) {
    return <Navigate to="/login" />;
  }

  if (refreshToken && forUserType === GLOBALS.USER_ROLE.ADMIN) {
    return <Navigate to="/admin/allprojects" />;
  }

  return [children];
}

PrivateRoute.defaultProps = {
  children: null,
};

PrivateRoute.propTypes = {
  forUserType: PropTypes.oneOf([
    GLOBALS.USER_ROLE.ADMIN,
    GLOBALS.USER_ROLE.MODERATOR,
    GLOBALS.USER_ROLE.BASIC,
  ]),
  children: PropTypes.any,
};
