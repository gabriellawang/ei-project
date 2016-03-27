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
    private String fullName;
    private ArrayList<Package> pkgList;

    public Vendor() {
        fullName = "";
        pkgList = new ArrayList<>();
    }

    public Vendor(String name) {
        this.name = name;
        fullName = "";
        pkgList = new ArrayList<>();
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPkgList(ArrayList<Package> pkgList) {
        this.pkgList = pkgList;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getName() {
        return name;
    }

    public ArrayList<Package> getPkgList() {
        return pkgList;
    }

    public String getFullName() {
        return fullName;
    }

    public void addPkg(Package pkg) {
        pkgList.add(pkg);
    }

}
