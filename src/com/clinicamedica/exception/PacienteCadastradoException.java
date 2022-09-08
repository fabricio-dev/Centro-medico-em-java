package com.clinicamedica.exception;

public class PacienteCadastradoException extends Exception {

	private static final long serialVersionUID = 1L;

	public PacienteCadastradoException() {
		super("Usuario ja cadastrado");
	}
}