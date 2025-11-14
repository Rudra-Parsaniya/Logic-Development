package Lab6;

import java.util.Scanner;

public class Code36 {
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

        System.out.print("\nenter the value: ");
        int K = sc.nextInt();
        int count = 0;
        for(int i=0; i<size; i++){
            for(int j=i+1; j<size; j++){
                if(arr[i]+arr[j] == K){
                    count++;
                }
            }
        }
        System.out.println(count);
    }
    
}
