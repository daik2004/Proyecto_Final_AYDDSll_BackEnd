<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprador_Inicio.aspx.cs" Inherits="Proyecto_Final_Diseño_.Comprador_Inicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #4D6C8B;
            display: flex;
            flex-direction: column;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        /* Barra superior */
        .barra-superior {
            height: 80px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .titulo {
            color: #000;
            font-size: 32px;
            font-weight: bold;
        }

        /* Contenedor principal */
        .contenedor {
            display: flex;
            height: calc(100vh - 60px);
        }

        .menu-lateral {
            width: 140px;
            background-color: #F5F5F5; 
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 10px;
        }

        .menu-lateral img,
        .menu-lateral input[type=image] {
            width: 100%;
            margin-bottom: 10px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .menu-lateral input[type=image]:hover {
            transform: scale(1.05);
        }

        /* Contenido principal */
        .contenido {
            flex: 1;
            background-color: #4D6C8B;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .contenido img {
            max-width: 250px;
            min-width: 150px;
            height: auto;
            margin-bottom: 30px;
        }

        /* Panel de botones */
        .panel-botones {
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .panel-botones input[type=image] {
            width: 200px;
            height: 50px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .panel-botones input[type=image]:hover {
            transform: scale(1.05);
        }
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Barra superior -->
        <div class="barra-superior">
            <asp:Label ID="Label1" runat="server" CssClass="titulo" Text="COMPRADOR"></asp:Label>
        </div>

        <!-- Contenedor principal -->
        <div class="contenedor">

            <!-- Menú lateral -->
            <div class="menu-lateral">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/fotos/Solicitudes.png" />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imagenes/fotos/Saliir.png" OnClick="ImageButton2_Click" CssClass="auto-style1" />
            </div>

            <!-- Contenido -->
            <div class="contenido">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/fotos/Comprador.png" />

                <asp:Panel ID="Panel1" runat="server" CssClass="panel-botones">
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/imagenes/fotos/GenSol.png" OnClick="ImageButton3_Click1" />
                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imagenes/fotos/Inf.png" OnClick="ImageButton4_Click" />
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>