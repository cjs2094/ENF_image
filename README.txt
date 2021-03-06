<Introduction>
This respository includes codes for the entropy minimization method and the curve fitting method proposed in this paper for a two-level ENF presence–classification test.


<README for folder test_real>
- Download "images_test_50Hz and images_test_60Hz, upzip them, and put them under datasets folder.
- Each dataset has 10 sets of photos organized by folders where each set folder containing images taken under seven different shutter speed levels.
- Each set folder has seven images whose file name has the form "stepx_y" where x represents the ENF strength having a positive integer (Larger x contains a stronger ENF trace) and y is a reciprocal of the shutter speed used for the corresponding image.
- Each set folder has three .txt files:
	1) camera_model.txt: includes a camera model used for taking images
	2) nonsmooth_region.txt: includes the location for nonsmooth region(s) of the form [x1 x2 y1 y2]. The x1 and x2 elements row-wise start and end points, respectively. The y1 and y2 elements column-wise start and end points, respectively.
	3) smooth_region.txt: includes the location for smooth region(s) of the form [x1 x2 y1 y2]. The x1 and x2 elements row-wise start and end points, respectively. The y1 and y2 elements column-wise start and end points, respectively.

- The script "main1_real_testImgs" performs the curve fitting method and the entropy minimization method.
- Based on .mat files generated from the script "main1_real_testImgs", The script "main2_1_real_draw_figs_roc_curve_1stLevel" and "main2_2_real_draw_figs_roc_curve_2ndLevel" analayze experimental results of the 1st level and the 2nd level by drawing ROC curves. 


<README for folder test_syn>
- rawImgs folder contains six template images.
- The section "step 1) generate imgs with syn enf" in the script "main1_syn_test_imgs" generates folder "imgs_with_syn_enf" which contains "res_synthetic_6imgs_50Hz" and "res_synthetic_6imgs_60Hz" folders. Each folder named "res_synthetic_6imgs_xxHz" has six set folders, which of each has nine images. The file name of each image is of the form "stepx_cnty" in which both x and y are positive integers. x represents the ENF strength (Larger x contains a stronger ENF trace). y represents the image count number at a specific ENF strength.
- Before running the section " step 2) baseline method - curve fitting" in the script "main1_syn_test_imgs", please generate and manually put three .txt files (camera_model.txt, nonsmooth_region.txt, and smooth_region.txt) into each set folder under "res_synthetic_6imgs_50Hz" and "res_synthetic_6imgs_60Hz" folders. Each .txt file should contain the following:
	1) camera_model.txt: includes a camera model used for taking images
	2) nonsmooth_region.txt: includes the location for nonsmooth region(s) of the form [x1 x2 y1 y2]. The x1 and x2 elements row-wise start and end points, respectively. The y1 and y2 elements column-wise start and end points, respectively.
	3) smooth_region.txt: includes the location for smooth region(s) of the form [x1 x2 y1 y2]. The x1 and x2 elements row-wise start and end points, respectively. The y1 and y2 elements column-wise start and end points, respectively.

	
