<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador_TI_Estado.aspx.cs" Inherits="Proyecto_Final_Diseño_.Administrador_TI_Estado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Estado de Usuario</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #4D6C8B, #3A5873);
            min-height: 100vh;
        }

        /* Barra superior */
        .barra-superior {
            height: 70px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.9rem;
            font-weight: 700;
            color: #1E2E3D;
            box-shadow: 0 3px 10px rgba(0,0,0,0.25);
        }

        /* Contenedor principal */
        .contenedor {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        /* Card central */
        .card {
            background-color: #ffffff;
            width: 100%;
            max-width: 480px;
            border-radius: 18px;
            padding: 35px 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .card h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #345830;
            font-size: 1.6rem;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #2E4053;
        }

        .input-text, .input-select, .input-textarea {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        .input-textarea {
            resize: none;
            height: 90px;
        }

        .acciones {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn {
            width: 48%;
            padding: 14px;
            border-radius: 10px;
            font-size: 1.05rem;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: 0.25s;
        }

        .btn-primario {
            background-color: #FFCC00;
        }

        .btn-primario:hover {
            background-color: #e6b800;
        }

        .btn-secundario {
            background-color: #dfe6e9;
        }

        .btn-secundario:hover {
            background-color: #b2bec3;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="barra-superior">
            Gestión de Estado de Usuarios
        </div>

        <div class="contenedor">
            <div class="card">

                <h2>Definir Estado</h2>

                <div class="form-group">
                    <label for="TextBox12">ID del Usuario</label>
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label for="DropDownList1">Estado de la Cuenta</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-select">
                        <asp:ListItem>Activar</asp:ListItem>
                        <asp:ListItem>Inactivar</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="TextBox13">Motivo (obligatorio si se inactiva)</label>
                    <asp:TextBox ID="TextBox13" runat="server" TextMode="MultiLine" CssClass="input-textarea" />
                </div>

                <div class="acciones">
                    <asp:Button ID="Button1" runat="server"
                        Text="Guardar"
                        CssClass="btn btn-primario"
                        OnClick="Button1_Click" />

                    <asp:Button ID="Button3" runat="server"
                        Text="Volver"
                        CssClass="btn btn-secundario"
                        OnClick="Button2_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>