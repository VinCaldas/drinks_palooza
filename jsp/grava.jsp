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
    ResultSet rs;
    ResultSet rsEmail;

    conexao = DriverManager.getConnection(endereco,usuario,senha) ;

    //ResultSet rs=st.executeQuery("SELECT id_cliente FROM clientes WHERE email = ?");

    String sql = "INSERT INTO clientes (nome,telefone,email) values(?,?,?)"; 
    String sqlId = "SELECT id_cliente FROM clientes WHERE email = ?";
    String sqlEmail = "SELECT email FROM clientes WHERE email = ?";
    String sql2 = "INSERT INTO agendamento (data_evento,endereco_evento,pedido,id_cliente,hora_evento) values(?,?,?,?,?)";


    PreparedStatement stmEmail = conexao.prepareStatement( sqlEmail ) ;
    stmEmail.setString(1 , vemail);
     rsEmail = stmEmail.executeQuery(); 
     String email = "";
    while (rsEmail.next()) {             
        email = rsEmail.getString(1);
        System.out.println(email);
    }


    if(email == ""){
        PreparedStatement stm = conexao.prepareStatement( sql ) ;
        stm.setString(1 , vnome);
        stm.setString(2 , vtelefone);
        stm.setString(3 , vemail);

        stm.execute();
        stm.close();
    }

    PreparedStatement stmId = conexao.prepareStatement( sqlId ) ;
    stmId.setString(1 , vemail);

    rs = stmId.executeQuery(); 
    int id = 0;
    while (rs.next()) {             
        id = rs.getInt(1);
        System.out.println(id);
    }

    PreparedStatement stm2 = conexao.prepareStatement( sql2 ) ;
    stm2.setString(1 , vdata);
    stm2.setString(2 , vendereco);
    stm2.setString(3 , vpedido);
    stm2.setInt(4 , id);
    stm2.setString(5 , vhora);

    stm2.execute();
    

    conexao.close();

    stmEmail.close();
    stm2.close();
    stmId.close();
 

%>
