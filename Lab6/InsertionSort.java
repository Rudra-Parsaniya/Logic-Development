package Lab6;

import java.util.Scanner;

public class InsertionSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
       
        System.out.print("Enter the size of array: ");
        int size = sc.nextInt();

        int[] arr = new int[size + 1]; 
        int  j;
        int key;

        System.out.println("Enter " + size + " elements:");
        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt();
        }
        System.out.print("array is : ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }

        for(int i=1; i<size; i++){
            key = arr[i];
            j = i-1;

            while(j>=0 && key<arr[j]){
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = key;
        }

        System.out.print("\nsorted array is : ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }
        

    }

    
}
