# Step 1: Download the FASTA file
curl -O https://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa

# Step 2: Calculate the average protein length
num_sequences=$(grep -c "^>" NC_000913.faa)

#Step 3: Print the number of sequence
echo ""
echo "Number of Sequences: $num_sequences"

# Step 4: Calculate the total number of amino acids
num_amino_acids=$(grep -v "^>" NC_000913.faa | tr -d '\n' | wc -m)

# Step 5: Print the total number of amino acids
echo ""
echo "Number of Amino Acids: $num_amino_acids"

#Step 6: Calculate the average length (divide the total number of amino acids by the total number of sequences)
average_length=$(awk -v num=$num_amino_acids -v den=$num_sequences 'BEGIN { print int(num/den) }')


# Step 5: Print the average length
echo ""
echo "Average Length is: $average_length"