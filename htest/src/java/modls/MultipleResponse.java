/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modls;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author tulga
 */
public class MultipleResponse extends Question {

    private Set<Answer> mAnswer = new HashSet(0);

    public Set<Answer> getAnswer() {
        return mAnswer;
    }

    public void setAnswer(Set<Answer> val) {
        this.mAnswer = val;
    }

    @Override
    public String getTemplate() {
        return "multi-response.jsp";
    }

    @Override
    public Double eval(Object answer) {
        List<Long> answers = (List<Long>) answer;
        Double sum = new Double(0);
        for (Answer a : mAnswer) {
            if (a.getId() == answer) {
                
            }
        }
        return sum;
    }
}
