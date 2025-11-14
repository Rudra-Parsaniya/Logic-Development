package Practice;

import java.util.Scanner;

public class Automorphic {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the value");
        int n = sc.nextInt();
        int count = 0;

        while(n != 0){
            count++;
            n = n/10;
        }

        int square = n*n;
        int rem = (int) (square % Math.pow(10,count));

        if(n == rem){
            System.out.println("it is automorphic number");
        }
        else{
            System.out.println("it is not an automorphic number");
        }
        
    }
    
}
