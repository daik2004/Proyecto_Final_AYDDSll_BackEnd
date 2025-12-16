<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion de Reportes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Gestion_de_Reportes" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Gestión de Reportes - Jefe</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background-color: #f4f6f9;
        }

        .contenedor {
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .contenido {
            width: 100%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .panel {
            background: #fff;
            padding: 20px;
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 25px;
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
        }

        .tabla th {
            background-color: #003366;
            color: white;
            padding: 10px;
        }

        .tabla td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }

        .estado-pendiente { color: orange; font-weight: bold; }
        .estado-aprobada { color: green; font-weight: bold; }
        .estado-rechazada { color: red; font-weight: bold; }

        .detalle {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .botones {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 15px;
        }

        button, .aspBtn {
            padding: 10px 25px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .aprobar { background-color: #28a745; color: white; }
        .rechazar { background-color: #dc3545; color: white; }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="contenedor">
<div class="contenido">

    <!-- TABLA -->
    <div class="panel">
        <asp:GridView ID="gvRequisiciones" runat="server"
            AutoGenerateColumns="False"
            CssClass="tabla"
            DataKeyNames="id_Requisicion"
            OnSelectedIndexChanged="gvRequisiciones_SelectedIndexChanged">

            <Columns>
                <asp:CommandField ShowSelectButton="true" SelectText="Ver" />

                <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />

                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />

                <asp:TemplateField HeaderText="Monto">
                    <ItemTemplate>
                        <asp:Label ID="lblMontoGrid" runat="server"
                            Text='<%# Eval("Monto") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="lblEstadoGrid" runat="server"
                            Text='<%# Eval("Estado") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

    <!-- DETALLE -->
    <asp:Panel ID="pnlDetalle" runat="server" CssClass="panel" Visible="false">
        <div class="detalle">
            <strong>ID Requisición:</strong>
            <asp:Label ID="lblId" runat="server" />

            <strong>Monto:</strong>
            <asp:Label ID="lblMonto" runat="server" />

            <strong>Observaciones:</strong>
            <asp:TextBox ID="txtObservaciones" runat="server"
                TextMode="MultiLine" Rows="4" />

            <div class="botones">
                <asp:Button ID="btnAprobar" runat="server"
                    CssClass="aspBtn aprobar"
                    Text="Aprobar"
                    OnClick="btnAprobar_Click" />

                <asp:Button ID="btnRechazar" runat="server"
                    CssClass="aspBtn rechazar"
                    Text="Rechazar"
                    OnClick="btnRechazar_Click" />
            </div>
        </div>
    </asp:Panel>

</div>
</div>

</form>
</body>
</html>