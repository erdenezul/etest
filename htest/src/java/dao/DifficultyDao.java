/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import modls.Difficulty;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class DifficultyDao extends HibernateDaoSupport {

    public List<Difficulty> getDifficulty() {
        return getHibernateTemplate().find("from Difficulty");
    }

    public Difficulty getDifficulty(Long id) {
        return (Difficulty) getHibernateTemplate().get(Difficulty.class,id);
    }


}
