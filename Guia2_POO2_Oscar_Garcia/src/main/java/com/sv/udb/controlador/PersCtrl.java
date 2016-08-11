/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.mysql.cj.core.util.Util;
import com.sv.udb.modelo.Pers;
import com.sv.udb.recursos.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author oscar
 */
public class PersCtrl {
    
    public boolean guar(Pers obje){
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try{
            String Consulta = "INSERT INTO `pers` (`CODI_PERS`, `NOMB_PERS`, `APEL_PERS`, "
                    + "`CODI_TIPO_PERS`, `GENE_PERS`, `FECH_NACI_PERS`, `DUI_PERS`, `NIT_PERS`,"
                    + " `TIPO_SANG_PERS`, `CODI_UBIC_GEOG`, `FECH_ALTA`, `FECH_BAJA`, `ESTA`, FOTO_PERS) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement cmd = cn.prepareStatement(Consulta);
//            cmd.setString(1, obje.getNombMarc());
            Pers a = (Pers) new PersCtrl().ultimoReg();
            cmd.setLong(1, a.getCodiPers()+1);
            cmd.setString(2, obje.getNombPers());
            cmd.setString(3, obje.getApelPers());
            cmd.setLong(4, obje.getTipoPers().getCodiTipoPers());
            cmd.setString(5, obje.getGenePers());
            cmd.setDate(6, obje.getFechNaciPers());
            cmd.setString(7, obje.getDuiPers());
            cmd.setString(8, obje.getNitPers());
            cmd.setString(9, obje.getTipoSangPers());
            cmd.setInt(10, obje.getCodiUbicGeog().intValue());
            cmd.setDate(11, new Date(new java.util.Date().getDate()));
            cmd.setDate(12, null);
            cmd.setBytes(13, obje.getFotoPers());
            cmd.executeUpdate();
            resp = true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            if(cn!= null){
                try{
                    if(!cn.isClosed()){
                        cn.close();
                    }
                }catch(SQLException ex){
                     ex.printStackTrace();
                }
            }
        }
        return resp;
    }
    
    public List<Pers> ultimoReg()
    {
        List<Pers> resp = new ArrayList<>();
        Connection cn = new Conexion().getConn();
        try
        {
            String consulta = "SELECT CODI_PERS FROM pers";
            PreparedStatement cmd = cn.prepareStatement(consulta);
            ResultSet rs = cmd.executeQuery();
            while(rs.last())
            {
                Pers modelo = new Pers() ;
                modelo.setCodiPers(rs.getLong(1));
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
    
    public List<Pers> consTodo()
    {
        List<Pers> resp = new ArrayList<>();
        Connection cn = new Conexion().getConn();
        try
        {
            String consulta = "SELECT CODI_PERS FROM pers";
            PreparedStatement cmd = cn.prepareStatement(consulta);
            ResultSet rs = cmd.executeQuery();
            while(rs.last())
            {
                Pers modelo = new Pers() ;
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
