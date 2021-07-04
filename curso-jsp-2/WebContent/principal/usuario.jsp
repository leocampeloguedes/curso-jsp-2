<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">

						<jsp:include page="page-header.jsp"></jsp:include>

						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="card">
											<div class="card-block">
												<h4 class="sub-title">Cadastro de Usuário</h4>
												
												<form id="formUser" class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post">
														
														<input type="hidden" name="acao" id="acao" value="">
														
														<div class="form-group form-default form-static-label">
														<input type="text" name="id" id="id" readonly="readonly" value="${modelLogin.id}"
															class="form-control" > <span
															class="form-bar"></span> <label class="float-label">ID:</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="text" name="nome" id="nome"  value="${modelLogin.nome}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Nome</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="email" name="email" id="email" autocomplete="off"  value="${modelLogin.email}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Email
															(email@gmail.com)</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="text" name="login" id="login" autocomplete="off"  value="${modelLogin.login}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Login</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="password" name="senha" id="senha" autocomplete="off"  value="${modelLogin.senha}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Senha</label>
													</div>
													
													
													
													<button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm();">Novo</button>
										            <button class="btn btn-success waves-effect waves-light">Salvar</button>
										            <button type="button" class="btn btn-info waves-effect waves-light" onclick="criarDelete();">Excluir</button>
										            
												</form>
											</div>
										</div>

									<span>${msg}</span>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<jsp:include page="javascriptfile.jsp"></jsp:include>

<script type="text/javascript">
	
	function limparForm(){
		var elementos = document.getElementById("formUser").elements;
		
		for(p = 0; p< elementos.length; p++){
			elementos[p].value = '';
		}
		
	}
	
	function criarDelete(){
		document.getElementById("formUser").method = 'get';
		document.getElementById("acao").value = 'deletar';
		document.getElementById("formUser").submit();
	}
</script>	
	
</body>

</html>

