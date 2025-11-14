package Practice;

import java.util.Scanner;

public class Pattern4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the value");
        int n = sc.nextInt();

        int i, j;

        // outer loop to handle number of rows
        for (i = 1; i <= n; i++) {
            
            // inner loop to print the spaces
            for (j = 1; j <= n - i; j++) {
                System.out.print(" ");
            }

            // inner loop to print the first part
            for (j = i; j >= 1; j--) {
                System.out.print(j);
            }

            // inner loop to print the second part
            for (j = 2; j <= i; j++) {
                System.out.print(j);
            }

            // printing new line for each row
            System.out.println();
        }
    }
}

    