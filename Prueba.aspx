<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="Proyecto_Final_Diseño_.Prueba" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Información de Reportes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #4D6C8B;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .barra-superior {
            height: 60px;
            background: linear-gradient(135deg, #89C4F4 0%, #6BB9F0 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
            color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .contenedor {
            flex: 1;
            display: flex;
            min-height: 0;
        }

        /* Barra lateral blanca */
        .menu-lateral {
            width: 160px;
            background: linear-gradient(to bottom, #F5F5F5, #E0E0E0);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        /* Contenido principal */
        .contenido {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 25px;
            overflow: hidden;
        }

        /* Panel gris responsivo */
        .panel {
            background-color: #CCCCCC;
            padding: 20px;
            width: 100%;
            box-sizing: border-box;
            flex: 1;
            min-height: 300px;
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .tabla {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            text-align: center;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .tabla th {
            background: linear-gradient(to bottom, #2c3e50, #1a2530);
            color: white;
            padding: 15px 10px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .tabla td {
            padding: 12px 10px;
            font-size: 16px;
            border-bottom: 1px solid #e0e0e0;
            background-color: #FFFFFF;
        }

        .tabla tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        .tabla tr:hover {
            background-color: #e3f2fd;
            transition: background-color 0.3s;
        }

        .estado {
            padding: 8px 15px;
            font-weight: bold;
            display: inline-block;
            border-radius: 20px;
            text-align: center;
            min-width: 120px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .estado-procesando { 
            background: linear-gradient(to right, #FFEB3B, #FBC02D);
            color: #8D6E00;
        }
        .estado-aceptada { 
            background: linear-gradient(to right, #4CAF50, #2E7D32);
            color: white;
        }
        .estado-rechazada { 
            background: linear-gradient(to right, #F44336, #C62828);
            color: white;
        }

        .boton-volver {
            margin-top: 25px;
            width: 230px;
            height: 50px;
            background: linear-gradient(to bottom, #FFCC00, #FFA000);
            border: none;
            border-radius: 25px;
            font-size: 24px;
            cursor: pointer;
            color: #333;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s;
        }

        .boton-volver:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }

        .filtro {
            margin-top: 25px;
            font-size: 18px;
            color: white;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .filtro select {
            height: 35px;
            width: 220px;
            font-size: 16px;
            border-radius: 18px;
            padding: 0 15px;
            border: 2px solid #89C4F4;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menu-lateral img {
            border-radius: 10px;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .menu-lateral img:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        .tabla-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            color: white;
        }

        .search-box {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 20px;
            padding: 5px 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .search-box input {
            border: none;
            outline: none;
            padding: 8px;
            font-size: 16px;
            background: transparent;
            width: 200px;
        }

        .search-box i {
            color: #4D6C8B;
        }

        /* Responsivo: ajusta altura de la barra lateral y panel gris */
        @media (max-height: 700px) {
            .panel { min-height: 200px; }
        }

        @media (max-width: 900px) {
            .contenedor {
                flex-direction: column;
            }
            
            .menu-lateral {
                width: 100%;
                flex-direction: row;
                justify-content: center;
                padding: 10px;
            }
            
            .menu-lateral img {
                margin: 0 10px;
                height: 40px;
                width: auto;
            }
            
            .tabla {
                font-size: 14px;
            }
            
            .tabla th, .tabla td {
                padding: 8px 5px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Barra superior -->
        <div class="barra-superior">
            <i class="fas fa-chart-line"></i> &nbsp; Información de Reportes
        </div>

        <!-- Contenedor principal -->
        <div class="contenedor">
            <!-- Menú lateral blanco -->
            <div class="menu-lateral">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="47px" ImageUrl="~/imagenes/fotos/Solicitudes.png" Width="100%" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="49px" ImageUrl="~/imagenes/fotos/Saliir.png" Width="100%" OnClick="ImageButton2_Click"  />
            </div>

            <!-- Contenido principal -->
            <div class="contenido">
                <!-- Panel con tabla -->
                <asp:Panel ID="Panel2" runat="server" CssClass="panel">
                    <div class="tabla-header">
                        <h2 style="margin: 0; color: #2c3e50;">Solicitudes</h2>
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" placeholder="Buscar solicitud...">
                        </div>
                    </div>
                    
                    <table class="tabla">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Categoría</th>
                                <th>Unidad de medida</th>
                                <th>Cantidad Solicitada</th>
                                <th>Descripción</th>
                                <th>Prioridad</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#123</td>
                                <td>Papeleria</td>
                                <td>Caja</td>
                                <td>3</td>
                                <td>Caja de hojas</td>
                                <td><span class="estado estado-procesando">Alta</span></td>
                                <td><asp:Label ID="Label1" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>#124</td>
                                <td>Oficina</td>
                                <td>Unidad</td>
                                <td>2</td>
                                <td>Sillas ergonómicas</td>
                                <td><span class="estado estado-procesando">Media</span></td>
                                <td><span class="estado estado-aceptada">Aceptada</span></td>
                            </tr>
                            <tr>
                                <td>#125</td>
                                <td>Tecnología</td>
                                <td>Unidad</td>
                                <td>5</td>
                                <td>Monitores 24"</td>
                                <td><span class="estado estado-procesando">Alta</span></td>
                                <td><span class="estado estado-rechazada">Rechazada</span></td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>

                <!-- Filtro -->
                <div class="filtro">
                    <i class="fas fa-filter"></i> Filtrar por rango de: 
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>₡100 000</asp:ListItem>
                        <asp:ListItem>₡100 000 - ₡1 000 000</asp:ListItem>
                        <asp:ListItem>+₡1 000 000</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Botón volver -->
                <asp:Button ID="Button1" runat="server" CssClass="boton-volver" Text="⇦ Volver" />
            </div>
        </div>
    </form>
</body>
</html>