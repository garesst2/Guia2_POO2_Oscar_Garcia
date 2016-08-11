/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.UbicGeog;
import com.sv.udb.recursos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *s
 * @author oscar
 */
public class UbicGeogCtrl {
    
    public List<UbicGeog> consTodo()
    {
        List<UbicGeog> resp = new ArrayList<>();
        Connection cn = new Conexion().getConn();
        try
        {
            String consulta = "SELECT NOMB_UBIC_GEOG, CODI_UBIC_GEOG FROM ubic_geog";
            PreparedStatement cmd = cn.prepareStatement(consulta);
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                UbicGeog modelo = new UbicGeog() ;
                modelo.setCodiUbicGeog(rs.getLong(2));
                modelo.setNombUbicGeog(rs.getString(1));
                resp.add(modelo);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            if(cn != null)
            {
                try
                {
                    if(cn.isClosed())
                    {
                        cn.close();
                    }
                }
                catch(SQLException ex)
                {
                    ex.printStackTrace();
                }
            }
        }     
        return resp;
    }
    
}
