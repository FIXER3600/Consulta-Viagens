<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/styles.css">
<meta charset="ISO-8859-1">
<title>Cliente</title>
</head>
<body>
	<div align="center" class="container">
		<form action="cliente" method="post">
			<p class="title">
				<b>Cliente</b>
			</p>
			<table>
				<tr>
					<td colspan="3">
						<input class="id_input_data" type="number" min="0"
							step="1" id="cpf" name="cpf" placeholder="#CPF"
							value='<c:out value="${pessoa.id }"></c:out>'>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="input_data" type="text" id="nome" name="nome"
							placeholder="Nome"
							value='<c:out value="${pessoa.nome }"></c:out>'>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="input_data" type="text" id="telFixo" name="telFixo"
							placeholder="Telefone Fixo"
							value='<c:out value="${pessoa.telFixo }"></c:out>'>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="input_data" type="text" id="telCelular" name="telCelular"
							placeholder="Telefone Celular"
							value='<c:out value="${pessoa.telCelular }"></c:out>'>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" id="botao" name="botao" value="Inserir">
					</td>
					<td>
						<input type="submit" id="botao" name="botao" value="Atualizar">
					</td>
					<td>
						<input type="submit" id="botao" name="botao" value="Deletar">
					</td>
				</tr>
			</table>
		</form>		
	</div>
	<div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty saida }">
			<H3><c:out value="${saida }" /></H3>
		</c:if>
	</div>
</body>
</html>