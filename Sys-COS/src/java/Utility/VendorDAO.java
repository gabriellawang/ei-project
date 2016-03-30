/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author gabriellawang
 */
public class VendorDAO {
    public static String retrieveFullName(String name) {
        String dbURL = "jdbc:mysql://localhost:3306/sys-ven";
        String userName = "root";
        String password = "";
        java.sql.Connection dbConn = null;
        String fullName = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            dbConn = DriverManager.getConnection(dbURL, userName, password);
            
            stmt = dbConn.prepareStatement("select name from vendors where id like ?;");
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            while (rs.next()) {
                fullName = rs.getString(1);
            }
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(InstantiationException e){
            e.printStackTrace();
        }catch(IllegalAccessException e){
            e.printStackTrace();
        }
        return fullName;
    }
}
