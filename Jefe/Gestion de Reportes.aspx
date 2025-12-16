<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Reportes</title>

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
        }

        /* Contenido centrado */
        .contenido {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        /* Panel */
        .panel {
            background-color: #fff;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        /* Tabla */
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

        /* Observaciones */
        .txtObservaciones {
            width: 100%;
            height: 100px;
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            resize: none;
        }

        /* Botones */
        .acciones {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        /* Botón volver */
        .boton-volver {
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
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- Barra superior -->
    <div class="barra-superior">
        <span>Gestión de Reportes</span>
    </div>

    <div class="contenedor">
        <div class="contenido">

            <!-- Tabla de requisiciones -->
            <div class="panel">
                <asp:GridView ID="gvRequisiciones" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="tabla"
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
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="₡{0:N0}" />
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Detalle -->
            <asp:Panel ID="pnlDetalle" runat="server" CssClass="panel" Visible="false">
                <h3>Detalle de la solicitud seleccionada</h3><br />

                <asp:Label ID="lblId" runat="server" /><br />
                <asp:Label ID="lblIdComprador" runat="server" /><br />
                <asp:Label ID="lblFecha" runat="server" /><br />
                <asp:Label ID="lblDescripcion" runat="server" /><br />
                <asp:Label ID="lblCategoria" runat="server" /><br />
                <asp:Label ID="lblCantidad" runat="server" /><br />
                <asp:Label ID="lblUnidad" runat="server" /><br />
                <asp:Label ID="lblMonto" runat="server" /><br />
                <asp:Label ID="lblEstado" runat="server" /><br /><br />

                <strong>Observaciones:</strong><br /><br />
                <asp:TextBox ID="txtObservaciones" runat="server"
                    CssClass="txtObservaciones"
                    TextMode="MultiLine" />

                <br /><br />

                <div class="acciones">
                    <asp:ImageButton ID="btnAprobar" runat="server"
                        ImageUrl="~/imagenes/fotos/Aceptar.png"
                        Width="160px"
                        OnClick="btnAprobar_Click" />

                    <asp:ImageButton ID="btnRechazar" runat="server"
                        ImageUrl="~/imagenes/fotos/Denegar.png"
                        Width="160px"
                        OnClick="btnRechazar_Click" />
                </div>
            </asp:Panel>

            <!-- Volver -->
            <asp:Button runat="server"
                CssClass="boton-volver"
                Text="⇦ Volver"
                PostBackUrl="Inicio_Reportes.aspx" />

        </div>
    </div>

</form>
</body>
</html>