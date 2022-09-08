package com.clinicamedica.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import com.clinicamedica.entidades.Consultas;

public class ConsultaJpaDao {

	private static ConsultaJpaDao instancia;
	protected EntityManager entityManager;

	public static ConsultaJpaDao getInstance() {
		if (instancia == null) {
			instancia = new ConsultaJpaDao();
		}
		return instancia;
	}

	private ConsultaJpaDao() {
		entityManager = getEntityManager();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("conexaoBd");

		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}

		return entityManager;
	}

	public Consultas getById(final int id) {
		return entityManager.find(Consultas.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Consultas> findAll() {
		return entityManager.createQuery("FROM " + Consultas.class.getName()).getResultList();
	}

	public void put(Consultas Consulta) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		entityManager.persist(Consulta);
		entityManager.getTransaction().commit();
	}

	public void update(Consultas consulta) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		Consultas consultaOrigin = entityManager.find(Consultas.class, consulta.getId());
		consultaOrigin.setStatus(consulta.getStatus());
		consultaOrigin.setParecerMedico(consulta.getParecerMedico());
		entityManager.merge(consultaOrigin);
		entityManager.getTransaction().commit();

	}

	public void del(final int id) {
		Consultas consulta = getById(id);

		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		consulta = entityManager.find(Consultas.class, consulta.getId());
		entityManager.remove(consulta);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	@SuppressWarnings("unchecked")
	public boolean consultaData(String data, int idMedico, int idPaciente) {
		List<Consultas> consultas = null;
		try {
			consultas = entityManager.createQuery(
					"FROM " + Consultas.class.getName() + " WHERE dataConsulta = '" + data + "' AND medico_id = "
							+ idMedico + " OR dataConsulta = '" + data + "' AND paciente_id = " + idPaciente)
					.getResultList();
		} catch (NoResultException e) {
			return false;
		}

		if (consultas.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Consultas> listarMedico(int idMedico, String data) {
		return entityManager.createQuery("FROM " + Consultas.class.getName() + " WHERE dataConsulta > '" + data
				+ "' AND medico_id = " + idMedico+" ORDER BY dataConsulta ASC").getResultList();

	}

	@SuppressWarnings("unchecked")
	public List<Consultas> listarPaciente(int idPaciente, String data) {
		return entityManager.createQuery("FROM " + Consultas.class.getName() + " WHERE dataConsulta > '" + data
				+ "' AND paciente_id = " + idPaciente+" ORDER BY dataConsulta ASC").getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Consultas> prontuario(int idPaciente) {
		return entityManager.createQuery("FROM " + Consultas.class.getName() + " WHERE paciente_id = " + idPaciente+" ORDER BY dataConsulta ASC").getResultList();
	}
}