<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion de Reportes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Gestion_de_Reportes" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Gestión de Reportes - Jefe</title>

       <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #4D6C8B;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

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

        .contenedor {
            flex: 1;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .card {
            background-color: #4D6C8B;
            width: 100%;
            max-width: 1200px;
            padding: 40px;
            border-radius: 12px;
            color: white;
        }

        .seccion {
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2px solid #FFCC00;
            padding-bottom: 6px;
            margin-bottom: 20px;
        }

        /* GRID */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            color: #333;
            margin-bottom: 30px;
        }

        .gridview th {
            background-color: #89C4F4;
            color: white;
            padding: 10px;
            text-align: left;
        }

        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .gridview a {
            color: #4D6C8B;
            font-weight: bold;
            text-decoration: none;
        }

        .gridview a:hover {
            text-decoration: underline;
        }

        /* ESTADOS */
        .estado-pendiente {
            color: orange;
            font-weight: bold;
        }

        .estado-aprobada {
            color: green;
            font-weight: bold;
        }

        .estado-rechazada {
            color: red;
            font-weight: bold;
        }

        /* PANEL DETALLE */
        .detalle {
            background-color: #3E5875;
            padding: 25px;
            border-radius: 10px;
        }

        .detalle p {
            margin: 8px 0;
        }

        textarea {
            width: 100%;
            height: 90px;
            border-radius: 6px;
            border: none;
            padding: 8px;
            resize: none;
        }

        .acciones {
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
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="header">
        Gestión de Requisiciones
    </div>

    <div class="contenedor">
        <div class="card">

            <div class="seccion">Requisiciones pendientes de aprobación</div>

            <!-- TABLA -->
            <asp:GridView ID="gvRequisiciones" runat="server"
                CssClass="gridview"
                AutoGenerateColumns="False"
                DataKeyNames="id_Requisicion"
                OnSelectedIndexChanged="gvRequisiciones_SelectedIndexChanged">

                <Columns>

                    <asp:CommandField ShowSelectButton="true" SelectText="Ver" />

                    <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />

                    <asp:BoundField DataField="Fecha_Creacion"
                        HeaderText="Fecha"
                        DataFormatString="{0:dd/MM/yyyy}" />

                    <asp:BoundField DataField="Categoria" HeaderText="Categoría" />

                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />

                    <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />

                    <asp:BoundField DataField="UnidadMedida" HeaderText="Unidad" />

                    <asp:BoundField DataField="MotivoSolicitud" HeaderText="Motivo" />

                    <asp:BoundField DataField="Monto"
                        HeaderText="Monto"
                        DataFormatString="₡{0:N0}" />

                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <asp:Label ID="lblEstadoGrid" runat="server"
                                Text='<%# Eval("Estado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <!-- DETALLE -->
            <asp:Panel ID="pnlDetalle" runat="server" CssClass="detalle" Visible="false">

                <div class="seccion">Decisión del jefe</div>

                <p><strong>ID Requisición:</strong>
                    <asp:Label ID="lblId" runat="server" /></p>

                <p><strong>Monto:</strong>
                    <asp:Label ID="lblMonto" runat="server" /></p>

                <p><strong>Observaciones:</strong></p>
                <asp:TextBox ID="txtObservaciones" runat="server"
                    TextMode="MultiLine"></asp:TextBox>

                <div class="acciones">
                    <asp:Button ID="btnAprobar" runat="server"
                        Text="Aprobar"
                        CssClass="btn"
                        OnClick="btnAprobar_Click" />

                    <asp:Button ID="btnRechazar" runat="server"
                        Text="Rechazar"
                        CssClass="btn"
                        OnClick="btnRechazar_Click" />
                </div>

            </asp:Panel>

        </div>
    </div>

</form>
</body>
</html>