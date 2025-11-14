package Lab4;

public class Removeduplicate {
    public static void main(String[] args) {
        int arr1[] ={10,10,20,30,20,30,40};

        for(int i=0;i<arr1.length;i++)
        {
            int temp=arr1[i];
            for(int j=i+1;j<arr1.length;j++)
            {
                if(temp==arr1[j])
                {
                    arr1[j] = -1;
                }
            }
            if(arr1[i]!=-1)
            {
                System.err.println(arr1[i]);
            }
        }
    }
}
