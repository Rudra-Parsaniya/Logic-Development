package Lab6;
import java.util.Scanner;

public class CheckInArray {

    static int isInArray(int[] a, int size, int m) {
        if (size == 0)       
            return 0;
        if (a[size - 1] == m) 
            return 1;
        return isInArray(a, size - 1, m); 
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter size of array: ");
        int n = sc.nextInt();

        int[] a = new int[n];
        System.out.println("Enter " + n + " elements:");
        for (int i = 0; i < n; i++)
            a[i] = sc.nextInt();

        System.out.print("Enter element to search: ");
        int m = sc.nextInt();

        if (isInArray(a, n, m) == 1)
            System.out.println(m + " is present in the array.");
        else
            System.out.println(m + " is not present in the array.");

        sc.close();
    }
}
