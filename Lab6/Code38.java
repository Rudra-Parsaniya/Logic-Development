package Lab6;

import java.util.Arrays;
import java.util.Scanner;

public class Code38 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
       
        System.out.print("Enter the size of array: ");
        int size = sc.nextInt();

        int[] arr = new int[size + 1]; 
        int temp;
        System.out.println("Enter " + size + " elements:");
        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt();
        }
        System.out.print("array is : ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }

        // for(int i=0; i<size-1; i++){
        //     for(int j=0; j<size-i-1; j++){
        //         if(arr[j]>arr[j+1]){
        //             temp = arr[j];
        //             arr[j] = arr[j+1];
        //             arr[j+1] = temp;
        //         }
        //     }
        // }
        // System.out.print("\nsorted array is: ");
        // for(int i=0; i<size; i++){
        //     System.out.print(arr[i]+ " ");
        // }
        System.out.println();
        int count = 0;
        int end =0;
        for(int i=0; i<size; i++){
            if(arr[i] > arr[i+1]){
                end++;
                break;
            }
            else if(arr[i] == arr[i+1]){
                count++;
            }
            else{
                if(count >= 2){
                    count = 0;
                    continue;
                }
                else{
                    end++;
                    break;
                    
                }

            }
        }
        if(end == 0){
            System.out.println("1");
        }
        else{
            System.out.println("0");
        }
    }
}
