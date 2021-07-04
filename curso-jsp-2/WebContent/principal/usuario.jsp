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

												<form id="formUser" class="form-material"
													action="<%=request.getContextPath()%>/ServletUsuarioController"
													method="post">

													<input type="hidden" name="acao" id="acao" value="">

													<div class="form-group form-default form-static-label">
														<input type="text" name="id" id="id" readonly="readonly"
															value="${modelLogin.id}" class="form-control"> <span
															class="form-bar"></span> <label class="float-label">ID:</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="text" name="nome" id="nome"
															value="${modelLogin.nome}" class="form-control"
															required="required"> <span class="form-bar"></span>
														<label class="float-label">Nome</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="email" name="email" id="email"
															autocomplete="off" value="${modelLogin.email}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Email
															(email@gmail.com)</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="text" name="login" id="login"
															autocomplete="off" value="${modelLogin.login}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Login</label>
													</div>
													<div class="form-group form-default form-static-label">
														<input type="password" name="senha" id="senha"
															autocomplete="off" value="${modelLogin.senha}"
															class="form-control" required="required"> <span
															class="form-bar"></span> <label class="float-label">Senha</label>
													</div>



													<button type="button"
														class="btn btn-primary waves-effect waves-light"
														onclick="limparForm();">Novo</button>
													<button class="btn btn-success waves-effect waves-light">Salvar</button>
													<button type="button"
														class="btn btn-info waves-effect waves-light"
														onclick="criarDelete();">Excluir</button>
													<button type="button"
														class="btn btn-danger waves-effect waves-light"
														onclick="criarDeleteComAjax();">Excluir Com Ajax</button>

													<!-- Button trigger modal -->
													<button type="button" class="btn btn-secondary"
														data-toggle="modal" data-target="#exampleModal">Pesquisar</button>
												</form>
											</div>
										</div>

										<span id="msg">${msg}</span>

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
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pesquisar Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>
	
	
	

	<script type="text/javascript">
		function criarDeleteComAjax() {
			if (confirm('Deseja realmente excluir os dados?')) {
				var urlAction = document.getElementById("formUser").action;
				var idUser = document.getElementById("id").value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + "&acao=deletarajax",
					success : function(response) {
						limparForm();
						document.getElementById("msg").textContent = response;
						alert(response);

					}
				}).fail(
						function(shr, status, errorThrown) {
							alert("Erro ao deletar usuário por id: "
									+ xhr.responseText);
						});

			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements;

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}

		}

		function criarDelete() {

			if (confirm('Deseja realmente excluir os dados?')) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}
		}
	</script>

</body>

</html>

