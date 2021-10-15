/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Minky
 */
public abstract class DAO {
    protected static Connection con;
    
    static{
        try {
            con = DBConnection.makeConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
