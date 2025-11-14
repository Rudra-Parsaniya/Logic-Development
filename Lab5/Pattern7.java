package Lab5;

import java.util.Scanner;

public class Pattern7 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number:");
        int n = sc.nextInt();
        int size = 2*n-1;

        for(int i=0; i<size; i++){
            for(int j=0; j<size; j++){
                int minDist = Math.min(Math.min(i, j), Math.min(size-1-i, size-1-j));
                System.out.print((n-minDist)+"  ");
            }
            System.out.println();
        }
    }
    
}
