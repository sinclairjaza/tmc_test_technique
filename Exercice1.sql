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

/*creation de la table service
* La table Service stocke les informations sur les différents services de l'entreprise
*/
CREATE TABLE service (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

/*creation de la table employe service
* La table Employee_Service permet de stocker les relations entre les salariés et les services. 
* Elle est utilisée pour indiquer les services auxquels chaque salarié appartient
*/
CREATE TABLE employee_service (
  employee_id INT NOT NULL,
  service_id INT NOT NULL,
  PRIMARY KEY (employee_id, service_id),
  FOREIGN KEY (employee_id) REFERENCES employee(id),
  FOREIGN KEY (service_id) REFERENCES service(id)
);

/*
* La table service_relationship stocke les relations entre les différents services de l'entreprise. 
* Elle est utilisée pour indiquer quels sont les services parents et enfants,
*/
CREATE TABLE service_relationship (
  parent_service_id INT,
  child_service_id INT,
  PRIMARY KEY (parent_service_id, child_service_id),
  FOREIGN KEY (parent_service_id) REFERENCES service(id),
  FOREIGN KEY (child_service_id) REFERENCES service(id)
);

/*
* La table service_employee permet de stocker les relations entre les services et les salariés qui y travaillent. 
*/
CREATE TABLE service_employee (
  service_id INT,
  employee_id INT,
  PRIMARY KEY (service_id, employee_id),
  FOREIGN KEY (service_id) REFERENCES service(id),
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

/*
* La table employee_manager permet de stocker les relations de management entre les salariés. 
* Chaque entrée indique que l'employé avec l'ID employee_id est managé par l'employé avec l'ID manager_id.
*/
CREATE TABLE employee_manager (
  employee_id INT,
  manager_id INT,
  PRIMARY KEY (employee_id, manager_id),
  FOREIGN KEY (employee_id) REFERENCES employee(id),
  FOREIGN KEY (manager_id) REFERENCES employee(id)
);
