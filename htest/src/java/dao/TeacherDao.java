/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import modls.Teacher;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class TeacherDao extends HibernateDaoSupport {
    
    public List<Teacher> getTeachers() {
        return getHibernateTemplate().loadAll(Teacher.class);
    }

    public Teacher getTeacher(String userName, String pass) {
        List<Teacher> teacher = getHibernateTemplate().find("from Teacher where userName=? and pass=?", new Object[]{userName, pass});
        return (teacher!=null)?teacher.get(0):null;
    }

    public Teacher getTeacher(Long id) {
        return (Teacher) getHibernateTemplate().get(Teacher.class, id);
    }

    public void save(Teacher teacher) {
//        getHibernateTemplate().save(teacher);
        getHibernateTemplate().persist(teacher);
//        getHibernateTemplate().
    }

    public void toPersist(Teacher teacher) {
        getHibernateTemplate().update(teacher);
    }
//    pub
}
