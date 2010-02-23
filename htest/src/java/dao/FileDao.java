/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.SQLException;
import modls.UFile;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class FileDao extends HibernateDaoSupport {
    public void saveFile(UFile uf) {
        getHibernateTemplate().save(uf);
    }

    public UFile getFile(String url) {
        try {
            UFile uf = (UFile) getHibernateTemplate().find("from UFile where url=?", url).get(0);
            return uf;
        } catch (Exception e) { }
        return null;
    }

    public UFile getFile(Long id) {
        return (UFile) getHibernateTemplate().get(UFile.class, id);
    }

    public void deleteFile(UFile uf) {
        final UFile uf1 = uf;
        getHibernateTemplate().execute(new HibernateCallback() {

            public Object doInHibernate(Session arg0) throws HibernateException, SQLException {
                arg0.beginTransaction();
                arg0.delete(uf1);
                arg0.getTransaction().commit();
                return null;
            }

        });
    }
}
