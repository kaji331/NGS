This is the Structural Variants (SVs) folder, which contains two sub-folders:

1.	SV_annotation
	structural variants are annotated in the following format:
	Breakpoints: the positions where SVs happens;
	probability: probability/likelihood of wrongly calling a SV;
	stand_left_breakpoint: strand on which the left breakpoint is located;
	strand_right_breakpoint: strand on whihc the right breakpoint is located;
	SV_type: annoated SV type;	
	Paired_Reads: pairended reads supporting SV events; 
	Splitted_Reads: Splitted reads supporting SV events;
	Left_gene: gene on the first chromosome involved in SV events; 
	Right_gene: gene on the second chromosome involved in SV events; 


	another sub-folder has summurized information about whether the same SV type was detected in different samples.


2.	translocation_pngs
	figures contained in this directory are visualized translocation evnets (interchromosome sv events shown in the above annotation tables).		the above pannel of each figure shows the depth of mapped reads supporting the identified SV events.
	the pannel belowe shows pair-ended reads mapped to different chromesomes, indicating the SV events. 
	
	