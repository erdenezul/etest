/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package handlers;

import dao.TeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tulga
 */
@Controller
public class ListTeacher {
    TeacherDao teacherDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @RequestMapping("/teacher/list.htm")
    public void ListTeachers(ModelMap model) {
        model.put("teachers", teacherDao.getTeachers());
    }
}
