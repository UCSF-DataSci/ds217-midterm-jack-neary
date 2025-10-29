#!/bin/bash
# Assignment 5, Question 8: Pipeline Automation Script
# Run the clinical trial data analysis pipeline

# NOTE: This script assumes Q1 has already been run to create directories and generate the dataset
# NOTE: Q2 (q2_process_metadata.py) is a standalone Python fundamentals exercise, not part of the main pipeline
# NOTE: Q3 (q3_data_utils.py) is a library imported by the notebooks, not run directly
# NOTE: The main pipeline runs Q4–Q7 notebooks in order

log_file="reports/pipeline_log.txt"
echo "Launching clinical trial analysis..." > "$log_file"

# Function to run a notebook and log outcome
run_notebook () {
    notebook=$1
    output_name="${notebook%.ipynb}_output.ipynb"

    echo "Running $notebook..." >> "$log_file"
    jupyter nbconvert --execute --to notebook "$notebook" --output "$output_name"
    if [ $? -ne 0 ]; then
        echo "✖️ Failed: $notebook" >> "$log_file"
        exit 1
    else
        echo "✔️ Success: $notebook" >> "$log_file"
    fi
}

# Execute notebooks in sequence
run_notebook "q4_exploration.ipynb"
run_notebook "q5_missing_data.ipynb"
run_notebook "q6_transformation.ipynb"
run_notebook "q7_aggregation.ipynb"

echo "All steps completed successfully." >> "$log_file"
chmod +x run_pipeline.sh

