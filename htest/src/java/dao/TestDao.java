/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modls.Lesson;
import modls.Teacher;
import modls.Test;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class TestDao extends HibernateDaoSupport {

    public void saveTest(Test t) {
        getHibernateTemplate().save(t);
    }

    public void updateTest(Test t) {
        final Test t1 = t;
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.update(t1);
                arg0.getTransaction().commit();
                return null;
            }
        });
    }

    public Test getTest(Long id) {
        return (Test) getHibernateTemplate().get(Test.class, id);
    }

    public List<Test> getTest(Teacher t) {
        List<Test> sum = new ArrayList(0);
        for(Lesson l:t.getLesson()) {
            sum.addAll(getHibernateTemplate().find("from Test t where t.lesson=?",new Object[]{
                l
            }));
        }
        return sum;
    }

    public void deleteTest(Long testId) {
        final Test t1 = getTest(testId);
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.delete(t1);
                arg0.getTransaction().commit();
                return null;
            }
        });
    }
}
