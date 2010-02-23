/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import modls.Lesson;
import modls.Topic;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class TopicDao extends HibernateDaoSupport {

    public void save(Topic topic) {
        getHibernateTemplate().saveOrUpdate(topic);
    }

    public void delete(Long topicId) {
        final Topic t = getTopic(topicId);
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.delete(t);
                arg0.getTransaction().commit();
                return null;
            }
        });
    }

    public List<Topic> getTopics(Lesson lesson) {
        return getHibernateTemplate().find("from Topic where lesson=?", new Object[]{lesson});
    }

    public Topic getTopic(Long id) {
        return (Topic) getHibernateTemplate().get(Topic.class, id);
    }
}
