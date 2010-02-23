/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package handlers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tulga
 */
@Controller
public class TeacherLogout {
    @RequestMapping("/teacher/signout.htm")
    public String signOut(
            HttpServletRequest request
            ) {
        request.getSession().invalidate();
        return "redirect:/";
    }
}
