/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author hoadoan
 */
public class UserDAO {
    private static final String LOGIN="SELECT fullName, roleID, phone FROM tblUsers WHERE userID=? AND password=?";
    private static final String SEARCH="SELECT userID, fullName, phone, roleID FROM tblUsers WHERE fullName like ?";
    private static final String DELETE="DELETE tblUsers WHERE userID = ?";
    private static final String UPDATE="UPDATE tblUsers SET fullname=?, phone=?, roleID=? WHERE userID = ?";
    private static final String CREATE="INSERT INTO tblUsers(userID, fullName, phone, roleID, password) VALUES(?,?,?,?,?)";
    private static final String DUPLICATE="SELECT fullName FROM tblUsers WHERE userID=?";
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user= null;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs= ptm.executeQuery();
                if(rs.next()){
                    String fullName= rs.getString("fullName");
                    String roleID= rs.getString("roleID");
                    String phone = rs.getString("phone");
                    user= new UserDTO(userID, fullName, phone, roleID, "");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser= new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+ search+"%");
                rs= ptm.executeQuery();
                while(rs.next()){
                    String userID= rs.getString("userID");
                    String fullName= rs.getString("fullName");
                    String roleID= rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String password="***";
                    listUser.add(new UserDTO(userID, fullName, phone, roleID, password));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            
        }
        return listUser;
    }

    public boolean delete(String userID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    public boolean update(UserDTO user) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getPhone());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getUserID());
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    public boolean create(UserDTO user) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CREATE);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPhone());
                ptm.setString(4, user.getRoleID());
                ptm.setString(5, user.getPassword());
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (ClassNotFoundException | SQLException e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DUPLICATE);
                ptm.setString(1, userID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    public boolean createV2 (UserDTO user) throws SQLException{
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CREATE);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPhone());
                ptm.setString(4, user.getRoleID());
                ptm.setString(5, user.getPassword());
                check= ptm.executeUpdate()>0?true:false;
            }
        } catch (ClassNotFoundException | SQLException e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
}
