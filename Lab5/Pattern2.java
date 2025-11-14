package Lab5;

public class Pattern2 {
    public static void main(String[] args) {
        for(int i=0; i<=4; i++){
            int n = 5;
            int x = n-1;
            int y = i+1;
            for(int j=0; j<=i; j++){
                System.out.print(" "+ y);
                y += x;
                x--;
            }
            System.out.print("\n");
        }
    }
    
}
