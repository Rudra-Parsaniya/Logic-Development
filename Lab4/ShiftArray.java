package Lab4;

public class ShiftArray {
    public static void main(String[] args) {
        int arr1[] = {30,2,4,66,9};
        int[] result= shiftArrayElement(arr1);
        
        for(int i=0; i<result.length; i++){
            System.out.println(result[i] + " ");
        }
    }
    public static int[] shiftArrayElement(int[] arr){
        int temp = arr[arr.length-1];
        for(int i=arr.length-1; i>0; i--){
            arr[i] = arr[i-1];
        }
        arr[0] = temp;
        return arr;   
    }
}
