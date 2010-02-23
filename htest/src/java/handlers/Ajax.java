/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.QuestionDao;
import dao.TopicDao;
import modls.Lesson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author tulga
 */
@Controller
public class Ajax {

    TopicDao topicDao;
    QuestionDao questionDao;
//    JasperReport

    @RequestMapping("/teacher/gettopics.htm")
    public void getTopics(ModelMap model,
            @RequestParam("lessonId")Long lessonId) {
        Lesson lesson = new Lesson();
        lesson.setId(lessonId);
        model.put("topics", topicDao.getTopics(lesson));
    }
    @RequestMapping("/teacher/getnumberofq.htm")
    public String getNumberOfQ(ModelMap model,
            @RequestParam("tId")Long tId,
            @RequestParam("dId")Long dId
            ) {
        Long nm = questionDao.getNumberOfQuestion(tId, dId);
        model.put("numberofq", nm);
        return "/teacher/ajax";
    }

    @Autowired
    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

}
