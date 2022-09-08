package com.clinicamedica.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clinicamedica.controler.ControlerMedico;
import com.clinicamedica.controler.ControlerPaciente;
import com.clinicamedica.entidades.Medico;
import com.clinicamedica.entidades.Paciente;
import com.clinicamedica.exception.MedicoCadastradoException;
import com.clinicamedica.exception.PacienteCadastradoException;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Paciente paciente;
	private Medico medico;

	private HttpServletRequest request;
	private HttpServletResponse response;

	private ControlerPaciente controlPaciente = new ControlerPaciente();
	private ControlerMedico controlMedico = new ControlerMedico();

	private HttpServletRequest httpServletRequest;

	private HttpSession sessao;

	public UsuarioServlet() {

	}

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.request = request;
		this.response = response;
		if (request.getParameter("act").equals("logout")) {
			logout();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.request = request;
		this.response = response;

		httpServletRequest = (HttpServletRequest) request;
		sessao = httpServletRequest.getSession();

		String resp = request.getParameter("act");

		if (resp.equals("put")) {
			cadastrar();
		}
		if (resp.equals("login")) {
			login();
		}
	}

	private void cadastrar() throws ServletException, IOException{
		if (request.getParameter("tipoUsuario").equals("paciente")) {
			paciente = new Paciente();
			paciente.setNome(request.getParameter("nome"));
			paciente.setCpf(Long.parseLong(request.getParameter("cpf").replace(".", "").replace("-", "")));
			paciente.setConvenio(request.getParameter("convenio"));
			paciente.setRua(request.getParameter("rua"));
			paciente.setBairro(request.getParameter("bairro"));
			paciente.setCidade(request.getParameter("cidade"));
			paciente.setNumero(Integer.parseInt(request.getParameter("numero")));
			paciente.setContato(Long.parseLong(request.getParameter("contato").replace(" ", "").replace("-", "")
					.replace("(", "").replace(")", "")));
			paciente.setSenha(Integer.parseInt(request.getParameter("senha")));
			paciente.setUf(request.getParameter("uf"));

			try {
				controlPaciente.cadastrar(paciente);
				sessao.setAttribute("retorno", "sucesso");
				response.sendRedirect("acesso/cadastrarPaciente.jsp");
			} catch (PacienteCadastradoException e) {
				sessao.setAttribute("retorno", "jaCadastrado");
				response.sendRedirect("acesso/cadastrarPaciente.jsp");
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("tipoUsuario").equals("medico")) {
			medico = new Medico();
			medico.setNome(request.getParameter("nome"));
			medico.setCpf(Long.parseLong(request.getParameter("cpf").replace(".", "").replace("-", "")));
			medico.setCrm(Integer.parseInt(request.getParameter("crm")));
			medico.setRua(request.getParameter("rua"));
			medico.setBairro(request.getParameter("bairro"));
			medico.setCidade(request.getParameter("cidade"));
			medico.setNumero(Integer.parseInt(request.getParameter("numero")));
			medico.setContato(Long.parseLong(request.getParameter("contato").replace(" ", "").replace("-", "")
					.replace("(", "").replace(")", "")));
			medico.setSenha(Integer.parseInt(request.getParameter("senha")));
			medico.setUf(request.getParameter("uf"));

			try {
				controlMedico.cadastrar(medico);
				sessao.setAttribute("retorno", "sucesso");
				response.sendRedirect("acesso/cadastrarMedico.jsp");
			} catch (MedicoCadastradoException e) {
				sessao.setAttribute("retorno", "jaCadastrado");
				response.sendRedirect("acesso/cadastrarMedico.jsp");
			} catch (NullPointerException e) {
				e.printStackTrace();
			}

		}
	}

	private void login() throws ServletException, IOException{
		String usuario = request.getParameter("usuario").replace(".", "").replace("-", "");
		int senha = Integer.parseInt(request.getParameter("senha"));

		if (usuario.length() == 11) {
			paciente = controlPaciente.login(usuario, senha);

			if (paciente != null) {
				sessao.setAttribute("paciente", paciente);
				response.sendRedirect("acesso/inicPaciente.jsp");
			} else {
				sessao.setAttribute("err", "naoExiste");
				response.sendRedirect("acessoRestrito.jsp");
			}
		} else {
			medico = controlMedico.login(usuario, senha);

			if (medico != null) {
				sessao.setAttribute("medico", medico);
				response.sendRedirect("acesso/inicio.jsp");
			} else {
				sessao.setAttribute("err", "naoExiste");
				response.sendRedirect("acessoRestrito.jsp");
			}
		}
	}

	private void logout() throws ServletException, IOException{
		sessao.invalidate();
		response.sendRedirect("acessoRestrito.jsp");
	}
}