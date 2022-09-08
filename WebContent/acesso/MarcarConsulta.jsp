<%@page import="com.clinicamedica.entidades.Paciente"%>
<%@page import="com.clinicamedica.controler.ControlerMedico"%>
<%@page import="java.util.List"%>
<%@page import="com.clinicamedica.entidades.Medico"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>

<meta charset="UTF-8" />
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


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%
			if (session.getAttribute("paciente") == null) {
				response.sendRedirect("../acessoRestrito.jsp");
			} else {
		%>
		<jsp:include page="menuPaciente.jsp"></jsp:include>
		<%
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
						<h1 class="h3 mb-0 text-gray-800">Agendar Consulta</h1>
					</div>

					<!-- Content Row -->

					<div class="row">
						<!-- Agenda -->
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->

								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Agendar</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<form action="/CentroMedico/ConsultaServlet?act=put"
										method="post">
										<%
											Paciente paciente = (Paciente) session.getAttribute("paciente");
										%>
										<input type="hidden" name="idPaciente"
											value="<%=paciente.getId()%>">
											<input type="hidden" name="status" value="aberta">

										<div class="row">
											<div class="col-md-6 form-group">
												<label style="color: black;">Motivo da Consulta</label>
												<textarea name="motivo" class="form-control form-control-lg"
													required="required"
													placeholder="Conte um pouco sobre o motivo da sua consulta, para que o médico possa melhor te atender"></textarea>
											</div>
											<div class="col-md-6 form-group">
												<label style="color: black;">Sintomas</label>
												<textarea name="sintoma"
													class="form-control form-control-lg" required="required"
													placeholder="Conte-nos se sente algum sintoma"></textarea>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4 form-group">
												<label for="cpf" style="color: black;">Médico</label> <select
													name="medico" class="form-control form-control-md"
													required="required">
													<%
														List<Medico> medicos = new ControlerMedico().listar();
														for (int i = 0; i < medicos.size(); i++) {
													%>
													<option value="<%=medicos.get(i).getId()%>"><%=medicos.get(i).getNome()%></option>
													<%
														}
													%>
												</select>
											</div>

											<div class="col-md-3 form-group">
												<label style="color: black;">Data</label> <input type="date"
													name="data" class="form-control form-control-md"
													required="required"
													placeholder="Conte-nos se sente algum sintoma">
											</div>

											<div class="col-md-3 form-group">
												<label style="color: black;">Hora</label> <input type="time"
													name="hora" class="form-control form-control-md"
													required="required">
											</div>
										</div>

										<div class="row">
											<div class="col-md-2 form-group">
												<button class="btn btn-success btn-md btn-block">Agendar</button>
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
		var today = new Date().toISOString().split('T')[0];
		document.getElementsByName("data")[0].setAttribute('min', today);
	</script>

	<%
		if (request.getSession().getAttribute("retorno") != null) {
			if (request.getSession().getAttribute("retorno").equals("reservada")) {
	%>
	<script type="text/javascript">
		swal("Sucesso!", "Consulta agendada com sucesso!", "success");
	</script>

	<%
		}

			if (request.getSession().getAttribute("retorno").equals("dataJaReservada")) {
				session.setAttribute("retorno", null);
	%>
	<script type="text/javascript">
		swal(
				"Erro!",
				"Esse horario já está reservado para outro paciente. \n Ou você já tem uma consulta nesse horario!",
				"error");
	</script>

	<%
			}
		}
	%>

</body>

</html>