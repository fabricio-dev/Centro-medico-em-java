package com.clinicamedica.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "prontuario")
public class Prontuario {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	private Paciente paciente;
	@ManyToOne
	private Medico medico;
	@ManyToOne
	private Exames exames;
	@ManyToOne
	private Prescricoes prescricoes;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Paciente getPaciente() {
		return paciente;
	}
	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}
	public Medico getMedico() {
		return medico;
	}
	public void setMedico(Medico medico) {
		this.medico = medico;
	}
	public Exames getExames() {
		return exames;
	}
	public void setExames(Exames exames) {
		this.exames = exames;
	}
	public Prescricoes getPrescricoes() {
		return prescricoes;
	}
	public void setPrescricoes(Prescricoes prescricoes) {
		this.prescricoes = prescricoes;
	}
}