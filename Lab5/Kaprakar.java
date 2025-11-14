package Lab5;

public class Kaprakar {
    public static void main(String[] args) {
         if(isKaprekar(45)){
            System.out.println("Given number is Kaprekar");
        }
        else{
            System.out.println("Given number not is Kaprekar");
        }
    }
    public static boolean isKaprekar(int n){
        int squ = n * n;
        int temp = n, count=0;
        while (temp!=0) {
            count++;
            temp/=10;
        }
        int secondPart = squ % (int) (Math.pow(10, count));
        int firstPart = squ / (int) (Math.pow(10, count));

        if((firstPart + secondPart) != n){
            return false;
        }
        return true;
    }
}
