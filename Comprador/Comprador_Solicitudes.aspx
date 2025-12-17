<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprador_Solicitudes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Comprador_Solicitudes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitudes</title>
    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #4D6C8B;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* HEADER */
        .header {
            height: 70px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 26px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* CONTENEDOR */
        .contenedor {
            flex: 1;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background-color: #4D6C8B;
            width: 100%;
            max-width: 900px;
            padding: 40px;
            border-radius: 12px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px 30px;
            color: white;
        }

        .seccion {
            grid-column: span 2;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2px solid #FFCC00;
            padding-bottom: 6px;
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
            margin-bottom: 6px;
            display: block;
        }

        select, input[type=text], textarea {
            width: 100%;
            padding: 8px 10px;
            font-size: 15px;
            border-radius: 6px;
            border: none;
            outline: none;
        }

        textarea {
            resize: none;
            height: 90px;
        }

        .acciones {
            grid-column: span 2;
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            width: 220px;
            height: 50px;
            margin: 8px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: 0.3s;
            background-color: #FFCC00;
        }

        .btn:hover {
            background-color: #e6b800;
            transform: scale(1.03);
        }

        .mensaje {
            grid-column: span 2;
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }

        .obligatorio {
            color: #FFD966;
            font-size: 13px;
            grid-column: span 2;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="header">
        Nueva Requisición
    </div>

    <div class="contenedor">
        <div class="card">

            <div class="seccion">Información del artículo / servicio</div>

            <div>
                <label>Categoría</label>
                <asp:DropDownList ID="ddlCategoria" runat="server">
                    <asp:ListItem>Papelería</asp:ListItem>
                    <asp:ListItem>Artículos</asp:ListItem>
                    <asp:ListItem>Mobiliario</asp:ListItem>
                    <asp:ListItem>Servicios</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <label>Prioridad</label>
                <asp:DropDownList ID="ddlPrioridad" runat="server">
                    <asp:ListItem>Baja</asp:ListItem>
                    <asp:ListItem>Media</asp:ListItem>
                    <asp:ListItem>Alta</asp:ListItem>
                    <asp:ListItem>Urgente</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <label>Unidad de medida</label>
                <asp:DropDownList ID="ddlUnidad" runat="server">
                    <asp:ListItem>Unidad</asp:ListItem>
                    <asp:ListItem>Caja</asp:ListItem>
                    <asp:ListItem>Paquete</asp:ListItem>
                    <asp:ListItem>Horas</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <label>Cantidad solicitada *</label>
                <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
            </div>

            <div>
                <label>Motivo de la solicitud *</label>
                <asp:TextBox ID="txtMotivo" runat="server"></asp:TextBox>
            </div>

            <div>
                <label>Descripción detallada</label>
                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="seccion">Información económica</div>

            <div>
                <label>Monto estimado ₡ *</label>
                <asp:TextBox ID="txtMonto" runat="server"></asp:TextBox>
            </div>

            <div class="obligatorio">
                * Campos obligatorios
            </div>

            <div class="acciones">
                <asp:Button ID="btnCrear" runat="server" Text="Crear Requisición"
                    CssClass="btn" OnClick="Button1_Click" />

                <asp:Button ID="btnVolver" runat="server" Text="Volver"
                    CssClass="btn" OnClick="Button2_Click" />
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label>

        </div>
    </div>

</form>
</body>
</html>