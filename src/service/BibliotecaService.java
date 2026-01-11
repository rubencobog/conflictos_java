package service;

import model.Libro;
import model.Reserva;
import model.Usuario;
import util.Validador;

import java.util.ArrayList;
import java.util.List;

public class BibliotecaService {

    private List<Reserva> reservas = new ArrayList<>();

    public void reservarLibro(Usuario usuario, Libro libro) {
        if (!Validador.validarUsuario(usuario)) {
            System.out.println("Usuario no válido");
            return;
        }

        if (!libro.isDisponible()) {
            System.out.println("Libro no disponible");
            return;
        }

        libro.setDisponible(false);
        reservas.add(new Reserva(usuario, libro));
        System.out.println("Reserva realizada correctamente");
    }

    public void listarReservas() {
        for (Reserva r : reservas) {
            System.out.println(r);
        }
    }
}
