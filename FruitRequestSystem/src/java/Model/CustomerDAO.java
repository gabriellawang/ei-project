/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author gabriellawang
 */
public class CustomerDAO {
    public static Customer retrieveCustomer(String username){
        Customer cus = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            Connection conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from customers where username like ?;");
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String password = rs.getString(2);
                String name = rs.getString(3);
                String phone = rs.getString(4);
                cus = new Customer(username, password, name, phone);
            }
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return cus;
    }
}
