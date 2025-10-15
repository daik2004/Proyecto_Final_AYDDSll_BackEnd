<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprador_Infomacion.aspx.cs" Inherits="Proyecto_Final_Diseño_.Comprador_Infomacion" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Información de Reportes</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #4D6C8B;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
            color: #2C3E50;
            flex-shrink: 0;
        }

           .contenedor {
     display: flex;
     flex: 1;
     overflow: hidden;
 }

 /* Menú lateral */
 /*dairmary okvamprio*/
 /*zorrilla*/
 .menu-lateral {
     width: 140px;
     background-color: #F5F5F5;
     display: flex;
     flex-direction: column;
     align-items: center;
     padding-top: 10px;
     height: 100vh;
     border-right: 1px solid #ccc;
 }

 .menu-lateral input[type=image] {
     width: 90%;
     margin-bottom: 20px;
     border-radius: 12px;
     background-color: white;
     padding: 5px;
     cursor: pointer;
     transition: transform 0.2s, box-shadow 0.2s;
 }

 .menu-lateral input[type=image]:hover {
     transform: scale(1.05);
     box-shadow: 0 4px 8px rgba(0,0,0,0.2);
 }

      

        .contenido {
            flex: 1 1 auto;
            display: flex;
            flex-direction: column;
            padding: 20px;
            overflow: hidden;
        }

        .panel {
            background-color: #fff;
            padding: 20px;
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 20px;
            overflow: auto;
        }

        .scroll-tabla {
            flex: 1 1 auto;
            overflow: auto;
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .tabla th, .tabla td {
            padding: 12px;
            font-size: 16px;
            border-bottom: 1px solid #ccc;
        }

        .tabla th {
            background-color: #f0f0f0;
            color: #2C3E50;
            font-weight: bold;
        }

        .estado {
            padding: 5px 10px;
            font-weight: bold;
            border-radius: 8px;
            display: inline-block;
            color: #fff;
        }

        .estado-procesando { background-color: #FFCC00; color: #2C3E50; }
        .estado-aceptada { background-color: #2ECC71; }
        .estado-rechazada { background-color: #E74C3C; }

        .boton-volver {
            margin-top: 20px;
            width: 230px;
            height: 46px;
            background-color: #FFCC00;
            border: none;
            font-size: 24px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .boton-volver:hover {
            background-color: #e6b800;
            transform: scale(1.03);
        }

        .filtro {
            margin-top: 20px;
            font-size: 18px;
        }
        
        .filtro select {
            height: 28px;
            width: 220px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="barra-superior">Información de Reportes</div>

        <div class="contenedor">
            <div class="menu-lateral">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="47px" ImageUrl="~/imagenes/fotos/Solicitudes.png" Width="100%" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="49px" ImageUrl="~/imagenes/fotos/Saliir.png" Width="100%" OnClick="ImageButton2_Click" />
            </div>

            <div class="contenido">
                <div class="panel scroll-tabla">
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
                                <th>Procesado por</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#123</td>
                                <td>Papelería</td>
                                <td>Caja</td>
                                <td>3</td>
                                <td>Caja de hojas</td>
                                <td>Alta</td>
                                <td><asp:Label ID="Label1" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                                <td>Financiero</td>
                            </tr>
                            <tr>
                                <td>#124</td>
                                <td>Impresora</td>
                                <td>Unidad</td>
                                <td>1</td>
                                <td>HP LaserJet</td>
                                <td>Media</td>
                                <td><asp:Label ID="Label2" runat="server" CssClass="estado estado-aceptada" Text="Aceptada"></asp:Label></td>
                                <td>Jefatura</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="filtro">
                    Filtrar por rango de: 
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>₡100 000</asp:ListItem>
                        <asp:ListItem>₡100 000 - ₡1 000 000</asp:ListItem>
                        <asp:ListItem>+₡1 000 000</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:Button ID="Button1" runat="server" CssClass="boton-volver" OnClick="Button1_Click" Text="⇦ Volver" />
            </div>
        </div>
    </form>
</body>
</html>
