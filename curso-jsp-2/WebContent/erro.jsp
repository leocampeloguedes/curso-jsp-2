<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erro!</title>
</head>
<body>
	<h2>Mensagem de Erro! Entrar em contato com o suporte, contato@gmail.com</h2>
	
	<% out.print(request.getAttribute("msg")); %>
</body>
</html>