package Models;

import java.util.ArrayList;

public class Quiz {

    double timeTaken;

    public double getTimeTaken() {
        return timeTaken;
    }

    public void setTimeTaken(double timeTaken) {
        this.timeTaken = timeTaken;
    }

    private int quizId;
    private String quizName;
    private int quizTypeId;
    private int levelId;
    private String quizContent;
    private int numberOfQuestion;
    private int passRate;
    private int duration;
    private Subject subjectId;
    private QuizLevel level;
    private QuizType type;
    boolean isTaken;
    private float point;
    private int time;

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
    
    public boolean isIsTaken() {
        return isTaken;
    }

    public void setIsTaken(boolean isTaken) {
        this.isTaken = isTaken;
    }
    ArrayList<Question> q;
    int userid;

    public ArrayList<Question> getQ() {
        return q;
    }

    public void setQ(ArrayList<Question> q) {
        this.q = q;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Quiz() {
    }

    public QuizLevel getLevel() {
        return level;
    }

    public void setLevel(QuizLevel level) {
        this.level = level;
    }

    public QuizType getType() {
        return type;
    }

    public void setType(QuizType type) {
        this.type = type;
    }

    public Quiz(int quizId, String quizName, Subject subjectId, QuizLevel level, int numberOfQuestion, int duration, int passRate, QuizType type) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.numberOfQuestion = numberOfQuestion;
        this.passRate = passRate;
        this.duration = duration;
        this.subjectId = subjectId;
        this.level = level;
        this.type = type;
    }
    
    
    
    public Quiz(int quizId, String quizName, int numberOfQuestion, int passRate, int duration, Subject subjectId) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.numberOfQuestion = numberOfQuestion;
        this.passRate = passRate;
        this.duration = duration;
        this.subjectId = subjectId;
    }

    public Quiz(int quizId, String quizName, int quizTypeId, int levelId, String quizContent, int numberOfQuestion, int passRate, int duration) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.quizTypeId = quizTypeId;
        this.levelId = levelId;
        this.quizContent = quizContent;
        this.numberOfQuestion = numberOfQuestion;
        this.passRate = passRate;
        this.duration = duration;
    }

    public Quiz(int quizId, String quizName, int quizTypeId, int levelId, String quizContent, int numberOfQuestion, int passRate, int duration, Subject subjectId) {
        this.quizId = quizId;
        this.quizName = quizName;
        this.quizTypeId = quizTypeId;
        this.levelId = levelId;
        this.quizContent = quizContent;
        this.numberOfQuestion = numberOfQuestion;
        this.passRate = passRate;
        this.duration = duration;
        this.subjectId = subjectId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public int getQuizTypeId() {
        return quizTypeId;
    }

    public void setQuizTypeId(int quizTypeId) {
        this.quizTypeId = quizTypeId;
    }

    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }

    public String getQuizContent() {
        return quizContent;
    }

    public void setQuizContent(String quizContent) {
        this.quizContent = quizContent;
    }

    public int getNumberOfQuestion() {
        return numberOfQuestion;
    }

    public void setNumberOfQuestion(int numberOfQuestion) {
        this.numberOfQuestion = numberOfQuestion;
    }

    public int getPassRate() {
        return passRate;
    }

    public void setPassRate(int passRate) {
        this.passRate = passRate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Subject getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Subject subjectId) {
        this.subjectId = subjectId;
    }

    public String secondtotime(int n) {
        int hour, minute, second;
        hour = n / 3600;
        minute = n % 3600 / 60;
        second = n % 3600 % 60;
        String s = hour + ":" + minute + ":" + second;
        return s;
    }
//    ${p.quizId.secondtotime(p.quizId.duration)}

    @Override
    public String toString() {
        return "Quiz{" + "timeTaken=" + timeTaken + ", quizId=" + quizId + ", quizName=" + quizName + ", quizTypeId=" + quizTypeId + ", levelId=" + levelId + ", quizContent=" + quizContent + ", numberOfQuestion=" + numberOfQuestion + ", passRate=" + passRate + ", duration=" + duration + ", subjectId=" + subjectId + ", level=" + level + ", type=" + type + ", q=" + q + ", userid=" + userid + '}';
    }

    

}
