<%@ page contentType="text/html; chasert=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title></title>
</head>
<body>
    <%
        String telefone;
        String nome;
        String email;
        String endereco;
        String data;
        String hora;
        String pedido;

        nome = request.getParameter("name");
        email = request.getParameter("email");
        endereco = request.getParameter("endereco");
        data = request.getParameter("data");
        hora = request.getParameter("hora");
        pedido = request.getParameter("pedido");
        telefone = request.getParameter("telefone");

        out.print( "Nome: " +nome);
        out.print( "<br><br>");
        out.print( "email: " +email);
        out.print( "<br><br>"); 
        out.print( "endereco: " +endereco); 
        out.print( "<br><br>");
        out.print( "data: " +data);
        out.print( "<br><br>"); 
        out.print( "hora: " +hora);
        out.print( "<br><br>"); 
        out.print( "pedido: " +pedido);
        out.print( "<br><br>"); 
        out.print( "telefone: " +telefone);     
    %>
</body>
</html>