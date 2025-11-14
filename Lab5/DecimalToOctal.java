package Lab5;

public class DecimalToOctal {
    public static void main(String[] args) {
        System.out.println(decimalToOcatl(25));
        
    }
    public static int decimalToOcatl(int n){
        int oct=0, place=1, count=0;
        while (n != 0) {
            int rem = n%8;
            count++;
            oct = oct + (rem * place);
            place = place * (int) (Math.pow(10, count));
            n = n / 8; 
        }
        return oct;
    }
}
