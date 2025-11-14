package Lab6;

import java.util.Scanner;

public class DiffOf2ndLargeAndSmall {
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

        for(int i=0; i<size-1; i++){
            for(int j=0; j<size-i-1; j++){
                if(arr[j]>arr[j+1]){
                    temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        System.out.print("\nsorted array is: ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }
        System.out.println("\n");
        for (int i = 0; i < size; i++) {
            for (int j = i + 1; j < size; j++) {
                if (arr[i] == arr[j]) {
                    
                    for (int k = j; k < size - 1; k++) {
                        arr[k] = arr[k + 1];
                    }
                    size--; 
                    j--;   
                }
            }


    }
        int secLarge = arr[size-2];
        System.out.println("second largest : "+secLarge);
        int secSmall = arr[1];
        System.out.println("second smallest : "+secSmall);
        System.out.println("\ndifference is: "+ (secLarge-secSmall));
    
}
}
