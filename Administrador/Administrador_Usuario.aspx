<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Administrador_Usuario.aspx.cs"
    Inherits="Proyecto_Final_Diseño_.Administrador_Usuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Definir Usuario</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #4D6C8B;
        }

        .barra-superior {
            height: 70px;
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
            justify-content: center;
            padding: 40px;
        }

        .card {
            background: #fff;
            max-width: 900px;
            width: 100%;
            padding: 35px;
            border-radius: 14px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 6px;
        }

        .input-text, .input-select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .botones {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            padding: 12px 30px;
            font-weight: bold;
            border-radius: 8px;
            border: none;
            cursor: pointer;
        }

        .btn-primario {
            background-color: #FFCC00;
        }

        .btn-secundario {
            background-color: #2C3E50;
            color: white;
        }

        .mensaje {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="barra-superior">Definir Usuario</div>

    <div class="contenedor">
        <div class="card">

            <h2 style="text-align:center;">Registro de Usuario</h2>

            <div class="form-grid">

                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Apellidos</label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Cédula</label>
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Usuario</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Correo</label>
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Departamento</label>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="input-text" />
                </div>

                <div class="form-group">
                    <label>Fecha Nacimiento</label>
                    <asp:TextBox ID="TextBox9" runat="server"
                        TextMode="Date" CssClass="input-text" />
                </div>

                <!-- ROL -->
                <div class="form-group">
                    <label>Rol</label>
                    <asp:DropDownList ID="ddlRol"
                        runat="server"
                        CssClass="input-select">
                    </asp:DropDownList>
                </div>

            </div>

            <div class="botones">
                <asp:Button ID="Button1" runat="server"
                    Text="Crear Usuario"
                    CssClass="btn btn-primario"
                    OnClick="Button1_Click" />

                <asp:Button ID="Button3" runat="server"
                    Text="Volver"
                    CssClass="btn btn-secundario"
                    OnClick="Button3_Click" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label>

        </div>
    </div>

</form>
</body>
</html>
