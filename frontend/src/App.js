// React Imports
import { Route, Routes } from 'react-router-dom';

// Context Imports
import { AuthProvider } from './contexts/AuthContext';
import { NoAuthRoute } from './hocs/NoAuthRoute';
import { PrivateRoute } from './hocs/PrivateRoute';

// Screen Imports
import Login from './screens/login';
import Logout from './screens/logout';

import SpringBoardAdminAllProjects from './screens/springboard/admin_view_all_projects';
import SpringBoardAdminTemplates from './screens/springboard/admin_templates';
import CreateTemplate from './screens/springboard/admin_create_template/CreateTemplate';
import EditTemplate from './screens/springboard/admin_edit_template/EditTemplate';
import ViewBoard from './screens/springboard/project_board_view/ViewBoard/ViewBoard';
import SearchProject from './screens/springboard/search_project/SearchProject';

// Style Imports
import './App.css';

function App() {
  return (
    <AuthProvider>
      <Routes>
        <Route
          path="/"
          element={
            <NoAuthRoute>
              <Login />
            </NoAuthRoute>
          }
        />
        <Route
          path="/login"
          element={
            <NoAuthRoute>
              <Login />
            </NoAuthRoute>
          }
        />
        <Route path="/logout" element={<Logout />} />

        <Route path="admin/allprojects">
          <Route
            index
            element={
              <PrivateRoute>
                <SpringBoardAdminAllProjects />
              </PrivateRoute>
            }
          />
          <Route
            path="team/:teamId/search-project/:projId"
            element={
              <PrivateRoute>
                <SearchProject />
              </PrivateRoute>
            }
          />
        </Route>

        <Route path="admin/templates">
          <Route
            index
            element={
              <PrivateRoute>
                <SpringBoardAdminTemplates />
              </PrivateRoute>
            }
          />
          <Route
            path="add-template"
            element={
              <PrivateRoute>
                <CreateTemplate />
              </PrivateRoute>
            }
          />
          <Route
            path="template/:id"
            element={
              <PrivateRoute>
                <EditTemplate />
              </PrivateRoute>
            }
          />
        </Route>

        <Route path="project/:id/board/:boardid">
          <Route
            index
            element={
              <PrivateRoute>
                <ViewBoard />
              </PrivateRoute>
            }
          />
        </Route>
      </Routes>
    </AuthProvider>
  );
}

export default App;
