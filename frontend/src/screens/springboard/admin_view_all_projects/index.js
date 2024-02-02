import React, { useState, useEffect, useRef } from 'react';
import jwtDecode from 'jwt-decode';
import { DateRangePicker } from 'rsuite';
import { FaCaretDown, FaCalendarAlt } from 'react-icons/fa';
import { SiGoogleclassroom } from 'react-icons/si';
import { GrStatusGoodSmall } from 'react-icons/gr';
import { useAuth } from '../../../contexts/AuthContext';

import Header from '../../../components/header';
import Sidebar from '../../../components/Sidebar';
import AdminTable from '../components/Table/AdminTable';
import { useProjects } from '../../../hooks';

import GLOBALS from '../../../app_globals';
import 'primeicons/primeicons.css';
import 'rsuite/dist/rsuite-no-reset.css';
import styles from './AdminAllProjects.module.css';
import Loading from '../components/UI/Loading/Loading';

function SpringBoardAdminAllProjects() {
  const { accessToken } = useAuth();
  const user = jwtDecode(accessToken);

  const { getAllClass } = useProjects();

  const { allclassteamproj } = useProjects();
  const [classroom, setClassroom] = useState([]);
  const [selectedClassrooms, setSelectedClassrooms] = useState([]);
  const [allProjects, setAllProjects] = useState();
  const dropdownRef = useRef(null);
  const [dropdownVisible, setDropdownVisible] = useState(false);
  const [statusVisible, setStatusVisible] = useState(false);
  const [selectedDates, setSelectedDates] = useState([]);
  const [isActive, setIsActive] = useState(
    sessionStorage.getItem('selectedStatus') === 'Active Projects' ||
      sessionStorage.getItem('selectedStatus') === null
  );

  let buttons;
  if (user?.role === GLOBALS.USER_ROLE.ADMIN) {
    buttons = GLOBALS.SIDENAV_ADMIN;
  } else {
    buttons = GLOBALS.SIDENAV_DEFAULT;
  }

  useEffect(() => {
    sessionStorage.setItem('selectedStatus', isActive ? 'Active Projects' : 'Inactive Projects');

    const currentPath = window.location.pathname;
    sessionStorage.setItem('dashboard', currentPath);
  }, [isActive]);

  useEffect(() => {
    const fetchData = async () => {
      const groupResponse = await allclassteamproj();
      setAllProjects(groupResponse.data);
      const allClassRes = await getAllClass();
      setClassroom(allClassRes.data);
    };
    fetchData();
  }, []);

  const handleStatusChange = (e) => {
    const selectedStatus = e.target.value;
    setIsActive(selectedStatus === 'Active Projects');
    setStatusVisible(false); // Close status dropdown when a status is selected
  };

  const handleDropdownClick = () => {
    setDropdownVisible(!dropdownVisible);
  };

  const handleStatusClick = () => {
    setStatusVisible(!statusVisible);
    setDropdownVisible(false);
  };

  const handleClickOutside = (event) => {
    if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
      setDropdownVisible(false);
      setStatusVisible(false);
    }
  };

  useEffect(() => {
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  const handleCheckboxChange = (clsrm) => {
    // Toggle selection
    setSelectedClassrooms((prevSelected) => {
      if (prevSelected.includes(clsrm.id)) {
        return prevSelected.filter((selectedId) => selectedId !== clsrm.id);
      }
      return [...prevSelected, clsrm.id];
    });
  };

  const handleDateRangeChange = (value) => {
    setSelectedDates(value);
  };

  const render = () => {
    if (!allProjects) {
      return <Loading />;
    }
    return (
      <div style={{ marginTop: '50px' }}>
        <div className={styles.otherHead}>
          <div className={styles.top}>
            <div className={styles.dropdown} ref={dropdownRef}>
              <div className={styles.icons}>
                <div className={styles.calendar}>
                  <FaCalendarAlt size={18} style={{ verticalAlign: 'middle' }} />
                  &nbsp;&nbsp;&nbsp;
                  <DateRangePicker
                    appearance="subtle"
                    size="sm"
                    onChange={handleDateRangeChange}
                    placeholder="Select Date Range"
                    caretAs={FaCaretDown}
                    character=" – "
                    className={styles.datepick}
                  />
                </div>

                <div className={styles.dropbtn} onClick={handleStatusClick}>
                  <GrStatusGoodSmall size={12} style={{ verticalAlign: 'middle' }} />
                  &nbsp;&nbsp;&nbsp;
                  <p className={styles.classroomText}>
                    {isActive ? 'Active Projects' : 'Inactive Projects'}
                  </p>
                  &nbsp;&nbsp;&nbsp;
                  <FaCaretDown style={{ verticalAlign: 'middle' }} />
                </div>

                <div className={styles.dropbtn} onClick={handleDropdownClick}>
                  <SiGoogleclassroom size={20} style={{ verticalAlign: 'middle' }} />
                  &nbsp;&nbsp;&nbsp;
                  <p className={styles.classroomText}>All Classrooms</p>
                  &nbsp;&nbsp;&nbsp;
                  <FaCaretDown style={{ verticalAlign: 'middle' }} />
                </div>
              </div>

              {dropdownVisible && (
                <div className={styles.dropdowncontent} style={{ minWidth: '12rem' }}>
                  {classroom &&
                    classroom.map((clsrm) => (
                      <div key={clsrm.id} className={styles.classroomItem}>
                        <input
                          type="checkbox"
                          id={`classroom-${clsrm.id}`}
                          checked={selectedClassrooms.includes(clsrm.id)}
                          onChange={() => handleCheckboxChange(clsrm)}
                          className={styles.box}
                        />
                        <label
                          style={{ color: '#9c7b16', margin: '0 10px 0 0' }}
                          htmlFor={`classroom-${clsrm.id}`}
                        >
                          {`${clsrm.course_name}-${clsrm.sections}`}
                        </label>
                      </div>
                    ))}
                </div>
              )}

              {statusVisible && (
                <div className={styles.statuscontent}>
                  <ul className={styles.statusList}>
                    <button
                      className={`${styles.customLi}`}
                      onClick={() =>
                        handleStatusChange({
                          target: { value: 'Active Projects' },
                        })
                      }
                    >
                      Active Projects
                    </button>
                    <button
                      className={`${styles.customLi}`}
                      onClick={() =>
                        handleStatusChange({
                          target: { value: 'Inactive Projects' },
                        })
                      }
                    >
                      Inactive Projects
                    </button>
                  </ul>
                </div>
              )}
            </div>
          </div>
        </div>

        <AdminTable
          isActive={isActive}
          allProjects={allProjects}
          filter={selectedClassrooms}
          dateRange={selectedDates}
        />
      </div>
    );
  };

  return (
    <div className="d-flex">
      <Sidebar name={`${user?.first_name} ${user?.last_name}`} sidebarItems={buttons} />
      <div className="container-fluid d-flex flex-column">
        <Header />
        <div className="px-5">{render()}</div>
      </div>
    </div>
  );
}

export default SpringBoardAdminAllProjects;
