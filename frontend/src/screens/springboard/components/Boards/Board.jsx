import React, { useState, useEffect } from 'react';
import { useNavigate, useOutletContext } from 'react-router-dom';
import jwtDecode from 'jwt-decode';
import styles from './Board.module.css';
import Card from '../UI/Card/Card';
import IdeaIcon from '../images/idea.png';
import CircularProgressWithLabel from '../UI/ProgressBar/CircularProgressWithLabel';
import Loading from '../../../../components/loading';
import { useAuth } from '../../../../contexts/AuthContext';
import { useProjects } from '../../../../hooks';

function Board({ selected, project }) {
  const { accessToken } = useAuth();
  const user = jwtDecode(accessToken);

  const { getProjectBoardByProjId } = useProjects();

  const navigate = useNavigate();
  const [loadCount, setLoadCount] = useState(0);
  const [boards, setBoards] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoadCount((prevLoadCount) => prevLoadCount + 1);

        const boardsResponse = await getProjectBoardByProjId(selected);
        const boardsTemp = boardsResponse.data;
        const sortedBoards = [...boardsTemp].sort((a, b) => a.templateId - b.templateId);
        setBoards(sortedBoards);
      } catch (error) {
        console.error(`Error fetching data: ${error}`, error);
      }
    };
    fetchData();
  }, [selected]);

  const onClickView = (id) => {
    navigate(`/project/${project.id}/board/${id}`);
  };

  return (
    <div className={styles.board}>
      {loadCount === 0 && <Loading />}
      <div className={styles.scrollable}>
        {project && boards.length === 0 && user.role !== 2 && (
          <p className={styles.centeredText} style={{ width: '45rem' }}>
            It looks like the group haven't created any boards yet. <br />
          </p>
        )}
        {boards.map((board) => (
          <div key={board.id}>
            <Card className={styles.card} onClick={() => onClickView(board.id)}>
              <div className={styles.container}>
                <div className={styles.subcontainer}>
                  <img className={styles.ideaicon} src={IdeaIcon} alt="IdeaIcon" />
                </div>

                <div className={styles.content}>
                  <h3>Board: {board.title}</h3>
                  <div>
                    <div className={styles.cards}>
                      <Card className={styles.smallCard}>
                        <h5 className={styles.ratings}>Novelty</h5>
                        <div className={styles.cardContent}>
                          <CircularProgressWithLabel value={board.novelty * 10} />
                        </div>
                      </Card>

                      <Card className={styles.smallCard}>
                        <h5 className={styles.ratings}>Capability</h5>
                        <div className={styles.cardContent}>
                          <CircularProgressWithLabel value={board.capability * 10} />
                        </div>
                      </Card>

                      <Card className={styles.smallCard}>
                        <h5 className={styles.ratingstech}>Technical Feasibility</h5>
                        <div className={styles.cardContent}>
                          <CircularProgressWithLabel value={board.technical_feasibility * 10} />
                        </div>
                      </Card>
                    </div>
                  </div>
                </div>
              </div>
            </Card>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Board;
