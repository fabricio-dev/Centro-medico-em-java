package com.clinicamedica.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;

import com.clinicamedica.entidades.Medico;

public class MedicoJpaDao {
	private static MedicoJpaDao instancia;
	protected EntityManager entityManager;

	public static MedicoJpaDao getInstance() {
		if (instancia == null) {
			instancia = new MedicoJpaDao();
		}
		return instancia;
	}

	private MedicoJpaDao() {
		entityManager = getEntityManager();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("conexaoBd");

		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}

		return entityManager;
	}

	public Medico getById(final int id) {
		return entityManager.find(Medico.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Medico> findAll() {
		return entityManager.createQuery("FROM " + Medico.class.getName()).getResultList();
	}

	public void put(Medico medico) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();
		
		entityManager.persist(medico);
		entityManager.getTransaction().commit();
	}

	public void update(Medico medico) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		entityManager.merge(medico);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public void del(final int id) {
		Medico medico = getById(id);

		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		medico = entityManager.find(Medico.class, medico.getId());
		entityManager.remove(medico);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public Medico findCpf(long cpf, long crm) {
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		Medico medico = null;

		try {

			medico = (Medico) entityManager
					.createQuery("FROM " + Medico.class.getName() + " WHERE cpf = " + cpf + " OR crm = " + crm)
					.getSingleResult();

		} catch (NoResultException e) {

		}

		return medico;
	}

	public Medico login(String usuario, int senha) {
		
		if (!entityManager.getTransaction().isActive())
			entityManager.getTransaction().begin();

		Medico medico = null;

		try {

			medico = (Medico) entityManager
					.createQuery("FROM " + Medico.class.getName() + " WHERE crm = " + usuario + " AND senha = " + senha)
					.getSingleResult();

		} catch (NoResultException e) {

		}

		return medico;
	}
	
	public int recuperarId() {
		return (Integer)entityManager.createQuery("select max(id)+1 FROM " + Medico.class.getName()).getSingleResult();
	}
}