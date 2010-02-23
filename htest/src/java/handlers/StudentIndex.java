/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.StudentDao;
import javax.servlet.http.HttpServletRequest;
import modls.Student;
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
@RequestMapping("/student/index.htm")
public class StudentIndex {

    StudentDao studentDao;
    GradeDao gradeDao;

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void showIndex(
            HttpServletRequest request,
            ModelMap model) {
        Student stud = (Student) request.getSession().getAttribute("student");
        studentDao.toPersist(stud);
        model.put("gs",gradeDao.getGradeQuery(stud));
//        for(Grade g :stud.getGrade()) {
//            g.getVariant().getTest().getLesson();
//        }
    }
}

class Utility {

    boolean getIsTaken() {
        return false;
    }
}
