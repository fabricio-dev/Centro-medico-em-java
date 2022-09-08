package com.clinicamedica.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clinicamedica.controler.ControlerConsulta;
import com.clinicamedica.entidades.Consultas;
import com.clinicamedica.entidades.Medico;
import com.clinicamedica.entidades.Paciente;
import com.clinicamedica.exception.HoraJaPreenchidaException;

@WebServlet("/ConsultaServlet")
public class ConsultaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConsultaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String resp = request.getParameter("act");
		ControlerConsulta controlerConsulta = new ControlerConsulta();
		Consultas consulta = new Consultas();
		if(resp.equals("canc")) {
			consulta.setId(Integer.parseInt(request.getParameter("con")));
			consulta.setStatus("cancelada");
			controlerConsulta.alterar(consulta);
			response.sendRedirect("acesso/inicPaciente.jsp");
		}else if(resp.equals("comp")) {
			consulta.setId(Integer.parseInt(request.getParameter("con")));
			consulta.setStatus("naoCompareceu");
			controlerConsulta.alterar(consulta);
			response.sendRedirect("acesso/inicio.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession sessao = httpServletRequest.getSession();

		String resp = request.getParameter("act");

		ControlerConsulta controlerConsulta = new ControlerConsulta();
		Consultas consultas = new Consultas();
		Medico medico = new Medico();
		Paciente paciente = new Paciente();

		if (resp.equals("put")) {
			try {
				medico.setId(Integer.parseInt(request.getParameter("medico")));
				paciente.setId(Integer.parseInt(request.getParameter("idPaciente")));

				consultas.setMedico(medico);
				consultas.setPaciente(paciente);

				consultas.setMotivoConsulta(request.getParameter("motivo"));
				consultas.setParecerMedico(request.getParameter("parecer"));
				consultas.setSintomas(request.getParameter("sintoma"));
				consultas.setStatus(request.getParameter("status"));
				consultas.setDataConsulta(request.getParameter("data") + " " + request.getParameter("hora"));

				controlerConsulta.cadastrar(consultas);
				sessao.setAttribute("retorno", "reservada");
				response.sendRedirect("acesso/MarcarConsulta.jsp");
			} catch (HoraJaPreenchidaException e) {
				sessao.setAttribute("retorno", "dataJaReservada");
				response.sendRedirect("acesso/MarcarConsulta.jsp");
			}
		}else if(resp.equals("concl")) {
			consultas.setId(Integer.parseInt(request.getParameter("con")));
			consultas.setStatus("finalizada");
			consultas.setParecerMedico(request.getParameter("parecer"));
			controlerConsulta.alterar(consultas);
			response.sendRedirect("acesso/inicio.jsp");
		}
	}
}