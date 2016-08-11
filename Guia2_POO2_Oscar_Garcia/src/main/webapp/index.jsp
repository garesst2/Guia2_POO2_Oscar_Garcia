<%@page import="java.io.FileInputStream"%>
<%@page import="com.lowagie.text.html.HtmlTags"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.UbicGeogCtrl"%>
<%@page import="com.sv.udb.controlador.TipoPersCtrl"%>
<%@page import="com.sv.udb.recursos.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guia 2 POO2</title>
        <link rel="stylesheet" href="css/foundation.css">
        <link rel="stylesheet" href="css/app.css">
    </head>
    <body>
        <center>
            <div class="row">
                <div class="large-12 column">
                    <h1>Registro de Personas</h1>
                </div>
            </div>
            <div class="row">
                <div class="large-5">
                    <form method="post" name="frmPers" action="" enctype="multipart/form-data">
                        <div class="row">
                            <div class="row">
                                <div class="medium-6 columns">
                                    <label>Nombre de Persona
                                        <input id="txtNombPers" name="txtNombPers" type="text" placeholder="Nombre de la Perona" />
                                    </label>
                                </div>
                                <div class="medium-6 columns">
                                    <label>Apellido de Persona
                                        <input id="txtApelPers" name="txtApelPers" type="text" placeholder="Apellido de la Perona" />
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="medium-6 columns">
                                    <br><br><br>
                                    <label for="txtimg1" class="button">Subir Foto</label>
                                    <input type="file" id="txtimg1" name="txtimg1" class="show-for-sr">                                    
                                </div>
                                <div class="medium-6 columns">
                                    <div class="row" id="list">
                                        <input type="image" name="ImageButton1" id="ImageButton1" src="img/camara.jpg" onclick="chooseFile();" style="height:196px;width:275px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <fieldset class="large-6 columns">
                                    <legend>Genero de Persona</legend>
                                    <input type="radio" name="genero" value="Masculino" id="generoM" required><label for="pokemonRed">Masculino</label>
                                    <input type="radio" name="genero" value="Femenino" id="generoF"><label for="pokemonBlue">Femenino</label>
                                </fieldset>
                                <div class="large-6 column">
                                    <label>Fecha de Nacimiento
                                        <input type="date" id="fehanacimiento" name="fehanacimiento">
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="large-6 column">
                                    <label>DUI
                                        <input id="txtDUI" name="txtDUI" type="text" placeholder="DUI" />
                                    </label>
                                </div>
                                <div class="large-6 column">
                                    <label>NIT
                                        <input id="txtNIT" name="txtNIT" type="text" placeholder="NIT" />
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="large-6 column">
                                    <label>Tipo Sangre
                                        <input id="txtSangre" name="txtSangre" type="text" placeholder="Tipo Sangre" />
                                    </label>
                                </div>
                                <div class="large-6 column">
                                    <jsp:useBean id="beanUbicGeoCtrl" class="com.sv.udb.controlador.UbicGeogCtrl" scope="page"/>
                                    <label>Selecciona una ubicación
                                        <select id="cbbubicacion" name="cbbubicacion">
                                            <c:forEach items="${beanUbicGeoCtrl.consTodo()}" var="fila">
                                                <option value="${fila.codiUbicGeog}">${fila.nombUbicGeog}</option>
                                            </c:forEach>   
                                        </select>
                                    </label>
                                </div>
                            </div>                            
                            <div class="row">
                                <div class="large-centered">
                                    <jsp:useBean id="beanTipoPersCtrl" class="com.sv.udb.controlador.TipoPersCtrl" scope="page"/>
                                    <label>Tipo de Persona
                                        <select id="tipopers" name="tipopers">
                                            <c:forEach items="${beanTipoPersCtrl.consTodo()}" var="fila">
                                                <option value="${fila.codiTipoPers}">${fila.nombTipoPers}</option>
                                            </c:forEach>   
                                        </select>
                                    </label>
                                    <input type="submit" class="success button" value="Guardar" name="Guardar" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </center>


        <script type="text/javascript">
            function chooseFile(input) {
                document.getElementById("txtimg1").click();
            }
        </script>
        <script>
            function archivo(evt) {
                var files = evt.target.files; // FileList object
                // Obtenemos la imagen del campo "file".
                for (var i = 0, f; f = files[i]; i++) {
                    //Solo admitimos imágenes.
                    if (!f.type.match('image.*')) {
                        continue;
                    }
                    var reader = new FileReader();
                    reader.onload = (function (theFile) {
                        return function (e) {
                            // Insertamos la imagen
                            document.getElementById("list").innerHTML = ['<input type="image" name="ImageButton1" id="ImageButton1" src="', e.target.result, '" onclick="chooseFile();" style="height:196px;width:275px;">'].join('');
                        };
                    })(f);
                    reader.readAsDataURL(f);
                }
            }

            document.getElementById('txtimg1').addEventListener('change', archivo, false);
        </script>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/vendor/jquery-dateFormat.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
