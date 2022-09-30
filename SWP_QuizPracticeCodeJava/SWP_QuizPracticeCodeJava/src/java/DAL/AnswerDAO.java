package DAL;

import Models.Answer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AnswerDAO extends DBContext {

    public ArrayList<Answer> getAnswerByQuesID(int qid) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "select * from Answer where questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer a = new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int countAnswerOfAQuest(int qid) {
        String sql = "select count(answerId) from Answer where questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int countCorrectAnswerOfAQuest(int qid) {
        String sql = "select count(answerId) from Answer where questionId = ? and isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public void addNewAnswerToQuestion(int qid, String content, int isCorrect, int status) {
        try {
            String sql = "INSERT INTO [dbo].[Answer]\n"
                    + "           ([questionId]"
                    + "           ,[answerContent]\n"
                    + "           ,[isCorrect],[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, qid);
            stm.setString(2, content);
            stm.setInt(3, isCorrect);
            stm.setInt(4, status);
            stm.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void editAnswer(int aid, String content, int isCorrect, int status) {
        try {
            String sql = "UPDATE [dbo].[Answer]\n"
                    + "   SET [answerContent] = ?\n"
                    + "      ,[isCorrect] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE answerId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, content);
            stm.setInt(2, isCorrect);
            stm.setInt(3, status);
            stm.setInt(4, aid);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        AnswerDAO adao = new AnswerDAO();
        ArrayList<Answer> list = adao.getAnswerByQuesID(6);
        for (Answer a : list) {
            System.out.println(a.isStatus());
        }
//        int ans = adao.countAnswerOfAQuest(12);
//        System.out.println(ans);
    }
}
