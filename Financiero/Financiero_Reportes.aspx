<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Financiero_Reportes.aspx.cs" Inherits="Proyecto_Final_Diseño_.Financiero_Reportes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Requisiciones - Financiero</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #4D6C8B;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .barra-superior {
            height: 60px;
            background-color: #89C4F4;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .barra-superior span {
            font-size: 28px;
            font-weight: bold;
            color: #2C3E50;
        }

        .contenedor {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        .contenido {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow-x: auto;
        }

        .panel {
            background-color: #fff;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 20px;
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .tabla th, .tabla td {
            padding: 12px;
            font-size: 16px;
            border-bottom: 1px solid #ccc;
        }

        .tabla th {
            background-color: #f0f0f0;
            color: #2C3E50;
            font-weight: bold;
        }

        .boton-volver {
            margin: 20px auto;
            display: block;
            width: 200px;
            height: 45px;
            background-color: #FFCC00;
            border: none;
            font-size: 20px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .boton-volver:hover {
            background-color: #e6b800;
            transform: scale(1.03);
        }

        .scroll-tabla {
            overflow-x: auto;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="barra-superior">
        <span>Gestión de Requisiciones - Financiero</span>
    </div>

    <div class="contenedor">
        <div class="contenido">

            <div class="panel scroll-tabla">
                <asp:GridView ID="gvRequisiciones" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="tabla"
                    GridLines="None"
                    DataKeyNames="id_Requisicion">

                    <Columns>
                        <asp:BoundField DataField="id_Requisicion" HeaderText="ID Requisición" />
                        <asp:BoundField DataField="Solicitante" HeaderText="Solicitante" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="₡{0:N0}" />
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:BoundField DataField="DecisionFinanciero" HeaderText="Decisión Financiero" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Button ID="btnVolver" runat="server"
                CssClass="boton-volver"
                Text="⇦ Volver"
                PostBackUrl="Inicio_Financiero.aspx" />

        </div>
    </div>

</form>
</body>
</html>


