<%@page language="java" import="java.sql.*" %>
<%
    
    String vlogin = request.getParameter("txtLogin");
    String vsenha = request.getParameter("txtSenha");

    String banco = "drinkspalooza" ;
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha ="";

    String driver = "com.mysql.jdbc.Driver";

    Class.forName( driver ) ;

    Connection conexao ;

    conexao = DriverManager.getConnection(endereco,usuario,senha) ;

    String sql = "SELECT * FROM admin WHERE login=? AND senha=?";

    PreparedStatement stm = conexao.prepareStatement( sql );

    stm.setString(1, vlogin);
    stm.setString(2, vsenha);

    ResultSet dados =  stm.executeQuery();

    if(dados.next())
    {
        session.setAttribute( "admin", dados.getString("login"));
        response.sendRedirect("admin.jsp");
    }
    else
    {
        out.print("Login incorreto");
    }



%>