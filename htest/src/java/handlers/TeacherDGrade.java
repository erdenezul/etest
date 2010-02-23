/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.TestDao;
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
public class TeacherDGrade {

    GradeDao gradeDao;
    TestDao testDao;

    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @RequestMapping(value = "/teacher/dgrade.htm", method = RequestMethod.POST)
    public String dGrades(
            @RequestParam("tId") Long testId) {

        testDao.deleteTest(testId);
        return "redirect:index.htm";
    }
}
