package app;

import model.Libro;
import model.Usuario;
import service.BibliotecaService;

public class Main {

    public static void main(String[] args) {

        BibliotecaService biblioteca = new BibliotecaService();

        Usuario usuario = new Usuario(1, "Ana");
        Libro libro = new Libro("ISBN123", "Programación en Java");

        biblioteca.reservarLibro(usuario, libro);
        biblioteca.listarReservas();
    }
}
