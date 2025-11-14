package Practice;

import java.util.Scanner;

public class Pattern3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the value");
        int n = sc.nextInt();

        int i, j;
        
        for (i = 1; i <= n; i++) {
            
            for (j = 1; j <= n+1 - i; j++) {

                System.out.print(j + " ");
            }
            System.out.println();
        }
    }
    
}
