<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador_TI_Estado.aspx.cs" Inherits="Proyecto_Final_Diseño_.Administrador_TI_Estado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Definir Estado de Usuario</title>
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

      
        .panel-mejorado {
            flex: 1;
            padding: 40px;
            background-color: #4D6C8B;
            display: flex;
            flex-direction: column;
            gap: 25px;
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

        .input-text, .input-select, .input-textarea {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            color: black;
        }

        .input-textarea {
            resize: none;
            height: 80px;
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
        <div class="barra-superior">Definir Estado</div>
        <!-- -->
        <div class="contenedor">
           
            <!-- Panel de contenido mejorado -->
            <div class="panel-mejorado">
                <div class="form-group">
                    <label for="TextBox12">Id asociado a Usuario</label>
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="DropDownList1">Estado</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-select">
                        <asp:ListItem>Activar</asp:ListItem>
                        <asp:ListItem>Inactivar</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="TextBox13">Motivo de inactivación de cuenta</label>
                    <asp:TextBox ID="TextBox13" runat="server" TextMode="MultiLine" CssClass="input-textarea"></asp:TextBox>
                </div>

                <div class="botones-panel">
                    <asp:Button ID="Button1" runat="server" Text="Definir Estado" OnClick="Page_Load" CssClass="btn-accion" />
                    <asp:Button ID="Button3" runat="server" Text="⇦" OnClick="Button2_Click" CssClass="btn-accion" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
