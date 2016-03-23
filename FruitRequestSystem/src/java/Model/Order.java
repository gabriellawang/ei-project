/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author gabriellawang
 */
public class Order {

    private String pkgName;
    private double unitPrice;
    private int qty;

    public Order(String pkgName, double unitPrice, int qty) {
        this.pkgName = pkgName;
        this.unitPrice = unitPrice;
        this.qty = qty;
    }

    public String getPkgName() {
        return pkgName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getQty() {
        return qty;
    }

}
