package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabriellawang
 */
public class Order {
    
    private String orderID;
    private String deliveryID;
    private String status;

    public Order(String orderID, String deliveryID, String status) {
        this.orderID = orderID;
        this.deliveryID = deliveryID;
        this.status = status;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getDeliveryID() {
        return deliveryID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
