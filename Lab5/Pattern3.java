package Lab5;

public class Pattern3 {

    public static void main(String[] args) {
        pattern12();
    }
     public static void pattern12() {
        int n = 4;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= (2 * i - 1); j += 2) {
                System.out.print(j);
                if (j < (2 * i - 1))
                    System.out.print("*");
            }
            for (int j = (2 * i - 3); j >= 1; j -= 2) {
                System.out.print("*" + j);
            }
            System.out.println();
        }
    }
}
