First create the list of transcription factor using the files in 1_identify_TF

    Run the script transcription_factor.bash with HMMER 
    Then filter the output with define filter levels (as described in AnimalTFDB 3.0) using the R script hmmer_filtering.R

Secondly find orthologuous genes for motif to TF annotation using the files in 2_Motif2TF

    Run the script orthologue_gene.bash with the Motif2TF annotation from Human

Create the feather files using the files in 3_cistarget_database

    Run the get_transcript_fasta.bash to obtain the regions you wants
    Obtain the motif files in clusterbuster from aerstlab website (or convert it with biopython)
    Execute the generate_feather.bash script

You will obtain the files in the cistarget_files directory