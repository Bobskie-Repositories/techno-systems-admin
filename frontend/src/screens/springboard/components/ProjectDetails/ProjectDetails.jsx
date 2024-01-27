import React, { useState } from 'react';
import { useOutletContext } from 'react-router-dom';
import { FaPen } from 'react-icons/fa6';
import jwtDecode from 'jwt-decode';
import Swal from 'sweetalert2';
import ModalCustom from '../UI/Modal/Modal';
import Button from '../UI/Button/Button';
import styles from './ProjectDetails.module.css';
import { useAuth } from '../../../../contexts/AuthContext';
import { useClassMemberTeam, useProjects } from '../../../../hooks';

const ProjectDetails = ({ project, numTemplates, team_name }) => {
  const { accessToken } = useAuth();
  const user = jwtDecode(accessToken);

  return (
    <div className={styles.side}>
      <p className={styles.title}>Overall Project Rating</p>
      <span className={styles.number}>
        {numTemplates > 0 ? Math.round((project.score / numTemplates) * 10) : 0} %
      </span>

      <hr />
      <div style={{ margin: '15px 0' }}>
        <p className={styles.title}>Project Details</p>
        <p className={styles.title_body}>Name:</p>
        <p className={styles.bodyName}>{project.name}</p>
        <p className={styles.title_body}>Description:</p>
        <p className={styles.body}>{project.description}</p>
      </div>

      <hr style={{ color: '#E5E4E2' }} />
      <p className={styles.title_body}>Created by: Group {team_name}</p>
    </div>
  );
};

export default ProjectDetails;
