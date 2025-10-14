<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador_TI_Rol.aspx.cs" Inherits="Proyecto_Final_Diseño_.Administrador_TI_Rol1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Definir Rol de Usuario</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #4D6C8B;
        }

        /* Barra superior */
        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 1.8rem;
            font-weight: bold;
        }

        /* Contenedor principal */
        .main-container {
            display: flex;
            min-height: calc(100vh - 60px);
        }
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

        /* Panel mejorado */
        .panel-mejorado {
            flex: 1;
            padding: 40px;
            background-color: #4D6C8B;
            display: flex;
            flex-direction: column;
            gap: 20px;
            color: #fff;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            max-width: 350px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 1.1rem;
        }

        .input-text, .input-select {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            color: black;
        }

        .input-textarea {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            color: black;
            resize: none;
            height: 80px;
        }

        .info-text {
            font-size: 0.9rem;
            color: #ddd;
            margin-top: 4px;
        }

        .botones-panel {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .btn-accion {
            background-color: #FFCC00;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            color: #000;
            font-size: 1rem;
        }

        .btn-accion:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra superior -->
        <div class="barra-superior">Definir Rol</div>

        <div class="contenedor">
            <!-- Menú lateral  -->
            <div class="menu-lateral">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="47px" ImageUrl="~/imagenes/fotos/Usuarios.png" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="49px" ImageUrl="~/imagenes/fotos/Saliir.png" OnClick="ImageButton2_Click" />
            </div>

            <!-- Panel de contenido mejorado -->
            <div class="panel-mejorado">
                <div class="form-group">
                    <label for="TextBox12">Id Asignado</label>
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="DropDownList1">Rol</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-select">
                        <asp:ListItem>Administrador</asp:ListItem>
                        <asp:ListItem>Comprador</asp:ListItem>
                        <asp:ListItem>Financiero</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="DropDownList2">Rol Financiero</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="input-select">
                        <asp:ListItem>Aprobador 1</asp:ListItem>
                        <asp:ListItem>Aprobador 2</asp:ListItem>
                        <asp:ListItem>Aprobador 3</asp:ListItem>
                    </asp:DropDownList>
                    <span class="info-text">(Aparece solo si se selecciona Rol Financiero)</span>
                </div>

                <div class="botones-panel">
                    <asp:Button ID="Button1" runat="server" Text="Asignar" OnClick="Page_Load" CssClass="btn-accion" />
                    <asp:Button ID="Button2" runat="server" Text="⇦" OnClick="Button2_Click" CssClass="btn-accion" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
