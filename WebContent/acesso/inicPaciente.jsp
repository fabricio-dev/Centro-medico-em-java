<%@page import="com.clinicamedica.entidades.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="com.clinicamedica.controler.ControlerConsulta"%>
<%@page import="com.clinicamedica.entidades.Consultas"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
						<h1 class="h3 mb-0 text-gray-800">Painel Principal</h1>
					</div>
					<!-- Content Row -->

					<div class="row">

						<!-- Agenda -->
						<div class="col-xl-12 col-lg-10">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Suas
										consultas</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="agenda">
										<div class="table-responsive">
											<table class="table table-condensed table-bordered">
												<thead>
													<tr>
														<th>Data</th>
														<th>Hora</th>
														<th>Detalhes</th>
														<th style="width: 70px;">Status</th>
														<th style="width: 60px;">opc</th>
													</tr>
												</thead>
												<tbody>
													<%
														Date data1 = new Date();
														SimpleDateFormat formatadorDate = new SimpleDateFormat("yyyy-MM-dd");
														String dataLoc = formatadorDate.format(data1) + " 00:00";

														Paciente paciente = (Paciente) session.getAttribute("paciente");

														List<Consultas> consultas = new ControlerConsulta().listarPaciente(paciente.getId(), dataLoc);

														DateFormat formatoEn = new SimpleDateFormat("yyyy-MM-dd HH:mm");
														Date data;
														Locale local = new Locale("pt", "BR");
														DateFormat formatoBr = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", local);

														for (Consultas consulta : consultas) {
															data = formatoEn.parse(consulta.getDataConsulta());
															String dataBr = formatoBr.format(data);

															String[] dataSeparada = dataBr.split(" de ");
													%>
													<!-- Multiple events in a single day (note the rowspan) -->
													<tr>
														<td class="agenda-date" rowspan="1">
															<div class="dayofmonth"><%=dataSeparada[0]%></div>
															<div class="shortdate text-muted"><%=dataSeparada[1]%>,
																<%=dataSeparada[2]%></div>
														</td>
														<td class="agenda-time"><%=data.toString().substring(10, 16)%></td>
														<td class="agenda-events">
															<div class="agenda-event">
																Dr.
																<%=consulta.getMedico().getNome()%></div>
															<div class="agenda-event">
																Motivo:
																<%=consulta.getMotivoConsulta()%></div>
															<div class="agenda-event">
																Sintomas:
																<%=consulta.getSintomas()%></div>
														</td>
														<td class="agenda-events">
															<div class="agenda-event">
																<%
																	if (consulta.getStatus().equals("aberta")) {
																%>
																<i class="fas fa-circle text-muted"></i>
																<%
																	} else if (consulta.getStatus().equals("finalizada")) {
																%>
																<i class="fas fa-circle text-success"></i>
																<%
																	} else if (consulta.getStatus().equals("naoCompareceu")) {
																%>
																<i class="fas fa-circle text-warning"></i>
																<%
																	} else if (consulta.getStatus().equals("cancelada")) {
																%>
																<i class="fas fa-circle text-danger"></i>
																<%
																	}
																%>

															</div>
														</td>
														<td><a
															href="/CentroMedico/ConsultaServlet?act=canc&con=<%=consulta.getId()%>"
															class="text-danger" title="Paciente não compareceu"><i
																class="fa fa-ban fa-sm"></i></a></td>
													</tr>
													<%
														}
													%>
												</tbody>
											</table>

											<div class="mt-4 text-center small">
												<span class="mr-2"> <i
													class="fas fa-circle text-success"></i> Consulta Finalizada
												</span> <span class="mr-2"> <i
													class="fas fa-circle text-warning"></i> Não compareceu
												</span> <span class="mr-2"> <i
													class="fas fa-circle text-danger"></i> Consulta Cancelada
												</span> <span class="mr-2"> <i
													class="fas fa-circle text-muted"></i> Consulta Aberta
												</span>
											</div>
										</div>
									</div>
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
	<script src="../js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../js/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
</body>

</html>