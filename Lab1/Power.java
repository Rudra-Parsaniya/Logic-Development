package Lab1;

public class Power {
    public static void main(String[] args) {
        System.out.println(power(3,3));
    }
    public static int power(int x, int y){
        int ans = 1;
        for(int i=1; i<=y; i++){
            ans *= x;
        }
        return ans;
    }
    
}
