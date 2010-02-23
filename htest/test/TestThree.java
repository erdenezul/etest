
import java.util.List;
import junit.framework.TestCase;
import modls.Lesson;
import modls.Teacher;
import modls.Test;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestThree extends TestCase {
    public void test() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        List<Teacher> teachers = s.createQuery("from Teacher").list();
        for(Teacher t:teachers) {
            for(Lesson l:t.getLesson()) {
                System.out.println(l.getCode()+" ");
                for(Test test:l.getExam()) {
                    System.out.println(test.getExamType().getDesc());
                }
            }
        }
    }
}