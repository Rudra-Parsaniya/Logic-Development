package Lab6;


import java.util.*;

public class LargestDivisibleBy3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of digits (N): ");
        int N = sc.nextInt();
        int[] digits = new int[N];

        System.out.println("Enter the digits:");
        for (int i = 0; i < N; i++) {
            digits[i] = sc.nextInt();
        }

        Arrays.sort(digits);

        int sum = 0;
        for (int d : digits) sum += d;

        int rem = sum % 3;

        List<Integer> rem1 = new ArrayList<>();
        List<Integer> rem2 = new ArrayList<>();
        for (int d : digits) {
            if (d % 3 == 1) rem1.add(d);
            else if (d % 3 == 2) rem2.add(d);
        }

        if (rem == 1) {
            if (!rem1.isEmpty()) digits = removeDigit(digits, rem1.get(0));
            else if (rem2.size() >= 2) {
                digits = removeDigit(digits, rem2.get(0));
                digits = removeDigit(digits, rem2.get(1));
            }
        } else if (rem == 2) {
            if (!rem2.isEmpty()) digits = removeDigit(digits, rem2.get(0));
            else if (rem1.size() >= 2) {
                digits = removeDigit(digits, rem1.get(0));
                digits = removeDigit(digits, rem1.get(1));
            }
        }

        Integer[] result = Arrays.stream(digits).boxed().toArray(Integer[]::new);
        Arrays.sort(result, Collections.reverseOrder());

        if (result.length == 0 || result[0] == 0) {
            System.out.println("Largest number divisible by 3: 0");
            return;
        }

        System.out.print("Largest number divisible by 3: ");
        for (int d : result) System.out.print(d);
    }

    private static int[] removeDigit(int[] arr, int target) {
        int[] newArr = new int[arr.length - 1];
        boolean removed = false;
        int idx = 0;
        for (int d : arr) {
            if (d == target && !removed) {
                removed = true;
            } else {
                newArr[idx++] = d;
            }
        }
        return newArr;
    }
}

// import java.util.*;

// public class LargestNumberDivisibleBy3 {
//     public static void main(String[] args) {
//         Scanner sc = new Scanner(System.in);
        
//         System.out.print("Enter number of digits: ");
//         int n = sc.nextInt();
        
//         int[] digits = new int[n];
//         System.out.println("Enter the digits:");
//         for (int i = 0; i < n; i++) {
//             digits[i] = sc.nextInt();
//         }

//         // Step 1: Find the sum of all digits
//         int sum = 0;
//         for (int i = 0; i < n; i++) {
//             sum += digits[i];
//         }

//         // Step 2: Sort digits in ascending order (to remove smallest if needed)
//         Arrays.sort(digits);

//         // Step 3: Check remainder
//         int rem = sum % 3;

//         // Step 4: If remainder not 0, remove smallest possible digits
//         if (rem != 0) {
//             boolean removed = false;

//             // Try removing one digit whose remainder == rem
//             for (int i = 0; i < n; i++) {
//                 if (digits[i] % 3 == rem) {
//                     digits[i] = -1; // mark as removed
//                     removed = true;
//                     break;
//                 }
//             }

//             // If not found, remove two digits whose remainder = 3 - rem
//             if (!removed) {
//                 int count = 0;
//                 for (int i = 0; i < n; i++) {
//                     if (digits[i] % 3 == (3 - rem)) {
//                         digits[i] = -1;
//                         count++;
//                         if (count == 2) break;
//                     }
//                 }
//             }
//         }

//         // Step 5: Now sort again in descending order to make largest number
//         Arrays.sort(digits);
        
//         System.out.print("Largest number divisible by 3: ");
//         boolean allZero = true;
//         for (int i = n - 1; i >= 0; i--) {
//             if (digits[i] != -1) {
//                 if (digits[i] != 0) allZero = false;
//                 System.out.print(digits[i]);
//             }
//         }

//         // Edge case: all zeros
//         if (allZero) System.out.print("0");
//     }
// }
