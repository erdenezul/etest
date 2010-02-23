/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.ExamTypeDao;
import dao.LessonDao;
import dao.RoomDao;
import dao.TeacherDao;
import javax.servlet.http.HttpServletRequest;
import modls.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/teacher/prepare.htm")
public class TeacherPrepare {

    RoomDao roomDao;
    LessonDao lessonDao;
    ExamTypeDao examTypeDao;
    TeacherDao teacherDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setRoomDao(RoomDao roomDao) {
        this.roomDao = roomDao;
    }

    @Autowired
    public void setExamTypeDao(ExamTypeDao examTypeDao) {
        this.examTypeDao = examTypeDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void showForm(HttpServletRequest request,
            ModelMap model) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);

        model.put("rooms", roomDao.getRooms());
        model.put("examTypes", examTypeDao.getExamTypes());

    }
}
