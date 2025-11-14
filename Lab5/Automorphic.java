package Lab5;

import java.util.Scanner;

public class Automorphic {
    public static void main(String[] args) {
         Scanner sc = new Scanner(System.in);
        System.out.println("Enter number:");
        int n = sc.nextInt();
        if(isArtomorphic(n)){
            System.out.println("Given number is Artomorphic");
         }
         else{
             System.out.println("Given number not is Artomorphic");
         }
    }

     public static boolean isArtomorphic(int n){
        int temp = n, count=0;
        while (temp != 0) {
            count++;
            temp = temp / 10; 
        }
        int square = n * n;
        int rem = (int) (square % Math.pow(10, count));
        if(n != rem){
            return false;
        }
        return true;
}
}