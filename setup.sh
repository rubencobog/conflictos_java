#!/bin/bash

echo "Inicializando repositorio..."
git init
git branch -m main

git add .
git commit -m "Base funcional: gestión de biblioteca en consola"

########################################
# conflict-metodo-modelo
########################################
git checkout -b conflict-metodo-modelo

sed -i '' 's/private boolean disponible;/private int reservasActivas;/' src/model/Libro.java
sed -i '' 's/this.disponible = true;/this.reservasActivas = 0;/' src/model/Libro.java
sed -i '' 's/return disponible;/return reservasActivas == 0;/' src/model/Libro.java

git add src/model/Libro.java
git commit -m "Cambio de lógica de disponibilidad en Libro"

########################################
# conflict-servicio-logica
########################################
git checkout main
git checkout -b conflict-servicio-logica

sed -i '' 's/public void reservarLibro(/public boolean reservarLibro(/' src/service/BibliotecaService.java
sed -i '' 's/return;/return false;/' src/service/BibliotecaService.java
sed -i '' 's/System.out.println("Reserva realizada correctamente");/System.out.println("Reserva OK"); return true;/' src/service/BibliotecaService.java

git add src/service/BibliotecaService.java
git commit -m "Nueva lógica de validación y retorno en reservas"

########################################
# conflict-rename-clase
########################################
git checkout main
git checkout -b conflict-rename-clase

mv src/model/Reserva.java src/model/Prestamo.java
sed -i '' 's/Reserva/Prestamo/g' src/model/Prestamo.java
sed -i '' 's/Reserva/Prestamo/g' src/service/BibliotecaService.java

git add .
git commit -m "Renombrada clase Reserva a Prestamo"

########################################
# conflict-delete-vs-edit
########################################
git checkout main
git checkout -b conflict-delete-vs-edit

rm src/util/Validador.java
sed -i '' '/Validador/d' src/service/BibliotecaService.java

git add .
git commit -m "Eliminado Validador y movida lógica al servicio"

########################################
# conflict-main-flow
########################################
git checkout main
git checkout -b conflict-main-flow

sed -i '' 's/main(String\\[] args)/main(String[] args) {\\n        System.out.println("Inicio aplicación");/' src/app/Main.java

git add src/app/Main.java
git commit -m "Nuevo flujo principal con más lógica"

########################################
# conflict-semantico
########################################
git checkout main
git checkout -b conflict-semantico

sed -i '' 's/int id;/String email;/' src/model/Usuario.java
sed -i '' 's/int id, String nombre/String email, String nombre/' src/model/Usuario.java

git add src/model/Usuario.java
git commit -m "Usuario identificado por email en lugar de id"

########################################
git checkout main
echo "Repositorio preparado con todas las ramas."
