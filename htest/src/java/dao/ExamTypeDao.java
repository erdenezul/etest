/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import modls.ExamType;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class ExamTypeDao extends HibernateDaoSupport {

    public List<ExamType> getExamTypes() {
        return getHibernateTemplate().find("from ExamType");
    }

    public ExamType getExamType(Long id) {
        return (ExamType) getHibernateTemplate().get(ExamType.class, id);
    }
}
