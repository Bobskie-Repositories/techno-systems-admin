import React, { useState, useEffect, useRef } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import Swal from 'sweetalert2';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft } from '@fortawesome/free-solid-svg-icons';
import Header from '../components/Header/Header';
import Card from '../components/UI/Card/Card';
import Button from '../components/UI/Button/Button';
import { Tiptap } from '../components/UI/RichTextEditor/TipTap';
import { useBoardTemplate } from '../../../hooks';
import styles from './EditTemplate.module.css';

function EditTemplate() {
  const { getTemplate, updateTemplate, deleteTemplate } = useBoardTemplate();
  const [template, setTemplate] = useState();
  const [rulesContent, setRulesContent] = useState('');
  const [templateContent, setTemplateContent] = useState('');
  const [title, setTitle] = useState('Unknown');
  const [description, setDescription] = useState(''); // Add description state
  const [isTitleEditable, setIsTitleEditable] = useState(false);
  const [isNext, setIsNext] = useState(false);
  const [savedRulesContent, setSavedRulesContent] = useState(''); // Store the rulesContent
  const { id } = useParams();
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await getTemplate(id);
        setTemplate(response.data);
        setTitle(response.data.title);
        setRulesContent(response.data.rules);
        setDescription(response.data.description);
        setTemplateContent(response.data.content);
      } catch (error) {
        console.error('Error fetching data:', error);
        navigate(`/admin/templates`);
      }
    };
    fetchData();
  }, [id]);

  const handleTitleChange = (e) => {
    const newTitle = e.target.value;
    setTitle(newTitle);
  };

  const handleDescriptionChange = (e) => {
    const newDescription = e.target.value;
    if (newDescription.length <= 150) {
      setDescription(newDescription);
    } else {
      setDescription(newDescription.slice(0, 150));
    }
  };

  const toggleTitleEdit = () => {
    setIsTitleEditable(!isTitleEditable);
  };

  const handleTitleKeyDown = (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      if (title.trim() === '') {
        Swal.fire({
          icon: 'error',
          title: 'Title cannot be empty',
          text: 'Please enter a title or click outside the input to cancel editing.',
          confirmButtonText: 'OK',
        }).then((result) => {
          if (result.isConfirmed) {
            setTitle('Unknown');
          }
        });
      } else {
        toggleTitleEdit();
      }
    }
  };

  const topRef = useRef();

  const handleNextClick = () => {
    setIsNext(true);
    setSavedRulesContent(rulesContent);
    topRef.current.scrollIntoView({ behavior: 'smooth' });
  };

  const handleBackClick = () => {
    setIsNext(false);
    setRulesContent(savedRulesContent);
    topRef.current.scrollIntoView({ behavior: 'smooth' });
  };

  const submitTemplate = async () => {
    try {
      if (title === 'Unknown') {
        Swal.fire({
          title: 'Title: Unknown. Please enter a correct title.',
          icon: 'error',
          confirmButtonColor: '#9c7b16',
        });
      } else if (description === '') {
        Swal.fire({
          title: 'Please enter the description',
          icon: 'error',
          confirmButtonColor: '#9c7b16',
        });
      } else if (rulesContent === '') {
        Swal.fire({
          title: 'Please enter the rules.',
          icon: 'error',
          confirmButtonColor: '#9c7b16',
        });
      } else if (templateContent === '') {
        Swal.fire({
          title: 'Please enter the template contents.',
          icon: 'error',
          confirmButtonColor: '#9c7b16',
        });
      } else {
        const response = await updateTemplate(id, {
          body: {
            title,
            content: templateContent,
            rules: rulesContent,
            description,
          },
        });
        Swal.fire({
          title: 'Template Created',
          icon: 'success',
          confirmButtonColor: '#9c7b16',
        });

        navigate(`/admin/templates`);
      }
    } catch (error) {
      console.error('Error updating Template:', error);
    }
  };

  const showDeleteProjectModal = async () => {
    Swal.fire({
      icon: 'warning',
      title: '<span style="font-size: 20px">Are you sure you want to delete?</span>',
      html: '<span style="font-size: 15px">This will delete this template permanently. You cannot undo this action.</span>',
      showCancelButton: true,
      confirmButtonText: 'Delete',
      confirmButtonColor: '#8A252C',
      cancelButtonText: 'Cancel',
      cancelButtonColor: 'rgb(181, 178, 178)',
    }).then(async (result) => {
      if (result.isConfirmed) {
        await deleteTemplate(id);
        Swal.fire({
          title: '<span style="font-size: 20px">Template Sucessfully Deleted</span>',
          icon: 'success',
          confirmButtonColor: '#9c7b16',
          confirmButtonText: 'OK',
        });
        navigate('/admin/templates');
      }
    });
  };

  const goBack = () => {
    navigate('/admin/templates');
  };

  return (
    <div className={styles.body}>
      <Header />

      <div className={styles.container}>
        <div className="d-flex">
          <FontAwesomeIcon icon={faArrowLeft} onClick={goBack} className={styles.back} />
          <span id="top" ref={topRef} className={styles.title}>
            {isTitleEditable ? (
              <input
                type="text"
                value={title}
                onChange={handleTitleChange}
                onBlur={toggleTitleEdit}
                onKeyDown={handleTitleKeyDown}
                className={styles.input}
              />
            ) : (
              <span onClick={toggleTitleEdit}>{title}</span>
            )}
          </span>
        </div>
        <hr className={styles.horizontalLine} />

        {!isNext ? (
          <>
            <span className={styles.title}>Short Description</span>
            <span className={styles.rightmostCount}>{description.length} / 150</span>
            <textarea
              value={description}
              onChange={handleDescriptionChange}
              className={styles.inputBox}
              placeholder="Write a description"
            />
            <span className={styles.title}>Rules</span>
            <Card className={styles.cardContainer}>
              <div className={styles.box} />
              <div className={styles.containerStyle}>
                <Tiptap setDescription={setRulesContent} value={rulesContent} />
              </div>
            </Card>
            <div className={styles.btmButton}>
              <Button className={styles.buttonR} onClick={showDeleteProjectModal}>
                Delete
              </Button>
              <Button className={styles.buttonG} onClick={handleNextClick}>
                Next
              </Button>
            </div>
          </>
        ) : (
          <>
            <span className={styles.title}>Content</span>
            <Card className={styles.cardContainer}>
              <div className={styles.box} />
              <div className={styles.containerStyle}>
                <Tiptap setDescription={setTemplateContent} value={templateContent} />
              </div>
            </Card>
            <div className={styles.btmButton}>
              <Button className={styles.buttonR} onClick={showDeleteProjectModal}>
                Delete
              </Button>
              <Button className={styles.buttonG} onClick={handleBackClick}>
                Back
              </Button>
              <Button className={styles.buttonG} onClick={submitTemplate}>
                Submit
              </Button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}

export default EditTemplate;
