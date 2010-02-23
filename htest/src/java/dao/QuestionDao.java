/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import modls.Difficulty;
import modls.FillInBlank;
import modls.Lesson;
import modls.MultipleChoice;
import modls.MultipleResponse;
import modls.Question;
import modls.Topic;
import modls.TrueFalse;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class QuestionDao extends HibernateDaoSupport {

    public Question getQuestion(Long qId) {
        Question q = (Question) getHibernateTemplate().get(Question.class, qId);
        if (q.getTemplate().equals("multi-choice.jsp")) {
            return (Question) getHibernateTemplate().get(MultipleChoice.class, qId);
        }
        if (q.getTemplate().equals("multi-response.jsp")) {
            return (Question) getHibernateTemplate().get(MultipleResponse.class, qId);
        }
        if (q.getTemplate().equals("true-false.jsp")) {
            return (Question) getHibernateTemplate().get(TrueFalse.class, qId);
        }
        if (q.getTemplate().equals("fillinblank.jsp")) {
            return (Question) getHibernateTemplate().get(FillInBlank.class, qId);
        }
        return (Question) getHibernateTemplate().get(Question.class, qId);
    }

    public List<Question> getQuestions(Lesson lesson) {
        return getHibernateTemplate().find("from Question where topic=any(from Topic where lesson=?) order by id desc", lesson);
    }

    public List<Question> getQuestions(Lesson lesson, Topic topic, Difficulty difficult, Class questionClass) {

        HibernateCallback hc = new HibernateCallback() {

            Topic topic;
            Difficulty difficult;
            Lesson lesson;
            Class questionClass;

            public HibernateCallback setArgs(Topic t, Difficulty d, Lesson l, Class q) {
                setTopic(t);
                setDifficulty(d);
                setLesson(l);
                setClass(q);
                return this;
            }

            public void setTopic(Topic topic) {
                this.topic = topic;
            }

            public void setDifficulty(Difficulty difficult) {
                this.difficult = difficult;
            }

            public void setLesson(Lesson lesson) {
                this.lesson = lesson;
            }

            public void setClass(Class questionClass) {
                this.questionClass = questionClass;
            }

            public Object doInHibernate(Session sess) throws HibernateException, SQLException {
                Criteria crit = sess.createCriteria(questionClass);
                if (topic != null) {
                    crit.add(Restrictions.eq("topic", topic));
                }
                if (difficult != null) {
                    crit.add(Restrictions.eq("difficult", difficult));
                }
                if (lesson != null) {
                    crit.add(Restrictions.in("topic",
                            sess.createQuery("from Topic where lesson=:lesson").setEntity("lesson", lesson).list()));
                }
                return crit.list();
            }
        }.setArgs(topic, difficult, lesson, questionClass);

        return (List<Question>) getHibernateTemplate().execute(hc);
    }

    public void deleteQuestion(Long qId) {
        Question q = (Question) getHibernateTemplate().get(Question.class, qId);
        Session s = getHibernateTemplate().getSessionFactory().getCurrentSession();
        s.beginTransaction();
        s.delete(q);
        s.getTransaction().commit();
    }

    public void saveQuestion(Question q) {
        getHibernateTemplate().save(q);
    }

    public Long getNumberOfQuestion(Long topicId, Long difficultyId) {
        Topic t = (Topic) getHibernateTemplate().get(Topic.class, topicId);
        Difficulty d = (Difficulty) getHibernateTemplate().get(Difficulty.class, difficultyId);
        return (Long) getHibernateTemplate().find("select count(*) from Question q where q.topic=? and q.difficult=?", new Object[]{t, d}).get(0);
    }

    public List<Question> getQuestions(Long topicId, Long difficultyId) {
        Topic t = (Topic) getHibernateTemplate().get(Topic.class, topicId);
        Difficulty d = (Difficulty) getHibernateTemplate().get(Difficulty.class, difficultyId);
        return getHibernateTemplate().find("from Question q where q.topic=? and q.difficult=?",
                new Object[]{t, d});
    }
}
