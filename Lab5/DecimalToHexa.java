package Lab5;

import java.util.Scanner;

public class DecimalToHexa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("enter number");
        int n = sc.nextInt();

        int[] arr = new int[100];
        int i = 0;
        while (n!=0) {
            arr[i] = n%16;
            n = n/16;
            i++;
        }
        for(int j=i-1; j>=0; j--){
            if(arr[j] > 9){
                System.out.print((char)(55+arr[j]));
            }
            else{
                System.out.print(arr[j]);
            }
        }
    }
}
