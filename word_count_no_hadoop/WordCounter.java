import java.io.File;
import java.io.FileNotFoundException;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class WordCounter {
    public static void main(String[] args) {
        // Check if the file name argument is provided
        if (args.length < 1) {
            System.out.println("Usage : java WordCounter <file_name>");
            return;
        }

        String fileName = args[0];
        Map<String, Integer> wordCounts = new TreeMap<>();

        try {
            File file = new File(fileName);
            Scanner scanner = new Scanner(file);

            while (scanner.hasNext()) {
                String word = scanner.next();
                if (word.length() > 0) {
                    int count = wordCounts.getOrDefault(word, 0);
                    wordCounts.put(word, count + 1);
                }
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + fileName);
            return;
        }
    }
}

