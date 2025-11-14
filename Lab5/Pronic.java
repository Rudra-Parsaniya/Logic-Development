package Lab5;

public class Pronic {
    public static void main(String[] args) {
        if(isPronic(13)){
            System.out.println("Given number is pronic");
        }
        else{
            System.out.println("Given number not is pronic");
        }
    }
    public static boolean isPronic(int n){
        int flag = 0; 
        for(int i=1; i<=n; i++){
            if(i * (i+1) == n){
                flag = 1;
                break; 
            }
        }
        if(flag == 1){
            return true;
        }
        return false;
    }
}
