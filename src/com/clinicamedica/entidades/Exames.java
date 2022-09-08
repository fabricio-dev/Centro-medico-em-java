package com.clinicamedica.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "exame")
public class Exames {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nomeExame;
	private String motivoExame;
	private String resultado;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomeExame() {
		return nomeExame;
	}
	public void setNomeExame(String nomeExame) {
		this.nomeExame = nomeExame;
	}
	public String getMotivoExame() {
		return motivoExame;
	}
	public void setMotivoExame(String motivoExame) {
		this.motivoExame = motivoExame;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}	
}