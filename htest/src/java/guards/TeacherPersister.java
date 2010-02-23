/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 
package guards;

import dao.TeacherDao;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import modls.Teacher;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author tulga
 */
public class TeacherPersister implements Filter {

    private TeacherDao teacherDao = null;

    public TeacherPersister(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }

    public TeacherPersister() {
    } 

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
	throws IOException, ServletException {
	
	Throwable problem = null;

	try {
            //********************************************
            //Here we gooooo!!!
	    //********************************************
//            int i=23;
//            i++;
//            Teacher t = (Teacher)((HttpServletRequest)request).getSession().getAttribute("teacher");
//            if(t!=null) {
//                teacherDao.toPersist(t);
//            }
            chain.doFilter(request, response);
	}
	catch(Throwable t) {
	    problem = t;
	    t.printStackTrace();
	}
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
