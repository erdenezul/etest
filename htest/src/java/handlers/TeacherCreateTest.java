/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.GradeDao;
import dao.LessonDao;
import dao.ProtocolDao;
import dao.QuestionDao;
import dao.QuestionOrderDao;
import dao.StudentDao;
import dao.TeacherDao;
import dao.TestDao;
import dao.VariantDao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import modls.Grade;
import modls.Lesson;
import modls.Protocol;
import modls.Question;
import modls.QuestionOrder;
import modls.Student;
import modls.Teacher;
import modls.Test;
import modls.Variant;
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
@RequestMapping("/teacher/cr8test.htm")
public class TeacherCreateTest {

    QuestionDao questionDao;
    StudentDao studentDao;
    TestDao testDao;
    VariantDao variantDao;
    QuestionOrderDao questionOrderDao;
    GradeDao gradeDao;
    ProtocolDao protocolDao;
    TeacherDao teacherDao;
    LessonDao lessonDao;

    @Autowired
    public void setLessonDao(LessonDao lessonDao) {
        this.lessonDao = lessonDao;
    }

    @Autowired
    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    @Autowired
    public void setProtocolDao(ProtocolDao protocolDao) {
        this.protocolDao = protocolDao;
    }

    @Autowired
    public void setGradeDao(GradeDao gradeDao) {
        this.gradeDao = gradeDao;
    }

    @Autowired
    public void setQuestionOrderDao(QuestionOrderDao questionOrderDao) {
        this.questionOrderDao = questionOrderDao;
    }

    @Autowired
    public void setVariantDao(VariantDao variantDao) {
        this.variantDao = variantDao;
    }

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @Autowired
    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String createTest(
            @RequestParam(value = "desc", required = false) String description,
            @RequestParam(value = "variantNum") Long variantNum,
            @RequestParam(value = "topic", required = false) List<String> topic,
            @RequestParam(value = "difficulty", required = false) List<String> difficulty,
            @RequestParam(value = "numberOfQuestions", required = false) List<String> numberOfQuestions,
            @RequestParam(value = "doNotIntercept", required = false) Boolean doNotIntercept,
            @RequestParam(value = "shuffleQuestions", required = false) Boolean shuffleQuestions,
            @RequestParam(value = "randomlyAssign", required = false) Boolean randomlyAssign,
            @RequestParam(value = "student", required = false) List<String> students,
            @RequestParam(value = "variant", required = false) List<String> variants,
            HttpServletRequest request) {

        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        teacherDao.toPersist(t);

        Lesson lesson = (Lesson) request.getSession().getAttribute("lesson");
        lessonDao.toPersist(lesson);
        if (doNotIntercept == null) {
            doNotIntercept = false;
        }
        if (shuffleQuestions == null) {
            shuffleQuestions = false;
        }
        if (randomlyAssign == null) {
            randomlyAssign = false;
        }
        Object[] topicZ = topic.toArray();
        Object[] difficultyZ = difficulty.toArray();
        Object[] numberOfQuestionZ = numberOfQuestions.toArray();
        Object[] variantZ = variants.toArray();
        Test test = (Test) request.getSession().getAttribute("test");
        Object[] studentZ = (randomlyAssign)
                ? lesson.getStudent().toArray() : students.toArray();
        List<Variant> variantsTo = new ArrayList<Variant>();
        Random rand = new Random();

        HashMap topicMap = new HashMap();

        //load questions from db
        for (int i = 0; i < topicZ.length; i++) {
            HashMap difficultyMap = new HashMap();
            List<Question> questionList = questionDao.getQuestions(
                    new Long(topicZ[i].toString()),
                    new Long(difficultyZ[i].toString()));
            if (topicMap.containsKey(topicZ[i])) {
                ((HashMap) topicMap.get(topicZ[i])).put(difficultyZ[i], questionList);
            } else {
                difficultyMap.put(difficultyZ[i],
                        questionList);
                topicMap.put(topicZ[i], difficultyMap);
            }
        }
        testDao.saveTest(test);
        //create variants and add to test
        while (variantNum-- > 0) {
            Variant currentVariant = new Variant();
            for (int i = 0; i < topicZ.length; i++) {
                List<Question> questionList = (List<Question>) ((HashMap) topicMap.get(topicZ[i])).get(difficultyZ[i]);
                if (doNotIntercept) {
                    int numberOfQuestionz = new Integer(numberOfQuestionZ[i].toString());
                    while (numberOfQuestionz-- > 0) {
                        int randomIndex = rand.nextInt(questionList.size());
                        if(questionList.size()==0) {
                            randomIndex = 0;
                        }
                        currentVariant.getQuestions().add(questionList.remove(randomIndex));
                    }
                } else {
                    int numberOfQuestionz = new Integer(numberOfQuestionZ[i].toString());
                    ArrayList tempList = new ArrayList(questionList);
                    while (numberOfQuestionz-- > 0) {
                        int randomIndex = rand.nextInt(questionList.size());
                        currentVariant.getQuestions().add(questionList.remove(randomIndex));
                    }
                    questionList = tempList;
                }
            }
            currentVariant.setTest(test);
            test.getVariant().add(currentVariant);
        }
        variantsTo = new ArrayList<Variant>(test.getVariant());
        //assign variants to student
        for (int i = 0; i < studentZ.length; i++) {
            Variant chosenVariant = null;
            Student stud = null;
            if (randomlyAssign) {
                int randomIndex = rand.nextInt(variantsTo.size());
                chosenVariant = variantsTo.get(randomIndex);
                stud = (Student) studentZ[i];
            } else {
                chosenVariant = variantsTo.get(variantZ[i].toString().charAt(0) - 'A');
                stud = studentDao.getStudent(new Long(studentZ[i].toString()));
            }
            Grade grade = new Grade();
            List questionList = new ArrayList(chosenVariant.getQuestions());
            //populate question order save into grade
            for (int j = 0, qL = questionList.size(); j < qL; j++) {
                QuestionOrder qo = new QuestionOrder();
                qo.setOrderNumber(j);
                if (shuffleQuestions) {
                    qo.setQuestion((Question) questionList.remove(rand.nextInt(questionList.size())));
                } else {
                    qo.setQuestion((Question) questionList.get(j));
                }
                grade.getQuestionOrder().add(qo);
                qo.setGrade(grade);
            }
            grade.setVariant(chosenVariant);
            grade.setStudent(stud);
            stud.getGrade().add(grade);
            gradeDao.save(grade);
        }
        Protocol p = new Protocol();
        test.setProtocol(p);
        lesson.getExam().add(test);
        test.setDesc(description);
        test.setLesson(lesson);
        testDao.updateTest(test);
//        lessonDao.toPersist(lesson);
//        testDao.saveTest(test);
        return "redirect:cr8test.htm";
    }

    protected void fillVariant() {
    }
//    protected

    @RequestMapping(method = RequestMethod.GET)
    public void showStatusTest() {
    }
}
