/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import modls.QuestionOrder;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class QuestionOrderDao extends HibernateDaoSupport {

    public void save(QuestionOrder qo) {
        getHibernateTemplate().save(qo);
    }

    public void update(QuestionOrder qo) {
        final QuestionOrder qof = qo;
        getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.update(qof);
                arg0.getTransaction().commit();
                return null;
            }
        });
    }
}
