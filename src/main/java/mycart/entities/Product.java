/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Product {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int Pid;
private String pName;
@Column(length=1000)
private String pDesc;
private int pPrice;
private int pDiscount;
private int pQuantity;
@ManyToOne
private Category category;
private String pPhoto;

    public Product() {
    }

    public Product(int Pid, String pName, String pDesc, int pPrice, int pDiscount, int pQuantity,String pPhoto) {
        this.Pid = Pid;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pPhoto=pPhoto;
    }

    public Product(String pName, String pDesc, int pPrice, int pDiscount, int pQuantity,Category category,String pPhoto) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category=category;
        this.pPhoto=pPhoto;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
//    public int getPriceAfterApplyingDiscount(){
//      
//     int discount=(int)((this.getpDiscount()/100.0)*this.getpPrice());
//    
//     return this.getpPrice()-discount;
//    }
    @Override
    public String toString() {
        return "Product{" + "Pid=" + Pid + ", pName=" + pName + ", pDesc=" + pDesc + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
}
