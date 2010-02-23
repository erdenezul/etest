/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import modls.Grade;
import modls.Student;
import modls.Test;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class GradeDao extends HibernateDaoSupport {

    public void save(Grade grade) {
        getHibernateTemplate().save(grade);
    }

    public Grade getGrade(long gradeId) {
        return (Grade) getHibernateTemplate().get(Grade.class, gradeId);
    }

    public Grade getGrade(Student student, Test test) {
        List<Grade> gList = getHibernateTemplate().find("from Grade where student=? and variant in(from Variant v where v.test=?)", new Object[]{student, test});
        if (gList != null && gList.size() != 0) {
            return gList.get(0);
        }
        return null;
    }

    public Object getGradeQuery(Student s) {
        final Student fs = s;
        return getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                List<Object> rows = arg0.createSQLQuery("select l.code,l.lessonName,e.description,g.score,g.relativeScore from Grade g left join(Students s,Variant v,Test t,ExamType e,Lesson l) on (g.student_id=s.student_id and g.variant_id=v.id and v.test_id=t.id and t.lesson_id=l.id and e.id=t.examtype_id) where g.student_id=:id and g.submitted=true").setLong("id", fs.getId()).list();
                return rows;
            }
        });
    }

    public List<Grade> getGrade(Test test) {
        return getHibernateTemplate().
                find("from Grade where variant in(from Variant where test=?)", test);
    }

    public void toPersist(Grade g) {
        getHibernateTemplate().update(g);
    }

    public void update(Grade g) {
        final Grade gf = g;
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.update(gf);
                arg0.getTransaction().commit();
                return null;
            }
        });
    }
}
