/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.StudentDao;
import javax.servlet.http.HttpServletRequest;
import modls.Student;
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
public class StudentLogin {

    StudentDao studentDao;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @RequestMapping(value = "/student/login.htm", method = RequestMethod.GET)
    public void showForm() {
    }

    @RequestMapping(value = "/student/login.htm", method = RequestMethod.POST)
    public String login(
            @RequestParam("userName") String username,
            @RequestParam("pass") String pass,
            HttpServletRequest request,
            ModelMap model) {
        Student s = studentDao.getStudent(username, pass);
        if (s != null) {
            request.getSession().setAttribute("student", s);
            return "redirect:index.htm";
        }
        model.put("msg", "Амжилтгүй боллоо");
        return "/student/login";
    }
}
