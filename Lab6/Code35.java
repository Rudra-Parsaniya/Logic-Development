package Lab6;

import java.util.Scanner;

public class Code35 {
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

    
        int count = 0;
        for(int i=0; i<size; i++){
            if(arr[i] > arr[i+1]){
                
                count++;
            }
                System.out.println(arr[i]);
            }
        
        System.out.println("\n" + count);

        if(count <= 1){
            System.out.println("asc");
        }
        else{
            System.out.println("not asc");
        }
    }
}
