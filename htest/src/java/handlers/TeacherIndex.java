/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.LessonDao;
import dao.TeacherDao;
import javax.servlet.http.HttpServletRequest;
import modls.Teacher;
import org.hibernate.FlushMode;
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
@RequestMapping("/teacher/index.htm")
public class TeacherIndex {

    TeacherDao teacherDao;
    LessonDao lessonDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap model,
            @RequestParam(value = "happy", required = false) String cat) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);
        if (cat != null) {
            if (cat.equals("lesson")) {
                Long lessonId = new Long(request.getParameter("lessonId"));
                model.put("lesson", lessonDao.getLesson(lessonId));
                return "teacher/showlesson";
            } else if (cat.equals("exam")) {
            } else if (cat.equals("question")) {
            } else if (cat.equals("grade")) {
            }
        } else {
            return "teacher/index";
        }

        return null;
    }
}
