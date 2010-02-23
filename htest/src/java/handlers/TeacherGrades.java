/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.LessonDao;
import dao.TestDao;
import java.util.List;
import modls.Grade;
import modls.Lesson;
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
@RequestMapping("/teacher/grades.htm")
public class TeacherGrades {

    GradeDao gradeDao;
    TestDao testDao;
    LessonDao lessonDao;

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void getGrades(
            @RequestParam("t") Long testid,
            ModelMap model) {
        Test t = testDao.getTest(testid);
        List<Grade> grades = gradeDao.getGrade(t);
        model.put("grades", grades);
        Lesson l = t.getLesson();
        model.put("lesson", l);
//        model.put("grades", gradeDao.getGrade(t));
    }

    @RequestMapping(method = RequestMethod.POST)
    public String evalGrades(
            @RequestParam("tId") Long testId,
            @RequestParam("gId") Long gradeId) {
        Test t = testDao.getTest(testId);
        Grade g = gradeDao.getGrade(gradeId);
        List<Grade> grades = gradeDao.getGrade(t);
        Double maxScore = g.getScore();
        for (Grade gr : grades) {
            if (gr.getScore() == null) {
                gr.setScore(0.0);
            }
            int score = (int) (30 * gr.getScore() / maxScore);
            score = score > 30 ? 30 : score;
            gr.setRelativeScore(score);
            gradeDao.update(gr);
        }
        return "redirect:grades.htm?t=" + testId;
    }
    
}
