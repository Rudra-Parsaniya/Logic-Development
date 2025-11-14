package Lab1;

public class SumOfDigits {
    public static void main(String[] args) {
        System.out.println(sumofdigits(123));
    }
    public static int sumofdigits(int n){
        int ans=0, rem=0;
        while(n!=0){
            rem = n%10; //it will give last no.
            ans += rem; //add last  no.
            n = n/10;  //remove that no. after adding 
        }
        return ans;
    }
    
}
