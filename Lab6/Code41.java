package Lab6;

import java.util.Scanner;

public class Code41 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the number of disk: ");
        int n = sc.nextInt();

        int move = 1;

        for(int i=1; i<=n; i++){
            move *= 2;
        }
        move = move-1;

        System.out.println("the number of moves for arrange all disk in order in target rod are : " + move);
        

    }
    
}
