package com.clinicamedica.controler;

import java.util.List;

import com.clinicamedica.dao.ConsultaJpaDao;
import com.clinicamedica.entidades.Consultas;
import com.clinicamedica.exception.HoraJaPreenchidaException;

public class ControlerConsulta {

	private ConsultaJpaDao consultaDao = ConsultaJpaDao.getInstance();

	public void cadastrar(Consultas consulta) throws HoraJaPreenchidaException {
		if(consultaData(consulta.getDataConsulta(), consulta.getMedico().getId(), consulta.getPaciente().getId())) throw new HoraJaPreenchidaException();
		
		consultaDao.put(consulta);
	}

	public List<Consultas> listar() {
		return consultaDao.findAll();
	}
	
	public List<Consultas> prontuario(int idPaciente) {
		return consultaDao.prontuario(idPaciente);
	}
	
	public List<Consultas> listarMedico(int idMedico, String data){
		return consultaDao.listarMedico(idMedico, data);
	}
	
	public List<Consultas> listarPaciente(int idPaciente, String data){
		return consultaDao.listarPaciente(idPaciente, data);
	}

	public void alterar(Consultas consulta) {
		consultaDao.update(consulta);
	}

	public void excluir(int id) {
		consultaDao.del(id);
	}
	
	public boolean consultaData(String data, int idMedico, int idPaciente) {
		return consultaDao.consultaData(data, idMedico, idPaciente);
	}
}