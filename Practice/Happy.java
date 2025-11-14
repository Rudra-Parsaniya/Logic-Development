package Practice;

import java.util.Scanner;

public class Happy {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("enter the value: ");
        int n = sc.nextInt();

        int sum = n;
        int x = n;
        int d;
        
        while(sum > 9){
            sum = 0;
            while(x > 0){
                d = x%10;
                sum += d*d;
                x = x/10;
            }
            x = sum;

        }

        if(sum == 1 || sum == 7){
            System.out.println("it is a happy number");
        }
        else{
            System.out.println("it is not a happy number");
        }
    }
    
}
