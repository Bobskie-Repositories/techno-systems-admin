import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import jwtDecode from 'jwt-decode';
import { useAuth } from '../../../contexts/AuthContext';

import Header from '../../../components/header';
import Sidebar from '../../../components/Sidebar';
import Button from '../components/UI/Button/Button';
import Card from '../components/UI/Card/Card';
import { useBoardTemplate } from '../../../hooks';

import GLOBALS from '../../../app_globals';
import 'primeicons/primeicons.css';
import styles from './AdminTemplates.module.css';
import Loading from '../components/UI/Loading/Loading';

function SpringBoardAdminTemplates() {
  const { accessToken } = useAuth();
  const user = jwtDecode(accessToken);

  const { getAllTemplate } = useBoardTemplate();

  const [templates, setTemplates] = useState([]);
  const navigate = useNavigate();
  const [isLoading, setIsLoading] = useState(true);

  let buttons;
  if (user?.role === GLOBALS.USER_ROLE.ADMIN) {
    buttons = GLOBALS.SIDENAV_ADMIN;
  } else {
    buttons = GLOBALS.SIDENAV_DEFAULT;
  }

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await getAllTemplate();
        setTemplates(response.data);
        setIsLoading(false);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  const formatDate = (dateString) => {
    const date = new Date(dateString);

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    return `${month}/${day}/${year}`;
  };

  const handleCreateTemplateClick = () => {
    navigate('add-template');
  };

  if (!templates) {
    return <Loading />;
  }

  return (
    <div className="d-flex">
      <Sidebar name={`${user?.first_name} ${user?.last_name}`} sidebarItems={buttons} />
      <div className="container-fluid d-flex flex-column">
        <Header />
        <div className="px-5">
          <div className={styles.container}>
            <h2 style={{ fontSize: '30px', color: '#9c7b16' }}>Templates</h2>
            <Button className={styles.butName} onClick={handleCreateTemplateClick}>
              Create Template
            </Button>
          </div>
          <div className={styles.container_card}>
            <div className={styles.scrollable}>
              {!isLoading && templates.length === 0 && (
                <p className={styles.centeredText}>
                  It looks like you haven't created any templates yet. <br /> Click on the "Create
                  Template" button to get started and create your first template.
                </p>
              )}
              {templates.map((template) => (
                <Card
                  key={template.id}
                  className={styles.container_board}
                  onClick={() => navigate(`template/${template.id}`)}
                >
                  <div className={styles.words}>
                    <h3>{template.title}</h3>
                    <p>{template.description}</p>
                  </div>

                  <div className={styles.date}>
                    <p>Date Created: {formatDate(template.date_created)}</p>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default SpringBoardAdminTemplates;
