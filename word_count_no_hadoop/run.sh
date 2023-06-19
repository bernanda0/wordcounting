#!/bin/bash

# Step 1: Compile the Java code
javac WordCounter.java

# Check if the user provided both arguments
if [ $# -ne 2 ]; then
    echo "Usage : run.sh <number_of_iteration> <file_name>"
    exit 1
fi

# Step 2: Run it n times
n=$1
file_name=$2
total_time=0

# Check if the file exists
if [ ! -f "input/$file_name" ]; then
    echo "Error: The file '$file_name' does not exist in the 'input' folder."
    exit 1
fi

for ((i=1; i<=$n; i++))
do
    # Step 3: Get the time taken (in ms) to complete the program
    start_time=$(date +%s%3N)  # Start time in milliseconds
    java WordCounter "input/$file_name"
    end_time=$(date +%s%3N)  # End time in milliseconds

    # Calculate the time taken and accumulate
    time_taken=$((end_time - start_time))
    total_time=$((total_time + time_taken))
done

# Step 4: Calculate and echo the average time taken
avg_time=$((total_time / n))
echo "------------------------"
echo "Average running time ${avg_time} ms"
echo "------------------------"
