<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.sql.*" %>
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
        String vDate = "2023-05-14";

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

        // Cria o statement para executar o camando no banco
        PreparedStatement stm = conexao.prepareStatement( sqlSelectAll );
        ResultSet dados =  stm.executeQuery() ;

        PreparedStatement stmWhere = conexao.prepareStatement( sqlWhere );
        stmWhere.setString(1, vDate);
        ResultSet dadosWhere = stmWhere.executeQuery();
        while ( dadosWhere.next() ){
            out.print(dadosWhere.getString("endereco_evento"));
        }
        //ArrayList<String> datas_eventos = new ArrayList<String>();

        //while ( dados.next() ){
            //datas_eventos.add(dados.getString("data_evento").replace("-",""));
        //}
        //out.print(datas_eventos.get(0));

    
    %>
    <div id="wrapper-admin">
        <i class="fa-sharp fa-solid fa-bars menu-icon"></i>
        <aside class="menu-dates">
            <h1 class="logo">Drink's Palooza</h1>
            <div class="container-dates">
                <%-- <div class="date active">
                    <span>13/04/2023</span>
                </div>
                <div class="date">
                    <span>14/04/2023</span>
                </div>
                <div class="date">
                    <span>14/04/2023</span>
                </div> --%>
                <%
                    while (dados.next()){ %>
                        <div class="date" name="date">
                            <span><%out.print(dados.getString("data_evento"));%></span>
                        </div>
                    <% } %>
                
                
                <%-- <script>
                    var datas = <%out.print(datas_eventos);%>
                    for (let i = 0; i < datas.length; i++) {
                        console.log(<%out.print(datas_eventos.get(1));%>)
                        
                    }
                </script> --%>
            </div>
        </aside>
        <main class="appointments-container">
            <div class="appointment-details">
                <div class="date__time"> 
                    <i class="fa-solid fa-calendar-days"></i>
                    <span class="appointment-date">14/04/2023</span>
                    <i class="fa-solid fa-clock"></i>
                    <span class="appointment-time">22:00</span>
                </div>
                <div class="appointment-info">
                    <h2><i class="fa-solid fa-user"></i>Alison Mateus</h2>                
                    <h2><i class="fa-solid fa-envelope"></i>alisonn2077@gmail.com</h2>
                    <h2><i class="fa-solid fa-phone"></i>11982071223</h2> 
                    <h2><i class="fa-solid fa-location-dot" style="margin-left: 3px"></i>Rua A 23 08248234</h2>
                    <h2 class="pedido">drink drink drink drink drink rink drink drikn</h2>   
                </div>
            </div>
        </main>
    </div>
</body>
</html>