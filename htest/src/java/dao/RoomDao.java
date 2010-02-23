/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import modls.Rooms;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author tulga
 */
public class RoomDao  extends HibernateDaoSupport {

    public List<Rooms> getRooms() {
        return getHibernateTemplate().find("from Rooms");
    }
}
