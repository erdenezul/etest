/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

import dao.TestDao;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modls.Teacher;
import modls.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tulga
 */
@Controller
@RequestMapping("/teacher/tcontrol.htm")
public class TeacherTestController {

    TestDao testDao;

    @Autowired
    public void setTestDao(TestDao testDao) {
        this.testDao = testDao;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void voidIndex(ModelMap model,
            HttpServletRequest request) throws IOException {
        String toggle = request.getParameter("toggle");
        if("yes".equals(toggle)) {
            Long testId = new Long(request.getParameter("tId"));
            Test t = testDao.getTest(testId);
            int state = (t.getState()==0)?1:0;
            t.setState(state);
            testDao.updateTest(t);
        }
        Teacher t = (Teacher) request.getSession().getAttribute("teacher");
        model.put("tests", testDao.getTest(t));
    }
}
