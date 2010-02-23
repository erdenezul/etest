package modls;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Grade {

    private Variant variant;
    private Double score;
    private int relativeScore;
    private long id;
    private String explanation;
    private Set<QuestionOrder> mQuestionOrder = new HashSet();
    private Student student;
    private Boolean submitted;
    private Date start;
    private Date lastClick;

    public Date getLastClick() {
        return lastClick;
    }

    public Date getStart() {
        return start;
    }

    
    public void setLastClick(Date lastClick) {
        this.lastClick = lastClick;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Boolean getSubmitted() {
        return submitted;
    }

    public void setSubmitted(Boolean submitted) {
        this.submitted = submitted;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Grade() {
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String val) {
        this.explanation = val;
    }

    public long getId() {
        return id;
    }

    public void setId(long val) {
        this.id = val;
    }

    public Set<QuestionOrder> getQuestionOrder() {
        return mQuestionOrder;
    }

    public void setQuestionOrder(Set<QuestionOrder> val) {
        this.mQuestionOrder = val;
    }

    public int getRelativeScore() {
        return relativeScore;
    }

    public void setRelativeScore(int val) {
        this.relativeScore = val;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double val) {
        this.score = val;
    }

    public Variant getVariant() {
        return variant;
    }

    public void setVariant(Variant val) {
        this.variant = val;
    }
}

