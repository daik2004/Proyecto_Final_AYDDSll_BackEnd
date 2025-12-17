<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Informacion_Jefe.aspx.cs"
    Inherits="Proyecto_Final_Diseño_.Informacion_Jefe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Historial de Aprobaciones - Jefe</title>

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
            font-size: 26px;
            font-weight: bold;
            color: #2C3E50;
        }

        .contenedor {
            flex: 1;
            padding: 20px;
            overflow: auto;
        }

        .panel {
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .tabla th, .tabla td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }

        .tabla th {
            background-color: #f0f0f0;
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

        .boton-volver {
            margin: 20px auto;
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
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="barra-superior">
        <span>Historial de Requisiciones Aprobadas / Rechazadas</span>
    </div>

    <div class="contenedor">
        <div class="panel">

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                CssClass="tabla"
                GridLines="None">

                <Columns>
                    <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />
                    <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                    <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="₡{0:N0}" />
                    <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Decision" HeaderText="Decisión Jefe" />
                    <asp:BoundField DataField="FechaAprobacion" HeaderText="Fecha Decisión" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>

            </asp:GridView>

            <asp:Button ID="btnVolver" runat="server"
                CssClass="boton-volver"
                Text="⇦ Volver"
                PostBackUrl="Jefe_Inicio.aspx" />

        </div>
    </div>

</form>
</body>
</html>
