package Practice;

import java.util.Scanner;

public class Kaprakar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the value");
        int n = sc.nextInt();

        int square = n*n;
        int count = 0;
        int temp = n;

        while(temp!=0){
            count++;
            temp/=10;
        }

        int secondpart = square % (int) (Math.pow(10,count));
        int firstpart = square / (int)(Math.pow(10,count));

        if(n == (secondpart+firstpart)){
            System.out.println("it is  a kaprekar number");
        }
        else{
            System.out.println("it is not a kaprekar number");
        }
    }
    
}
