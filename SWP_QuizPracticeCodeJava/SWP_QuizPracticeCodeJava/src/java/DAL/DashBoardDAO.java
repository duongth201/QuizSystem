/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Subject;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class DashBoardDAO extends DBContext {

    public int getCountRegistration(int status, Date regTimeStart, Date regTimeEnd) {
        String sql = "select count(*) from Registration where status = ? and regTime >= ? and regTime <= ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setDate(2, regTimeStart);
            stm.setDate(3, regTimeEnd);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getCountRegistrationUserCustomer(Date regTimeStart, Date regTimeEnd, int subjectId) {
        String sql = "select count(Distinct r.userId ) from Registration r inner join [User] u\n"
                + " on r.userId = u.userId where roleId = 5 and regTime >= ? and regTime <= ? and subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, regTimeStart);
            stm.setDate(2, regTimeEnd);
            stm.setInt(3, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int getCountRegistrationUserCustomerAndStatus(Date regTimeStart, Date regTimeEnd, int subjectId) {
        String sql = "select count(Distinct r.userId ) from Registration r inner join [User] u\n"
                + " on r.userId = u.userId where roleId = 5 and regTime >= ? and regTime <= ? and subjectId = ? and r.status = 1 ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, regTimeStart);
            stm.setDate(2, regTimeEnd);
            stm.setInt(3, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<String> getSubjectName() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "select subjectId, subjectName from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                list.add(rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public int getTrendOrderRegistration(String regTime) {
        String sql = "select count(Distinct userId) from Registration where regTime = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, regTime);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int getTrendOrderRegistrationStatus(String regTime) {
        String sql = "select count(Distinct userId) from Registration where regTime = ? and status = 1 ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, regTime);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int countSubject(Date regTimeStart, Date regTimeEnd) {
        String sql = "select count(subjectName) from Subject where updatedDate >= ? and updatedDate <= ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, regTimeStart);
            stm.setDate(2, regTimeEnd);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int countUser(Date regTimeStart, Date regTimeEnd) {
        String sql = "select count(userId) from [User] where roleId = 5 and createdTimeResetToken >= ? and createdTimeResetToken <= ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, regTimeStart);
            stm.setDate(2, regTimeEnd);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int countCostRegistration(Date regTimeStart, Date regTimeEnd) {
        String sql = "select sum(cost) from Registration where regTime >= ? and regTime <= ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, regTimeStart);
            stm.setDate(2, regTimeEnd);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        DashBoardDAO dao = new DashBoardDAO();
        //System.out.println(dao.countSubject("2022-07-01"));
    }
}
