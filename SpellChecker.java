import java.io.*;
import java.util.*;

public class SpellChecker {
	public static void main(String[] args) {
		try {
			int numOfWords = 0;
			Scanner sc2 = null;
    			try {
        			sc2 = new Scanner(new File("translate.txt"));
    			} catch (FileNotFoundException e) {
        			e.printStackTrace();  
    			}

			//Cleaning the previous input file
			PrintWriter pw = new PrintWriter("input.txt");
			pw.close();


			PrintWriter out = new PrintWriter(new OutputStreamWriter(new BufferedOutputStream(new FileOutputStream("input.txt")), "UTF-8"));

    			while (sc2.hasNextLine()) {
    			        Scanner s2 = new Scanner(sc2.nextLine());
    			    while (s2.hasNext()) {
    			        String s = s2.next();
				s = (s.replaceAll("[,.()%?!'-:;/|*#~+=]", " ")).toLowerCase();
				numOfWords+=1;
				out.println(String.format(s));
    			    }
    			}
			out.close();

			Process p = Runtime.getRuntime().exec("fst-infl possessives.a input.txt output.txt");  //Change this line to the appropriate file that you wanna use for your testing
			p.waitFor(); 

			//Reading the output of the programme from a file and then printing out the misspelled words

			FileInputStream fstream = new FileInputStream("output.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
			
			String strLine, prevStr = "";
			int unrecognisedWords = 0;
			while ((strLine = br.readLine()) != null)   {
				//System.out.println("In while");
				if (strLine.contains("no result for")) {
					System.out.println(prevStr);
					unrecognisedWords+=1;
				}
				prevStr = strLine.replaceAll("[> ]", "");
			}
			System.out.println("The input file has "+(numOfWords)+" raw words");
			System.out.println("There are "+(unrecognisedWords)+" incorrect words");
			br.close();

		} catch(Exception e) {
			System.out.println ("Exception Caught here");
		}

	}
}
