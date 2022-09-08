package com.clinicamedica.exception;

public class MedicoCadastradoException extends Exception {

	private static final long serialVersionUID = 1L;

	public MedicoCadastradoException() {
		super("Medico ja cadastrado");
	}
}