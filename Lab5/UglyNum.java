package Lab5;

import java.util.Scanner;

public class UglyNum {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number:");
        int n = sc.nextInt();

        int x = 0;
        while(n != 1){
        if(n %5 ==0){
            n /= 5;
        }
        else if(n%3 == 0){
            n /= 3;
        }
        else if(n%2 == 0){
            n /= 2;
        }
        else{
            System.out.println("it is not an ugly number");
            x = 1;
            break;
        }
    }
    if (x == 0){
        System.out.println("it is an ugly number");
    }
    
    }

}
