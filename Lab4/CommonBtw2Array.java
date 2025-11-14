package Lab4;

public class CommonBtw2Array {
    public static void main(String[] args) {
        int[] arr1 = {10,30,50,10};
        int[] arr2 = {20,30,60,40,50};
        
        System.out.println("common between two array are:");
        duplicate(arr1, arr2);
    }
    
    public static void duplicate(int[] arr1, int[] arr2){
        
        for(int i=0;i<arr1.length;i++){
            int temp = arr1[i];
            for(int j=0; j<arr2.length; j++){
                if(temp == arr2[j]){
                    System.out.println(arr1[i]);
                }
            }
        }
    }
}
