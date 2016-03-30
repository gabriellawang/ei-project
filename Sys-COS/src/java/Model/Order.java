/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author gabriellawang
 */
public class Order {

    private String vendorName;
    private ArrayList<Package> items = new ArrayList<Package>();

    public Order(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorName() {
        return vendorName;
    }

    public ArrayList<Package> getItems() {
        return items;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public void addItems(Package p) {
        items.add(p);
    }

}
