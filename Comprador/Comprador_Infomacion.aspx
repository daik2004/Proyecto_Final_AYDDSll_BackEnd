<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprador_Infomacion.aspx.cs" Inherits="Proyecto_Final_Diseño_.Comprador_Infomacion" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mis Requisiciones</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #4D6C8B;
        }

        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            font-weight: bold;
            color: #2C3E50;
        }

        .contenedor {
            padding: 30px;
        }

        .panel {
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .titulo {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2C3E50;
        }

        .filtro {
            margin-bottom: 15px;
            font-size: 16px;
        }

        .filtro select {
            height: 32px;
            font-size: 15px;
            margin-left: 10px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .grid th {
            background-color: #EAEAEA;
            padding: 10px;
            font-weight: bold;
        }

        .grid td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .estado {
            padding: 6px 12px;
            border-radius: 8px;
            color: white;
            font-weight: bold;
        }

        .pendiente { background-color: #F1C40F; color: #2C3E50; }
        .aprobada { background-color: #2ECC71; }
        .rechazada { background-color: #E74C3C; }

        .btn-volver {
            margin: 25px auto 0;
            display: block;
            width: 200px;
            height: 45px;
            background-color: #FFCC00;
            border: none;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-volver:hover {
            background-color: #e6b800;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="barra-superior">Mis Requisiciones</div>

    <div class="contenedor">
        <div class="panel">

            <div class="titulo">Historial de Solicitudes</div>

            <div class="filtro">
                Filtrar por estado:
                <asp:DropDownList ID="ddlEstado" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged">
                    <asp:ListItem Value="">Todos</asp:ListItem>
                    <asp:ListItem>Pendiente</asp:ListItem>
                    <asp:ListItem>Aprobada</asp:ListItem>
                    <asp:ListItem>Rechazada</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:GridView ID="gvRequisiciones" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False">

                <Columns>
                    <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />
                    <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha"
                        DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="Motivo" DataField="MotivoSolicitud" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                    <asp:BoundField DataField="UnidadMedida" HeaderText="Unidad" />
                    <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto ₡"
                        DataFormatString="₡{0:N2}" />
                    <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                    <asp:BoundField DataField="ProcesadoPor" HeaderText="Procesado por" />

                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <span class='estado <%# Eval("Estado").ToString().ToLower() %>'>
                                <%# Eval("Estado") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

            <asp:Button ID="btnVolver" runat="server"
                Text="⇦ Volver"
                CssClass="btn-volver"
                OnClick="btnVolver_Click" />

        </div>
    </div>

</form>
</body>
</html>