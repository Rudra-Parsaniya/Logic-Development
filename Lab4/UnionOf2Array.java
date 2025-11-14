package Lab4;

public class UnionOf2Array {
    public static void main(String[] args) {
        int[] arr1 = {10,30,50,60};
        int[] arr2 = {20,40,60};
        int[] result = merge(arr1, arr2);

        for(int i=0;i<result.length;i++)
        {
            int temp=result[i];
            for(int j=i+1;j<result.length;j++)
            {
                if(temp==result[j])
                {
                    result[j] = -1;
                }
            }
            if(result[i]!=-1)
            {
                System.err.println(result[i]);
            }
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
    public static void union(int[] arr3){
        

     }
}