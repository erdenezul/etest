
import junit.framework.TestCase;
import modls.Lesson;
import modls.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tulga
 */
public class TestFour extends TestCase {

    public void test() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Lesson l = (Lesson)s.load(Lesson.class, new Long(1));
        Student s1 = (Student)s.load(Student.class, new Long(2));
        Student s2 = (Student)s.load(Student.class, new Long(3));

        s.beginTransaction();
        s2.getLesson().add(l);
        l.getStudent().add(s2);
        s.getTransaction().commit();
//        s.save(s2);
//        s.save(s1);
    }
}
