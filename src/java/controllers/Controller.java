/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import hibernate.HibernateUtil;
import hibernate.User;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import org.hibernate.Session;

/**
 *
 * @author MAKSA
 */
@ManagedBean(name = "controller")
@SessionScoped
public class Controller {
    
    public void method() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        User user = new User();
        user.setEmail("moze puta dva");
        session.save(user);
        session.getTransaction().commit();
    }
    
}
