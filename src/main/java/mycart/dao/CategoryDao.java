/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mycart.dao;

import java.util.List;
import mycart.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    //save category to db
    
    public int saveCategory(Category cat)
    {
     Session session=this.factory.openSession();
          Transaction tx= session.beginTransaction();
          
          int catid=(int)session.save(cat);
          tx.commit();
          session.close();
          return catid;
    }
    public List<Category> getCategories()
    {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Category");
        List<Category> list=query.list();
        return list;
    }
    public Category getCategory(int cid){
         Category cat=null;
         try{
             Session session=this.factory.openSession();
             cat=session.get(Category.class, cid);
             session.close();
         }catch(Exception e)
         {
          e.printStackTrace();
         }
         return cat;
    }
}
