package com.clinicamedica.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import java.util.List;

import com.clinicamedica.entidades.Paciente;

public class PacienteJpaDao {

	private static PacienteJpaDao instancia;
	protected EntityManager entityManager;

	public static PacienteJpaDao getInstance() {
		if (instancia == null) {
			instancia = new PacienteJpaDao();
		}
		return instancia;
	}

	private PacienteJpaDao() {
		entityManager = getEntityManager();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("conexaoBd");

		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}

		return entityManager;
	}

	public Paciente getById(final int id) {
		return entityManager.find(Paciente.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Paciente> findAll() {
		return entityManager.createQuery("FROM " + Paciente.class.getName()).getResultList();
	}

	public void put(Paciente paciente) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		entityManager.persist(paciente);
		entityManager.getTransaction().commit();
	}

	public void update(Paciente paciente) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		entityManager.merge(paciente);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public void del(final int id) {
		Paciente paciente = getById(id);

		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		paciente = entityManager.find(Paciente.class, paciente.getId());
		entityManager.remove(paciente);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public Paciente findCpf(long cpf) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		Paciente paciente = null;

		try {

			paciente = (Paciente) entityManager.createQuery("FROM " + Paciente.class.getName() + " WHERE cpf = " + cpf)
					.getSingleResult();

		} catch (NoResultException e) {

		}

		return paciente;
	}

	public Paciente login(String usuario, int senha) {

		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();
		
		Paciente paciente = null;
		
		try {

			paciente = (Paciente) entityManager
					.createQuery("FROM " + Paciente.class.getName() + " WHERE cpf = " + usuario + " AND senha = " + senha)
					.getSingleResult();
		} catch (NoResultException e) {

		}

		return paciente;
	}
}