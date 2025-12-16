<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Financiero_Gestion.aspx.cs" Inherits="Proyecto_Final_Diseño_.Financiero_Gestión" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Requisiciones - Financiero</title>
    <style>
        body {
            background-color: #121212;
            color: white;
            font-family: Arial;
            padding: 40px;
        }

        .contenedor {
            width: 90%;
            margin: auto;
            background-color: #1f1f1f;
            padding: 30px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .btn {
            margin: 10px 10px 10px 0;
            padding: 10px 20px;
            background-color: #00c853;
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #00e676;
        }

        .grid {
            margin-top: 30px;
        }

        .volver {
            margin-top: 20px;
            text-align: center;
        }

        .volver a {
            color: #00e676;
            text-decoration: none;
        }

        .resultado {
            margin-top: 20px;
            font-size: 16px;
            color: lightgreen;
        }

        .txtJustificacion {
            margin-top: 20px;
            width: 100%;
            height: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h2>Gestión de Requisiciones</h2>

            <asp:GridView ID="gvRequisiciones" runat="server" AutoGenerateColumns="False"
                CssClass="grid" OnSelectedIndexChanged="gvRequisiciones_SelectedIndexChanged"
                DataKeyNames="id_Requisicion">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                    <asp:BoundField DataField="id_Requisicion" HeaderText="ID Requisición" />
                    <asp:BoundField DataField="Solicitante" HeaderText="Solicitante" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="₡{0}" />
                    <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                </Columns>
            </asp:GridView>

            <asp:TextBox ID="txtJustificacion" runat="server" CssClass="txtJustificacion" Placeholder="Justificación..." TextMode="MultiLine" />

            <div style="margin-top:15px;">
                <asp:Button ID="btnAprobar" runat="server" CssClass="btn" Text="Aprobar" OnClick="btnAprobar_Click" />
                <asp:Button ID="btnDenegar" runat="server" CssClass="btn" Text="Denegar" OnClick="btnDenegar_Click" />
            </div>

            <asp:Label ID="lblResultados" runat="server" CssClass="resultado" />

            <div class="volver">
                <a href="Inicio_Financiero.aspx">← Volver al Menú</a>
            </div>
        </div>
    </form>
</body>
</html>

