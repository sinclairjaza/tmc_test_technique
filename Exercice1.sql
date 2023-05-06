/*
Livrable : .sql
Faire un schema de db pour le cas suivant:
Dans une entreprise on a des salariés qui ont chacun un nom - prenom - date de naissance.
Chaque salarié dispose d'un ou plusieurs contrats qui contiennent la date de signature - la duree - le salaire.
Chaque salarié a des membres de la famille qui ont eux aussi un nom - prenom - ddn.
L'entreprise possedes plusieurs service, qui sont diriger par un employee et qui en contiennent plusieurs autres (services).
Chaque employee peut avoir plusieurs services

*/

/*creation de la base de données*/
CREATE DATABASE exercice_1;

USE exercice_1;

/*creation de la table employe*/
CREATE TABLE employee (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE NOT NULL
);

/*creation de la table contrat*/
CREATE TABLE contract (
  id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  signature_date DATE NOT NULL,
  duration INT NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

/*creation de la table membre de famille*/
CREATE TABLE family_member (
  id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

/*creation de la table service*/
CREATE TABLE service (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  manager_id INT NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES employee(id)
);

/*creation de la table employe service pour la gestion des services par des employes*/
CREATE TABLE employee_service (
  id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  service_id INT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee(id),
  FOREIGN KEY (service_id) REFERENCES service(id)
);
