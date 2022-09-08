package com.clinicamedica.controler;

import java.util.List;

import com.clinicamedica.dao.PacienteJpaDao;
import com.clinicamedica.entidades.Paciente;
import com.clinicamedica.exception.PacienteCadastradoException;

public class ControlerPaciente {

	private PacienteJpaDao pacienteDao = PacienteJpaDao.getInstance();
	
	public void cadastrar(Paciente paciente) throws PacienteCadastradoException, NullPointerException {
		
		if (pacienteDao.findCpf(paciente.getCpf()) == null)
			pacienteDao.put(paciente);
		else
			throw new PacienteCadastradoException();

	}

	public List<Paciente> listar() {
		return pacienteDao.findAll();
	}

	public void alterar(Paciente paciente) {
		pacienteDao.update(paciente);
	}

	public void excluir(int id) {
		pacienteDao.del(id);
	}

	public Paciente buscaId(int id) {
		return pacienteDao.getById(id);
	}

	public Paciente login(String usuario, int senha) {
		return pacienteDao.login(usuario, senha);
	}
}