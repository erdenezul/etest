/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.Set;
import modls.Variant;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class VariantDao extends HibernateDaoSupport {

    public void save(Variant variant) {
        getHibernateTemplate().saveOrUpdate(variant);
    }

    public void save(Set<Variant> variants) {
        for(Variant v:variants) {
            save(v);
        }
    }

    public void update(Set<Variant> variants) {
        for(Variant v:variants) {
            getHibernateTemplate().update(v);
        }
    }
}
