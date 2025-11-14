package Lab1;
public class SumOf10No {
    public static void main(String[] args) {
        System.out.println(sumOf10No());
        
    }
    public static int sumOf10No(){
            int sum = 0;
            for(int i=0; i<=10; i++){
                sum+=i;
            }
            return sum;
        }

}

    
