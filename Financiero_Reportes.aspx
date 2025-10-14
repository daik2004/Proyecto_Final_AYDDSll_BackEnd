<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Financiero_Reportes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Financiero_Reportes" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Reportes</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #4D6C8B;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Barra superior */
        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .barra-superior span {
            font-size: 28px;
            font-weight: bold;
            color: #2C3E50;
        }

        /* Contenedor principal */
        .contenedor {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        /* Menú lateral */
        .menu-lateral {
            width: 140px;
            background-color: #F5F5F5;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 10px;
            border-right: 1px solid #ccc;
        }

        .menu-lateral asp\:ImageButton {
            width: 90%;
            margin-bottom: 20px;
            border-radius: 12px;
            background-color: white;
            padding: 5px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .menu-lateral asp\:ImageButton:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        /* Contenido principal */
        .contenido {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow-x: auto;
        }

        .panel {
            background-color: #fff;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 20px;
        }

        /* Tabla estilizada */
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
            width: 200px;
            height: 45px;
            background-color: #FFCC00;
            border: none;
            font-size: 20px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .boton-volver:hover {
            background-color: #e6b800;
            transform: scale(1.03);
        }

        .scroll-tabla {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra superior -->
        <div class="barra-superior">
            <span>Gestión de Reportes</span>
        </div>

        <!-- Contenedor principal -->
        <div class="contenedor">
            <!-- Menú lateral -->
            <div class="menu-lateral">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="47px" ImageUrl="~/imagenes/fotos/Solicitudes.png" Width="100%" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="49px" ImageUrl="~/imagenes/fotos/Saliir.png" Width="100%" OnClick="ImageButton2_Click" />
            </div>

            <!-- Contenido principal -->
            <div class="contenido">
                <!-- Panel de tabla de solicitudes -->
                <div class="panel scroll-tabla">
                    <table class="tabla">
                        <thead>
                            <tr>
                                <th>Id Solicitante</th>
                                <th>Descripción</th>
                                <th>Cantidad</th>
                                <th>Monto</th>
                                <th>Prioridad</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#123</td>
                                <td>Hojas</td>
                                <td>3</td>
                                <td>₡10 000</td>
                                <td>Baja</td>
                                <td><asp:Label ID="Label3" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>#236</td>
                                <td>Impresora</td>
                                <td>1</td>
                                <td>₡100 000</td>
                                <td>Baja</td>
                                <td><asp:Label ID="Label4" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>#452</td>
                                <td>PC Gamer</td>
                                <td>1</td>
                                <td>₡1 000 000</td>
                                <td>Baja</td>
                                <td><asp:Label ID="Label5" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>#326</td>
                                <td>Escritorio</td>
                                <td>1</td>
                                <td>₡125 000</td>
                                <td>Baja</td>
                                <td><asp:Label ID="Label6" runat="server" CssClass="estado estado-procesando" Text="Procesando"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Panel de justificación -->
                <div class="panel">
                    <strong>Justificación:</strong><br />
                    Ej. Esta solicitud es aprobada/denegada debido a que...
                </div>

                <!-- Botones Aceptar/Denegar -->
                <div class="panel" style="display: flex; gap: 20px;">
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" ImageUrl="~/imagenes/fotos/Aceptar.png" Width="162px" />
                    <asp:ImageButton ID="ImageButton4" runat="server" Height="38px" ImageUrl="~/imagenes/fotos/Denegar.png" Width="162px" />
                </div>

                <!-- Botón volver -->
                <asp:Button ID="Button1" runat="server" CssClass="boton-volver" OnClick="Button1_Click" Text="⇦ Volver" />
            </div>
        </div>
    </form>
</body>
</html>
