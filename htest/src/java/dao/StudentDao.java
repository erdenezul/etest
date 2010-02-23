/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import modls.Student;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class StudentDao extends HibernateDaoSupport {

    public Student getStudent(Long id) {
        return (Student) getHibernateTemplate().get(Student.class, id);
    }

    public Student getStudent(String username, String pass) {
        List<Student> students = getHibernateTemplate().findByNamedParam("from Student where userName=:userName and pass=:pass", new String[]{"userName", "pass"}, new Object[]{username, pass});
        if (students != null && students.size() != 0) {
            return students.get(0);
        }
        return null;
    }

    public void toPersist(Student t) {
        getHibernateTemplate().update(t);
    }

    public void getGrades() {
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.createSQLQuery("");
                throw new UnsupportedOperationException("Not supported yet.");
            }
        });
    }
}
