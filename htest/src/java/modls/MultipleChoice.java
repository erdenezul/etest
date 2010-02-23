package modls;

import java.util.HashSet;
import java.util.Set;

public class MultipleChoice extends Question {

    private Set<Answer> mAnswer = new HashSet(0);

    @Override
    public String getTemplate() {
        return "multi-choice.jsp";
    }

    public MultipleChoice() {
    }

    public Set<Answer> getAnswer() {
        return mAnswer;
    }

    public void setAnswer(Set<Answer> val) {
        this.mAnswer = val;
    }

    @Override
    public Double eval(Object answer) {
        for(Answer a:mAnswer) {
            if(a.getId()==answer) {
                return a.getPoint();
            }
        }
        return null;
    }
}

