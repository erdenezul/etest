/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.QuestionDao;
import javax.servlet.http.HttpServletRequest;
import modls.FillInBlank;
import modls.Grade;
import modls.MultipleChoice;
import modls.MultipleResponse;
import modls.QuestionOrder;
import modls.TrueFalse;
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
@RequestMapping("/exam/getq.htm")
public class ExamAjax {

    GradeDao gradeDao;
    QuestionDao questionDao;

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getQuestion(
            @RequestParam("qId") Integer qId,
            HttpServletRequest request,
            ModelMap model) {

        Grade g = (Grade) request.getSession().getAttribute("grade");
        gradeDao.toPersist(g);

        for (QuestionOrder q : g.getQuestionOrder()) {
            if (q.getOrderNumber() == qId) {
                model.put("question", questionDao.getQuestion(q.getQuestion().getId()));
                return "/exam/getq";
            }
        }
        return "xxx";
    }
}
