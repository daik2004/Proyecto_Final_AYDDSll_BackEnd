<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador_Usuario.aspx.cs" Inherits="Proyecto_Final_Diseño_.Administrador_Usuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Definir Usuario</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #4D6C8B;
        }

        /* Barra superior */
        .barra-superior {
            height: 70px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
        }

        /* Contenedor general */
        .contenedor {
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }

        /* Tarjeta principal */
        .card {
            background-color: #ffffff;
            width: 100%;
            max-width: 950px;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.25);
        }

            .card h2 {
                margin-top: 0;
                margin-bottom: 25px;
                color: #2C3E50;
                text-align: center;
                font-size: 1.6rem;
            }

        /* Grid del formulario */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

            .form-group label {
                font-weight: bold;
                margin-bottom: 6px;
                color: #2C3E50;
            }

        .input-text {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

            .input-text:focus {
                border-color: #89C4F4;
                box-shadow: 0 0 6px rgba(137,196,244,0.6);
                outline: none;
            }

        /* Botones */
        .botones {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-primario {
            background-color: #FFCC00;
            color: #000;
        }

            .btn-primario:hover {
                background-color: #e6b800;
                transform: translateY(-1px);
            }

        .btn-secundario {
            background-color: #2C3E50;
            color: #fff;
        }

            .btn-secundario:hover {
                background-color: #1f2d3a;
            }

        label {
            font-weight: bold;
            margin-bottom: 6px;
            display: block;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="barra-superior">Definir Usuario</div>

        <div class="contenedor">
            <div class="card">

                <h2>Registro de Usuario del Sistema</h2>

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
                        <label>Correo electrónico</label>
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="input-text" />
                    </div>

                    <div class="form-group">
                        <label>Departamento</label>
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="input-text" />
                    </div>

                    <div class="form-group">
                        <label>Fecha de nacimiento</label>
                        <asp:TextBox ID="TextBox9" runat="server" CssClass="input-text" TextMode="Date" />
                    </div>



                </div>

                <div class="botones">
                    <asp:Button ID="Button1" runat="server" Text="Crear Usuario"
                        CssClass="btn btn-primario" OnClick="Button1_Click" />

                    <asp:Button ID="Button3" runat="server" Text="⇦ Volver"
                        CssClass="btn btn-secundario" OnClick="Button3_Click" />
                </div>
                <div>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label>
                </div>


            </div>
        </div>

    </form>
</body>
</html>
