package DAL;

import Models.Answer;
import Models.Question;
import Models.Quiz;
import Models.QuizLevel;
import Models.QuizType;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QuizDAO extends DBContext {

    public Quiz getPracticeQuizCustom(int subjectid, int duration, int numberQ) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "    SELECT * FROM dbo.Quiz where subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setDuration(duration * 60);
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuiz(rs.getInt("quizId"), numberQ));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Answer> getCorrectAnswer(int questionId) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "SELECT * FROM  dbo.Question AS q JOIN dbo.Answer AS a ON a.questionId = q.questionId WHERE a.questionId = ? AND a.isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer a = new Answer();
                a.setAnswerContent(rs.getString("answerContent"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Quiz> getAllQuiz() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "Select * from Quiz";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                list.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<QuizLevel> getAllLevel() {
        ArrayList<QuizLevel> list = new ArrayList<>();
        String sql = "select * from QuizLevel";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                QuizLevel level = new QuizLevel(rs.getInt(1), rs.getString(2));
                list.add(level);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<QuizType> getAllQuizType() {
        ArrayList<QuizType> list = new ArrayList<>();
        String sql = "select * from QuizType";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                QuizType type = new QuizType(rs.getInt(1), rs.getString(2));
                list.add(type);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Quiz> getAllQuizList() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "SELECT q.quizId,q.quizName,s.subjectName,ql.levelName,q.numOfQuestion,q.duration, q.passRate,qt.quizTypeName    \n"
                + "FROM dbo.Quiz q INNER JOIN\n"
                + "dbo.QuizLevel ql ON q.levelId = ql.levelId INNER JOIN\n"
                + "dbo.QuizType qt ON q.quizTypeId = qt.quizTypeId INNER JOIN\n"
                + "dbo.Subject s ON q.subjectId = s.subjectId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getString(3)),
                        new QuizLevel(rs.getString(4)),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        new QuizType(rs.getString(8)));
                list.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Quiz> getAllQuizWithFilter(String type, String subName) {
        ArrayList<Quiz> list = new ArrayList<>();

        String sql = "SELECT q.quizId,q.quizName,s.subjectName,ql.levelName,q.numOfQuestion,q.duration, q.passRate,qt.quizTypeName\n"
                + "FROM dbo.Quiz q INNER JOIN\n"
                + "dbo.QuizLevel ql ON q.levelId = ql.levelId INNER JOIN\n"
                + "dbo.QuizType qt ON q.quizTypeId = qt.quizTypeId INNER JOIN\n"
                + "dbo.Subject s ON q.subjectId = s.subjectId\n"
                + "where (1=1)\n";
        if (type != null && !type.equals("0")) {
            sql += "and qt.quizTypeName = ?\n";
        }
        if (subName != null && !subName.equals("0")) {
            sql += "and s.subjectName = ?\n";
        }

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            if ((type != null || !type.equals("0")) && (subName == null || subName.equals("0"))) {
                stm.setString(1, type);
            } else if ((type == null || type.equals("0")) && (subName != null || !subName.equals("0"))) {
                stm.setString(1, subName);
            } else if ((type != null || !type.equals("0")) && (subName != null || !subName.equals("0"))) {
                stm.setString(1, type);
                stm.setString(2, subName);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getString(3)),
                        new QuizLevel(rs.getString(4)),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        new QuizType(rs.getString(8)));
                list.add(quiz);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertNewQuiz(String quizName, int quizType, int level, int number, int duration, int subjectId) {
        String sql = "INSERT INTO [dbo].[Quiz]\n"
                + "           ([quizName]\n"
                + "           ,[quizTypeId]\n"
                + "           ,[levelId]\n"
                + "           ,[quizContent]\n"
                + "           ,[numOfQuestion]\n"
                + "           ,[passRate]\n"
                + "           ,[duration]\n"
                + "           ,[subjectId]\n"
                + "           ,[maximum answers per ques])\n"
                + "     VALUES\n"
                + "           (?,?,?,'...',?,80,?,?,null)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, quizName);
            stm.setInt(2, quizType);
            stm.setInt(3, level);
            stm.setInt(4, number);
            stm.setInt(5, duration);
            stm.setInt(6, subjectId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void UpdateQuiz(String quizName, int quizType, int level, int number, int duration, int subjectId, int quizId) {
        String sql = "UPDATE [dbo].[Quiz]\n"
                + "   SET [quizName] = ?\n"
                + "      ,[quizTypeId] = ?\n"
                + "      ,[levelId] = ?\n"
                + "      ,[numOfQuestion] = ?\n"
                + "      ,[duration] = ?\n"
                + "      ,[subjectId] = ?\n"
                + " WHERE quizId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, quizName);
            stm.setInt(2, quizType);
            stm.setInt(3, level);
            stm.setInt(4, number);
            stm.setInt(5, duration);
            stm.setInt(6, subjectId);
            stm.setInt(7, quizId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void DeleteQuiz(int quizId) {
        String sql = "Delete from Quiz where quizId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void editQuizDuration(int settingid, int value, int status) {
        String sql = "UPDATE [dbo].[Setting]\n"
                + "   SET [Value] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(3, settingid);
            stm.setInt(1, value);
            stm.setInt(2, status);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Quiz getQuizById2(int quizid) {
        String sql = "SELECT q.quizId,q.quizName,s.subjectName,ql.levelName,q.numOfQuestion,q.duration, q.passRate,qt.quizTypeName, qt.quizTypeId, ql.levelId,s.subjectId    \n"
                + "FROM dbo.Quiz q INNER JOIN\n"
                + "dbo.QuizLevel ql ON q.levelId = ql.levelId INNER JOIN\n"
                + "dbo.QuizType qt ON q.quizTypeId = qt.quizTypeId INNER JOIN\n"
                + "dbo.Subject s ON q.subjectId = s.subjectId\n"
                + "where q.quizId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getString(3)),
                        new QuizLevel(rs.getString(4)),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        new QuizType(rs.getString(8)));
                quiz.getType().setQuizTypeId(rs.getInt(9));
                quiz.getLevel().setLevelId(rs.getInt(10));
                quiz.getSubjectId().setSubjectId(rs.getInt(11));
                return quiz;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Quiz getQuizById(int quizid) {
        String sql = "select * from Quiz where quizid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                return quiz;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Quiz> getQuizLeftToAddSetting() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "select * from Quiz where quizId not in (SELECT quizID FROM Setting)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                list.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
//        ArrayList<Quiz> listQuiz = dao.getAllQuizWithFilter("Simulation", "0");
//        for (Quiz quiz : listQuiz) {
//            System.out.println(quiz);
//        }
//        System.out.println(dao.getAllLevel());
//        System.out.println(dao.getQuizById2(1));
//            dao.UpdateQuiz("Practice Quiz",2 , 1, 10, 100, 1, 1);
//        dao.DeleteQuiz(18);
//        System.out.println(dao.getCusQuizById(2));
//        Quiz q = dao.getQuizById(1);
//        System.out.println(q.getQuizName());
    }

    public Quiz getPracticeQuizByLesson(int subjectId, int lessonId) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "SELECT * FROM dbo.Quiz WHERE lessonId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuizLesson(rs.getInt("quizId")));

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

//    public void calculateScore(Quiz q) {
//        boolean isCorrect = true;
//
//        ArrayList<Integer> chooseAnswers = new ArrayList<>();
//        ArrayList<Integer> correctAnswers = new ArrayList<>();
//        Question ques = new Question();
//        float totalCorrectAnswer = 0;
//        int totalChoice = 0;
//
//        for (Question question : q.getQ()) {
//            correctAnswers = getCorrectAnswerByQuestionId(question.getQuestionId());
//            //5, 6
//            if (question.getMarkedAnswer() != null) {
//                for (Integer answer : question.getMarkedAnswer()) {
//                    // 5
//                    if (correctAnswers.contains(answer)) {
//                        isCorrect = true;
//                        totalChoice++;
//                    } else {
//                        isCorrect = false;
//                        break;
//                    }
//                }
//                if (isCorrect == true && totalChoice == correctAnswers.size()) {
//                    totalCorrectAnswer += 1;
//                    totalChoice = 0;
//                }
//                isCorrect = true;
//            }
//
//        }
//        float point = totalCorrectAnswer / (float) q.getQ().size();
//        point = point * 100;
//
//        String sql2 = "INSERT INTO dbo.CustomerQuiz(quizId, userId, point, time, submitted)\n"
//                + "VALUES(?, \n"
//                + "?   ,\n"
//                + "? , \n"
//                + "?   , \n"
//                + "GETDATE()\n"
//                + "    )";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql2);
//            stm.setInt(1, q.getQuizId());
//            stm.setInt(2, q.getUserid());
//            stm.setFloat(3, point);
//            stm.setDouble(4, q.getTimeTaken());
//
//            stm.executeUpdate();
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//    }
    public ArrayList<Integer> getCorrectAnswerByQuestionId(int questionId) {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT * FROM  dbo.Question AS q JOIN dbo.Answer AS a ON a.questionId = q.questionId WHERE a.questionId = ? AND a.isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("answerId"));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Quiz getPracticeQuizExamination(int subjectid) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "    SELECT * FROM dbo.Quiz where subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuizExamination(rs.getInt("quizId")));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Quiz getQuizReview(int quizid) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "SELECT * FROM dbo.CustomerQuiz AS cq JOIN dbo.Quiz AS q ON q.quizId = cq.quizId WHERE cq.quizTakeId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setTime(rs.getInt("time"));
                q.setPoint(rs.getFloat("point"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));
              
                q.setQ(qd.getQuesByQuiz(rs.getInt("quizTakeId")));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Object> calculateScore(Quiz q) {

        boolean isCorrect = true;
        List<Object> quizInfo = new ArrayList<>();
        ArrayList<Integer> chooseAnswers = new ArrayList<>();
        ArrayList<Integer> correctAnswers = new ArrayList<>();
        Question ques = new Question();
        float totalCorrectAnswer = 0;
        int totalChoice = 0;
        int justTakeCustomerQuiz = -1;

        for (Question question : q.getQ()) {
            correctAnswers = getCorrectAnswerByQuestionId(question.getQuestionId());
            //5, 6
            if (question.getMarkedAnswer() != null) {
                for (Integer answer : question.getMarkedAnswer()) {
                    // 5
                    if (correctAnswers.contains(answer)) {
                        isCorrect = true;
                        totalChoice++;
                    } else {
                        isCorrect = false;
                        break;
                    }

                }
                if (isCorrect == true && totalChoice == correctAnswers.size()) {
                    totalCorrectAnswer += 1;
                    totalChoice = 0;
                }
                isCorrect = true;
            }
        }
        float point = totalCorrectAnswer / (float) q.getQ().size();
        point = point * 100;

        String sql2 = "INSERT INTO dbo.CustomerQuiz(quizId, userId, point, time, submitted)\n"
                + "VALUES(?, \n"
                + "?   ,\n"
                + "? , \n"
                + "?   , \n"
                + "GETDATE()\n"
                + "    )";
        try {
            connection.setAutoCommit(false);
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, q.getQuizId());
            stm.setInt(2, q.getUserid());
            stm.setFloat(3, point);
            stm.setDouble(4, q.getTimeTaken());

            stm.executeUpdate();

            String sql_get_id = "select @@IDENTITY as quizTakeId";
            PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);

            ResultSet rs = stm_get_id.executeQuery();
            int justTakenQuizId = -1;
            if (rs.next()) {
                justTakenQuizId = rs.getInt("quizTakeId");
                justTakeCustomerQuiz = justTakenQuizId;
            }

            //insert answer
            for (Question question : q.getQ()) {
                for (int markedAnswer : question.getMarkedAnswer()) {
                    String sql = "INSERT INTO dbo.TakeAnswer(quizTakeId, questionId, answerId, [status])\n"
                            + "VALUES(?,\n"
                            + "?   ,\n"
                            + "?   , \n"
                            + "NULL \n"
                            + "    )";
                    PreparedStatement stm_answer = connection.prepareStatement(sql);
                    stm_answer.setInt(1, justTakenQuizId);
                    stm_answer.setInt(2, question.getQuestionId());
                    stm_answer.setInt(3, markedAnswer);
                    stm_answer.executeUpdate();
                }
            }
            connection.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {

            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            quizInfo.add(q.getQ().size());
            quizInfo.add(point);
            quizInfo.add(totalCorrectAnswer);
            quizInfo.add(justTakeCustomerQuiz);
            return quizInfo;
        }

    }

    ArrayList<Integer> getMarkedAnswer(int questionId, int qid) {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Question AS q Right JOIN dbo.TakeAnswer AS ta ON ta.questionId = q.questionId WHERE ta.questionId = ? and ta.quizTakeId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            stm.setInt(2, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("answerId"));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

}
