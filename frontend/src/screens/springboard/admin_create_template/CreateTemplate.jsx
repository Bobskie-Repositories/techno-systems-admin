import React, { useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import Swal from 'sweetalert2';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft } from '@fortawesome/free-solid-svg-icons';
import Header from '../components/Header/Header';
import Card from '../components/UI/Card/Card';
import Button from '../components/UI/Button/Button';
import { Tiptap } from '../components/UI/RichTextEditor/TipTap';
import { useBoardTemplate } from '../../../hooks';
import styles from './CreateTemplate.module.css';

function CreateTemplate() {
  const { createTemplate } = useBoardTemplate();

  const [rulesContent, setRulesContent] = useState('');
  const [templateContent, setTemplateContent] = useState('');
  const [title, setTitle] = useState('Unknown');
  const [description, setDescription] = useState(''); // Add description state
  const [isTitleEditable, setIsTitleEditable] = useState(false);
  const [isNext, setIsNext] = useState(false);
  const [savedRulesContent, setSavedRulesContent] = useState(''); // Store the rulesContent
  const navigate = useNavigate();

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
        const response = await createTemplate({
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
      console.error('Error creating Template:', error);
    }
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
            <Button className={styles.button} onClick={handleNextClick}>
              Next
            </Button>
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
              <Button className={styles.button} onClick={handleBackClick}>
                Back
              </Button>
              <Button className={styles.button} onClick={submitTemplate}>
                Submit
              </Button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}

export default CreateTemplate;
