import React, { useState, useEffect, useRef } from 'react';
import { useOutletContext, useNavigate } from 'react-router-dom';
import jwtDecode from 'jwt-decode';

import { FaCaretDown } from 'react-icons/fa';
import { Switch } from '@mui/material';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircle } from '@fortawesome/free-solid-svg-icons';
import Swal from 'sweetalert2';
import { useAuth } from '../../../../contexts/AuthContext';
import Loading from '../../../../components/loading';
import ModalCustom from '../UI/Modal/Modal';
import Board from './Board';
import Button from '../UI/Button/Button';
import Caution from '../UI/Caution/Caution';
import { useClassMemberTeam, useProjects } from '../../../../hooks';
import styles from './Board.module.css';

const BoardContainer = ({ selected, project, setSelected }) => {
  const { teamProjects } = useProjects();

  const [loadCount, setLoadCount] = useState(0);
  const [projectList, setProjectList] = useState([]);

  const [dropdownVisible, setDropdownVisible] = useState(false);
  const dropdownRef = useRef(null);

  const navigate = useNavigate();

  const theme = createTheme({
    palette: {
      success: {
        main: '#87EE63',
        light: '#81c784',
        dark: '#388e3c',
        contrastText: '#242105',
      },
    },
  });

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoadCount((prevLoadCount) => prevLoadCount + 1);
        const result = await teamProjects(project.team_id);
        if (result.success) {
          setProjectList(result.data.projects);
        } else {
          console.error('Error fetching team projects:', result.error);
        }
      } catch (error) {
        console.error(`Error fetching data: ${error}`, error);
      }
    };

    fetchData();
  }, [selected]);

  const handleDropdownClick = () => {
    setDropdownVisible(!dropdownVisible);
  };

  const handleClickOutside = (event) => {
    if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
      setDropdownVisible(false);
    }
  };

  useEffect(() => {
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  if (!projectList) {
    return <Loading />;
  }

  return (
    <div className={styles.board}>
      {project ? (
        <>
          <ThemeProvider theme={theme}>
            <div className={styles.alignment}>
              <div className={styles.head}>{project.name} Boards</div>

              <div>
                <div className={styles.top} onClick={handleDropdownClick}>
                  <div className={styles.dropdown} ref={dropdownRef}>
                    <div className={styles.dropbtn}>
                      <span>View other project &nbsp;</span>
                      <FaCaretDown />
                    </div>
                    {dropdownVisible && (
                      <div className={styles.dropdowncontent}>
                        {projectList.map((proj) => (
                          <span
                            key={proj.id}
                            onClick={() => {
                              navigate(
                                `/admin/allprojects/team/${proj.team_id}/search-project/${proj.id}`
                              );
                              setDropdownVisible(!dropdownVisible);
                            }}
                          >
                            {proj.is_active ? (
                              <FontAwesomeIcon
                                icon={faCircle}
                                className={styles.greenBullet}
                                size="xs"
                              />
                            ) : (
                              <FontAwesomeIcon icon={faCircle} className={styles.clear} size="xs" />
                            )}

                            <p style={{ padding: 0, margin: 0 }}>{proj.name}</p>
                          </span>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
            <hr />
          </ThemeProvider>
          <Board selected={selected} project={project} />
        </>
      ) : loadCount === 0 ? (
        <Loading />
      ) : (
        <p className={styles.centeredText}>There's no project created in this group.</p>
      )}
    </div>
  );
};

export default BoardContainer;
