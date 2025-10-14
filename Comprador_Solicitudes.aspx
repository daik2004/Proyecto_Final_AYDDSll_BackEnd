<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprador_Solicitudes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Comprador_Solicitudes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitudes</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #4D6C8B;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Barra superior */
        .auto-style2 {
            height: 8vh;
            min-height: 50px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .auto-style4 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        /* Contenedor principal */
        .main-container {
            flex: 1;
            display: flex;
            overflow: hidden;
        }

        /* Menú lateral */
        .auto-style1 {
            width: 150px;
            min-width: 150px;
            background-color: #F5F5F5;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 15px;
        }

        .auto-style1 img, 
        .auto-style1 input[type=image] {
            width: 100%;
            height: 55px;
            margin-bottom: 20px;
            object-fit: contain;
        }

        /* Panel de contenido */
        #Panel1 {
            flex: 1;
            background-color: #4D6C8B;
            padding: 40px;
            display: grid;
            grid-template-columns: 1fr 1fr; /* dos columnas iguales */
            grid-row-gap: 25px;
            grid-column-gap: 30px;
            color: white;
        }

        label {
            display: block;
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 6px;
            color: white;
        }

        select, input[type=text], textarea {
            width: 100%;
            height: 38px;
            font-size: 1rem;
            padding: 6px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            color: black;
        }

        textarea {
            height: 80px;
            resize: none;
        }

        /* Botón Crear */
        #Button1 {
            grid-column: span 2;
            justify-self: center;
            background-color: #FFCC00;
            border: none;
            font-size: 1.2rem;
            font-weight: bold;
            width: 200px;
            height: 50px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        #Button1:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra superior -->
        <div class="auto-style2">
            <span class="auto-style4">Datos del artículo o servicio solicitado</span>
        </div>

        <!-- Contenedor principal -->
        <div class="main-container">
            <!-- Menú lateral -->
            <div class="auto-style1">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/fotos/Solicitudes.png" />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imagenes/fotos/Saliir.png" OnClick="ImageButton2_Click" />
            </div>

            <!-- Panel de contenido -->
            <asp:Panel ID="Panel1" runat="server">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Categoría"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Papelería</asp:ListItem>
                        <asp:ListItem>Artículos</asp:ListItem>
                        <asp:ListItem>Mobiliario</asp:ListItem>
                        <asp:ListItem>Servicios</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Prioridad"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Baja</asp:ListItem>
                        <asp:ListItem>Media</asp:ListItem>
                        <asp:ListItem>Alta</asp:ListItem>
                        <asp:ListItem>Urgente</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Label ID="Label3" runat="server" Text="Unidad de medida"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Unidad</asp:ListItem>
                        <asp:ListItem>Caja</asp:ListItem>
                        <asp:ListItem>Paquete</asp:ListItem>
                        <asp:ListItem>Horas</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Label ID="Label5" runat="server" Text="Cantidad solicitada"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="Label4" runat="server" Text="Motivo de solicitud"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="Label6" runat="server" Text="Descripción"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="Label7" runat="server" Text="Monto ₡"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="Button1" runat="server" Text="Crear" OnClick="Button1_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
