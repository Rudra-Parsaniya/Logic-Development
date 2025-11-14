package Lab4;

public class Merge2Array {
    public static void main(String[] args) {
        int[] arr1 = {10,30,50};
        int[] arr2 = {20,40,60};
        int[] result = merge(arr1, arr2);
        for(int i=0; i<result.length; i++){
            System.out.println(result[i] + " ");
        }
        
    }
    public static int[] merge(int[] arr1, int[] arr2){
        int newArrLen = arr1.length + arr2.length;
        int[] newArr = new int[newArrLen];
        int k=0; 
        for(int i=0; i<arr1.length; i++){
            newArr[k] = arr1[i];
            k++;
        }
        for(int j=0; j<arr2.length; j++){
            newArr[k] = arr2[j];
            k++;
        }
        return newArr;
    }
}

