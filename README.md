# Produccion
link: [https://testing-p2.herokuapp.com/flights](https://testing-p2.herokuapp.com/flights)

# Uso de la página
Para reservar, los asientos disponibles son los verdes. En el campo de input se deben poner los asientos deseados separados por un "-" (e.g. `1A-13B-3C`).

# Prerequisitos
- Ruby: `ruby-2.7.4`
- Rails: `Rails 7.0.3`
- Postgres: `psql > 11.16`

# Guía de Instalacion

1. Clonar el repositorio
2. Correr `bundle install`
3. Crear una base de datos con postgres
4. Crear un archivo `.env` con lo siguiente:

```
USER=db_user
DB=db_name
PASSWORD=password
DB_TEST=test_db_name
```
5. Correr `bin/rails db:migrate`
6. Para correr la aplicacion correr `bin/rails s` y dirigirse a `http://localhost:3000`

# Capybara Tests

Para correr los test con capybara, luego de iniciar la base de datos, se debe correr el comando ```rspec``` en la terminal.

# Unit test

Para correr los unit test se debe ejecutar `bin/rails test _archivo_`, donde `_archivo_` son los siguiente posibles archivos.

```
test/models/flight_test.rb
test/models/reservation_test.rb
test/controllers/flights_controller_test.rb
test/controllers/reservations_controller_test.rb
```

