import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import SpringBoardService from '../services/SpringBoardService';

const useBoardTemplate = () => {
  const getAllTemplate = async () => {
    try {
      const res = await SpringBoardService.getAllTemplate();
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };
  const getTemplate = async (tempId) => {
    try {
      const res = await SpringBoardService.getTemplate(tempId);
      return { success: true, data: res.data };
    } catch (error) {
      return { success: false, error: error?.response?.status };
    }
  };

  const createTemplate = async ({ body }) => {
    try {
      const res = await SpringBoardService.createTemplate(body);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const updateTemplate = async (templateId, { body }) => {
    try {
      const res = await SpringBoardService.updateTemplate(templateId, body);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  const deleteTemplate = async (templateId) => {
    try {
      const res = await SpringBoardService.deleteTemplate(templateId);
      return true;
    } catch (error) {
      console.error('API Error:', error);
      return false;
    }
  };

  return { getAllTemplate, getTemplate, createTemplate, updateTemplate, deleteTemplate };
};

export default useBoardTemplate;
