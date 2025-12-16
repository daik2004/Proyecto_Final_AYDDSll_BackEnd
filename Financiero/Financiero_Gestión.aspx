<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Financiero_Gestion.aspx.cs" Inherits="Proyecto_Final_Diseño_.Financiero_Gestión" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Requisiciones</title>

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

        /* Barra superior */
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

        /* Contenedor principal */
        .contenedor {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        /* Contenido */
        .contenido {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow-x: auto;
        }

        /* Panel */
        .panel {
            background-color: #fff;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 20px;
        }

        /* GridView como tabla */
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

        /* TextBox justificación */
        .txtJustificacion {
            width: 100%;
            height: 80px;
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            resize: none;
        }

        /* Botones */
        .btn {
            width: 160px;
            height: 45px;
            background-color: #FFCC00;
            border: none;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #e6b800;
            transform: scale(1.03);
        }

        /* Resultado */
        .resultado {
            font-size: 16px;
            font-weight: bold;
            color: #2ECC71;
            text-align: center;
        }

        /* Botón volver */
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

    <!-- Barra superior -->
    <div class="barra-superior">
        <span>Gestión de Requisiciones</span>
    </div>

    <!-- Contenedor -->
    <div class="contenedor">
        <div class="contenido">

            <!-- Panel tabla -->
            <div class="panel scroll-tabla">
                <asp:GridView ID="gvRequisiciones" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="tabla"
                    DataKeyNames="id_Requisicion"
                    OnSelectedIndexChanged="gvRequisiciones_SelectedIndexChanged">

                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                        <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />
                        <asp:BoundField DataField="Solicitante" HeaderText="Solicitante" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="₡{0:N0}" />
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Panel justificación -->
            <div class="panel">
                <strong>Justificación:</strong><br /><br />
                <asp:TextBox ID="txtJustificacion" runat="server"
                    CssClass="txtJustificacion"
                    TextMode="MultiLine"
                    Placeholder="Ingrese la justificación..." />
            </div>

            <!-- Panel botones -->
            <div class="panel" style="display:flex; gap:20px; justify-content:center;">
                <asp:Button ID="btnAprobar" runat="server"
                    CssClass="btn"
                    Text="Aprobar"
                    OnClick="btnAprobar_Click" />

                <asp:Button ID="btnDenegar" runat="server"
                    CssClass="btn"
                    Text="Denegar"
                    OnClick="btnDenegar_Click" />
            </div>

            <!-- Resultado -->
            <asp:Label ID="lblResultados" runat="server" CssClass="resultado" />

            <!-- Botón volver -->
            <asp:Button ID="Button1" runat="server"
                CssClass="boton-volver"
                Text="⇦ Volver"
                PostBackUrl="Inicio_Financiero.aspx" />

        </div>
    </div>

</form>
</body>
</html>
