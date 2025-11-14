package Lab6;

import java.util.Scanner;

public class Wrapper {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the value of rupees: ");
        int n = sc.nextInt();  

        System.out.print("Enter the price of 1 chocolate: ");
        int m = sc.nextInt();  

        System.out.print("Enter number of wrappers needed to exchange for 1 chocolate: ");
        int k = sc.nextInt(); 

        int chocolates = n / m;

        int wrappers = chocolates;

        while (wrappers >= k) {
            int extra = wrappers / k;       
            chocolates += extra;            
            wrappers = (wrappers % k) + extra;
        }

        System.out.println("Total chocolates you can get: " + chocolates);

        sc.close();
    }
}
