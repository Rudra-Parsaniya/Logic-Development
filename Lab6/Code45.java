package Lab6;

import java.util.Scanner;

class Code45 {

    public int maximumSum(int[] nums) {
        int[] max1 = new int[82];
        int[] max2 = new int[82];

        int ans = -1;

        for (int num : nums) {
            int s = sumDigits(num);

            if (num > max1[s]) {
                max2[s] = max1[s];
                max1[s] = num;
            } else if (num > max2[s]) {
                max2[s] = num;
            }
        }

        for (int i = 0; i < 82; i++) {
            if (max1[i] > 0 && max2[i] > 0) {
                ans = Math.max(ans, max1[i] + max2[i]);
            }
        }

        return ans;
    }

    private int sumDigits(int n) {
        int sum = 0;
        while (n > 0) {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter size: ");
        int n = sc.nextInt();

        int[] nums = new int[n];
        System.out.println("Enter elements:");

        for (int i = 0; i < n; i++) {
            nums[i] = sc.nextInt();
        }

        Code45 obj = new Code45();
        int result = obj.maximumSum(nums);

        System.out.println("Maximum Sum = " + result);

        sc.close();
    }
}
