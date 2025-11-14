package Practice;

import java.util.Scanner;

public class Pronic {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("enter the value: ");
        int n = sc.nextInt();
        int flag = 0;
        for(int i=0; i<=n; i++){
            if(i * (i+1) == n){
                flag = 1;
                break;
            }
            else{
                continue;
            }

        }
        if(flag == 1){
            System.out.println("it is pronic number");
        }
        else{
            System.out.println("it is not a pronic number");
        }
        
        
    }
    
}
