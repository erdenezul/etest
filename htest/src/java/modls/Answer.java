package modls;


public class Answer {

    private long id;

    private String answer;

    private Double point;

    private Question question;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    

    public Answer () {
    }

    public String getAnswer () {
        return answer;
    }

    public void setAnswer (String val) {
        this.answer = val;
    }

    public long getId () {
        return id;
    }

    public void setId (long val) {
        this.id = val;
    }

    public Double getPoint () {
        return point;
    }

    public void setPoint (Double val) {
        this.point = val;
    }

}

