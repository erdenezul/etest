/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.StudentDao;
import dao.TestDao;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import modls.Grade;
import modls.Student;
import modls.Test;
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
@RequestMapping("/student/take.htm")
public class StudentTakeExam {

    TestDao testDao;
    GradeDao gradeDao;
    StudentDao studentDao;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void showExam(
            ModelMap model,
            @RequestParam("id") Long testId,
            HttpServletRequest request) {
        Test t = testDao.getTest(testId);
        model.put("test", t);
        Student s = (Student) request.getSession().getAttribute("student");
        studentDao.toPersist(s);
        Grade g = gradeDao.getGrade(s, t);
        if (g.getStart() == null) {
            g.setStart(new Date());
        }
//        Long last = (g.getLastClick() == null) ? g.getStart().getTime() : g.getLastClick().getTime();
        Long second = 0L;
        if(g.getLastClick() == null) {
            second = (long)t.getDurationInMinute()*60;
        } else {
            second = t.getDurationInMinute()*60 - (g.getLastClick().getTime() - g.getStart().getTime())/1000;
        }
        request.getSession().setAttribute("grade", g);
        model.put("seconds", second);
    }
}
