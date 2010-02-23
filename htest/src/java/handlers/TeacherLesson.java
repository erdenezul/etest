/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.LessonDao;
import dao.TopicDao;
import javax.servlet.http.HttpServletRequest;
import modls.Lesson;
import modls.Topic;
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
@RequestMapping("/teacher/les.htm")
public class TeacherLesson {

    LessonDao lessonDao;
    TopicDao topicDao;

    @Autowired
    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void lesIndex(
            @RequestParam(value = "l") Long lessonId,
            ModelMap model) {
        Lesson l = lessonDao.getLesson(lessonId);
        model.put("lesson", l);
//        l.getStudent();
    }
    @RequestMapping(method = RequestMethod.POST)
    public String postHandler(
            HttpServletRequest request) {

        String act = request.getParameter("act");

        if ("add".equals(act)) {
            addTopic(request);
        } else if ("del".equals(act)) {
            deleteTopic(request);
        }
        return "redirect:les.htm?l="+request.getParameter("l");
    }

    public void addTopic(
            HttpServletRequest request) {
        Long lessonId = new Long(request.getParameter("l"));
        String desc = new String(request.getParameter("topic"));
        Lesson lesson = lessonDao.getLesson(lessonId);
        Topic t = new Topic();
        t.setLesson(lesson);
        t.setDescription(desc);
        topicDao.save(t);
    }

    public void deleteTopic(
            HttpServletRequest request) {
        Long topicId = new Long(request.getParameter("tId"));
        topicDao.delete(topicId);
    }
}
