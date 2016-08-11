/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.mysql.cj.fabric.xmlrpc.base.Data;
import com.sv.udb.modelo.Pers;
import com.sv.udb.modelo.TipoPers;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author oscar
 */
@WebServlet(name = "PersServ", urlPatterns = {"/Personas"})
public class PersServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String CRUD = (request.getParameter("frmPers") == null) ? "" : request.getParameter("frmPers");
        if (!CRUD.equals("")) {
            if (CRUD.equals("Guardar")) {
                try {
                    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (isMultipart) {
                        
                        Date fecha_na = Date.valueOf(request.getParameter("fehanacimiento"));
                        Pers obje = new Pers(new Long(0), request.getParameter("txtNombPers"),
                                request.getParameter("txtApelPers"), request.getParameter("genero"),
                                fecha_na, request.getParameter("txtDUI"), request.getParameter("txtNIT"),
                                request.getParameter("txtSangre"),
                                new BigInteger(request.getParameter("cbbubicacion")),
                                null, null, null, new TipoPers(new Long(request.getParameter("tipopers")), "",
                                        null, null, null, null, null), null, null, null);
//                if(new CentrosCtrl().guar(obje)){
//                    response.setContentType("text/html; charset=UTF-8");
//                    PrintWriter out = response.getWriter();
//                    out.println("<script>$('#tabla').load('centro.jsp #tabla')</script>");
//                }
                    }
                } catch (Exception e) {
                    log(e.toString());
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
