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
public class Vendor {
    
    private String name;
    private ArrayList<Package> pkgList;

    public Vendor() {
        pkgList = new ArrayList<>();
    }

    public Vendor(String name) {
        this.name = name;
        pkgList = new ArrayList<>();
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPkgList(ArrayList<Package> pkgList) {
        this.pkgList = pkgList;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Package> getPkgList() {
        return pkgList;
    }
    
    public void addPkg(Package pkg){
        pkgList.add(pkg);
    }
    
}
