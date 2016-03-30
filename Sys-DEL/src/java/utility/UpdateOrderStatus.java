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
import java.util.ArrayList;
import model.Order;

/**
 *
 * @author gabriellawang
 */
public class UpdateOrderStatus {
    
    public static ArrayList<Order> getUnstartedOrder(String dID){
        ArrayList<Order> oList = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            Connection conn = ConnectionManager.getConnection();
            oList = new ArrayList<>();
            stmt = conn.prepareStatement("select * from deliverylog where status='unstarted' and deliveryID like ?;");
            stmt.setString(1, dID);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String oID = rs.getString(1);
                String delID = rs.getString(2);
                oList.add(new Order(oID, delID, "unstarted"));
            }
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return oList;
    }
    
    public static ArrayList<Order> getStartedOrder(String dID){
        ArrayList<Order> oList = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            Connection conn = ConnectionManager.getConnection();
            oList = new ArrayList<>();
            stmt = conn.prepareStatement("select * from deliverylog where status like 'started' and deliveryID like ?;");
            stmt.setString(1, dID);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String oID = rs.getString(1);
                String delID = rs.getString(2);
                oList.add(new Order(oID, delID, "started"));
            }
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return oList;
    }
    
    public static ArrayList<Order> getFinishedOrder(String dID){
        ArrayList<Order> oList = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            Connection conn = ConnectionManager.getConnection();
            oList = new ArrayList<>();
            stmt = conn.prepareStatement("select * from deliverylog where status like 'finished' and deliveryID like ?;");
            stmt.setString(1, dID);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String oID = rs.getString(1);
                String delID = rs.getString(2);
                oList.add(new Order(oID, delID, "finished"));
            }
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return oList;
    }
    
    public static void UpdateStatus(String orderID, String status){
        PreparedStatement stmt = null;
        try{
            Connection conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("UPDATE deliverylog SET status=? WHERE orderID like ?");
            stmt.setString(1, status);
            stmt.setString(2, orderID);
            stmt.execute();
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
}
