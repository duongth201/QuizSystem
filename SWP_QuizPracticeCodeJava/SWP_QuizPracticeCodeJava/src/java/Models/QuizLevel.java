
package Models;

public class QuizLevel {
    private int levelId;
    private String levelName;

    public QuizLevel() {}

    public QuizLevel(String levelName) {
        this.levelName = levelName;
    }

    public QuizLevel(int levelId, String levelName) {
        this.levelId = levelId;
        this.levelName = levelName;
    }

    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    @Override
    public String toString() {
        return "QuizLevel{" + "levelId=" + levelId + ", levelName=" + levelName + '}';
    }
    
}
