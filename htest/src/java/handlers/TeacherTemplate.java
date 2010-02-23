/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modls.Rooms;
import org.hibernate.Session;

/**
 *
 * @author tulga
 */
public class TeacherTemplate {

    public static void populateArguments(HttpServletRequest request,
            Session session) {

        List<Rooms> rooms = session.createQuery("from Rooms").list();
        request.setAttribute("rooms", rooms);
        
    }
}
