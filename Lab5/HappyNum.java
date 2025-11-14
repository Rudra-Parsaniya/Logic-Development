package Lab5;

import java.util.Scanner;

public class HappyNum {
    public static void main(String[] args) {
        int rem;
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number:");
        int n = sc.nextInt();

        int sum = n;
        int x = n;

        while(sum > 9){
            sum = 0;

            while(x > 0){
                int d = x%10;
                sum += d*d;
                x = x/10;
            }
            x = sum;
        }
        if(sum == 1 || sum == 7){
            System.out.println("it is happy number");
        }
        else{
            System.out.println("it is not an happy number");
        }    
    }
}
