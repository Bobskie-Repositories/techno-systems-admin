import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import SpringBoardService from '../services/SpringBoardService';

const useProjects = () => {
  const allclassteamproj = async () => {
    try {
      const res = await SpringBoardService.getAllClassroomTeamAndProjects();
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const getProjectsByClassId = async (classId) => {
    try {
      const res = await SpringBoardService.getTeamsAndProjectsByClassId(classId);
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const teamProjects = async (teamId) => {
    try {
      const res = await SpringBoardService.getProjectsByTeamId(teamId);
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const createProjects = async ({ body }) => {
    try {
      const res = await SpringBoardService.projectCreate(body);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const updateProjects = async (projId, { body }) => {
    try {
      const res = await SpringBoardService.projectUpdate(projId, body);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const getProject = async (projId) => {
    try {
      const res = await SpringBoardService.getProjectById(projId);
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const deleteProjects = async (projId) => {
    try {
      const res = await SpringBoardService.deleteProject(projId);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const getProjectBoardByProjId = async (projId) => {
    try {
      const res = await SpringBoardService.getProjectBoards(projId);
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const createProjectBoard = async (projId, { body }) => {
    try {
      const res = await SpringBoardService.createProjectBoard(projId, body);
      return res;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const getProjectBoardById = async (projbrdId) => {
    try {
      const res = await SpringBoardService.getProjectBoardById(projbrdId);
      return res;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const updateProjectBoard = async (projbrdId, { body }) => {
    try {
      const res = await SpringBoardService.updateBoard(projbrdId, body);
      return res;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const getVersionProjectBoards = async (projbrdId) => {
    try {
      const res = await SpringBoardService.getVersionProjectBoards(projbrdId);
      return res;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const getAllClass = async () => {
    try {
      const res = await SpringBoardService.allClasses();
      return res;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  return {
    allclassteamproj,
    getProjectsByClassId,
    teamProjects,
    createProjects,
    getProject,
    updateProjects,
    deleteProjects,
    getProjectBoardByProjId,
    createProjectBoard,
    getProjectBoardById,
    updateProjectBoard,
    getVersionProjectBoards,
    getAllClass,
  };
};

export default useProjects;
