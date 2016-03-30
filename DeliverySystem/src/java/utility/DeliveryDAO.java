/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author gabriellawang
 */
public class DeliveryDAO {
    public static boolean validateUser(String dID, String password){
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean result = false;
        try{
            Connection conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from info where id like ? and password like ?;");
            stmt.setString(1, dID);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            while (rs.next()) {
                result = true;
            }
            stmt.close();
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}
