/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import modls.Protocol;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class ProtocolDao extends HibernateDaoSupport {

    public void save(Protocol protocol) {
        getHibernateTemplate().save(protocol);
    }
}
