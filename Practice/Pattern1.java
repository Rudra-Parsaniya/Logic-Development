package Practice;

import java.util.Scanner;

public class Pattern1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the value");
        int n = sc.nextInt();
        int i, j;
        
        for (i = 1; i <= n; i++) {
            
            //print space
            for (j = 1; j <= n - i; j++) {
                System.out.print(" ");
            }
            
            //print star
            for (j = 1; j <= i; j++) {
                System.out.print(i + " ");
            }
            
            // new line for each row
            System.out.println();
    }
    
}
}
