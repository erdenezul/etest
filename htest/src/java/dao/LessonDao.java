/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import modls.Lesson;
import modls.Teacher;
import modls.Test;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class LessonDao extends HibernateDaoSupport {
    public List<Lesson> getLessons(Teacher teacher) {
        return getHibernateTemplate().find("from Lesson where teacher=?", new Object[]{
            teacher
        });
    }

    public List<Lesson> getLessons() {
        return getHibernateTemplate().find("from Lesson");
    }
    public Lesson getLesson(Long lessonId) {
        return (Lesson) getHibernateTemplate().get(Lesson.class, lessonId);
    }

    public Lesson getLessonsOf(Test t) {
        return (Lesson) getHibernateTemplate().findByNamedParam("from Lesson where exam=:exam", "exam", t).get(0);
    }

    public void toPersist(Lesson l ) {
        getHibernateTemplate().update(l);
    }
}
