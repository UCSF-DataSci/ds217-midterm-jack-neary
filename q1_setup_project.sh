# TODO: Add shebang line: #!/bin/bash
# Assignment 5, Question 1: Project Setup Script
# This script creates the directory structure for the clinical trial analysis project
# TODO: Make this script executable (if not already)

#!/bin/bash
chmod +x q1_setup_project.sh
echo "setting up project..."

# TODO: Create the following directories:
#   - data/
#   - output/
#   - reports/
mkdir -p data output reports
echo "Directories created"

# TODO: Generate the dataset
python3 generate_data.py
#       This creates data/clinical_trial_raw.csv with 10,000 patients

# TODO: Save the directory structure to reports/directory_structure.txt
#       Hint: Use 'ls -la' or 'tree' command

tree > reports/directory_structure.txt
