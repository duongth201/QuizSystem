/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Category;
import Models.Expert;
import Models.FeedBack;
import Models.PricePackage;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class SubjectDAO extends DBContext {

    public ArrayList<Subject> getAllSubjects() {
        ArrayList<Subject> list = new ArrayList<>();
//        String sql = "select Subject.*, Category.* from Subject\n"
//                + "join SubjectCategory on Subject.subjectId = SubjectCategory.subjectId\n"
//                + "join Category on Category.catId = SubjectCategory.catId\n"
//                + "where Subject.featured = 1";
        String sql = "select * from [Subject] as s join SubjectCategory as sc on s.subjectId = sc.subjectId join Category as c on c.catId = sc.catId where s.featured = 1";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        new Category(rs.getInt(8), rs.getString("catName")));
                list.add(s);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Subject> getSubjectNameAndSubjectID() {
        ArrayList<Subject> list = new ArrayList<>();
        String sql = "select subjectId, subjectName from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectId(rs.getInt(1));
                subject.setSubjectName(rs.getString(2));
                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> getFeaturedSubjectWithAuthor() {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT Subject.subjectId, Subject.subjectName, [User].fullName\n"
                + "FROM  dbo.Expert INNER JOIN\n"
                + "         dbo.Subject ON dbo.Expert.subjectId = dbo.Subject.subjectId INNER JOIN\n"
                + "         dbo.[User] ON dbo.Expert.userId = dbo.[User].userId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3)/* expertName */);
                /* updatedDate */
                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> searchCourse(String keyword) {
        List<Subject> listSearch = new ArrayList<>();
        String sql = "select s.*,p.listPrice,p.salePrice, p.duration from Subject s \n"
                + "join PricePackage p on s.subjectId = p.subjectId\n"
                + "where duration = (select MIN(duration) from PricePackage)\n"
                + "and subjectName like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)));
                listSearch.add(subject);
            }
            return listSearch;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSearch;
    }

    public int getTotalSubjectByCategory_ID(int categoryID) {
        String sql = "select COUNT(subjectId) from SubjectCategory where catId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalSubject() {
        String sql = "select COUNT(subjectId) from Subject where status = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Subject> getAllSubjectsWithPrice() {
        List<Subject> list = new ArrayList<>();
        String sql = "select s.*,p.listPrice,p.salePrice, p.duration from Subject s \n"
                + "join PricePackage p on s.subjectId = p.subjectId\n"
                + "where duration = (select MIN(duration) from PricePackage) and s.status = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)));
                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> getSubjectWithPriceInPagingByCatID(int page, int PAGE_SIZE, int catID) {
        List<Subject> list = new ArrayList<>();
        String sql = "select s.*,p.listPrice,p.salePrice, p.duration from Subject s \n"
                + "join PricePackage p on s.subjectId = p.subjectId\n"
                + "join SubjectCategory c on s.subjectId = c.subjectId\n"
                + "where catId=? and duration = (select MIN(duration) from PricePackage) and s.status = 1\n"
                + "order by updatedDate\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, catID);
            stm.setInt(2, page);
            stm.setInt(3, PAGE_SIZE);
            stm.setInt(4, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)));
                list.add(subject);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> getAllSubjectsWithPriceInPaging(String order, int page, int PAGE_SIZE) {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT s.*,p.listPrice,p.salePrice, p.duration, c.catName\n"
                + "FROM dbo.Subject s INNER JOIN\n"
                + "dbo.PricePackage p ON s.subjectId = p.subjectId INNER JOIN\n"
                + "dbo.SubjectCategory sc ON s.subjectId = sc.subjectId INNER JOIN\n"
                + "dbo.Category c ON sc.catId = c.catId\n"
                + "where duration = (select MIN(duration) from PricePackage) and s.status = 1\n"
                + "order by updatedDate " + order + "\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category();
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)), new Category(rs.getString(11)));
                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> getAllSubjectsWithPriceInPagingASC(int page, int PAGE_SIZE) {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT s.*,p.listPrice,p.salePrice, p.duration, c.catName\n"
                + "FROM dbo.Subject s INNER JOIN\n"
                + "dbo.PricePackage p ON s.subjectId = p.subjectId INNER JOIN\n"
                + "dbo.SubjectCategory sc ON s.subjectId = sc.subjectId INNER JOIN\n"
                + "dbo.Category c ON sc.catId = c.catId\n"
                + "where duration = (select MIN(duration) from PricePackage) and s.status = 1\n"
                + "order by updatedDate ASC\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category();
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)), new Category(rs.getString(11)));
                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> getAllSubjectsWithPriceInPagingDESC(int page, int PAGE_SIZE) {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT s.*,p.listPrice,p.salePrice, p.duration, c.catName\n"
                + "FROM     dbo.Subject s INNER JOIN\n"
                + "dbo.PricePackage p ON s.subjectId = p.subjectId INNER JOIN\n"
                + "dbo.SubjectCategory sc ON s.subjectId = sc.subjectId INNER JOIN\n"
                + "dbo.Category c ON sc.catId = c.catId\n"
                + "where duration = (select MIN(duration) from PricePackage) and s.status = 1\n"
                + "order by updatedDate DESC\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)), new Category(rs.getString(11)));

                list.add(subject);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Subject> FilterSubject(String[] category, String search, String from, String to, String order, int page, int PAGE_SIZE) {
        List<Subject> listSearch = new ArrayList<>();

        String sql = " SELECT s.*,p.listPrice,p.salePrice, p.duration, c.catName, c.catId\n"
                + "FROM dbo.Subject s INNER JOIN\n"
                + "dbo.PricePackage p ON s.subjectId = p.subjectId INNER JOIN\n"
                + "dbo.SubjectCategory sc ON s.subjectId = sc.subjectId INNER JOIN\n"
                + "dbo.Category c ON sc.catId = c.catId\n"
                + "where duration = (select MIN(duration) from PricePackage) and s.status = 1\n";
        try {

            //select * from [subject] where (1=1) and subjectId in (4,5,7)
            HashMap<Integer, Object[]> parameters = new HashMap<>();

            int paramIndex = 0;
            if (search != null && !search.equals("")) {
                sql += " and s.subjectName like ?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = "%" + search + "%";
                parameters.put(paramIndex, param);
            }
            if (category != null && !category[0].equals("")) {
                String categoryList = "(";
                for (int i = 0; i < category.length - 1; i++) {
                    categoryList += category[i] + ",";
                }
                categoryList += category[category.length - 1] + ")";
                sql += " and c.catId in " + categoryList + "";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = Integer.class.getTypeName();
//                param[1] = category;
//                parameters.put(paramIndex, param);
            }

            if (from != null && !from.equals("")) {
                sql += " and s.updatedDate > ?";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = from;
                parameters.put(paramIndex, param);
            }

            if (to != null && !to.equals("")) {
                sql += " and s.updatedDate < ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = String.class.getTypeName();
                param[1] = to;
                parameters.put(paramIndex, param);
            }

            sql += " order by s.updatedDate " + order + "\n"
                    + "offset (" + page + "-1)*" + PAGE_SIZE + " row fetch next " + PAGE_SIZE + " rows only";
            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object[]> entry : parameters.entrySet()) {
                //select * from [subject] where (1=1) and subjectName like ? and description like ? and subjectId > ?
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();

                if (type.equals(Integer.class.getName())) {
                    stm.setInt(index, Integer.parseInt(value[1].toString()));
                } else if (type.equals(String.class.getName())) {
                    stm.setString(index, value[1].toString());
                }

            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getString(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getBoolean(6), /* status */
                        rs.getDate(7), /* updatedDate */
                        new PricePackage(rs.getDouble(8), rs.getDouble(9), rs.getInt(10)), new Category(rs.getString(11)));
                subject.getCat().setCatId(rs.getInt(12));
                listSearch.add(subject);
            }
            return listSearch;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSearch;
    }

    public ArrayList<FeedBack> getFeedBack(int subjectId) {
        ArrayList<FeedBack> exlist = new ArrayList<FeedBack>();
        try {
            String sql = "SELECT * FROM [Subject] AS s JOIN dbo.Review AS r ON r.subjectId = s.subjectId JOIN dbo.[User] AS u ON u.userId = r.userId WHERE s.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                FeedBack e = new FeedBack();
                e.setSubjectId(rs.getInt("subjectId"));
                e.setUserId(rs.getInt("userId"));
                e.setContent(rs.getString("content"));
                e.setFullName(rs.getString("fullName"));
                e.setImg(rs.getString("profilePic"));
                exlist.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exlist;
    }

    public ArrayList<Subject> getAllSubject() {
        ArrayList<Subject> list = new ArrayList<>();
//        String sql = "select Subject.*, Category.* from Subject\n"
//                + "join SubjectCategory on Subject.subjectId = SubjectCategory.subjectId\n"
//                + "join Category on Category.catId = SubjectCategory.catId\n"
//                + "where Subject.featured = 1";
        String sql = "select top 3 * from [Subject] as s join SubjectCategory as sc on s.subjectId = sc.subjectId join Category as c on c.catId = sc.catId where s.featured = 1";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        new Category(rs.getInt(8), rs.getString("catName")));
                list.add(s);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        SubjectDAO dao = new SubjectDAO();
        String a[] = null;
        List<Subject> list = dao.FilterSubject(a, "pre", "", "", "DESC", 1, 4);
        for (Subject subject : list) {
            System.out.println(subject);
        }
    }

    public Subject getSubjectById(int sid) {
        LessonDAO ld = new LessonDAO();
        PricePackageDAO price = new PricePackageDAO();
        TagDAO tag = new TagDAO();
        try {
            String sql = "select * from [subject] as s join dbo.SubjectCategory AS sc ON sc.subjectId = s.subjectId JOIN dbo.Category AS c ON  c.catId = sc.catId WHERE s.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject d = new Subject();
                d.setSubjectId(rs.getInt("subjectId"));
                d.setSubjectName(rs.getString("subjectName"));
                d.setDescription(rs.getString("description"));
                d.setFeatured(rs.getBoolean("featured"));
                d.setStatus(rs.getBoolean("status"));
                d.setThumbnailURL(rs.getString("thumbnailURL"));
                d.setExpert(getAllExpertBySubject(sid));
                d.setLesson(ld.getElem(sid));
                d.setCategory(new Category(rs.getInt("catId"), rs.getString("catName")));
                d.setTag(tag.getTagBySubjectId(sid));
                d.setPricePackage(price.getPricePackageBySubject(sid));
                d.setTotalLesson(ld.countLessonBySubjectId(sid));
                d.setFeedBack(getFeedBack(sid));
                return d;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Subject getSubjectWithOwnerById(int sid) {
        LessonDAO ld = new LessonDAO();
        PricePackageDAO price = new PricePackageDAO();
        TagDAO tag = new TagDAO();
        try {
            String sql = "select s.*, c.*, e.userId, u.fullName from subject as s join SubjectCategory as sc \n"
                    + "                    on s.subjectId = sc.subjectId\n"
                    + "                    join Category as c on sc.catId = c.catId\n"
                    + "                    join Expert e on e.subjectId = s.subjectId\n"
                    + "                    join [User] u on u.userId = e.userId\n"
                    + "                    where s.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        new Category(rs.getInt(8), rs.getString(9)),
                        rs.getInt(10),
                        rs.getString(11));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Expert> getAllExpertBySubject(int subjectId) {
        ArrayList<Expert> exlist = new ArrayList<Expert>();
        try {
            String sql = "SELECT * FROM expert AS e JOIN [user] AS u ON u.userId = e.userId WHERE subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Expert e = new Expert();
                e.setExpertId(rs.getInt("userId"));
                e.setExpertName(rs.getString("fullName"));
                e.setImg(rs.getString("profilePic"));
                exlist.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exlist;
    }

    public ArrayList<Subject> getFeaturedSubject() {
        ArrayList<Subject> listsubject = new ArrayList<>();
        try {
            String sql = "select * from subject as s join category as c on s.subjectId = c.catId where featured = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject d = new Subject();
                d.setSubjectId(rs.getInt("subjectId"));
                d.setSubjectName(rs.getString("subjectName"));
                d.setDescription(rs.getString("description"));
                d.setFeatured(rs.getBoolean("featured"));
                d.setStatus(rs.getBoolean("status"));
                d.setThumbnailURL(rs.getString("thumbnailURL"));
                d.setCategory(new Category(rs.getInt("catId"), rs.getString("catName")));
                listsubject.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listsubject;
    }

    public ArrayList<Subject> getLastestSubject(int sid) {
        ArrayList<Subject> listsubject = new ArrayList<>();
        PricePackageDAO price = new PricePackageDAO();
        LessonDAO ldao = new LessonDAO();
        try {
            String sql = "SELECT TOP 3 * FROM subject as s join category as c on s.subjectId = c.catId WHERE subjectId != ? ORDER BY updatedDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject d = new Subject();
                d.setSubjectId(rs.getInt("subjectId"));
                d.setSubjectName(rs.getString("subjectName"));
                d.setDescription(rs.getString("description"));
                d.setFeatured(rs.getBoolean("featured"));
                d.setStatus(rs.getBoolean("status"));
                d.setThumbnailURL(rs.getString("thumbnailURL"));
                d.setCategory(new Category(rs.getInt("catId"), rs.getString("catName")));
                d.setPricePackage(price.getPricePackageBySubject(sid));
                d.setTotalLesson(ldao.countLessonBySubjectId(sid));
                listsubject.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listsubject;
    }

    public void updateSubject(String subjectName, String description, boolean featured, boolean status, int subjectID) {
        try {
            String sql = "UPDATE [dbo].[Subject]\n"
                    + "   SET [subjectName] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[featured] = ?\n"
                    + "      ,[status] = ?\n"
                    + "      ,[updatedDate] = GETDATE()\n"
                    + " WHERE subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subjectName);
            stm.setString(2, description);
            stm.setBoolean(3, featured);
            stm.setBoolean(4, status);
            stm.setInt(5, subjectID);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }

    public void updateSubjectThumbnail(String thumbnailURL, int subjectID) {
        try {
            String sql = "UPDATE [dbo].[Subject]\n"
                    + "   SET [thumbnailURL] = ?\n"
                    + " WHERE subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "img/courses/" + thumbnailURL);
            stm.setInt(2, subjectID);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Subject> getSubject() {
        ArrayList<Subject> list = new ArrayList<>();
        String sql = "select * from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(1));
                s.setSubjectName(rs.getString(2));
                list.add(s);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalFilteredSubject(String keyword, int roleId, int userId, int catId, int status) {
        try {
            String sql = "select COUNT(*) from (select s.subjectId, s.subjectName, c.catId, c.catName, e.userId, u.fullName, s.[status], COUNT(lessonId) as [Number of lesson]\n"
                    + "from Subject s left join SubjectCategory sc on s.subjectId = sc.subjectId\n"
                    + "left join Category c on sc.catId = c.catId\n"
                    + "left join Lesson l on l.subjectId = s.subjectId\n"
                    + "left join Expert e on e.subjectId = s.subjectId\n"
                    + "left join [User] u on u.userId = e.userId\n where s.subjectId > -1"
                    + "and (s.subjectName like ? or c.catName like ? or u.fullName like ?)\n";
            if (userId == 0 || roleId == 1) {
                sql += "";
            } else {
                sql += " and u.userId = " + userId;
            }
            if (catId == 12) {
                sql += "";
            } else {
                sql += " and c.catId = " + catId;
            }

            if (status == 2) {
                sql += "";
            } else {
                sql += " and s.status = " + status;
            }

            sql += "group by s.subjectId, s.subjectName, c.catId, c.catName, e.userId, u.fullName, s.[status], updatedDate) as t";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            stm.setString(2, "%" + keyword + "%");
            stm.setString(3, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Subject> filterSubjectInPaging(String keyword, int roleId, int userId, int catId, int status, int pageIndex, int pageSize) {
        List<Subject> list = new ArrayList<>();
        try {
            String sql = "select s.subjectId, s.subjectName, c.catId, c.catName, e.userId, u.fullName, s.[status], COUNT(lessonId) as [Number of lesson]\n"
                    + "from Subject s left join SubjectCategory sc on s.subjectId = sc.subjectId\n"
                    + "left join Category c on sc.catId = c.catId\n"
                    + "left join Lesson l on l.subjectId = s.subjectId\n"
                    + "left join Expert e on e.subjectId = s.subjectId\n"
                    + "left join [User] u on u.userId = e.userId\n where s.subjectId > -1";

            if (userId == 0 || roleId == 1) {
                sql += "";
            } else {
                sql += " and u.userId = " + userId;
            }
            if (catId == 12) {
                sql += "";
            } else {
                sql += " and c.catId = " + catId;
            }

            if (status == 2) {
                sql += "";
            } else {
                sql += " and s.status = " + status;
            }

            sql += "and (s.subjectName like ? or c.catName like ? or u.fullName like ?)\n" + "group by s.subjectId, s.subjectName, c.catId, c.catName, e.userId, u.fullName, s.[status], updatedDate order by updatedDate DESC offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            stm.setString(2, "%" + keyword + "%");
            stm.setString(3, "%" + keyword + "%");
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            stm.setInt(6, pageSize);
//            System.out.println(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        new Category(rs.getInt(3), rs.getString(4)), /* thumbnailURL */
                        rs.getInt(5), /* featured */
                        rs.getString(6), /* status */
                        rs.getBoolean(7), /* updatedDate */
                        rs.getInt(8));
                list.add(subject);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalAdminSubject() {
        String sql = "select COUNT(s.subjectId) as [Number of lesson]\n"
                + "from Subject s";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getLatestInsertedSubject() {
        String sql = "select TOP (1) subjectId from Subject order by updatedDate DESC";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void insertSubject(String subjectName, String description, String imgURL, String featured, String status) {
        try {
            String sql = "INSERT INTO [dbo].[Subject]\n"
                    + "           ([subjectName]\n"
                    + "           ,[description]\n"
                    + "           ,[thumbnailURL]\n"
                    + "           ,[featured]\n"
                    + "           ,[status]\n"
                    + "           ,[updatedDate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,GETDATE())";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, subjectName);
            statement.setString(2, description);
            statement.setString(3, imgURL);
            statement.setString(4, featured);
            statement.setString(5, status);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertSubjectCategory(int subjectId, int catId) {
        try {
            String sql = "INSERT INTO [dbo].[SubjectCategory]\n"
                    + "           ([catId]\n"
                    + "           ,[subjectId])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, catId);
            statement.setInt(2, subjectId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertSubjectExpert(int subjectId, int userId) {
        try {
            String sql = "INSERT INTO [dbo].[Expert]\n"
                    + "           ([userId]\n"
                    + "           ,[subjectId])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, subjectId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
