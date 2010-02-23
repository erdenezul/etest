/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import modls.Grade;
import modls.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author tulga
 */
public class TestOne {

    public TestOne() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void hello() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        
        Test t = (Test) s.load(Test.class, new Long(27));
        String username="D.PT09D999", pass="mongol";
        Student stud = (Student) s.createQuery("from Student where userName=:username and pass=pass").setEntity("username", username).setEntity("pass", pass).uniqueResult();
        String query = "from Grade where student=? and variant=any(from Variant where test=?)";
        Grade g = (Grade) s.createQuery(query).setEntity("student", stud).setEntity("test", t).uniqueResult();
        System.out.println(g);
    }
}
