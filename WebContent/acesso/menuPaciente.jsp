<%@page import="com.clinicamedica.entidades.Paciente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 

Paciente paciente = (Paciente) session.getAttribute("paciente");

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
			<%=paciente.getNome()%>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="inicPaciente.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Painel</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Consulta</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="MarcarConsulta.jsp"><i class="fas fa-calendar-check"></i> <span>Marcar Consulta</span></a></li>
</ul>
<!-- End of Sidebar -->