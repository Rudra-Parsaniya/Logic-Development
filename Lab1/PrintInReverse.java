package Lab1;

public class PrintInReverse {
    public static void main(String[] args) {
        printreverse(1234);
    }

    public static void printreverse(int n){
        int rem = 0;
        while(n!=0){
            rem = n%10;  //it will give last number
            System.out.println(rem);  //print that no.
            n = n/10;  //remove last no.
        }
        
    }
}
