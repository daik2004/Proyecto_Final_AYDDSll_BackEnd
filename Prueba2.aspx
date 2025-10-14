<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba2.aspx.cs" Inherits="Proyecto_Final_Diseño_.Prueba2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menú Lateral Mejorado</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #4D6C8B;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .barra-superior {
            height: 60px;
            background: linear-gradient(135deg, #89C4F4 0%, #6BB9F0 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
            color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        /* Contenedor principal */
        .contenedor {
            flex: 1;
            display: flex;
            height: calc(100vh - 80px);
        }

        /* Menú lateral mejorado */
        .menu-lateral {
            width: 200px;
            background: linear-gradient(to bottom, #2c3e50, #1a2530);
            display: flex;
            flex-direction: column;
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
        }

        .boton-menu {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            margin: 8px 15px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .boton-menu:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .boton-menu i {
            margin-right: 12px;
            font-size: 20px;
            width: 24px;
            text-align: center;
        }

        .boton-salir {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            margin-top: auto;
        }

        .boton-salir:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
        }

        .contenido {
            flex: 1;
            padding: 25px;
            background-color: #f5f7fa;
            overflow-y: auto;
        }

        .titulo-contenido {
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }

        .tarjeta {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        /* Estilos responsivos */
        @media (max-width: 768px) {
            .contenedor {
                flex-direction: column;
            }
            
            .menu-lateral {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
                padding: 10px 0;
                height: auto;
            }
            
            .boton-menu {
                flex-direction: column;
                padding: 10px;
                margin: 5px;
                text-align: center;
                font-size: 12px;
            }
            
            .boton-menu i {
                margin-right: 0;
                margin-bottom: 5px;
                font-size: 18px;
            }
            
            .texto-boton {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra superior -->
        <div class="barra-superior">
            <i class="fas fa-tachometer-alt"></i> &nbsp; Sistema de Gestión
        </div>

        <!-- Contenedor principal -->
        <div class="contenedor">
            <!-- Menú lateral mejorado -->
            <div class="menu-lateral">
                <asp:Button ID="btnSolicitudes" runat="server" CssClass="boton-menu" OnClick="btnSolicitudes_Click">
                    <i class="fas fa-clipboard-list"></i> <span class="texto-boton">Solicitudes</span>
                </asp:Button>
                
                <asp:Button ID="btnUsuarios" runat="server" CssClass="boton-menu" OnClick="btnUsuarios_Click">
                    <i class="fas fa-users"></i> <span class="texto-boton">Usuarios</span>
                </asp:Button>
                
                <asp:Button ID="btnReportes" runat="server" CssClass="boton-menu" OnClick="btnReportes_Click">
                    <i class="fas fa-chart-bar"></i> <span class="texto-boton">Reportes</span>
                </asp:Button>
                
                <asp:Button ID="btnConfiguracion" runat="server" CssClass="boton-menu" OnClick="btnConfiguracion_Click">
                    <i class="fas fa-cog"></i> <span class="texto-boton">Configuración</span>
                </asp:Button>
                
                <asp:Button ID="btnSalir" runat="server" CssClass="boton-menu boton-salir" OnClick="btnSalir_Click">
                    <i class="fas fa-sign-out-alt"></i> <span class="texto-boton">Salir</span>
                </asp:Button>
            </div>

            <!-- Contenido principal -->
            <div class="contenido">
                <h2 class="titulo-contenido">Panel Principal</h2>
                
                <div class="tarjeta">
                    <h3><i class="fas fa-info-circle"></i> Bienvenido al sistema</h3>
                    <p>Selecciona una opción del menú lateral para comenzar.</p>
                </div>
                
                <div class="tarjeta">
                    <h3><i class="fas fa-chart-line"></i> Estadísticas rápidas</h3>
                    <p>Aquí puedes mostrar información relevante o resumen de actividades.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>