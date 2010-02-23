/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modls.Grade;
import modls.QuestionOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/student/finish.htm")
public class ExamFinish {

    GradeDao gradeDao;

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String finishExam(
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        Grade g = (Grade) session.getAttribute("grade");
        gradeDao.toPersist(g);
        Double sum = new Double(0);
        for (QuestionOrder qo : g.getQuestionOrder()) {
            try {
                sum += qo.getPoint();
            } catch (Exception e) {
            }
        }
        g.setSubmitted(Boolean.TRUE);
        g.setScore(sum);
        gradeDao.update(g);
        return "redirect:index.htm";
    }
}
