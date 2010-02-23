package modls;

public class QuestionOrder {

    private long id;
    private int orderNumber;
    private Question mQuestion;
    private Grade grade;
    private Boolean answered = false;
    private Double point;

    public Boolean getAnswered() {
        return answered;
    }

    public void setAnswered(Boolean answered) {
        if (answered != null) {
            this.answered = answered;
        }
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public QuestionOrder() {
    }

    public Question getQuestion() {
        return mQuestion;
    }

    public void setQuestion(Question val) {
        this.mQuestion = val;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int val) {
        this.orderNumber = val;
    }
}

