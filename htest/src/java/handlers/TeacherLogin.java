/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package handlers;

import dao.TeacherDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modls.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/teacher/login.htm")
public class TeacherLogin {
    TeacherDao teacherDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void getLoginForm() {

    }
    @RequestMapping(method = RequestMethod.POST)
    public String getCheckLoginForm(
            @RequestParam(value = "userName")   String userName,
            @RequestParam(value = "pass")       String pass,
            ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        Teacher teacher = teacherDao.getTeacher(userName, pass);
//        teacherDao.
        if(teacher == null) {
            model.put("msg", "Login failed");
            return "teacher/login";
        } else {
            session.setAttribute("teacher", teacher);
            return "redirect:index.htm";
        }
    }
}
