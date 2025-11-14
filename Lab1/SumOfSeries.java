package Lab1;

public class SumOfSeries {
    public static void main(String[] args) {
        System.out.println(sumofseries(5));
    }
    public static int sumofseries(int n){
        int ans = 0;
        for(int i=1; i<=n; i++){
            ans += (i*i);
        }
        return ans;

    }
}
