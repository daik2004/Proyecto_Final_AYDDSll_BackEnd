<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador_Usuario.aspx.cs" Inherits="Proyecto_Final_Diseño_.Administrador_Usuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Definir Usuario</title>
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

        .contenedor {
            display: flex;
            min-height: calc(100vh - 60px);
        }


        /* Panel principal */
        .panel-mejorado {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            background-color: #4D6C8B;
            color: #fff;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            flex: 1 1 300px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 6px;
            font-size: 1.1rem;
        }

        .input-text {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            color: black;
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

        <div class="barra-superior">Definir un Usuario</div>

        <div class="contenedor">
         
            <!-- Panel de usuario -->
            <div class="panel-mejorado">
                <div class="form-row">
                    <div class="form-group">
                        <label for="TextBox5">Nombre</label>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="TextBox10">Departamento</label>
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="TextBox6">Apellidos</label>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="TextBox11">ID Asignado</label>
                        <asp:TextBox ID="TextBox11" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="TextBox7">Cédula</label>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="TextBox8">Correo electrónico</label>
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="TextBox9">Fecha de Nacimiento</label>
                        <asp:TextBox ID="TextBox9" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>
                </div>

                <div class="botones-panel">
                    <asp:Button ID="Button1" runat="server" Text="Crear" OnClick="Button1_Click" CssClass="btn-accion" />
                    <asp:Button ID="Button3" runat="server" Text="⇦" OnClick="Button3_Click" CssClass="btn-accion" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
