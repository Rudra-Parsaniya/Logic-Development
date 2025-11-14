package Lab6;
import java.util.*;

public class Decode{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();
        String result = "";
        int num = 0;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (Character.isDigit(ch)) {
                num = num * 10 + (ch - '0');
            } else {
                if (num == 0) num = 1;
                for (int j = 0; j < num; j++) result += ch;
                num = 0;
            }
        }
        System.out.println(result);
    }
}
