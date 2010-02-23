package modls;

import java.util.Set;
import java.util.Date;
import java.util.HashSet;

public class Test {

    private String desc;
    private int state;
    private boolean isRegisterStudentAtRuntime;
    private Date startDate;
    private Date endDate;
    private Lesson lesson;
    private boolean isStartFromLogin;
    private int durationInMinute;
    private long id;
    private Set<Rooms> mRooms = new HashSet(0);
    private Set<Variant> mVariant = new HashSet(0);
    private ExamType mExamType = new ExamType();
    private Protocol mProtocol = new Protocol();

    public Test() {
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public Set<Variant> getVariant() {
        return mVariant;
    }

    public void setVariant(Set<Variant> val) {
        this.mVariant = val;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String val) {
        this.desc = val;
    }

    public int getDurationInMinute() {
        return durationInMinute;
    }

    public void setDurationInMinute(int val) {
        this.durationInMinute = val;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date val) {
        this.endDate = val;
    }

    public long getId() {
        return id;
    }

    public void setId(long val) {
        this.id = val;
    }

    public boolean getIsRegisterStudentAtRuntime() {
        return isRegisterStudentAtRuntime;
    }

    public void setIsRegisterStudentAtRuntime(boolean val) {
        this.isRegisterStudentAtRuntime = val;
    }

    public boolean getIsStartFromLogin() {
        return isStartFromLogin;
    }

    public void setIsStartFromLogin(boolean val) {
        this.isStartFromLogin = val;
    }

    public Set<Rooms> getRooms() {
        return mRooms;
    }

    public void setRooms(Set<Rooms> val) {
        this.mRooms = val;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date val) {
        this.startDate = val;
    }

    public int getState() {
        return state;
    }

    public boolean getIsActive() {
        Date today = new Date();
//        startDate.getYear();
        return state != 0 ||
                (startDate.compareTo(today) < 0 && endDate.compareTo(today) > 0);
    }

    public void setState(int val) {
        this.state = val;
    }

    public ExamType getExamType() {
        return mExamType;
    }

    public void setExamType(ExamType val) {
        this.mExamType = val;
    }

    public Protocol getProtocol() {
        return mProtocol;
    }

    public void setProtocol(Protocol val) {
        this.mProtocol = val;
    }

}

