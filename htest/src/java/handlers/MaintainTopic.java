/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package handlers;

import dao.LessonDao;
import dao.TopicDao;
import modls.Topic;
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
public class MaintainTopic {
    TopicDao topicDao;
    LessonDao lessonDao;

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @Autowired
    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @RequestMapping(value ="/teacher/addtopic.htm", method = RequestMethod.POST)
    public String addTopic(@RequestParam(value = "lessonId") Long lessonId,
            @RequestParam(value = "topicDesc") String topicDesc) {

        Topic topic = new Topic();
        topic.setDescription(topicDesc);
        topic.setLesson(lessonDao.getLesson(lessonId));
        topicDao.save(topic);
        return "redirect:index.htm?happy=lesson&lessonId=" + lessonId;
    }

    @RequestMapping(value ="/teacher/deletetopic.htm", method = RequestMethod.GET)
    public String deleteTopic(@RequestParam(value = "topicId") Long topicId, 
            @RequestParam(value = "lessonId") Long lessonId) {

        topicDao.delete(topicId);
        return "redirect:index.htm?happy=lesson&lessonId="+lessonId;// + lessonId;
    }
}
