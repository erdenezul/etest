/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import modls.UFile;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class UFileDao extends HibernateDaoSupport {
    public UFile getUFile(Long id) {
        return (UFile) getHibernateTemplate().get(UFile.class, id);
    }
}
