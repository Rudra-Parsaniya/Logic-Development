package Lab5;

import java.util.Scanner;

public class Pattern6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("enter number");
        int n = sc.nextInt();
        int num = 1;
        int x;
        for(int i=1; i<=n; i++){

            if(i%2 == 0){
                
                for(int j=n; j>=1; j--){
                    System.out.print(" "+num);
                    num--;
                }
                
                num = (num+1) + n;
                System.out.println();
            }
            else{
                
                for(int j=1; j<=n; j++){
                    System.out.print(" "+num);
                    num++;
                }
                
                num = (num-1) + n;
                System.out.println();
            }
        }
    }
    
}
