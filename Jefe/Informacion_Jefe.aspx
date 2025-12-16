<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Informacion_Jefe.aspx.cs"
    Inherits="Proyecto_Final_Diseño_.Informacion_Jefe" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Información de Reportes</title>

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
            justify-content: center;
            align-items: center;
            font-size: 36px;
            font-weight: bold;
        }

        .menu-lateral {
            width: 170px;
            float: left;
            background: #cde8f7;
            height: calc(100vh - 80px);
            padding-top: 30px;
        }

            .menu-lateral .img-btn {
                display: block;
                margin: 0 auto 20px;
            }

        .contenido-wrap {
            margin-left: 170px;
            padding: 20px;
        }

        .panel {
            background: #D9D9D9;
            padding: 25px;
            border: 3px solid #7A8A99;
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }

            .tabla th {
                border-bottom: 3px solid #7A8A99;
                padding: 12px;
            }

            .tabla td {
                border-bottom: 2px solid #b5b5b5;
                padding: 10px;
            }

        .estado-pendiente {
            background: #FFD800;
            font-weight: bold;
        }

        .estado-aprobada {
            background: #00C853;
            color: white;
            font-weight: bold;
        }

        .estado-rechazada {
            background: #D50000;
            color: white;
            font-weight: bold;
        }

        .boton-volver {
            margin-top: 25px;
            width: 160px;
            height: 60px;
            background: #FFCC00;
            font-size: 30px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <form runat="server">

        <div class="barra-superior">Información de Reportes</div>

        <div class="menu-lateral">
            <asp:ImageButton ID="ImageButton1" runat="server"
                ImageUrl="~/imagenes/fotos/Solicitudes.png"
                Height="47px" Width="132px" CssClass="img-btn" />

            <asp:ImageButton ID="ImageButton2" runat="server"
                ImageUrl="~/imagenes/fotos/Saliir.png"
                Height="49px" Width="132px"
                CssClass="img-btn"
                OnClick="ImageButton2_Click" />
        </div>

        <div class="contenido-wrap">
            <div class="panel">

                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="tabla">

                    <Columns>
                        <asp:BoundField DataField="id_Requisicion" HeaderText="ID" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                        <asp:BoundField DataField="UnidadMedida" HeaderText="Unidad" />
                        <asp:BoundField DataField="CantidadSolicitada" HeaderText="Cantidad" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />

                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server"
                                    Text='<%# Eval("Estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>

            </div>

            <asp:Button ID="Button1" runat="server"
                CssClass="boton-volver"
                Text="⇦ Volver"
                OnClick="Button1_Click" />

        </div>

    </form>
</body>
</html>
