package Practice;

import java.util.Scanner;

public class Ugly {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("enter the value: ");
        int n = sc.nextInt();
        int flag = 0;

        while(n!=1){

            if(n % 5 == 0){
                n = n/5;
            }
            else if(n % 3 == 0){
                n = n/5;
            }
            else if(n % 2 == 0){
                n = n/2;
            }
            else{
                System.out.println("it is not an ugly number");
                flag = 1;
                break;
            }
        
        }
        if(flag == 0){
            System.out.println("it is an ugly number");
        }
    }
    
}
