<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Administrador_TI_Rol.aspx.cs"
    Inherits="Proyecto_Final_Diseño_.Administrador_TI_Rol1" %>

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

        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        .panel-mejorado {
            padding: 40px;
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

        label {
            font-weight: bold;
            margin-bottom: 8px;
        }

        .input-text, .input-select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            color: black;
        }

        .info-text {
            font-size: 0.85rem;
            color: #ddd;
            margin-top: 5px;
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
        }

        .btn-accion:hover {
            background-color: #e6b800;
        }

        /* oculto por defecto */
        #grupoRolFinanciero {
            display: none;
        }
    </style>

    <script>
        function mostrarRolFinanciero() {
            var rol = document.getElementById('<%= DropDownList1.ClientID %>').value;
            var grupo = document.getElementById('grupoRolFinanciero');

            if (rol === 'Financiero') {
                grupo.style.display = 'flex';
            } else {
                grupo.style.display = 'none';
            }
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

    <div class="barra-superior">Definir Rol</div>

    <div class="panel-mejorado">

        <!-- ID del usuario -->
        <div class="form-group">
            <label>ID Usuario</label>
            <asp:TextBox ID="TextBox12" runat="server" CssClass="input-text" />
        </div>

        <!-- Rol principal -->
        <div class="form-group">
            <label>Rol</label>
            <asp:DropDownList ID="DropDownList1"
                runat="server"
                CssClass="input-select"
                onchange="mostrarRolFinanciero()">

                <asp:ListItem Text="-- Seleccione --" Value="" />
                <asp:ListItem Text="Administrador" Value="Administrador" />
                <asp:ListItem Text="Comprador" Value="Comprador" />
                <asp:ListItem Text="Financiero" Value="Financiero" />
            </asp:DropDownList>
        </div>

        <!-- Rol financiero (solo si es Financiero) -->
        <div class="form-group" id="grupoRolFinanciero">
            <label>Rol Financiero</label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="input-select">
                <asp:ListItem Text="Aprobador Financiero 1" />
                <asp:ListItem Text="Aprobador Financiero 2" />
                <asp:ListItem Text="Aprobador Financiero 3" />
                <asp:ListItem Text="Aprobador Jefe" />
            </asp:DropDownList>
            <span class="info-text">
                Solo para usuarios con rol Financiero
            </span>
        </div>

        <!-- Botones -->
        <div class="botones-panel">
            <asp:Button ID="Button1"
                runat="server"
                Text="Asignar"
                CssClass="btn-accion" />

   

    </div>
</form>
</body>
</html>
