package Lab6;

import java.util.*;

public class Code31 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the string: ");
        String s = sc.nextLine();

        int n = s.length();
        boolean found = false;
        HashSet<Character> set = new HashSet<>();

        for (int i = 0; i < n; i++) {
            char ch = s.charAt(i);
            if (set.contains(ch)) {
                System.out.println("Earliest repeated character: " + ch);
                found = true;
                break;
            } else {
                set.add(ch);
            }

        if (!found)
            System.out.println("No repeated character found.");
        }
    }
}