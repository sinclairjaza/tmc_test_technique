/*
Livrable : .java
Faire une boucle de 1 a 100
quand on rencontre un multiple de 3 imprimer "Chausettes"
quand on rencontre un multiple de 5 imprimer "Sales"
quand on rencontre un multiple de 3 et de 5 imprimer "ChausettesSales"
sinon imprimer le nombre
*/

public class Exercice2 {

    public static void multipleThreeOrFive(){
        for (int i = 1; i <= 100; i++) {
            boolean isMultipleOf3 = i % 3 == 0;
            boolean isMultipleOf5 = i % 5 == 0;

            //si c'est multiple de 3 et de 5
            if (isMultipleOf3 && isMultipleOf5) {
                System.out.println("ChausettesSales");
            }
            //si c'est multiple de 3
            else if (isMultipleOf3) {
                System.out.println("Chausettes");
            }
            //si c'est multiple de 5
            else if (isMultipleOf5) {
                System.out.println("Sales");
            }
            else {
                System.out.println(i);
            }
        }
    }

    public static void main(String[] args) {
        multipleThreeOrFive();
    }
        
}
