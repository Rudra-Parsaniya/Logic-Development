package Lab6;

public class Code40 {
    public static void main(String[] args) {
        int[] arr1 = {10,30,50};
        int[] arr2 = {20,40,60};
        int[] result = merge(arr1, arr2);
        for(int i=0; i<result.length; i++){
            System.out.println(result[i] + " ");
        }
        int temp;
        for(int i=0; i<result.length; i++){
            for(int j=0; j<result.length-i-1; j++){
                if(result[j]>result[j+1]){
                    temp = result[j];
                    result[j] = result[j+1];
                    result[j+1] = temp;
                }
            }
        }
        System.out.print("\nsorted array is: ");
        for(int i=0; i<result.length; i++){
            System.out.print(result[i]+ " ");
        }

        int n = result.length-1;
        System.out.println();
        int median;

        if(n%2 != 0){
            median = (result[n/2]+result[(n/2)+1]) / 2;
            System.out.println("median is "+ median);
        }
        else{
            median = result[n/2];
            System.out.println("median is "+ median);
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
