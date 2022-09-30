/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Answer;
import Models.Dimension;
import Models.Lesson;
import Models.Question;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class QuestionDAO extends DBContext {

    public ArrayList<Question> getAllQuestionByID(String keyword) {
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select q.*, s.subjectName, d.dimensionName, l.lessonName from Question q inner join Subject s\n"
                + "on q.subjectId = s.subjectId\n"
                + "inner join Dimension d on q.dimensionId = d.dimensionId\n"
                + "inner join Lesson l on q.lessonId = l.lessonId\n";
        if (keyword != null) {
            sql += "where q.questionContent like ? \n";
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword == null) {

            }

            if (keyword != null) {
                stm.setString(1, "%" + keyword + "%");

            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt(1));
                q.setQuestionContent(rs.getString(3));
                q.setSubjectId(rs.getInt(2));
                q.setDimensionId(rs.getInt(4));
                q.setLessonId(rs.getInt(5));
                q.setStatus(rs.getBoolean(6));
                q.setSubjectName(rs.getString(11));
                q.setDimensionName(rs.getString(12));
                q.setLessonName(rs.getString(13));
                list.add(q);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalQuestion(String keyword) {
        String sql = "select count(*) from\n"
                + "(select q.*, s.subjectName, d.dimensionName, l.lessonName from Question q inner join Subject s\n"
                + "on q.subjectId = s.subjectId\n"
                + "inner join Dimension d on q.dimensionId = d.dimensionId\n"
                + "inner join Lesson l on q.lessonId = l.lessonId\n";
        if (keyword != null) {
            sql += "where q.questionContent like ? \n";
        }
        sql += ") as T";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword != null) {
                stm.setString(1, "%" + keyword + "%");
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<Subject> getAllSubject() {
        ArrayList<Subject> listSubject = new ArrayList<>();
        String sql = "select * from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(1));
                s.setSubjectName(rs.getString(2));
                listSubject.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSubject;
    }

    public ArrayList<Question> getQuesByQuizLesson(int quizid) {
        ArrayList<Question> list = new ArrayList<>();
        QuizDAO quizd = new QuizDAO();
        String sql = "    SELECT * FROM dbo.Question AS q JOIN dbo.QuizQuestion AS qq ON qq.questionId = q.questionId JOIN dbo.Quiz AS qi ON qi.quizId = qq.quizId\n"
                + "        WHERE qi.quizId = ? ORDER BY NEWID()";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("questionId"));
                q.setQuestionContent(rs.getString("questionContent"));
                q.setAnswer(getAnswer(rs.getInt("questionId")));
                q.setCorrectAnswer(quizd.getCorrectAnswer(rs.getInt("questionId")));
                list.add(q);
            }

            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Question> getQuesByQuiz(int quizid, int numberOfQ) {
        ArrayList<Question> list = new ArrayList<>();
        QuizDAO quizd = new QuizDAO();
        String sql = "    SELECT TOP " + numberOfQ + " * FROM dbo.Question AS q JOIN dbo.QuizQuestion AS qq ON qq.questionId = q.questionId JOIN dbo.Quiz AS qi ON qi.quizId = qq.quizId\n"
                + "        WHERE qi.quizId = " + quizid + " ORDER BY NEWID()";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("questionId"));
                q.setQuestionContent(rs.getString("questionContent"));
                q.setAnswer(getAnswer(rs.getInt("questionId")));
                q.setExplanation(rs.getString("explanation"));
                q.setCorrectAnswer(quizd.getCorrectAnswer(rs.getInt("questionId")));
                q.setImage(rs.getString("image"));
                list.add(q);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Lesson> getAllLesson() {
        ArrayList<Lesson> listLesson = new ArrayList<>();
        String sql = "select * from Lesson";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setLessonId(rs.getInt(1));
                l.setLessonName(rs.getString(3));
                listLesson.add(l);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listLesson;
    }

    public ArrayList<Dimension> getAllDimension() {
        ArrayList<Dimension> listDimension = new ArrayList<>();
        String sql = "select * from Dimension";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Dimension d = new Dimension();
                d.setDimensionId(rs.getInt(1));
                d.setDimensionName(rs.getString(2));
                listDimension.add(d);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listDimension;
    }

    //subjectId null, lessonId null, dimensionId null, status null
    public List<Question> searchQuestion(int subjectId, int lessonId, int dimensionId, int status) {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "select q.*, s.subjectName, d.dimensionName, l.lessonName from Question q inner join Subject s\n"
                    + "on q.subjectId = s.subjectId\n"
                    + "inner join Dimension d on q.dimensionId = d.dimensionId\n"
                    + "inner join Lesson l on q.lessonId = l.lessonId\n"
                    + "where (1=1)\n";

            HashMap<Integer, Object[]> parameters = new HashMap<>();
            int paramIndex = 0;
            if (subjectId != 0) {
                sql += " and q.subjectId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = subjectId;
                parameters.put(paramIndex, param);
            }
            if (lessonId != 0) {
                sql += "and q.lessonId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = lessonId;
                parameters.put(paramIndex, param);
            }
            if (dimensionId != 0) {
                sql += "and q.dimensionId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = dimensionId;
                parameters.put(paramIndex, param);
            }
            if (status != -1) {
                sql += "and q.status = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getTypeName();
                param[1] = status;
                parameters.put(paramIndex, param);
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> entry : parameters.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    statement.setInt(index, Integer.parseInt(value[1].toString()));
                }
            }
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt(1));
                q.setQuestionContent(rs.getString(3));
                q.setSubjectId(rs.getInt(2));
                q.setDimensionId(rs.getInt(4));
                q.setLessonId(rs.getInt(5));
                q.setStatus(rs.getBoolean(6));
                q.setSubjectName(rs.getString(11));
                q.setDimensionName(rs.getString(12));
                q.setLessonName(rs.getString(13));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

    public static void main(String[] args) {
        QuestionDAO db = new QuestionDAO();
        ArrayList<Question> list = db.getQuesByQuiz(1, 3);
        for (Question question : list) {

            System.out.println(question);
        }
//        ArrayList<Question> d = (ArrayList<Question>) db.searchQuestion(7, 5, 2, 1);
//        for (Question dimension : d) {
//            System.out.println(dimension);
//        }
//        db.insertQuestionMedia(6, "upload_6_pexels-fauxels-3183132.jpg", "", "");
//        System.out.println(db.searchQuestion(7, 5, 2, 1));

    }

    public ArrayList<Answer> getAnswer(int quesid) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Answer WHERE questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quesid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer a = new Answer();
                a.setAnswerId(rs.getInt("answerId"));
                a.setAnswerContent(rs.getString("answerContent"));
                a.setIsCorrect(rs.getBoolean("isCorrect"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Question getQuestionByQuesID(int qid) {
        String sql = "select * from Question where questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question(
                        rs.getInt("questionId"),
                        rs.getInt("subjectId"),
                        rs.getString("questionContent"),
                        rs.getInt("dimensionId"),
                        rs.getInt("lessonId"),
                        rs.getBoolean("status"),
                        rs.getString("image"),
                        rs.getString("audio"),
                        rs.getString("video"),
                        rs.getString("explanation"));
                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void insertQuestionMedia(int quesid, String img, String audio, String video) {
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [image] = ?\n"
                + "   ,[audio] = ?\n"
                + "   ,[video] = ?\n"
                + " WHERE questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
//            if (img != null) {
//                stm.setString(1, img);
//            } else {
//                stm.setString(1, "");
//            }
//            if (audio != null) {
//                stm.setString(2, audio);
//            } else {
//                stm.setString(2, "");
//            }
//            if (video != null) {
//                stm.setString(3, video);
//            } else {
//                stm.setString(3, "");
//            }

            stm.setString(1, img);
            stm.setString(2, audio);
            stm.setString(3, video);
            stm.setInt(4, quesid);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateQuestionDetail(int questid, int sub, int dimension, int lesson, String content,
            int status, String explain) {
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [subjectId] = ?\n"
                + "      ,[dimensionId] = ?\n"
                + "      ,[lessonId] = ?\n"
                + "	  ,[questionContent] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[explanation] = ?\n"
                + " WHERE questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sub);
            stm.setInt(2, dimension);
            stm.setInt(3, lesson);
            stm.setString(4, content);
            stm.setInt(5, status);
            stm.setString(6, explain);
            stm.setInt(7, questid);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Question> getQuesByQuizExamination(int quizid) {
        ArrayList<Question> list = new ArrayList<>();
        QuizDAO quizd = new QuizDAO();
        String sql = "    SELECT * FROM dbo.Question AS q JOIN dbo.QuizQuestion AS qq ON qq.questionId = q.questionId JOIN dbo.Quiz AS qi ON qi.quizId = qq.quizId\n"
                + "        WHERE qi.quizId = " + quizid + " ORDER BY NEWID()";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("questionId"));
                q.setQuestionContent(rs.getString("questionContent"));
                q.setAnswer(getAnswer(rs.getInt("questionId")));
                q.setExplanation(rs.getString("explanation"));
                q.setCorrectAnswer(quizd.getCorrectAnswer(rs.getInt("questionId")));
                q.setImage(rs.getString("image"));
                list.add(q);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    //for quiz review
    public ArrayList<Question> getQuesByQuiz(int quizid) {
        ArrayList<Question> list = new ArrayList<>();
        QuizDAO quizd = new QuizDAO();
        String sql = "SELECT * FROM dbo.Question WHERE questionId IN (SELECT DISTINCT(q.questionId) FROM dbo.Question AS q JOIN dbo.TakeAnswer AS ta ON ta.questionId = q.questionId WHERE ta.quizTakeId = ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("questionId"));
                q.setQuestionContent(rs.getString("questionContent"));
                q.setAnswer(getAnswer(rs.getInt("questionId")));
                q.setExplanation(rs.getString("explanation"));
                q.setCorrectAnswer(quizd.getCorrectAnswer(rs.getInt("questionId")));
                q.setMarkedAnswer(quizd.getMarkedAnswer(rs.getInt("questionId"), quizid));
                q.setImage(rs.getString("image"));
                list.add(q);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void insertImportedQuestion(Question q) {
        ArrayList<Answer> anwers = q.getAnswer();
        String sql = "INSERT INTO dbo.Question(subjectId, questionContent)\n"
                + "VALUES(?, \n"
                + "? )";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, q.getSubjectId());
            stm.setString(2, q.getQuestionContent());
            stm.executeUpdate();

            String sql_get_id = "select @@IDENTITY as questionId";
            PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);

            ResultSet rs = stm_get_id.executeQuery();
            int justInsertedQuesId = -1;
            if (rs.next()) {
                justInsertedQuesId = rs.getInt("questionId");
            }

            for (Answer anwer : anwers) {
                String sql2 = "INSERT INTO dbo.Answer(questionId, answerContent, isCorrect, status)\n"
                        + "VALUES(?, \n"
                        + "? , \n"
                        + "?, \n"
                        + "1\n"
                        + "    )";
                PreparedStatement stm_answer = connection.prepareStatement(sql2);
                stm_answer.setInt(1, justInsertedQuesId);
                stm_answer.setNString(2, anwer.getAnswerContent());
                stm_answer.setBoolean(3, anwer.isIsCorrect());
                stm_answer.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
