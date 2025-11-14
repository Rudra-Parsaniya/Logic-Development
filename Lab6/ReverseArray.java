package Lab6;

import java.util.Scanner;

public class ReverseArray {
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

        //logic
        for(int i=0; i<size/2; i++){
            int temp = arr[i];
            arr[i] = arr[size-i-1];
            arr[size-i-1] = temp;
        }

        System.out.print("\nreversed array is :");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }

    }
    
}
