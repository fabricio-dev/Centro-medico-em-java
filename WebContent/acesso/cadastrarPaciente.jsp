<%@page import="java.util.Random"%>
<%@page import="com.clinicamedica.controler.ControlerPaciente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Centro Medico</title>

<!-- Custom fonts for this template-->
<link href="../fonts/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/agenda.css" rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%
			if (session.getAttribute("medico") == null) {
				response.sendRedirect("../acessoRestrito.jsp");
			} else {
		%>
		<jsp:include page="menu.jsp"></jsp:include>
		}<%
			Random ran = new Random();
				int pass = ran.nextInt(9999);
				if (pass < 1000) {
					pass += 1000;
				}
		%>



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<img alt="logotipo" src="../images/logo.png" width="150rem"
						height="50rem">

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Opções</span>
								<i class="fas fa-user fa-2x fa-fw mr-2"></i>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Perfil
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Sair
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Cadastrar paciente</h1>
					</div>

					<!-- Content Row -->

					<div class="row">
						<!-- Agenda -->
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->

								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Cadastro</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<form action="/CentroMedico/UsuarioServlet?act=put"
										method="post">
										<input type="hidden" name="tipoUsuario" value="paciente">
										<div class="row">
											<div class="col-md-4 form-group">
												<label for="nome" style="color: black;">Nome</label> <input
													type="text" name="nome"
													class="form-control form-control-md" required="required">
											</div>
											<div class="col-md-2 form-group">
												<label for="cpf" style="color: black;">CPF</label> <input
													type="text" name="cpf" id="cpf"
													class="form-control form-control-md" required="required">
											</div>

											<div class="col-md-4 form-group">
												<label for="convenio" style="color: black;">Convenio</label>
												<select class="form-control form-control-sm" name="convenio">
													<option value="particular">Particular</option>
													<option value="amil">Amil</option>
													<option value="bradesco">Bradesco Saúde</option>
													<option value="camed">Camed</option>
													<option value="cassi">Cassi</option>
													<option value="compesa">Compesa</option>
													<option value="unimed">Unimed</option>
												</select>

											</div>
										</div>
										<div class="row">
											<div class="col-md-4 form-group">
												<label style="color: black;">Rua</label> <input type="text"
													name="rua" class="form-control form-control-md">
											</div>

											<div class="col-md-2 form-group">
												<label style="color: black;">Bairro</label> <input
													type="text" name="bairro"
													class="form-control form-control-md">
											</div>

											<div class="col-md-1 form-group">
												<label style="color: black;">Numero</label> <input
													type="text" name="numero"
													class="form-control form-control-md">
											</div>

										</div>

										<div class="row">
											<div class="col-md-4 form-group">
												<label style="color: black;">Cidade</label> <input
													type="text" name="cidade"
													class="form-control form-control-md">
											</div>

											<div class="col-md-2 form-group">
												<label style="color: black;">Estado</label> <input
													type="text" id="uf" name="uf"
													class="form-control form-control-md">
											</div>

											<div class="col-md-2 form-group">
												<label style="color: black;">Contato</label> <input
													type="text" id="contato" name="contato"
													class="form-control form-control-md">
											</div>

											<div class="col-md-2 form-group">
												<label style="color: black;">Senha de Acesso</label> <input
													type="text" name="senha" value="<%=pass%>"
													readonly="readonly" class="form-control form-control-md">
											</div>

										</div>


										<div class="row">
											<div class="col-md-2 form-group">
												<button class="btn btn-success btn-md btn-block">Salvar</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Centro Medico 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Deseja
						realmente sair ?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">Foi um prazer te ter aqui, volte
					sempre que precisar.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary"
						href="/CentroMedico/UsuarioServlet?act=logout">Sair</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/notify.min.js"></script>
	<script src="../js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../js/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<script src="../js/MaskJquery.js"></script>


	<script type="text/javascript">
		//mascaras de telefone, cep e cpf
		$(document).ready(function() {
			$("#contato").mask("(99)9 9999-9999");
			$("#cpf").mask("999.999.999-99");
			$("#uf").mask("aa");
		});
	</script>

	<%
		if (request.getSession().getAttribute("retorno") != null) {
				if (request.getSession().getAttribute("retorno").equals("sucesso")) {
	%>
	<script type="text/javascript">
		swal("Sucesso!", "Seu paciente foi cadastrado", "success");
	</script>

	<%
		}

				if (request.getSession().getAttribute("retorno").equals("jaCadastrado")) {
					session.setAttribute("retorno", null);
	%>
	<script type="text/javascript">
		swal("Erro!", "Esse paciente já está cadastrado no sistema", "error");
	</script>

	<%
		}
			}

		}
	%>

</body>

</html>