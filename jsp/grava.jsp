<%@page language="java" import="java.sql.*" %>
<%
    String vnome = request.getParameter("name") ;
    String vtelefone = request.getParameter("telefone") ;
    String vemail = request.getParameter("email") ;
    String vdata = request.getParameter("dataEvento");
    String vhora = request.getParameter("horaEvento") ;
    String vendereco = request.getParameter("naendereçome") ;
    int vidcliente = 1 ;
    String vpedido = request.getParameter("pedido") ;

    String banco = "drinkspalooza" ;
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha ="";

    String driver = "com.mysql.jdbc.Driver";

    Class.forName( driver ) ;

    Connection conexao ;

    conexao = DriverManager.getConnection(endereco,usuario,senha) ;

    String sql = "INSERT INTO clientes (nome,telefone,email) values(?,?,?)" ;
    String sql2 = "INSERT INTO agendamento (data_evento,endereco_evento,pedido,id_cliente,hora_evento) values(?,?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement( sql ) ;
    stm.setString(1 , vnome);
    stm.setString(2 , vemail);
    stm.setString(3 , vendereco);

    stm.execute();
    stm.close();

    PreparedStatement stm2 = conexao.prepareStatement( sql2 ) ;
    stm2.setString(1 , vdata);
    stm2.setString(2 , vendereco);
    stm2.setString(3 , vpedido);
    stm2.setInt(4 , vidcliente);
    stm2.setString(5 , vhora);

    stm2.execute();
    

    conexao.close();

    stm2.close();
 

%>
