/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import modls.Answer;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class AnswerDao extends HibernateDaoSupport {

    public void saveAnswer(Answer a) {
        getHibernateTemplate().save(a);
    }
}
