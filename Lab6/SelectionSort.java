package Lab6;

import java.util.Scanner;

public class SelectionSort {
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

        for(int step = 0; step<size-1; step++){
            int min_idx = step;
            for(int i=step+1; i<size; i++){
                if(arr[i]<arr[min_idx]){
                    min_idx = i;
                }
            }
            int temp = arr[step];
            arr[step] = arr[min_idx];
            arr[min_idx] = temp;
        }

        System.out.print("\nsorted array is : ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }
        

    }
}
