
<br />
<div align="center">
  <h1 align="center">Hadoop - Big Data Solutions</h1>
</div>


Overview:
-------
This README provides an introduction to Hadoop, a powerful framework for processing and analyzing big data. It explains the traditional approach to handling big data, the limitations it poses, and how Google's solution, MapReduce, inspired the development of Hadoop.

Traditional Approach:
-------
In the traditional approach, enterprises rely on a single computer system to store and process big data. They use databases provided by vendors like Oracle or IBM for data storage and analysis. While this approach works well for smaller datasets, it becomes challenging to process massive amounts of scalable data using a single database. The limitations of this approach led to the need for a more efficient solution.

Google's Solution - MapReduce:
-------
Google introduced an algorithm called MapReduce to address the challenges of processing large-scale data. MapReduce breaks down the data processing task into smaller parts, distributes them across multiple computers, and collects the results to form the final dataset. This approach enables parallel processing and eliminates the bottleneck created by a single database.

Introducing Hadoop:
-------
Inspired by Google's solution, Doug Cutting and his team developed Hadoop as an open-source project. Hadoop utilizes the MapReduce algorithm to enable parallel processing of data.

Hadoop provides a comprehensive framework for developing applications that can perform statistical analysis on vast amounts of data. By dividing the data into smaller chunks and processing them in parallel across a cluster of computers, Hadoop offers scalability and efficiency for big data analysis.

Hadoop's Components:
Hadoop consists of two primary components:

- Hadoop Distributed File System (HDFS): HDFS is a distributed file system designed to store large volumes of data across multiple machines in a Hadoop cluster. It ensures high fault tolerance and leverages data locality, processing data on the same machine where it resides.

- MapReduce: MapReduce is a programming model and computational algorithm used for distributed processing of data in a Hadoop cluster. It partitions the input data into smaller subsets, processes them in parallel, and combines the results to produce the final output.

Benefits and Applications:
-------
Hadoop has gained popularity as a leading big data solution due to its ability to handle large-scale data processing, fault tolerance, and scalability. It finds applications in various domains, including data analytics, machine learning, and data warehousing.

Additional Resources:
-------
For more in-depth information about Hadoop and its applications, please refer to the following resources:

- Hadoop Official Website: https://hadoop.apache.org/
- Hadoop Documentation: https://hadoop.apache.org/documentation/
- Books: "Hadoop: The Definitive Guide" by Tom White, "Hadoop in Action" by Chuck Lam

-------

<br />
<div align="center">
  <h1 align="center">Hadoop (Single Node) MapRed vs Java TreeMap</h1>
</div>

Overview
---------
This repository compares the performance of Hadoop (single node) MapReduce and Java TreeMap for a specific problem. The aim is to analyze the advantages and disadvantages of each approach in terms of simplicity and optimization.

Test Machine
------------
The experiments were conducted on an Ubuntu 20.04 machine with 16 GB of RAM and 4 CPU cores.

Dataset
-------
The dataset used for the experiments consists of six text files of varying sizes:

- File 1: 102 KB
- File 2: 1016 KB
- File 3: 10177 KB
- File 4: 101766 KB
- File 5: 1017909 KB
- File 6: 10178992 KB

### `code`

```
def load_word_pool(file_path):
    with open(file_path, 'r') as file: 
        word_pool = file.read().split()
return word_pool

def generate_random_text(word_pool, size_mb):
    words_per_mb = 100000
    total_words = int(size_mb * words_per_mb)

    list_of_words = random.choices(word_pool, k=total_words) 
    random_text = ' '.join(list_of_words)
    return random text

def save_text_to_file(text, file_path): 
    with open(file_path, 'w') as file: 
        file.write(text)
```
### `Both program has the same result`
![App Screenshot 1](link here !!)

### `JAVA TREEMAP O(log n)`
```
public class WordCounter {
    Run | Debug
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
```

### `Result`
![App Screenshot2](link here !!)

### `Hadoop (uber false)`
![App Screenshot3](link here !!)
![App Screenshot4](link here !!)
![App Screenshot5](link here !!)

### `Hadoop (uber true)`
```
<property>
    <name>mapreduce.job.ubertask.enable</name>
    <value>true</value>
</property>
```
![App Screenshot6](link here !!)
![App Screenshot7](link here !!)
![App Screenshot8](link here !!)

Program Results
---------------
Both the Java TreeMap and Hadoop MapReduce implementations produce the same results for the given problem.

- Java TreeMap: The Java TreeMap implementation offers efficient key-value pair storage and retrieval with a time complexity of O(log n). It is particularly suited for problems involving mapping and counting.

- Hadoop MapReduce (uber false): This implementation utilizes the Hadoop framework's MapReduce paradigm on a single-node setup. It avoids the overhead of inter-process communication between the Application Master (AM) and Resource Manager (RM). However, the parallelism and data locality advantages of distributed processing are not fully utilized due to the single-node configuration.

- Hadoop MapReduce (uber true): This implementation also uses Hadoop MapReduce on a single-node setup but runs the job in "uber" mode, where the entire MapReduce process executes in a single JVM. This mode aims to reduce the overhead of cluster setup and management but still operates on a single machine.

Graph and Output
---------------
![App Screenshot9](link here !!)
![App Screenshot10](link here !!)
![App Screenshot11](link here !!)
![App Screenshot12](link here !!)

Conclusion
----------
Based on the experiments and analysis, the following observations can be made:

- For small-scale problems or scenarios where the data can fit in memory, the Java TreeMap implementation provides a simpler and optimized solution. Its O(log n) time complexity ensures efficient mapping and counting operations.

- Hadoop MapReduce, while powerful for large-scale distributed processing, incurs additional overhead for cluster setup and management. In the single-node setup used here, the benefits of parallelism and data locality are not fully realized.

Consider the specific requirements of your problem to determine the appropriate approach. If the dataset is small and the problem can be effectively solved on a single machine, the Java TreeMap approach may be more suitable. However, for large-scale distributed processing and leveraging the full Hadoop ecosystem, Hadoop MapReduce is recommended.


