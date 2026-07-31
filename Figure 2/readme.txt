###Phylogenetic tree construction: the input file gtdbtk.bac120.user_msa.ref.fasta is a multiple sequence alignment file built from the 120 conserved genes extracted using the GTDB-tk software. Note that in the final Figure 2, the tree file excludes FDZ058?Be0?2.bin.88, SAMEA101255668_bin.18, SAMN05422120_bin.1, SAMN08778824_bin.131, and SAMN08779247_bin.6, because for these genomes, the predicted microviridin lacked the corresponding enzyme and precursor peptide.

FastTreeMP gtdbtk.bac120.user_msa.ref.fasta >drep_bac120_ref_tree.txt

####Gene cluster visualization
clinker gbk/*.gbk -p plot.html -o aln.txt -mo matrix.csv -s session.json