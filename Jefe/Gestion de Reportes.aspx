<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion_Reportes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Gestion_Reportes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Reportes</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial;
            background: #4D6C8B;
        }

        .barra-superior {
            height: 80px;
            background: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            font-weight: bold;
            color: #1F2E40;
        }

        .menu-lateral {
            width: 140px;
            background: #F5F5F5;
            float: left;
            height: 100vh;
            padding-top: 10px;
            border-right: 1px solid #ccc;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .menu-lateral input[type=image] {
                width: 90%;
                margin-bottom: 20px;
                border-radius: 12px;
                background: white;
                padding: 5px;
                cursor: pointer;
                transition: transform 0.2s, box-shadow 0.2s;
            }

                .menu-lateral input[type=image]:hover {
                    transform: scale(1.05);
                    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
                }

        .contenido-wrap {
            margin-left: 140px;
            padding: 20px;
        }

        .panel {
            background: #D9D9D9;
            padding: 25px;
            border: 3px solid #7A8A99;
            margin-bottom: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }

            .gridview th {
                padding: 10px;
                border-bottom: 3px solid #7A8A99;
            }

            .gridview td {
                padding: 10px;
                border-bottom: 2px solid #999;
            }

        .estado-pendiente {
            background: #FFD700;
            font-weight: bold;
            padding: 6px;
            border-radius: 4px;
        }

        .estado-aprobada {
            background: #6FCF97;
            font-weight: bold;
            padding: 6px;
            border-radius: 4px;
        }

        .estado-rechazada {
            background: #EB5757;
            color: white;
            font-weight: bold;
            padding: 6px;
            border-radius: 4px;
        }

        .botones-accion {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 20px;
        }

        #txtObservaciones {
            width: 95%;
            height: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="barra-superior">Gestión de Reportes</div>

        <div class="menu-lateral">
            <div class="menu-lateral">
     
     
 </div>
        </div>

        <div class="contenido-wrap">

            <asp:Panel runat="server" CssClass="panel">
                <asp:GridView ID="gvRequisiciones" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="gridview"
                    DataKeyNames="id_Requisicion"
                    OnSelectedIndexChanged="gvRequisiciones_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
                        <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />
                        <asp:BoundField DataField="id_Comprador" HeaderText="Comprador" />
                        <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                        <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                        <asp:BoundField DataField="UnidadMedida" HeaderText="Unidad" />
                        <asp:BoundField DataField="MotivoSolicitud" HeaderText="Motivo" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstadoGrid" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>

            <asp:Panel ID="pnlDetalle" runat="server" CssClass="panel" Visible="false">
                <h3>Detalle de la solicitud seleccionada</h3>

                <asp:Label ID="lblId" runat="server" /><br />
                <asp:Label ID="lblIdComprador" runat="server" /><br />
                <asp:Label ID="lblFecha" runat="server" /><br />
                <asp:Label ID="lblDescripcion" runat="server" /><br />
                <asp:Label ID="lblCategoria" runat="server" /><br />
                <asp:Label ID="lblCantidad" runat="server" /><br />
                <asp:Label ID="lblUnidad" runat="server" /><br />
                <asp:Label ID="lblMotivo" runat="server" /><br />
                <asp:Label ID="lblMonto" runat="server" /><br />
                <asp:Label ID="lblEstado" runat="server" /><br />

                <strong>Observaciones:</strong><br />
                <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" />

                <div class="botones-accion">
                    <asp:ImageButton ID="btnAprobar" runat="server"
                        ImageUrl="~/imagenes/fotos/Aceptar.png"
                        Width="140px" OnClick="btnAprobar_Click" />
                    <asp:ImageButton ID="btnRechazar" runat="server"
                        ImageUrl="~/imagenes/fotos/Denegar.png"
                        Width="140px" OnClick="btnRechazar_Click" />
                </div>
            </asp:Panel>

        </div>

    </form>
</body>
</html>
