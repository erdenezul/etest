/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.QuestionDao;
import dao.QuestionOrderDao;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modls.Answer;
import modls.Grade;
import modls.MultipleChoice;
import modls.MultipleResponse;
import modls.Question;
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
@RequestMapping("/student/ansexam.htm")
public class StudentAnswer {

    GradeDao gradeDao;
    QuestionDao questionDao;
    QuestionOrderDao questionOrderDao;

    @Autowired
    public void setQuestionOrderDao(QuestionOrderDao questionOrderDao) {
        this.questionOrderDao = questionOrderDao;
    }

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void takeAnswer(
            @RequestParam(value = "aId", required = false) List<String> ids,
            @RequestParam(value = "a", required = false) String va,
            @RequestParam("qId") int qId,
            @RequestParam("type") String questionType,
            HttpServletRequest request,
            ModelMap model) {
        HttpSession session = request.getSession();
        Grade g = (Grade) session.getAttribute("grade");
        g.setLastClick(new Date());
        gradeDao.toPersist(g);
        QuestionOrder qorder = null;
        for (QuestionOrder qo : g.getQuestionOrder()) {
            System.out.println(qo.getOrderNumber());
            System.out.println(qId);
            if (qo.getOrderNumber() == qId) {
                qorder = qo;
                break;
            }
        }
        Question q = qorder.getQuestion();
        q = questionDao.getQuestion(q.getId());
        Double point = new Double(0);
        if ("multi-choice".equals(questionType)) {
            MultipleChoice mc = (MultipleChoice) q;
            Long aId = new Long(request.getParameter("aId"));
            for (Answer a : mc.getAnswer()) {
                if (a.getId() == aId) {
                    point = a.getPoint();
                    break;
                }
            }
        } else if ("multi-response".equals(questionType)) {
            MultipleResponse mr = (MultipleResponse) q;
            for (Answer a : mr.getAnswer()) {
                for (String id : ids) {
                    if (a.getId() == new Long(id)) {
                        point += a.getPoint();
                    }
                }
            }
        } else if ("true-false".equals(questionType)) {
            TrueFalse tf = (TrueFalse) q;
            Boolean b = new Boolean(va);
            if (tf.getValue() == b) {
                point += tf.getPoint();
            }
        }
        qorder.setPoint(point);
        model.put("p", point);
        qorder.setAnswered(Boolean.TRUE);
        questionOrderDao.update(qorder);
    }
}
