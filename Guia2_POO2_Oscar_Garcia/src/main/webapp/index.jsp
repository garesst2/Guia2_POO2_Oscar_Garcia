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
                    <form >
                        <div class="row">
                            <div class="row">
                                <div class="medium-6 columns">
                                    <label>Nombre de Persona
                                        <input id="txtNombPers" type="text" placeholder="Nombre de la Perona" />
                                    </label>
                                </div>
                                <div class="medium-6 columns">
                                    <label>Apellido de PErsona
                                        <input id="txtApelPers" type="text" placeholder="Apellido de la Perona" />
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="medium-6 columns">
                                    <label for="Foto" class="button">Subir Foto</label>
                                    <input type="file" id="Foto" class="show-for-sr">
                                </div>
                                <div class="medium-6 columns">
                                    <label>Tipo de Persona
                                        <select>
                                            <option value="husker">Husker</option>
                                            <option value="starbuck">Starbuck</option>
                                            <option value="hotdog">Hot Dog</option>
                                            <option value="apollo">Apollo</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <fieldset class="large-6 columns">
                                    <legend>Genero de Persona</legend>
                                    <input type="radio" name="genero" value="M" id="generoM" required><label for="pokemonRed">Masculino</label>
                                    <input type="radio" name="genero" value="F" id="generoF"><label for="pokemonBlue">Femenino</label>
                                </fieldset>
                                <div class="large-6 column">
                                    <label>Fecha de Nacimiento
                                        <input type="date" id="feha">
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="large-6 column">
                                    <label>DUI
                                        <input id="txtDUI" type="text" placeholder="DUI" />
                                    </label>
                                </div>
                                <div class="large-6 column">
                                    <label>NIT
                                        <input id="txtNIT" type="text" placeholder="NIT" />
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="large-6 column">
                                    <label>Tipo Sangre
                                        <input id="txtSangre" type="text" placeholder="Tipo Sangre" />
                                    </label>
                                </div>
                                <div class="large-6 column">
                                    <label>Selecciona una ubicación
                                        <select id="cbb2">
                                            <option value="codigo">texto</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="large-centered">
                                    <button type="button" class="success button">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </center>


        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/vendor/jquery-dateFormat.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
