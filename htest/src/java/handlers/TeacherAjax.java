/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package handlers;

import dao.LessonDao;
import dao.TopicDao;
import modls.Lesson;
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
@RequestMapping("/teacher/ajax.htm")
public class TeacherAjax {
    TopicDao topicDao;
    LessonDao lessonDao;

    @Autowired
    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(method=RequestMethod.GET)
    public void responseAjax(
            @RequestParam("lessonId")Long lessonId,
            ModelMap model
            ) {
        
        Lesson lesson = lessonDao.getLesson(lessonId);
        model.put("topics", topicDao.getTopics(lesson));
    }
}
