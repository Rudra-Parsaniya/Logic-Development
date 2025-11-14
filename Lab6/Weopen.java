package Lab6;

import javax.print.DocFlavor.STRING;

public class Weopen {
    public static void main(String[] args) {
        // System.out.println("hello");
        String pl1 = "1010101010";
        String pl2 = "0000000000";
        int i=0;
        String output = "";
        while (i < pl1.length()) {
            if(pl1.charAt(i) == pl2.charAt(i)){
                output += "0";
            }
            else{
                output += "1";
            }
            i++;
        }
        int count = 0;
        for(int j=0; j<output.length(); j++){
            if(output.charAt(j) == '1'){
                count++;
            }
        }
        System.out.println(count);
    }    
}
