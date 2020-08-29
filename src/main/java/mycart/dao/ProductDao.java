/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mycart.dao;

import mycart.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DarkWorld
 */
public class ProductDao {
private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    public boolean saveProduct(Product product)
    {
      boolean f=false;
      try{
          Session session=this.factory.openSession();
          Transaction tx=session.beginTransaction();
          session.save(product);
          tx.commit();
          session.close();
      }catch(Exception e)
      {
       e.printStackTrace();
      }
      return f;
    }
}
