<%@ page language="java" contentType="text/html charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página do Administrador - Drink's Palooza</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
    <script src="js/scripts.js" defer="defer"></script>
</head>
<body>
    <%

        String vDate = request.getParameter("date");

        String banco    = "drinkspalooza" ;
        String endereco = "jdbc:mysql://localhost:3306/" + banco ;
        String usuario  = "root";
        String senha    = "" ;

        String driver   = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com banco
        Connection conexao ;

        // Abrir a conexao com o banco
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;

        String sqlSelectAll = "SELECT * FROM agendamento";
        String sqlWhere = "SELECT * FROM agendamento WHERE data_evento = ?";
        String sqlGetClient = "SELECT * FROM clientes WHERE id_cliente = ?";

        // Cria o statement para executar o camando no banco
        PreparedStatement stm = conexao.prepareStatement( sqlSelectAll );
        ResultSet dados =  stm.executeQuery() ;

        PreparedStatement stmWhere = conexao.prepareStatement( sqlWhere );
        stmWhere.setString(1, vDate);

        int idCliente = 28;
        ResultSet id = stmWhere.executeQuery();

        while(id.next()) {
            idCliente = id.getInt("id_cliente");
        }

        ResultSet dataAppointment = stmWhere.executeQuery();

        PreparedStatement stmGetClient = conexao.prepareStatement( sqlGetClient );
        stmGetClient.setInt(1, idCliente);
        ResultSet clientData = stmGetClient.executeQuery();
    
    %>
    <div id="wrapper-admin">
        <i class="fa-sharp fa-solid fa-bars menu-icon"></i>
        <aside class="menu-dates">
            <h1 class="logo">Drink's Palooza</h1>
            <div class="container-dates">
                <%
                    while (dados.next()){ %>
                        <div class="date" name="date">
                            <span><%out.print(dados.getString("data_evento"));%></span>
                        </div>
                    <% } %>
            </div>
        </aside>
        <main class="appointments-container">
        <% if (dataAppointment.next() != false && clientData.next() != false) { %>
            <div class="appointment-details">
                <div class="date__time"> 
                    <i class="fa-solid fa-calendar-days"></i>
                    <span class="appointment-date">
                    <script>
                        document.write(localStorage.getItem("activeDate") !== null ?  localStorage.getItem("activeDate") : "");
                    </script></span>
                    <i class="fa-solid fa-clock"></i>
                    <span class="appointment-time"><%
                        String[] parts = dataAppointment.getString("hora_evento").split(":");
                        out.print(parts[0]+":"+parts[1]);
                    %></span>
                </div>
                <div class="appointment-info">
                    <h2><i class="fa-solid fa-user"></i><%out.print(clientData.getString("nome"));%></h2>                
                    <h2><i class="fa-solid fa-envelope"></i><%out.print(clientData.getString("email"));%></h2>
                    <h2><i class="fa-solid fa-phone"></i><%out.print(clientData.getString("telefone"));%></h2> 
                    <h2><i class="fa-solid fa-location-dot" style="margin-left: 3px"></i><%{out.print(dataAppointment.getString("endereco_evento"));};%></h2>
                    <h2 class="pedido"><%out.print(dataAppointment.getString("pedido"));%></h2>   
                </div>
            </div>
        <%}%>
        </main>
    </div>

  
</body>
</html>