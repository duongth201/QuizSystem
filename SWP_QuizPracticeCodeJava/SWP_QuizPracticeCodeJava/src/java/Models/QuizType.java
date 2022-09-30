
package Models;

public class QuizType {
    private int quizTypeId;
    private String quizTypeName;

    public QuizType() {}

    public QuizType(String quizTypeName) {
        this.quizTypeName = quizTypeName;
    }
    
    public QuizType(int quizTypeId, String quizTypeName) {
        this.quizTypeId = quizTypeId;
        this.quizTypeName = quizTypeName;
    }

    public int getQuizTypeId() {
        return quizTypeId;
    }

    public void setQuizTypeId(int quizTypeId) {
        this.quizTypeId = quizTypeId;
    }

    public String getQuizTypeName() {
        return quizTypeName;
    }

    public void setQuizTypeName(String quizTypeName) {
        this.quizTypeName = quizTypeName;
    }

    @Override
    public String toString() {
        return "QuizType{" + "quizTypeId=" + quizTypeId + ", quizTypeName=" + quizTypeName + '}';
    }
    
}
