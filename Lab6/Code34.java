package Lab6;

import java.util.Scanner;

public class Code34 {
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
        System.out.print("\nafter removing duplicate in array is: ");
        for(int i=0; i<size; i++){
            System.out.print(arr[i]+ " ");
        }
        System.out.println("\n");  
        
        if(size>=2){
        int secLarge = arr[size-2];
            if(secLarge >= 0){
                System.out.println("second largest : "+secLarge);
            }
            else{
                System.out.println("-1");
            }
        }
        else{
            System.out.println("-1");
        }
    }
}
