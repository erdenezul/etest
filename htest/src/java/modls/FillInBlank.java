/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modls;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * select <x |1.0x> from <x |2x>
 * @author tulga
 */
public class FillInBlank extends Question {

    Set<FAnswer> answers = new HashSet(0);

    @Override
    public String getTemplate() {
        return "fillinblank.jsp";
    }

    public Set<FAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<FAnswer> answers) {
        this.answers = answers;
    }
    
    public FillInBlank() {
        
    }

    @Override
    public void setQuestion(String text) {
        String regex = "<x([^>|]*?)\\|([^>]*?)x>";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(text);
        String question = new String(text.toCharArray());
        int orderNumber = 0;
        while (m.find()) {
            FAnswer fa = new FAnswer();
            fa.setAnswer(m.group(1));
            fa.setPoint(new Double(m.group(2)));
            fa.setOrder(orderNumber++);
            question = question.replaceFirst(regex, "<x"+(orderNumber-1)+"x>");
            answers.add(fa);
        }
        super.setQuestion(question);
    }

    @Override
    public String toString() {
        StringBuffer str = new StringBuffer(this.getQuestion());
        for (FAnswer fa : answers) {
            str.append("\n");
            str.append("\ttext:" + fa.getAnswer());
            str.append("\n");
            str.append("\tpoint:" + fa.getPoint());
        }
        return str.toString();
    }

    public static void main(String[] args) {
//        FillInBlank fib = new FillInBlank("select <x*|2.0x> from <xEmployee|1x>");
//        System.out.println(fib);
        String fib="select <x0x> from <x1x>";
        Pattern p = Pattern.compile("<x([0-9]+)x>");
        Matcher m = p.matcher("select <x0x> from <x1x>");

        System.out.println(m.replaceAll("<zzz \\1 zzz>"));
    }
}
