blast

#!/bin/bash

# Specify the BLAST output file
blast_output_file="blastoutput2.out"

# Check if the file exists
if [ -e "$blast_output_file" ]; then
    # Read the file line by line
    while IFS= read -r line; do
        # Skip comment lines and header
        if [[ $line =~ ^# ]]; then
            continue
        fi

        # Extract relevant fields using whitespace as a delimiter
        IFS=$t read -ra fields <<< "$line"

        # Access specific fields of interest
        query_acc_ver="${fields[0]}"
        subject_acc_ver="${fields[1]}"
        percent_identity="${fields[2]}"
        alignment_length="${fields[3]}"
        mismatches="${fields[4]}"
        gap_opens="${fields[5]}"
        q_start="${fields[6]}"
        q_end="${fields[7]}"
        s_start="${fields[8]}"
        s_end="${fields[9]}"
        evalue="${fields[10]}"
        bit_score="${fields[11]}"

        # Process the data as needed
        echo "Query Accession: $query_acc_ver"
        echo "Subject Accession: $subject_acc_ver"
        echo "Percent Identity: $percent_identity"
        echo "Alignment Length: $alignment_length"
        echo "Mismatches: $mismatches"
        echo "Gap Opens: $gap_opens"
        echo "Q Start: $q_start"
        echo "Q End: $q_end"
        echo "S Start: $s_start"
        echo "S End: $s_end"
        echo "E-value: $evalue"
        echo "Bit Score: $bit_score"
        
        # Add your processing logic here, based on the extracted fields
        # For example, you can perform conditional checks or calculations
    done < "$blast_output_file"
else
    echo "BLAST output file blastoutput2.out not found."
fi
