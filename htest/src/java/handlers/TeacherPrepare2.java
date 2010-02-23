/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.DifficultyDao;
import dao.ExamTypeDao;
import dao.LessonDao;
import dao.TeacherDao;
import java.util.Collection;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import modls.Lesson;
import modls.Rooms;
import modls.Teacher;
import modls.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/teacher/prepare2.htm")
public class TeacherPrepare2 {

    LessonDao lessonDao;
    DifficultyDao difficultyDao;
    ExamTypeDao examTypeDao;
    TeacherDao teacherDao;

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setExamTypeDao(ExamTypeDao examTypeDao) {
        this.examTypeDao = examTypeDao;
    }

    @Autowired
    public void setDifficultyDao(DifficultyDao difficultyDao) {
        this.difficultyDao = difficultyDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(method = RequestMethod.POST)
    public void processSubmit(
            @RequestParam("examType") Long examType,
            @RequestParam("lesson") Long lessonId,
            @RequestParam("duration") Integer duration,
            @RequestParam("start-year") Integer startYear,
            @RequestParam("start-month") Integer startMonth,
            @RequestParam("start-day") Integer startDay,
            @RequestParam("start-hour") Integer startHour,
            @RequestParam("start-minute") Integer startMinute,
            @RequestParam("end-year") Integer endYear,
            @RequestParam("end-month") Integer endMonth,
            @RequestParam("end-day") Integer endDay,
            @RequestParam("end-hour") Integer endHour,
            @RequestParam("end-minute") Integer endMinute,
            @RequestParam("variantNumber") Long variantNumber,
            @RequestParam(value = "registerStudentAtRuntime", required = false) Boolean registerStudentAtRuntime,
            @RequestParam(value = "rooms", required = false) Collection<String> rooms,
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);

        if(registerStudentAtRuntime == null) { registerStudentAtRuntime = false; }
        Test test = new Test();

        test.setExamType(examTypeDao.getExamType(examType));
        test.setDurationInMinute(duration);

        Date start = new Date();
        start.setYear(startYear-1900);
        start.setMonth(startMonth-1);
        start.setDate(startDay);
        start.setHours(startHour);
        start.setMinutes(startMinute);

        Date end = new Date();
        end.setYear(endYear-1900);
        end.setMonth(endMonth-1);
        end.setDate(endDay);
        end.setHours(endHour);
        end.setMinutes(endMinute);

        test.setStartDate(start);
        test.setEndDate(end);
        for (String roomId : rooms) {
            Rooms room = new Rooms();
            room.setId(new Long(roomId));
            test.getRooms().add(room);
        }
        test.setIsRegisterStudentAtRuntime(registerStudentAtRuntime);
        Lesson lesson = lessonDao.getLesson(lessonId);
        request.getSession().setAttribute("test", test);
        request.getSession().setAttribute("lesson", lesson);
        request.setAttribute("variantNumber", variantNumber);
        request.setAttribute("difficulty", difficultyDao.getDifficulty());

//        lesson.getExam().
    }
}
