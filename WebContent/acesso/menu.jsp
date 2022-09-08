<%@page import="com.clinicamedica.entidades.Medico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

Medico medico = (Medico) session.getAttribute("medico");
String nome = medico.getNome().split(" ")[0];
%>
<!-- Sidebar -->
<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="inicio.jsp">
		<div class="sidebar-brand-text mx-3">
			Seja Bem Vindo<br>
			Dr. <%=nome%>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="inicio.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Painel</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Pacientes</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="cadastrarPaciente.jsp"><i class="fas fa-user fa-cog"></i> <span>Cadastrar Paciente</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Medicos</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="cadastrarMedico.jsp"> <i class="fas fa-user-md fa-folder"></i> <span>Cadastrar Medico</span></a></li>
</ul>
<!-- End of Sidebar -->