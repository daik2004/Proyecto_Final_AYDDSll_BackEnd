<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_Final_Diseño_.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: lightskyblue;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            height: 100vh;
            width: 100%;
        }    

        .left-panel {
            flex: 1;
            background-color: white;
        }

        .left-panel img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .right-panel {
            flex: 1;
            background-color: #bce5f2;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .form-box {
            width: 80%;
            max-width: 400px;
            text-align: center;
        }

        .form-box h2 {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form-box label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: white;
        }

        .form-box input[type="text"],
        .form-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #e0e0e0;
        }

        .form-box .btn {
            width: 100%;
            padding: 10px;
            background-color: #5c6cff;
            border: none;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-box .code-box {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .form-box .code-box input {
            width: 40px;
            height: 40px;
            text-align: center;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            background-color: #e0e0e0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Panel izquierdo con imagen -->
            <div class="left-panel">
                <img src="/imagenes/fotos/2117554.jpg" alt="Imagen Login" />
            </div>

            <!-- Panel derecho con formulario -->
            <div class="right-panel">
                <div class="form-box">
                    <h2>INICIAR SESIÓN</h2>
                    
                    <label for="txtUsuario">Usuario:</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="input"></asp:TextBox>

                    <label for="txtContrasena">Contraseña:</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

                    <div class="code-box">
                    </div>

                    <asp:Button ID="btnIngresar" runat="server" CssClass="btn" Text="Ingresar" OnClick="btnIngresar_Click" />
                    <asp:Label ID="lb_mensaje" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>