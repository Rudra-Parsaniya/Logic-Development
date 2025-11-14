package Lab5;

public class Pattern4 {
    public static void main(String[] args) {
        for(int i=0; i<9; i++){
            for(int j=0; j<9; j++){

                if(j == j/2+1){
                    System.out.print("*");
                }
                else if(i == i/2+1){
                    System.out.print("*");
                }
                else{
                    System.out.println(" ");
                }
            }
        System.out.print("\n");
        }
    }
    
}
