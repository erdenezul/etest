/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package guards;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.orm.hibernate3.support.OpenSessionInViewFilter;

/**
 *
 * @author tulga
 */
public class OpenSessionFilterOv extends OpenSessionInViewFilter {

    @Override
    protected Session getSession(SessionFactory sessionFactory) throws DataAccessResourceFailureException {
        Session sessionFlushAuto = super.getSession(sessionFactory);
        sessionFlushAuto.setFlushMode(FlushMode.AUTO);
        return sessionFlushAuto;
    }

}
