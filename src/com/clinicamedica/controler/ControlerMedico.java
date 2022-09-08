package com.clinicamedica.controler;

import java.util.List;

import com.clinicamedica.dao.MedicoJpaDao;
import com.clinicamedica.entidades.Medico;
import com.clinicamedica.exception.MedicoCadastradoException;

public class ControlerMedico {
	
private MedicoJpaDao medicoDao = MedicoJpaDao.getInstance();
	
	public void cadastrar(Medico medico) throws MedicoCadastradoException, NullPointerException {
		
		if (medicoDao.findCpf(medico.getCpf(), medico.getCrm()) == null)
			medicoDao.put(medico);
		else
			throw new MedicoCadastradoException();

	}

	public List<Medico> listar() {
		return medicoDao.findAll();
	}

	public void alterar(Medico medico) {
		medicoDao.update(medico);
	}

	public void excluir(int id) {
		medicoDao.del(id);
	}

	public Medico buscaId(int id) {
		return medicoDao.getById(id);
	}

	public Medico login(String usuario, int senha) {
		return medicoDao.login(usuario, senha);
	}
	
	public int recuperaId() {
		return medicoDao.recuperarId();
	}
}