#!/bin/bash

for i in {1..200}; do
    file_name="file_${i}"
    # Use the current time in nanoseconds as the seed for srand() in awk, done only once per file
    seed=$(date +%s%N)
    awk -v seed="$seed" 'BEGIN {
        srand(seed);
        for (j=0; j<100; j++) {  # Generate 100 lines per file
            line="";
            for (i=0; i<20; i++) {  # Generate 20 characters per line
                line = line sprintf("%c", int(rand() * 26) + (rand() < 0.5 ? 65 : 97));
            }
            print line;
        }
    }' > "$file_name"  # Overwrite the file with new content
done
