/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.AnswerDao;
import dao.DifficultyDao;
import dao.LessonDao;
import dao.QuestionDao;
import dao.TeacherDao;
import dao.UFileDao;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modls.Answer;
import modls.Difficulty;
import modls.FillInBlank;
import modls.MultipleChoice;
import modls.MultipleResponse;
import modls.Question;
import modls.Teacher;
import modls.Topic;
import modls.TrueFalse;
import modls.UFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/teacher/qadd.htm")
public class TeacherQuestion {

    QuestionDao questionDao;
    LessonDao lessonDao;
    DifficultyDao difficultyDao;
    AnswerDao answerDao;
    TeacherDao teacherDao;
    UFileDao uFileDao;

    @Autowired
    public void setuFileDao(UFileDao uFileDao) {
        this.uFileDao = uFileDao;
    }

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setAnswerDao(AnswerDao answerDao) {
        this.answerDao = answerDao;
    }

    @Autowired
    public void setDifficultyDao(DifficultyDao difficultyDao) {
        this.difficultyDao = difficultyDao;
    }

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void voidIndex(
            HttpServletRequest request,
            ModelMap model) {
        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        model.put("difficulty", difficultyDao.getDifficulty());
    }

    @Transactional
    @RequestMapping(method = RequestMethod.POST)
    public String saveQuestion(
            @RequestParam("qtype") String qtype,
            @RequestParam("difficulty") Long difficultyId,
            @RequestParam("topic") Long topicId,
            @RequestParam("lesson") Long lessonId,
            @RequestParam("question") String questiona,
            @RequestParam(value = "answer", required = false) List<String> answers,
            @RequestParam(value = "point", required = false) List<String> points,
            @RequestParam(value = "val", required = false) Boolean val,
            @RequestParam(value = "tfpoint", required = false) Double tfpoint,
            @RequestParam(value = "ufile", required = false) Long ufId,
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);

        Question question = new Question();
//        questionDao.saveQuestion(question);

        if ("multiplechoice-form".equals(qtype)) {
            question = new MultipleChoice();
            MultipleChoice mc = (MultipleChoice) question;
            Object[] answerA = answers.toArray();
            Object[] pointA = points.toArray();
            for (int i = 0; i < answerA.length; i++) {
                Answer a = new Answer();
                a.setAnswer(answerA[i].toString());
                a.setPoint(new Double(pointA[i].toString()));
                a.setQuestion(question);
                mc.getAnswer().add(a);
            }
        } else if ("multipleresponse-form".equals(qtype)) {
            question = new MultipleResponse();
            MultipleResponse mc = (MultipleResponse) question;
            Object[] answerA = answers.toArray();
            Object[] pointA = points.toArray();
            for (int i = 0; i < answerA.length; i++) {
                Answer a = new Answer();
                a.setAnswer(answerA[i].toString());
                a.setPoint(new Double(pointA[i].toString()));
                a.setQuestion(question);
                mc.getAnswer().add(a);
            }
        } else if ("truefalse-form".equals(qtype)) {
            question = new TrueFalse();
            TrueFalse tf = (TrueFalse)question;
            tf.setValue(val);
            tf.setPoint(tfpoint);
        } else if ("fill-form".equals(qtype)) {
            question = new FillInBlank();
        }

        if (ufId != null) {
            UFile uf = uFileDao.getUFile(ufId);
            question.setUfile(uf);
        }
        Difficulty diff = new Difficulty();
        diff.setId(difficultyId);
        Topic topic = new Topic();
        topic.setId(topicId);
        question.setQuestion(questiona);
        question.setDifficult(diff);
        question.setTopic(topic);

        questionDao.saveQuestion(question);
        return "redirect:qadd.htm?success=true";
    }
}
