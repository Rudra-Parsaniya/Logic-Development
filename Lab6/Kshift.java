package Lab6;

import java.util.Scanner;

public class Kshift {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
       
        System.out.print("Enter the size of array: ");
        int size = sc.nextInt();

        int[] arr = new int[size + 1]; 

        System.out.println("Enter " + size + " elements:");
        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt();
        }
        System.out.print("array is :");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }

        System.out.print("\nenter the value of k (shift): ");
        int k = sc.nextInt();
        

        //logic
        for(int i=0; i<k; i++){
            int temp  =arr[size - 1];

            for(int j =size-1; j>0; j--){
                arr[j] = arr[j-1];
            }
            arr[0] = temp;
        }
        System.out.print("shifted array is :");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }
    }
}