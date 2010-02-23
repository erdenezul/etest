/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.DifficultyDao;
import dao.LessonDao;
import dao.QuestionDao;
import dao.TeacherDao;
import dao.TopicDao;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modls.Difficulty;
import modls.FillInBlank;
import modls.Lesson;
import modls.MultipleChoice;
import modls.MultipleResponse;
import modls.Question;
import modls.Teacher;
import modls.Topic;
import modls.TrueFalse;
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
public class TeacherQController {

    TeacherDao teacherDao;
    LessonDao lessonDao;
    DifficultyDao difficultyDao;
    QuestionDao questionDao;
    TopicDao topicDao;

    @Autowired
    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @Autowired
    public void setDifficultyDao(DifficultyDao difficultyDao) {
        this.difficultyDao = difficultyDao;
    }

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @RequestMapping(value = "/teacher/qmain.htm", method = RequestMethod.GET)
    public void showQuestions(
            @RequestParam(value = "lessonId", required = false) Long lessonId,
            @RequestParam(value = "difficultId", required = false) Long difficultId,
            @RequestParam(value = "typeId", required = false) Long typeId,
            @RequestParam(value = "topicId", required = false) Long topicId,
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        Teacher t = (Teacher) session.getAttribute("teacher");
        teacherDao.toPersist(t);
        Lesson l = null;
        Difficulty d = null;
        Topic to = null;
        if (lessonId != null) {
            l = lessonDao.getLesson(lessonId);
        } else {
            l = (Lesson) t.getLesson().toArray()[0];
        }
        if (difficultId != null) {
            d = difficultyDao.getDifficulty(difficultId);
        }
        if(topicId!=null) {
            to = topicDao.getTopic(topicId);
        }
        Class type=null;
        if (typeId != null) {
            int tmpType = (int)typeId.longValue();
            switch(tmpType) {
                case 1: {
                    type = MultipleChoice.class;
                    break;
                }
                case 2: {
                    type = TrueFalse.class;
                    break;
                }
                case 3: {
                    type = FillInBlank.class;
                    break;
                }
                case 4: {
                    type = MultipleResponse.class;
                    break;
                }
            }
        }
        List<Question> qs = null;
        if(to!=null||d!=null||type!=null) {
            if(type==null) { type=Question.class; }
            qs = questionDao.getQuestions(l, to, d, type);
        } else {
            qs = questionDao.getQuestions(l);
        }
        session.setAttribute("questions", qs);
        session.setAttribute("lesson", l);
        session.setAttribute("difficulties", difficultyDao.getDifficulty());
        //        t.getLesson().
    }

    @RequestMapping(value = "/teacher/deletequestion.htm", method = RequestMethod.GET)
    public String deleteQuestion(
            @RequestParam(value = "qId") Long questionId,
            @RequestParam(value = "back") String back
            ) {
        questionDao.deleteQuestion(questionId);
        return "redirect:"+back;
    }
}
