package model;

public class Libro {
    private String isbn;
    private String titulo;
    private boolean disponible;

    public Libro(String isbn, String titulo) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.disponible = true;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    @Override
    public String toString() {
        return titulo + " (" + isbn + ") - " +
               (disponible ? "Disponible" : "No disponible");
    }
}
