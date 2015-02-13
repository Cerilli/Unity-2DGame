//Maya ASCII 2013 scene
//Name: Blocking_3.ma
//Last modified: Wed, Feb 11, 2015 08:57:22 PM
//Codeset: 1252
requires maya "2013";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201209210409-845513";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.6038849624266351 15.395500380944245 48.763111845750799 ;
	setAttr ".r" -type "double3" -6.3383527188838267 -348.9999999999842 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 46.279246495611218;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.32588579928195704 16.281753524389224 0.75919106831574568 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 44.646245256992209;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.0079326762695747233 16.117610811674744 100.43193344829898 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 8.366296187619426;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 15.534837782950586 1.588974251400938 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 15.441713893421014;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "RefImages";
createNode transform -n "SideRef_Plane" -p "RefImages";
	setAttr ".t" -type "double3" -12.200956626644171 10 0.83465906279259272 ;
	setAttr ".r" -type "double3" 90 90 0 ;
	setAttr ".s" -type "double3" 20.48 20.48 20.48 ;
createNode mesh -n "SideRef_PlaneShape" -p "SideRef_Plane";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "FrontRef_Plane" -p "RefImages";
	setAttr ".t" -type "double3" 0 10 -11.82636586126721 ;
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".s" -type "double3" 20.48 20.48 20.48 ;
createNode mesh -n "FrontRef_PlaneShape" -p "FrontRef_Plane";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -0.5 -1.110223e-016 0.5 0.5 -1.110223e-016 0.5
		 -0.5 1.110223e-016 -0.5 0.5 1.110223e-016 -0.5;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCylinder1";
	setAttr ".t" -type "double3" 0 12.46729058300309 1.0228878407066362 ;
	setAttr ".s" -type "double3" 1.8597529195397073 3.5227631477782535 1.4809537439632883 ;
createNode mesh -n "polySurfaceShape1" -p "pCylinder1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 86 ".uvst[0].uvsp[0:85]" -type "float2" 0.375 0.3125 0.39583334
		 0.3125 0.41666669 0.3125 0.54166669 0.3125 0.5625 0.3125 0.58333331 0.3125 0.60416663
		 0.3125 0.62499994 0.3125 0.375 0.35009399 0.39583334 0.35009399 0.41666669 0.35009399
		 0.54166669 0.35009399 0.5625 0.35009399 0.58333331 0.35009399 0.60416663 0.35009399
		 0.62499994 0.35009399 0.375 0.38768798 0.39583334 0.38768798 0.41666669 0.38768798
		 0.54166669 0.38768798 0.5625 0.38768798 0.58333331 0.38768798 0.60416663 0.38768798
		 0.62499994 0.38768798 0.375 0.42528197 0.39583334 0.42528197 0.41666669 0.42528197
		 0.54166669 0.42528197 0.5625 0.42528197 0.58333331 0.42528197 0.60416663 0.42528197
		 0.62499994 0.42528197 0.375 0.46287596 0.39583334 0.46287596 0.41666669 0.46287596
		 0.54166669 0.46287596 0.5625 0.46287596 0.58333331 0.46287596 0.60416663 0.46287596
		 0.62499994 0.46287596 0.375 0.50046992 0.39583334 0.50046992 0.41666669 0.50046992
		 0.54166669 0.50046992 0.5625 0.50046992 0.58333331 0.50046992 0.60416663 0.50046992
		 0.62499994 0.50046992 0.375 0.53806388 0.39583334 0.53806388 0.41666669 0.53806388
		 0.54166669 0.53806388 0.5625 0.53806388 0.58333331 0.53806388 0.60416663 0.53806388
		 0.62499994 0.53806388 0.375 0.57565784 0.39583334 0.57565784 0.41666669 0.57565784
		 0.54166669 0.57565784 0.5625 0.57565784 0.58333331 0.57565784 0.375 0.61325181 0.39583334
		 0.61325181 0.41666669 0.61325181 0.54166669 0.61325181 0.5625 0.61325181 0.58333331
		 0.61325181 0.60416663 0.61325181 0.62499994 0.61325181 0.375 0.65084577 0.39583334
		 0.65084577 0.41666669 0.65084577 0.54166669 0.65084577 0.5625 0.65084577 0.58333331
		 0.65084577 0.60416663 0.65084577 0.62499994 0.65084577 0.375 0.68843973 0.39583334
		 0.68843973 0.41666669 0.68843973 0.54166669 0.68843973 0.5625 0.68843973 0.58333331
		 0.68843973 0.60416663 0.68843973 0.62499994 0.68843973;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[2]" -type "float3" 0 0.10199083 0 ;
	setAttr ".pt[3]" -type "float3" 0 0.10199083 0 ;
	setAttr ".pt[9]" -type "float3" 0 0.10199083 0 ;
	setAttr ".pt[10]" -type "float3" 0 0.10199083 0 ;
	setAttr ".pt[16]" -type "float3" 0 0.04856706 0 ;
	setAttr ".pt[17]" -type "float3" 0 0.04856706 -1.110223e-016 ;
	setAttr ".pt[23]" -type "float3" 0 0.038853649 0 ;
	setAttr ".pt[24]" -type "float3" 0 0.038853649 0 ;
	setAttr -s 76 ".vt[0:75]"  0.91475177 -0.86809218 -0.67518067 0.5281322 -0.98302668 -1.083953142
		 0 -1.14003015 -1.23357427 0 -1.14003015 1 0.5281322 -0.98302668 0.85037887 0.91475177 -0.86809218 0.44160643
		 1.0562644 -0.82602322 -0.11678711 0.83122081 -0.68704683 -0.60510838 0.47990558 -0.77029663 -0.996782
		 0 -0.88401806 -1.14014459 0 -0.88401806 1 0.47990558 -0.77029663 0.85663748 0.83122081 -0.68704683 0.46496385
		 0.95981115 -0.65657526 -0.070072271 0.74768984 -0.50600147 -0.53503615 0.43167895 -0.55756664 -0.90961093
		 0 -0.62800604 -1.046714902 0 -0.62800604 1 0.43167895 -0.55756664 0.86289608 0.74768984 -0.50600147 0.48832127
		 0.8633579 -0.48712727 -0.023357429 0.72263056 -0.33238304 -0.47330582 0.41721097 -0.36096135 -0.83281738
		 0 -0.40000004 -0.96440774 0 -0.40000004 1 0.41721097 -0.36096135 0.86840963 0.72263056 -0.33238304 0.50889808
		 0.83442193 -0.32192263 0.017796125 0.75604296 -0.16619153 -0.4199174 0.43650159 -0.18048069 -0.76640129
		 0 -0.20000003 -0.89322323 0 -0.20000003 1 0.43650159 -0.18048069 0.87317806 0.75604296 -0.16619153 0.52669418
		 0.87300318 -0.16096133 0.053388391 0.84042764 0.043727916 -0.36652902 0.45579225 0.016818415 -0.69998521
		 0 -2.9802322e-008 -0.82203871 0 -2.9802322e-008 1 0.45579225 0.016818415 0.87794656
		 0.84042764 0.043727916 0.54449034 0.96255678 0.043727919 0.088980652 0.85349572 0.32482356 -0.51585895
		 0.49276599 0.28352731 -0.85908586 0 0.22805527 -1.022245169 0 0.19999997 1.053388357
		 0.49276599 0.27137902 0.79012591 0.85349572 0.32294422 0.3736183 0.98553199 0.34087873 -0.084531605
		 1.12779677 0.64964718 -0.66518885 0.52973974 0.56705469 -1.018186569 0 0.45611057 -1.22245157
		 0 0.39999998 1.10677683 0.52973974 0.54275811 0.70230526 1.12779677 0.64588851 0.20274624
		 1.090767741 0.89992964 -0.71913344 0.49517736 0.77893603 -1.058696389 0 0.65611058 -1.25804389
		 0 0.59999996 0.99777555 0.49517736 0.75463945 0.59822142 1.090767741 0.89617097 0.11209718
		 1.22345006 0.93522358 -0.33034071 0.58470273 0.95292395 -0.67769253 0.38907877 0.91917133 -0.98061514
		 0 0.82805526 -1.129022 0 0.79999995 0.72638452 0.38907877 0.90702307 0.47787443 0.58470273 0.95104462 0.10167114
		 0.68895608 0.97852987 -0.301422 0.43279225 1.049076438 -0.63625163 0.23200792 1.019042492 -0.90253389
		 0 1 -1 0 1 0.45499346 0.23200792 1.019042492 0.35752738 0.43279225 1.049076438 0.091245092
		 0.54684573 1.091903925 -0.27250326;
	setAttr -s 132 ".ed[0:131]"  0 1 0 1 2 0 3 4 0 4 5 0 5 6 0 6 0 0 7 8 1
		 8 9 1 10 11 1 11 12 1 12 13 1 13 7 1 14 15 1 15 16 1 17 18 1 18 19 1 19 20 1 20 14 1
		 21 22 1 22 23 1 24 25 1 25 26 1 26 27 1 27 21 1 28 29 1 29 30 1 31 32 1 32 33 1 33 34 1
		 34 28 1 35 36 1 36 37 1 38 39 1 39 40 1 40 41 1 41 35 1 42 43 1 43 44 1 45 46 1 46 47 1
		 47 48 0 48 42 0 49 50 1 50 51 1 52 53 1 53 54 1 55 56 1 56 57 1 58 59 1 59 60 1 60 61 0
		 61 55 0 62 63 1 63 64 1 65 66 1 66 67 1 67 68 1 68 62 1 69 70 0 70 71 0 72 73 0 73 74 0
		 74 75 0 75 69 0 0 7 0 1 8 0 2 9 0 3 10 0 4 11 0 5 12 0 6 13 0 7 14 0 8 15 0 9 16 0
		 10 17 0 11 18 0 12 19 0 13 20 0 14 21 0 15 22 0 16 23 0 17 24 0 18 25 0 19 26 0 20 27 0
		 21 28 0 22 29 0 23 30 0 24 31 0 25 32 0 26 33 0 27 34 0 28 35 0 29 36 0 30 37 0 31 38 0
		 32 39 0 33 40 0 34 41 0 35 42 0 36 43 0 37 44 0 38 45 0 39 46 0 40 47 0 41 48 0 42 49 0
		 43 50 0 44 51 0 45 52 0 46 53 0 47 54 0 49 55 0 50 56 0 51 57 0 52 58 0 53 59 0 54 60 0
		 55 62 0 56 63 0 57 64 0 58 65 0 59 66 0 60 67 0 61 68 0 62 69 0 63 70 0 64 71 0 65 72 0
		 66 73 0 67 74 0 68 75 0;
	setAttr -s 56 -ch 224 ".fc[0:55]" -type "polyFaces" 
		f 4 0 65 -7 -65
		mu 0 4 0 1 9 8
		f 4 1 66 -8 -66
		mu 0 4 1 2 10 9
		f 4 2 68 -9 -68
		mu 0 4 3 4 12 11
		f 4 3 69 -10 -69
		mu 0 4 4 5 13 12
		f 4 4 70 -11 -70
		mu 0 4 5 6 14 13
		f 4 5 64 -12 -71
		mu 0 4 6 7 15 14
		f 4 6 72 -13 -72
		mu 0 4 8 9 17 16
		f 4 7 73 -14 -73
		mu 0 4 9 10 18 17
		f 4 8 75 -15 -75
		mu 0 4 11 12 20 19
		f 4 9 76 -16 -76
		mu 0 4 12 13 21 20
		f 4 10 77 -17 -77
		mu 0 4 13 14 22 21
		f 4 11 71 -18 -78
		mu 0 4 14 15 23 22
		f 4 12 79 -19 -79
		mu 0 4 16 17 25 24
		f 4 13 80 -20 -80
		mu 0 4 17 18 26 25
		f 4 14 82 -21 -82
		mu 0 4 19 20 28 27
		f 4 15 83 -22 -83
		mu 0 4 20 21 29 28
		f 4 16 84 -23 -84
		mu 0 4 21 22 30 29
		f 4 17 78 -24 -85
		mu 0 4 22 23 31 30
		f 4 18 86 -25 -86
		mu 0 4 24 25 33 32
		f 4 19 87 -26 -87
		mu 0 4 25 26 34 33
		f 4 20 89 -27 -89
		mu 0 4 27 28 36 35
		f 4 21 90 -28 -90
		mu 0 4 28 29 37 36
		f 4 22 91 -29 -91
		mu 0 4 29 30 38 37
		f 4 23 85 -30 -92
		mu 0 4 30 31 39 38
		f 4 24 93 -31 -93
		mu 0 4 32 33 41 40
		f 4 25 94 -32 -94
		mu 0 4 33 34 42 41
		f 4 26 96 -33 -96
		mu 0 4 35 36 44 43
		f 4 27 97 -34 -97
		mu 0 4 36 37 45 44
		f 4 28 98 -35 -98
		mu 0 4 37 38 46 45
		f 4 29 92 -36 -99
		mu 0 4 38 39 47 46
		f 4 30 100 -37 -100
		mu 0 4 40 41 49 48
		f 4 31 101 -38 -101
		mu 0 4 41 42 50 49
		f 4 32 103 -39 -103
		mu 0 4 43 44 52 51
		f 4 33 104 -40 -104
		mu 0 4 44 45 53 52
		f 4 34 105 -41 -105
		mu 0 4 45 46 54 53
		f 4 35 99 -42 -106
		mu 0 4 46 47 55 54
		f 4 36 107 -43 -107
		mu 0 4 48 49 57 56
		f 4 37 108 -44 -108
		mu 0 4 49 50 58 57
		f 4 38 110 -45 -110
		mu 0 4 51 52 60 59
		f 4 39 111 -46 -111
		mu 0 4 52 53 61 60
		f 4 42 113 -47 -113
		mu 0 4 56 57 63 62
		f 4 43 114 -48 -114
		mu 0 4 57 58 64 63
		f 4 44 116 -49 -116
		mu 0 4 59 60 66 65
		f 4 45 117 -50 -117
		mu 0 4 60 61 67 66
		f 4 46 119 -53 -119
		mu 0 4 62 63 71 70
		f 4 47 120 -54 -120
		mu 0 4 63 64 72 71
		f 4 48 122 -55 -122
		mu 0 4 65 66 74 73
		f 4 49 123 -56 -123
		mu 0 4 66 67 75 74
		f 4 50 124 -57 -124
		mu 0 4 67 68 76 75
		f 4 51 118 -58 -125
		mu 0 4 68 69 77 76
		f 4 52 126 -59 -126
		mu 0 4 70 71 79 78
		f 4 53 127 -60 -127
		mu 0 4 71 72 80 79
		f 4 54 129 -61 -129
		mu 0 4 73 74 82 81
		f 4 55 130 -62 -130
		mu 0 4 74 75 83 82
		f 4 56 131 -63 -131
		mu 0 4 75 76 84 83
		f 4 57 125 -64 -132
		mu 0 4 76 77 85 84;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "transform1" -p "pCylinder1";
	setAttr ".v" no;
createNode mesh -n "pCylinderShape1" -p "transform1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 112 ".pt";
	setAttr ".pt[0]" -type "float3" -0.0022444194 0.021287855 0.083143942 ;
	setAttr ".pt[1]" -type "float3" 0 0.045861095 0.098481275 ;
	setAttr ".pt[2]" -type "float3" 0 0.079932421 0.19619684 ;
	setAttr ".pt[3]" -type "float3" 0 0.01695336 -0.19219184 ;
	setAttr ".pt[4]" -type "float3" 0 0.01695336 -0.18224719 ;
	setAttr ".pt[5]" -type "float3" 0.033751912 0.01695336 -0.079667583 ;
	setAttr ".pt[6]" -type "float3" -0.0075693959 0.0068512647 0 ;
	setAttr ".pt[7]" -type "float3" 0.028063519 0.020914625 0 ;
	setAttr ".pt[8]" -type "float3" 0 0.044448808 0.073918171 ;
	setAttr ".pt[9]" -type "float3" 0 0.0079759639 0.064375766 ;
	setAttr ".pt[10]" -type "float3" 0 -0.0031784815 -0.12100969 ;
	setAttr ".pt[11]" -type "float3" 0 0.05399986 -0.13786745 ;
	setAttr ".pt[12]" -type "float3" 0.057636093 0.01695336 0 ;
	setAttr ".pt[13]" -type "float3" 0.020281924 0.01695336 0 ;
	setAttr ".pt[14]" -type "float3" 0 0.01695336 0 ;
	setAttr ".pt[15]" -type "float3" 0 0.028748561 0.073918171 ;
	setAttr ".pt[16]" -type "float3" 0 0.01695336 0.069056205 ;
	setAttr ".pt[17]" -type "float3" 0 -0.03049491 -0.092536822 ;
	setAttr ".pt[18]" -type "float3" 0 -0.0088354629 -0.092536822 ;
	setAttr ".pt[19]" -type "float3" 0 0.0058394093 0 ;
	setAttr ".pt[20]" -type "float3" 0 0.01695336 0 ;
	setAttr ".pt[22]" -type "float3" 0 0.011795204 0.073918171 ;
	setAttr ".pt[23]" -type "float3" 0 0 0.083423324 ;
	setAttr ".pt[24]" -type "float3" 0 0 -0.042709298 ;
	setAttr ".pt[25]" -type "float3" 0 0.011969864 -0.064035885 ;
	setAttr ".pt[27]" -type "float3" 0 0 -0.010676794 ;
	setAttr ".pt[28]" -type "float3" 0.082922064 0 0 ;
	setAttr ".pt[29]" -type "float3" -0.024303816 0 0.066155374 ;
	setAttr ".pt[30]" -type "float3" 0 0 0.064637423 ;
	setAttr ".pt[31]" -type "float3" 0 0.0089773983 -0.042709298 ;
	setAttr ".pt[32]" -type "float3" 0 0 -0.036583915 ;
	setAttr ".pt[34]" -type "float3" 0 0 -0.042148329 ;
	setAttr ".pt[35]" -type "float3" 0.035105243 0 0 ;
	setAttr ".pt[38]" -type "float3" 0 0 -0.048778553 ;
	setAttr ".pt[39]" -type "float3" 0 0 -0.054875873 ;
	setAttr ".pt[40]" -type "float3" -0.035952359 0 -0.08962252 ;
	setAttr ".pt[41]" -type "float3" 0.019725181 0.035061996 -0.088516511 ;
	setAttr ".pt[42]" -type "float3" 0.02796958 -5.5511151e-016 0 ;
	setAttr ".pt[44]" -type "float3" 0 -0.0087960176 0 ;
	setAttr ".pt[45]" -type "float3" 0 0 -0.042681232 ;
	setAttr ".pt[48]" -type "float3" 0.014657893 0 0 ;
	setAttr ".pt[50]" -type "float3" -0.019993806 -0.024628846 0 ;
	setAttr ".pt[52]" -type "float3" 0 0.038449284 0 ;
	setAttr ".pt[56]" -type "float3" -0.019993808 -0.063331328 0 ;
	setAttr ".pt[58]" -type "float3" 0 0.038449284 0 ;
	setAttr ".pt[63]" -type "float3" -0.013329204 0 0 ;
	setAttr ".pt[64]" -type "float3" 0 0.01583283 0 ;
	setAttr ".pt[65]" -type "float3" 0 0.043575853 0 ;
	setAttr ".pt[69]" -type "float3" -0.033323009 -0.017592033 0 ;
	setAttr ".pt[70]" -type "float3" 0 0 0.028738093 ;
	setAttr ".pt[71]" -type "float3" 0 0 0.028738093 ;
	setAttr ".pt[72]" -type "float3" 0 0.033322707 -0.11584906 ;
	setAttr ".pt[73]" -type "float3" 0 0.035885997 -0.13414103 ;
	setAttr ".pt[74]" -type "float3" -0.033323009 0.0017592037 0 ;
	setAttr ".pt[75]" -type "float3" -0.033323009 -0.01055522 0 ;
	setAttr ".pt[76]" -type "float3" 0 0.01695336 -0.14236432 ;
	setAttr ".pt[77]" -type "float3" 0 0.0056259013 -0.14236432 ;
	setAttr ".pt[78]" -type "float3" 0.013522904 -0.030956309 -0.19219184 ;
	setAttr ".pt[79]" -type "float3" 0 0.1556218 0 ;
	setAttr ".pt[80]" -type "float3" 0 0.12861511 0 ;
	setAttr ".pt[81]" -type "float3" 0 0.13995984 0 ;
	setAttr ".pt[82]" -type "float3" 0 0.10189611 0.075704843 ;
	setAttr ".pt[93]" -type "float3" 0.039987616 -5.5511151e-016 0 ;
	setAttr ".pt[123]" -type "float3" 0 0.10189611 0 ;
	setAttr ".pt[124]" -type "float3" -0.050495062 0.082315646 7.6327833e-017 ;
	setAttr ".pt[125]" -type "float3" -0.03220199 -0.12506831 -0.38815099 ;
	setAttr ".pt[126]" -type "float3" -0.05562824 -0.13227901 -0.2247232 ;
	setAttr ".pt[127]" -type "float3" -0.0383472 -0.13227901 -0.75874126 ;
	setAttr ".pt[128]" -type "float3" -0.03220199 -0.12506831 -0.65944165 ;
	setAttr ".pt[129]" -type "float3" -0.047266446 -0.12508206 -0.52379644 ;
	setAttr ".pt[130]" -type "float3" 0.061129518 -0.14533208 -0.81824476 ;
	setAttr ".pt[131]" -type "float3" -0.0026872475 -0.15120538 -0.68801737 ;
	setAttr ".pt[132]" -type "float3" -0.043047957 -0.15120538 -0.5431118 ;
	setAttr ".pt[133]" -type "float3" 0.025670201 -0.14685649 -0.41819975 ;
	setAttr ".pt[134]" -type "float3" 0 0.01695336 -0.22836739 ;
	setAttr ".pt[135]" -type "float3" 0.028818043 0.01695336 -0.12796491 ;
	setAttr ".pt[136]" -type "float3" 0.028818043 0.01695336 0.0091874711 ;
	setAttr ".pt[137]" -type "float3" 0.028818043 0.01695336 0.14633988 ;
	setAttr ".pt[138]" -type "float3" -0.019525858 0.028923225 0.095010765 ;
	setAttr ".pt[139]" -type "float3" 0 0.09513586 0.11595729 ;
	setAttr ".pt[140]" -type "float3" -0.05285712 0.09513586 -0.010342494 ;
	setAttr ".pt[141]" -type "float3" 0 0.072081938 -0.15685788 ;
	setAttr ".pt[142]" -type "float3" -0.011367331 0.046958823 -0.2467422 ;
	setAttr ".pt[143]" -type "float3" 0.029508963 -0.061060909 -0.43751925 ;
	setAttr ".pt[144]" -type "float3" -0.003187675 -0.066100001 -0.22683388 ;
	setAttr ".pt[145]" -type "float3" 0.012957746 -0.05485303 -0.045576453 ;
	setAttr ".pt[146]" -type "float3" 0.043192491 -0.030400667 0.099155009 ;
	setAttr ".pt[147]" -type "float3" 0.12820882 0.10873295 -0.13424867 ;
	setAttr ".pt[148]" -type "float3" 0.062269799 0.1041333 -0.30694264 ;
	setAttr ".pt[149]" -type "float3" 0.073427223 0.093413055 -0.49989644 ;
	setAttr ".pt[150]" -type "float3" 0.071754947 0.025808757 -0.65680891 ;
	setAttr ".pt[151]" -type "float3" 0.043192491 -0.033704568 -0.53626382 ;
	setAttr ".pt[152]" -type "float3" 0.036257572 -0.11598071 -0.25444996 ;
	setAttr ".pt[153]" -type "float3" 0.12017689 -0.12818937 -0.098951846 ;
	setAttr ".pt[154]" -type "float3" 0.036257572 -0.11598071 0.022080703 ;
	setAttr ".pt[155]" -type "float3" 0.025886381 -0.085294552 0.13591313 ;
	setAttr ".pt[156]" -type "float3" 0.066238418 0.10694945 0.017694497 ;
	setAttr ".pt[157]" -type "float3" -0.022098927 0.098690763 -0.1210942 ;
	setAttr ".pt[158]" -type "float3" 0.066238418 0.093200102 -0.36742619 ;
	setAttr ".pt[159]" -type "float3" 0.045310028 -0.002801077 -0.45030349 ;
	setAttr ".pt[160]" -type "float3" 0.025886381 -0.085294552 -0.36828265 ;
	setAttr ".pt[161]" -type "float3" 0.0079306848 0.24860026 -0.47002056 ;
	setAttr ".pt[162]" -type "float3" 0.025497733 0.24328591 -0.39357561 ;
	setAttr ".pt[163]" -type "float3" 0 0.24860026 -0.36302605 ;
	setAttr ".pt[164]" -type "float3" 0 0.26060784 -0.20333511 ;
	setAttr ".pt[165]" -type "float3" 0.026008729 0.30932158 -0.38482285 ;
	setAttr ".pt[166]" -type "float3" -0.11293752 0.30560613 -0.40803543 ;
	setAttr ".pt[167]" -type "float3" -0.076325543 0.30003294 -0.49557975 ;
	setAttr ".pt[168]" -type "float3" 0.028999839 0.2782433 -0.58306473 ;
	setAttr ".pt[169]" -type "float3" 0 0.25739658 -0.56946003 ;
	setAttr ".dr" 1;
createNode transform -n "pCube1";
	setAttr ".t" -type "double3" 0 17.970030531206444 0.80896368289689113 ;
	setAttr ".s" -type "double3" 2.1181183156751837 2.1181183156751837 2.1181183156751837 ;
createNode transform -n "transform2" -p "pCube1";
	setAttr ".v" no;
createNode mesh -n "pCubeShape1" -p "transform2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 20 ".pt";
	setAttr ".pt[0]" -type "float3" 0.017554987 0 -0.043535285 ;
	setAttr ".pt[2]" -type "float3" 0 -0.030139809 0.043535285 ;
	setAttr ".pt[3]" -type "float3" 0 -0.096658699 0 ;
	setAttr ".pt[6]" -type "float3" 0 -0.013395471 -0.0033488676 ;
	setAttr ".pt[7]" -type "float3" 0 -0.070326224 0 ;
	setAttr ".pt[8]" -type "float3" 0 0 -0.030139809 ;
	setAttr ".pt[10]" -type "float3" 0 -0.023442073 0.026790941 ;
	setAttr ".pt[11]" -type "float3" 0 -0.077023953 0 ;
	setAttr ".pt[14]" -type "float3" 0 -0.0033488676 0 ;
	setAttr ".pt[17]" -type "float3" 0 0 0.046884153 ;
	setAttr ".pt[21]" -type "float3" 0 0.055420902 -0.080999777 ;
	setAttr ".pt[22]" -type "float3" -0.029258313 0.0029258349 0 ;
	setAttr ".pt[23]" -type "float3" 0 0 0.020093206 ;
	setAttr ".pt[24]" -type "float3" -0.029258313 -0.029258313 0 ;
	setAttr ".pt[25]" -type "float3" -0.029258313 -0.017554987 0 ;
	setAttr ".pt[26]" -type "float3" 0.036495551 0.038475387 -0.050023876 ;
	setAttr ".pt[27]" -type "float3" 0.032184143 0 0 ;
	setAttr ".pt[32]" -type "float3" 0 -0.013395471 0.010046603 ;
	setAttr ".pt[35]" -type "float3" 0.0058516623 -0.070326217 -0.0033488676 ;
	setAttr ".pt[36]" -type "float3" 0.036495551 -0.010061522 -0.023671975 ;
createNode transform -n "polySurface1";
createNode mesh -n "polySurfaceShape2" -p "polySurface1";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 109 ".pt";
	setAttr ".pt[0]" -type "float3" 0 0.15697251 -0.031418353 ;
	setAttr ".pt[1]" -type "float3" 0 0.051921293 -0.10998814 ;
	setAttr ".pt[2]" -type "float3" 0 0.037879694 0.078838423 ;
	setAttr ".pt[3]" -type "float3" 0 0.2342023 0.18020502 ;
	setAttr ".pt[4]" -type "float3" 0 0.0058973264 0.14992259 ;
	setAttr ".pt[5]" -type "float3" 0 0.055298708 -0.015776401 ;
	setAttr ".pt[6]" -type "float3" 0 0.024743438 0.08430922 ;
	setAttr ".pt[7]" -type "float3" -1.3038516e-008 0.28755021 0.13617674 ;
	setAttr ".pt[8]" -type "float3" 0 0 -0.041550048 ;
	setAttr ".pt[9]" -type "float3" -0.047086179 0.065365016 0.024393128 ;
	setAttr ".pt[10]" -type "float3" 0 0 0.11291206 ;
	setAttr ".pt[11]" -type "float3" 0.027269546 0.19375063 -0.0029916316 ;
	setAttr ".pt[12]" -type "float3" 0 0 0.059484106 ;
	setAttr ".pt[13]" -type "float3" 0 0.065365016 0.056471005 ;
	setAttr ".pt[14]" -type "float3" 0 0.090995349 -7.8067183e-005 ;
	setAttr ".pt[15]" -type "float3" 0 0 0.02469215 ;
	setAttr ".pt[16]" -type "float3" 0 -0.015165431 0.052789211 ;
	setAttr ".pt[17]" -type "float3" 0 -0.14023055 0.12642907 ;
	setAttr ".pt[18]" -type "float3" 0 0.065365016 0.024551498 ;
	setAttr ".pt[19]" -type "float3" 0 0.14839186 -0.18186958 ;
	setAttr ".pt[20]" -type "float3" 0 0.21074617 0.053231914 ;
	setAttr ".pt[21]" -type "float3" 0 -0.099913374 0.0083261421 ;
	setAttr ".pt[22]" -type "float3" 0 -0.11656558 -0.024978336 ;
	setAttr ".pt[23]" -type "float3" -4.4703484e-008 0.052938733 0.34927621 ;
	setAttr ".pt[24]" -type "float3" 0 -0.030322397 0.24880487 ;
	setAttr ".pt[25]" -type "float3" 0 -0.099913351 0.041630562 ;
	setAttr ".pt[26]" -type "float3" 0 -0.11656557 0.01012325 ;
	setAttr ".pt[27]" -type "float3" 0 -0.0042517334 0.171157 ;
	setAttr ".pt[28]" -type "float3" 0 0 0.13113345 ;
	setAttr ".pt[29]" -type "float3" 0 0.20488696 0.11076671 ;
	setAttr ".pt[30]" -type "float3" 0 0.055298708 -0.00090825558 ;
	setAttr ".pt[31]" -type "float3" 0 0.12362486 0.053181037 ;
	setAttr ".pt[32]" -type "float3" 0 0.058006935 0.082176432 ;
	setAttr ".pt[33]" -type "float3" 0 -0.079297855 0.05795449 ;
	setAttr ".pt[34]" -type "float3" 0 0.050481044 0.062807411 ;
	setAttr ".pt[35]" -type "float3" 0 0.24258336 0.15886478 ;
	setAttr ".pt[36]" -type "float3" 0 0.052938726 0.34927613 ;
	setAttr ".pt[37]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[38]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[39]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[40]" -type "float3" 0 0.23904186 -0.16359383 ;
	setAttr ".pt[41]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[42]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[43]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[44]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[45]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[46]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[47]" -type "float3" 0 0.23904186 -0.11798245 ;
	setAttr ".pt[48]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[49]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[50]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[51]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[52]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[53]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[54]" -type "float3" 0 0.23904186 -0.13970289 ;
	setAttr ".pt[55]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[56]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[57]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[58]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[59]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[60]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[61]" -type "float3" 0 0.059982128 -0.12806098 ;
	setAttr ".pt[62]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[63]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[64]" -type "float3" 0 0.059982128 0 ;
	setAttr ".pt[68]" -type "float3" 0 0 -0.12206546 ;
	setAttr ".pt[75]" -type "float3" 0 0 -0.088408463 ;
	setAttr ".pt[80]" -type "float3" 0 0.19565651 0.040920842 ;
	setAttr ".pt[81]" -type "float3" 0 0.14731503 0.15371773 ;
	setAttr ".pt[82]" -type "float3" 0 0.034925722 -0.15849672 ;
	setAttr ".pt[83]" -type "float3" 0 0 -0.090025842 ;
	setAttr ".pt[87]" -type "float3" 0 0.38673219 0.12595204 ;
	setAttr ".pt[88]" -type "float3" 0 0.31421989 0.25649098 ;
	setAttr ".pt[89]" -type "float3" 0 0.11197098 -0.24191712 ;
	setAttr ".pt[90]" -type "float3" 0 0 -0.040920842 ;
	setAttr ".pt[93]" -type "float3" 0 0.15308148 0.12595204 ;
	setAttr ".pt[94]" -type "float3" 0 0 0.25649098 ;
	setAttr ".pt[95]" -type "float3" 0 0.10538445 -0.15645033 ;
	setAttr ".pt[96]" -type "float3" 0 0 -0.040920842 ;
	setAttr ".pt[100]" -type "float3" 0 0 0.15711305 ;
	setAttr ".pt[101]" -type "float3" 0 0 0.15711305 ;
	setAttr ".pt[102]" -type "float3" 0 0.026346114 -0.17717984 ;
	setAttr ".pt[103]" -type "float3" 0 -0.013057946 -0.10777396 ;
	setAttr ".pt[106]" -type "float3" 0 0.23904186 -0.14534929 ;
	setAttr ".pt[107]" -type "float3" 0 0.23904186 -0.063855931 ;
	setAttr ".pt[108]" -type "float3" 0 0.23904186 -0.082100503 ;
	setAttr ".pt[109]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[110]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[111]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[112]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[153]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[154]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[164]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[165]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[166]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[167]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[168]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[169]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[170]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[171]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[172]" -type "float3" 0 0.23904186 0 ;
	setAttr ".pt[200]" -type "float3" 0 0.023436865 -0.17102301 ;
	setAttr ".pt[201]" -type "float3" -0.1146053 0.0034145843 -0.15962361 ;
	setAttr ".pt[202]" -type "float3" -0.21526958 0 -0.1412055 ;
	setAttr ".pt[203]" -type "float3" -0.20003858 -0.01512535 0 ;
	setAttr ".pt[204]" -type "float3" -0.21526958 0.045780335 0.26358911 ;
	setAttr ".pt[205]" -type "float3" -0.14060277 0.07702259 0.25643745 ;
	setAttr ".pt[206]" -type "float3" 0 0.1335846 0.29595661 ;
	setAttr ".dr" 1;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 1;
	setAttr -s 2 ".dli[1]"  1;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode shadingEngine -n "surfaceShader1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "surfaceShader2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "X:/Unity Projects/Unity-2DGame/Maya Projects/Characters//Digital Tutors Files/project_files/Creative Development Modeling a Fantasy Character in Maya with Pat Imrie/sourceimages/Front.jpg";
	setAttr ".ft" 0;
createNode place2dTexture -n "place2dTexture1";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "X:/Unity Projects/Unity-2DGame/Maya Projects/Characters//Digital Tutors Files/project_files/Creative Development Modeling a Fantasy Character in Maya with Pat Imrie/sourceimages/Profile.jpg";
createNode place2dTexture -n "place2dTexture2";
createNode lambert -n "FrontRef_Mat";
createNode file -n "file3";
	setAttr ".ftn" -type "string" "X:/Unity Projects/Unity-2DGame/Maya Projects/Characters//Digital Tutors Files/project_files/Creative Development Modeling a Fantasy Character in Maya with Pat Imrie/sourceimages/Front.jpg";
createNode place2dTexture -n "place2dTexture3";
createNode lambert -n "SideRef_Mat";
createNode file -n "file4";
	setAttr ".ftn" -type "string" "X:/Unity Projects/Unity-2DGame/Maya Projects/Characters//Digital Tutors Files/project_files/Creative Development Modeling a Fantasy Character in Maya with Pat Imrie/sourceimages/Profile.jpg";
createNode place2dTexture -n "place2dTexture4";
createNode displayLayer -n "Ref";
	setAttr ".dt" 2;
	setAttr ".c" 3;
	setAttr ".do" 1;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n"
		+ "            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 1\n                -headsUpDisplay 1\n"
		+ "                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n"
		+ "            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 1\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 1\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n"
		+ "                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n"
		+ "                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 0\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 0\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n"
		+ "            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 1\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n"
		+ "                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 1\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n"
		+ "                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n"
		+ "                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n"
		+ "\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode polySplit -n "polySplit1";
	setAttr -s 3 ".sps[0].sp";
	setAttr ".sps[0].sp[0].f" 2;
	setAttr ".sps[0].sp[0].t" 1;
	setAttr ".sps[0].sp[0].bc" -type "double3" 0.5 0 0.5 ;
	setAttr ".sps[0].sp[1].f" 2;
	setAttr ".sps[0].sp[1].t" 1;
	setAttr ".sps[0].sp[1].bc" -type "double3" 0.45722028613090515 0.54277974367141724 
		-5.9604644775390625e-008 ;
	setAttr ".sps[0].sp[2].f" 2;
	setAttr ".sps[0].sp[2].bc" -type "double3" 0.50000053644180298 0.49999949336051941 
		-2.9802322387695313e-008 ;
	setAttr ".c2v" yes;
createNode polySplit -n "polySplit2";
	setAttr -s 3 ".sps[0].sp";
	setAttr ".sps[0].sp[0].f" 56;
	setAttr ".sps[0].sp[0].bc" -type "double3" 0.50000083446502686 0 0.49999916553497314 ;
	setAttr ".sps[0].sp[1].f" 56;
	setAttr ".sps[0].sp[1].t" 1;
	setAttr ".sps[0].sp[1].bc" -type "double3" 0.51176786422729492 0.48823219537734985 
		-5.9604644775390625e-008 ;
	setAttr ".sps[0].sp[2].f" 56;
	setAttr ".sps[0].sp[2].t" 1;
	setAttr ".sps[0].sp[2].bc" -type "double3" 2.6094798499798344e-007 0.5 0.4999997615814209 ;
	setAttr ".c2v" yes;
createNode polyMergeVert -n "polyMergeVert1";
	setAttr ".ics" -type "componentList" 3 "vtx[2]" "vtx[11]" "vtx[76]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".am" yes;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr ".tk[76]" -type "float3"  -0.024113327 0.10636514 0.0031293035;
createNode polyExtrudeEdge -n "polyExtrudeEdge1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[133]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.24554884 8.8589735 2.448446 ;
	setAttr ".rs" 36424;
	setAttr ".lt" -type "double3" 7.3552275381416621e-016 -0.86640408104209699 -0.52089435314728239 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0 8.8105238970732618 2.3930505990590225 ;
	setAttr ".cbx" -type "double3" 0.49109770065064717 8.9074222583649512 2.5038415846699245 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[139]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.29142445 8.0068188 1.9064912 ;
	setAttr ".rs" 55842;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.045875592936946014 7.9583688670331432 1.8510957702297408 ;
	setAttr ".cbx" -type "double3" 0.53697332476413095 8.0552680682170177 1.9618864910254774 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[142]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.29142445 8.0068188 0.086481467 ;
	setAttr ".rs" 40838;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.045875592936946014 7.9583688670331432 0.031086105645135031 ;
	setAttr ".cbx" -type "double3" 0.53697332476413095 8.0552680682170177 0.14187682644087141 ;
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[81:82]" -type "float3"  0 0 -1.22894418 0 0 -1.22894418;
createNode polyMergeVert -n "polyMergeVert2";
	setAttr ".ics" -type "componentList" 2 "vtx[2]" "vtx[83]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".am" yes;
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk";
	setAttr ".tk[83]" -type "float3" -0.024667574 0.24189948 -0.63867986 ;
	setAttr ".tk[84]" -type "float3" 0.23939851 0.2694056 -0.41424859 ;
createNode polyMergeVert -n "polyMergeVert3";
	setAttr ".ics" -type "componentList" 2 "vtx[1]" "vtx[83]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".am" yes;
createNode polyExtrudeEdge -n "polyExtrudeEdge4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[37:38]" "e[47:48]" "e[100]" "e[105:106]" "e[111]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.9608574 14.925022 0.70052904 ;
	setAttr ".rs" 33059;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7637972449952135 14.028301388210021 -0.042503027612426969 ;
	setAttr ".cbx" -type "double3" 2.1579174566112682 15.821743326554609 1.4435610752790733 ;
createNode polyTweak -n "polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 24 ".tk";
	setAttr ".tk[42]" -type "float3" 0.17479283 0.15055789 0 ;
	setAttr ".tk[47]" -type "float3" 0.17479283 0.20373006 -0.10841256 ;
	setAttr ".tk[48]" -type "float3" 0.17479283 0.10224243 0 ;
	setAttr ".tk[49]" -type "float3" -0.1793927 0.024897574 -0.054206274 ;
	setAttr ".tk[53]" -type "float3" -0.018399242 -0.019426826 0 ;
	setAttr ".tk[54]" -type "float3" -0.1793927 0.044590805 0.081309415 ;
	setAttr ".tk[55]" -type "float3" -0.068997182 -0.04389552 1.110223e-016 ;
	setAttr ".tk[59]" -type "float3" 0 -0.05342377 0 ;
	setAttr ".tk[60]" -type "float3" -0.068997182 -0.0097134123 1.5265567e-016 ;
	setAttr ".tk[61]" -type "float3" -0.073596992 0.016998474 1.6653345e-016 ;
	setAttr ".tk[62]" -type "float3" 0 0.0072850599 0 ;
	setAttr ".tk[66]" -type "float3" 0.004599812 -0.016998474 0 ;
	setAttr ".tk[67]" -type "float3" 0 0.0072850599 0 ;
	setAttr ".tk[68]" -type "float3" 0.01839925 0.016998474 0 ;
	setAttr ".tk[69]" -type "float3" 0 0.019426826 0 ;
	setAttr ".tk[70]" -type "float3" 0 0.014570119 0 ;
	setAttr ".tk[71]" -type "float3" 0 0.016998474 0 ;
	setAttr ".tk[72]" -type "float3" 0 -0.024283532 0 ;
	setAttr ".tk[73]" -type "float3" 0 -0.029140238 0 ;
	setAttr ".tk[74]" -type "float3" 0 -0.012141768 0 ;
	setAttr ".tk[75]" -type "float3" -0.032198686 -0.01457012 0 ;
createNode polySplitRing -n "polySplitRing1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[145:146]" "e[148]" "e[150:151]" "e[153]" "e[155]" "e[157]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.13707467913627625;
	setAttr ".re" 150;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak5";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[83:90]" -type "float3"  2.97136188 0.10576056 -0.29865539
		 2.8400228 0.15743807 -0.082345024 2.97136188 0.13748489 0.18442816 2.97784448 -0.11676316
		 -0.20395876 2.85043907 -0.15743807 0.069686331 2.97784448 -0.097946025 0.31015217
		 3.050824881 0.014303815 0.31031409 3.050824881 0.0044481452 -0.31031409;
createNode polySplitRing -n "polySplitRing2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[161:162]" "e[164]" "e[166]" "e[168]" "e[170]" "e[172]" "e[174]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.34553083777427673;
	setAttr ".re" 161;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[161:162]" "e[164]" "e[166]" "e[168]" "e[170]" "e[172]" "e[174]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.82066446542739868;
	setAttr ".dr" no;
	setAttr ".re" 174;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak6";
	setAttr ".uopa" yes;
	setAttr -s 38 ".tk";
	setAttr ".tk[21]" -type "float3" -0.020561751 0 0 ;
	setAttr ".tk[26]" -type "float3" -0.020561751 0 0 ;
	setAttr ".tk[27]" -type "float3" -0.020561751 0 0 ;
	setAttr ".tk[28]" -type "float3" -0.06990996 0 0 ;
	setAttr ".tk[33]" -type "float3" -0.06990996 0 0 ;
	setAttr ".tk[34]" -type "float3" -0.06990996 0 0 ;
	setAttr ".tk[35]" -type "float3" 0.028786451 0.028223135 0 ;
	setAttr ".tk[40]" -type "float3" 0.028786451 0.028223135 0 ;
	setAttr ".tk[41]" -type "float3" 0.028786451 0.028223135 0 ;
	setAttr ".tk[42]" -type "float3" -5.1222742e-009 0.043306064 0 ;
	setAttr ".tk[49]" -type "float3" -0.0096506821 0.017831907 0 ;
	setAttr ".tk[54]" -type "float3" 0 0.0025474152 0 ;
	setAttr ".tk[55]" -type "float3" 0.0048253401 0.025474152 0 ;
	setAttr ".tk[83]" -type "float3" -0.17853758 -0.017872971 0 ;
	setAttr ".tk[84]" -type "float3" -0.17853758 -0.0017710626 0 ;
	setAttr ".tk[85]" -type "float3" -0.17853758 0.0021177609 0 ;
	setAttr ".tk[86]" -type "float3" -0.17853758 -0.037539873 0 ;
	setAttr ".tk[87]" -type "float3" -0.17853758 -0.026852133 0 ;
	setAttr ".tk[88]" -type "float3" -0.17853758 -0.025885621 0 ;
	setAttr ".tk[89]" -type "float3" -0.17853758 -0.014854766 0 ;
	setAttr ".tk[90]" -type "float3" -0.17853758 -0.020891177 0 ;
	setAttr ".tk[91]" -type "float3" -0.071788691 -0.048400912 0 ;
	setAttr ".tk[92]" -type "float3" -0.072444797 -0.063685402 0 ;
	setAttr ".tk[93]" -type "float3" -0.073789284 -0.02143551 0 ;
	setAttr ".tk[94]" -type "float3" -0.049903627 0.012178191 0 ;
	setAttr ".tk[95]" -type "float3" -0.1616863 0.046614055 0 ;
	setAttr ".tk[96]" -type "float3" -0.26856884 -4.9960036e-016 0 ;
	setAttr ".tk[97]" -type "float3" -0.16842416 -5.5511151e-016 0 ;
	setAttr ".tk[98]" -type "float3" -0.049903627 -0.0019885381 0 ;
	setAttr ".tk[99]" -type "float3" -0.065836586 -0.094702616 0 ;
	setAttr ".tk[100]" -type "float3" -0.13786758 -0.094254367 0 ;
	setAttr ".tk[101]" -type "float3" -0.065836586 -0.073426828 0 ;
	setAttr ".tk[102]" -type "float3" -0.024259068 0.0056871604 0 ;
	setAttr ".tk[103]" -type "float3" -0.069343209 0.062380128 0 ;
	setAttr ".tk[104]" -type "float3" -0.14387618 0.025474152 0 ;
	setAttr ".tk[105]" -type "float3" -0.06962204 0.025474152 0 ;
	setAttr ".tk[106]" -type "float3" -0.024259068 -0.0056871655 0 ;
createNode polySplitRing -n "polySplitRing4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[177:178]" "e[180]" "e[182]" "e[184]" "e[186]" "e[188]" "e[190]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.20246045291423798;
	setAttr ".re" 190;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[140:141]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.53704988956451416;
	setAttr ".dr" no;
	setAttr ".re" 140;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak7";
	setAttr ".uopa" yes;
	setAttr -s 50 ".tk";
	setAttr ".tk[42]" -type "float3" 0 0 0.010656852 ;
	setAttr ".tk[47]" -type "float3" 0 0 -0.11773551 ;
	setAttr ".tk[48]" -type "float3" 0 0 -0.060245227 ;
	setAttr ".tk[49]" -type "float3" 0 0 -0.03838136 ;
	setAttr ".tk[54]" -type "float3" 0 0 -0.12083407 ;
	setAttr ".tk[55]" -type "float3" 0 0 0.044071358 ;
	setAttr ".tk[60]" -type "float3" 0 0 -0.092567325 ;
	setAttr ".tk[61]" -type "float3" 0 0 -0.019838847 ;
	setAttr ".tk[80]" -type "float3" -0.086791031 0 0 ;
	setAttr ".tk[82]" -type "float3" -0.086791031 0 0.11822155 ;
	setAttr ".tk[83]" -type "float3" -0.043271273 -2.9976022e-015 0.30578673 ;
	setAttr ".tk[84]" -type "float3" -0.023662332 -2.9976022e-015 0.30824319 ;
	setAttr ".tk[85]" -type "float3" 0.00054791232 -2.9976022e-015 0.31091166 ;
	setAttr ".tk[86]" -type "float3" -0.034680985 -2.9976022e-015 0.3067832 ;
	setAttr ".tk[87]" -type "float3" -0.009871047 -2.9976022e-015 0.30984327 ;
	setAttr ".tk[88]" -type "float3" 0.011952582 -2.9976022e-015 0.33341309 ;
	setAttr ".tk[89]" -type "float3" 0.011973905 -2.9976022e-015 0.31214941 ;
	setAttr ".tk[90]" -type "float3" -0.044321511 -2.9976022e-015 0.30556533 ;
	setAttr ".tk[91]" -type "float3" -0.033420697 0.0050422428 -0.087971628 ;
	setAttr ".tk[92]" -type "float3" -0.05879106 0.026951289 -0.021409042 ;
	setAttr ".tk[93]" -type "float3" -0.070642322 0.011320276 0.037082862 ;
	setAttr ".tk[94]" -type "float3" -0.072202116 0 0.0015810854 ;
	setAttr ".tk[95]" -type "float3" 0 0 0.0065012164 ;
	setAttr ".tk[96]" -type "float3" 0 0 -0.058389794 ;
	setAttr ".tk[97]" -type "float3" 0 0 -0.11100602 ;
	setAttr ".tk[98]" -type "float3" -0.073222667 0 -0.086313076 ;
	setAttr ".tk[99]" -type "float3" 0.010714028 -0.012993726 -0.094030418 ;
	setAttr ".tk[100]" -type "float3" 0.079486489 -0.010855064 -0.040013816 ;
	setAttr ".tk[101]" -type "float3" 0.080084555 -0.0021710098 0.016330898 ;
	setAttr ".tk[102]" -type "float3" 0.059900373 -0.0086840466 -0.019688809 ;
	setAttr ".tk[103]" -type "float3" 0.05355636 0.010855056 -0.0082722269 ;
	setAttr ".tk[104]" -type "float3" 0.0369047 0.023881115 -0.046934351 ;
	setAttr ".tk[105]" -type "float3" -0.0087533398 0.010855056 -0.14126642 ;
	setAttr ".tk[106]" -type "float3" -0.019445147 -0.0086840466 -0.12078391 ;
	setAttr ".tk[107]" -type "float3" -0.012331843 0 -0.10136004 ;
	setAttr ".tk[108]" -type "float3" 0.0041175606 -0.0021710172 -0.079767734 ;
	setAttr ".tk[109]" -type "float3" 0.041128717 -0.0086840466 -0.02421207 ;
	setAttr ".tk[110]" -type "float3" -0.0091169905 -0.0021710172 0.024607504 ;
	setAttr ".tk[111]" -type "float3" -0.012331843 0 0.024640376 ;
	setAttr ".tk[112]" -type "float3" 0.0082299132 0 -0.00091708079 ;
	setAttr ".tk[113]" -type "float3" 0.041128717 0.0080174552 -0.055077594 ;
	setAttr ".tk[114]" -type "float3" 0.0082299132 0 -0.098993108 ;
	setAttr ".tk[115]" -type "float3" -0.13063492 -0.015197083 0.022497177 ;
	setAttr ".tk[116]" -type "float3" -0.087292187 -2.9976022e-015 0.00069983164 ;
	setAttr ".tk[117]" -type "float3" -0.026206605 0.01480535 0.032555692 ;
	setAttr ".tk[118]" -type "float3" 0.0061700353 0.013597827 0.044174511 ;
	setAttr ".tk[119]" -type "float3" -0.0092419889 -0.015197083 0.0082095265 ;
	setAttr ".tk[120]" -type "float3" 0.014075788 -0.019539103 0.017402261 ;
	setAttr ".tk[121]" -type "float3" -0.015783381 -0.018412517 -0.00017355196 ;
	setAttr ".tk[122]" -type "float3" -0.10855022 -0.01170397 -0.014215225 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[0]" "e[2:4]" "e[135]" "e[138]" "e[141]" "e[144]" "e[226]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.1699771 8.8063374 0.9053269 ;
	setAttr ".rs" 36086;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.37556343749935461 8.0552680682170177 -0.58239680000851957 ;
	setAttr ".cbx" -type "double3" 1.9643908026025887 9.5574060008529873 2.3930505990590225 ;
createNode polySplitRing -n "polySplitRing6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[228:229]" "e[231:232]" "e[234]" "e[237]" "e[239]" "e[241]" "e[243]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.1066175177693367;
	setAttr ".re" 231;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak8";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[125]" -type "float3" 0.25934827 -2.1596448 0.21402259 ;
	setAttr ".tk[126]" -type "float3" 0.39822978 -2.0449357 0.36086178 ;
	setAttr ".tk[127]" -type "float3" 0.39822978 -2.0449357 -0.33398828 ;
	setAttr ".tk[128]" -type "float3" 0.25934827 -2.1596448 -0.18714915 ;
	setAttr ".tk[129]" -type "float3" 0.20851421 -2.2016311 0.01343671 ;
	setAttr ".tk[130]" -type "float3" 0.49308747 -2.0174816 -0.36086178 ;
	setAttr ".tk[131]" -type "float3" 0.51540351 -1.7760587 -0.22940537 ;
	setAttr ".tk[132]" -type "float3" 0.51540351 -1.7760587 -0.015125951 ;
	setAttr ".tk[133]" -type "float3" 0.51540351 -1.7760587 0.16958804 ;
createNode polySplitRing -n "polySplitRing7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[246:247]" "e[249]" "e[251]" "e[253]" "e[255]" "e[257]" "e[259]" "e[261]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.48587760329246521;
	setAttr ".dr" no;
	setAttr ".re" 247;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak9";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[78]" -type "float3" 0 9.3132257e-010 0 ;
	setAttr ".tk[79]" -type "float3" -0.029305425 0.025140459 0 ;
	setAttr ".tk[80]" -type "float3" 0 0.0038677684 -1.110223e-016 ;
	setAttr ".tk[81]" -type "float3" -0.029305425 0.025140459 0 ;
	setAttr ".tk[82]" -type "float3" 0 0.0038677684 -1.110223e-016 ;
	setAttr ".tk[123]" -type "float3" -0.029305425 0.025140459 0 ;
	setAttr ".tk[124]" -type "float3" 0 0.0038677684 -1.5265567e-016 ;
	setAttr ".tk[126]" -type "float3" 0.086384967 0 0 ;
	setAttr ".tk[127]" -type "float3" 0.086384967 0 0 ;
	setAttr ".tk[134]" -type "float3" 0.029305425 0.11990061 0 ;
	setAttr ".tk[135]" -type "float3" 0 0.09758468 0 ;
	setAttr ".tk[136]" -type "float3" 0 0.09758468 0 ;
	setAttr ".tk[137]" -type "float3" 0 0.09758468 0 ;
	setAttr ".tk[138]" -type "float3" 0.029305425 0.11990061 0 ;
	setAttr ".tk[139]" -type "float3" 0.021125246 0.072491474 0 ;
	setAttr ".tk[140]" -type "float3" 0.020894673 0.072491474 -7.6327833e-017 ;
	setAttr ".tk[141]" -type "float3" 0.021125246 0.093764164 0 ;
	setAttr ".tk[142]" -type "float3" 0.11057014 0.016965095 0 ;
createNode polySplitRing -n "polySplitRing8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[246:247]" "e[249]" "e[251]" "e[253]" "e[255]" "e[257]" "e[259]" "e[261]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.54958224296569824;
	setAttr ".dr" no;
	setAttr ".re" 247;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[264:265]" "e[267]" "e[269]" "e[271]" "e[273]" "e[275]" "e[277]" "e[279]";
	setAttr ".ix" -type "matrix" 1.8597529195397073 0 0 0 0 3.5227631477782535 0 0 0 0 1.4809537439632883 0
		 0 12.46729058300309 1.0228878407066362 1;
	setAttr ".wt" 0.56811350584030151;
	setAttr ".re" 264;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyCube -n "polyCube1";
	setAttr ".cuv" 4;
createNode polySmoothFace -n "polySmoothFace1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 5 "f[2:3]" "f[6:7]" "f[10:11]" "f[14:15]" "f[20:23]";
createNode polyTweak -n "polyTweak10";
	setAttr ".uopa" yes;
	setAttr -s 17 ".tk[0:16]" -type "float3"  -0.067287453 -0.21757156 0
		 0 0.078502029 0 0 0.078502029 0 -0.067287453 -0.21757156 0 0 -0.21757156 0 0 0.019625505
		 0 0 0.019625505 0 0 -0.21757156 0 -0.036447365 -0.025232797 0 0 0.078502029 0 -0.036447365
		 -0.025232797 0 -0.067287453 -0.21757156 0 0 -0.01682188 0 0 0.019625505 0 0 -0.01682188
		 0 0 -0.21757156 0 -0.036447365 -0.025232797 0;
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 1 "f[6]";
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "f[6]";
createNode polySplitRing -n "polySplitRing10";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[5]" "e[8]" "e[14]" "e[18]" "e[23]";
	setAttr ".ix" -type "matrix" 2.0890490222498705 0 0 0 0 2.0890490222498705 0 0 0 0 2.0890490222498705 0
		 0 17.786876295981109 1.2191697935937016 1;
	setAttr ".wt" 0.47037610411643982;
	setAttr ".re" 5;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak11";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[0]" -type "float3" 0 -0.16762905 -0.03223636 ;
	setAttr ".tk[2]" -type "float3" 0 0.045130905 -0.06447272 ;
	setAttr ".tk[3]" -type "float3" 0 -0.02578909 -0.045130901 ;
	setAttr ".tk[4]" -type "float3" 0 -0.14183997 0.0064472724 ;
	setAttr ".tk[6]" -type "float3" 0 0.045130905 -0.06447272 ;
	setAttr ".tk[7]" -type "float3" 0 0.090261802 -0.090261802 ;
	setAttr ".tk[8]" -type "float3" 0 -0.10315634 0 ;
	setAttr ".tk[10]" -type "float3" 0 0 -0.051578175 ;
	setAttr ".tk[11]" -type "float3" 0 0.038683634 -0.019341817 ;
	setAttr ".tk[12]" -type "float3" 0 -0.17407633 0 ;
	setAttr ".tk[14]" -type "float3" 0 0 -0.051578175 ;
	setAttr ".tk[15]" -type "float3" 0 -0.019341817 -0.0064472686 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[0]" "e[3]" "e[10:11]";
	setAttr ".ix" -type "matrix" 2.1181183156751837 0 0 0 0 2.1181183156751837 0 0 0 0 2.1181183156751837 0
		 0 17.970030531206444 0.80896368289689113 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.3258858 16.666323 0.7591911 ;
	setAttr ".rs" 62126;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0 16.46644924558241 -0.098531964839981279 ;
	setAttr ".cbx" -type "double3" 0.65177159856391409 16.866197678380107 1.6169141645963174 ;
createNode polyTweak -n "polyTweak12";
	setAttr ".uopa" yes;
	setAttr -s 18 ".tk";
	setAttr ".tk[1]" -type "float3" -0.025501279 -0.0085004261 -0.0061362567 ;
	setAttr ".tk[2]" -type "float3" 0 -1.7208457e-015 0.042953797 ;
	setAttr ".tk[4]" -type "float3" 0 0.024545027 0 ;
	setAttr ".tk[6]" -type "float3" 0 0 0.036817536 ;
	setAttr ".tk[7]" -type "float3" 0 -0.049090054 0.036817539 ;
	setAttr ".tk[8]" -type "float3" 0 -0.036817543 -0.012272513 ;
	setAttr ".tk[9]" -type "float3" -0.0478695 -0.04308255 0 ;
	setAttr ".tk[10]" -type "float3" 0 -0.079771332 0.042953797 ;
	setAttr ".tk[13]" -type "float3" 0 -0.015352529 0 ;
	setAttr ".tk[14]" -type "float3" 0 -0.19022392 0.055226311 ;
	setAttr ".tk[15]" -type "float3" -0.025501277 -0.076462448 0 ;
	setAttr ".tk[16]" -type "float3" 0 0 -0.024545025 ;
	setAttr ".tk[17]" -type "float3" 0 0.042953797 -0.024545025 ;
	setAttr ".tk[18]" -type "float3" 0 -0.033523578 0 ;
	setAttr ".tk[19]" -type "float3" 0 0 0.042415824 ;
	setAttr ".tk[20]" -type "float3" 0 0 0.054688342 ;
createNode polySplitRing -n "polySplitRing11";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[0:3]" "e[13]" "e[16]" "e[19]" "e[27]" "e[33]" "e[36]" "e[39]";
	setAttr ".ix" -type "matrix" 2.1181183156751837 0 0 0 0 2.1181183156751837 0 0 0 0 2.1181183156751837 0
		 0 17.970030531206444 0.80896368289689113 1;
	setAttr ".wt" 0.44003152847290039;
	setAttr ".dr" no;
	setAttr ".re" 36;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak13";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk[21:25]" -type "float3"  0 -0.26530069 0.037673734
		 0.16951045 -0.21037346 -0.080747098 0 -0.35510877 -0.16974214 0.16951045 -0.29971004
		 -0.020950757 0.14415851 -0.2522738 -0.070190802;
createNode polyUnite -n "polyUnite1";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:27]";
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:146]";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:174]";
createNode polyMergeVert -n "polyMergeVert4";
	setAttr ".ics" -type "componentList" 2 "vtx[21]" "vtx[109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert5";
	setAttr ".ics" -type "componentList" 2 "vtx[26]" "vtx[109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert6";
	setAttr ".ics" -type "componentList" 2 "vtx[22]" "vtx[109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert7";
	setAttr ".ics" -type "componentList" 2 "vtx[25]" "vtx[109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert8";
	setAttr ".ics" -type "componentList" 2 "vtx[24]" "vtx[106]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert9";
	setAttr ".ics" -type "componentList" 2 "vtx[36]" "vtx[106]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polyMergeVert -n "polyMergeVert10";
	setAttr ".ics" -type "componentList" 2 "vtx[23]" "vtx[106]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".am" yes;
createNode polySplitRing -n "polySplitRing12";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[34:35]" "e[37:38]" "e[40]" "e[45]" "e[63]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wt" 0.39534515142440796;
	setAttr ".dr" no;
	setAttr ".re" 40;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 4 ".st";
select -ne :initialShadingGroup;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 5 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :defaultTextureList1;
	setAttr -s 4 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 4 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "Ref.di" "RefImages.do";
connectAttr "groupId3.id" "pCylinderShape1.iog.og[4].gid";
connectAttr ":initialShadingGroup.mwc" "pCylinderShape1.iog.og[4].gco";
connectAttr "groupParts2.og" "pCylinderShape1.i";
connectAttr "groupId4.id" "pCylinderShape1.ciog.cog[0].cgid";
connectAttr "groupId1.id" "pCubeShape1.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCubeShape1.iog.og[0].gco";
connectAttr "groupParts1.og" "pCubeShape1.i";
connectAttr "groupId2.id" "pCubeShape1.ciog.cog[0].cgid";
connectAttr "polySplitRing12.out" "polySurfaceShape2.i";
connectAttr "groupId5.id" "polySurfaceShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape2.iog.og[0].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "surfaceShader2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "surfaceShader2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "FrontRef_Mat.oc" "surfaceShader1SG.ss";
connectAttr "FrontRef_PlaneShape.iog" "surfaceShader1SG.dsm" -na;
connectAttr "surfaceShader1SG.msg" "materialInfo1.sg";
connectAttr "FrontRef_Mat.msg" "materialInfo1.m";
connectAttr "file3.msg" "materialInfo1.t" -na;
connectAttr "SideRef_Mat.oc" "surfaceShader2SG.ss";
connectAttr "SideRef_PlaneShape.iog" "surfaceShader2SG.dsm" -na;
connectAttr "surfaceShader2SG.msg" "materialInfo2.sg";
connectAttr "SideRef_Mat.msg" "materialInfo2.m";
connectAttr "file4.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "file3.oc" "FrontRef_Mat.c";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "file4.oc" "SideRef_Mat.c";
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr "layerManager.dli[1]" "Ref.id";
connectAttr "polySurfaceShape1.o" "polySplit1.ip";
connectAttr "polySplit1.out" "polySplit2.ip";
connectAttr "polyTweak1.out" "polyMergeVert1.ip";
connectAttr "pCylinderShape1.wm" "polyMergeVert1.mp";
connectAttr "polySplit2.out" "polyTweak1.ip";
connectAttr "polyMergeVert1.out" "polyExtrudeEdge1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge1.mp";
connectAttr "polyExtrudeEdge1.out" "polyExtrudeEdge2.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge2.mp";
connectAttr "polyTweak2.out" "polyExtrudeEdge3.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge3.mp";
connectAttr "polyExtrudeEdge2.out" "polyTweak2.ip";
connectAttr "polyTweak3.out" "polyMergeVert2.ip";
connectAttr "pCylinderShape1.wm" "polyMergeVert2.mp";
connectAttr "polyExtrudeEdge3.out" "polyTweak3.ip";
connectAttr "polyMergeVert2.out" "polyMergeVert3.ip";
connectAttr "pCylinderShape1.wm" "polyMergeVert3.mp";
connectAttr "polyTweak4.out" "polyExtrudeEdge4.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge4.mp";
connectAttr "polyMergeVert3.out" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polySplitRing1.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing1.mp";
connectAttr "polyExtrudeEdge4.out" "polyTweak5.ip";
connectAttr "polySplitRing1.out" "polySplitRing2.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing2.mp";
connectAttr "polyTweak6.out" "polySplitRing3.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing3.mp";
connectAttr "polySplitRing2.out" "polyTweak6.ip";
connectAttr "polySplitRing3.out" "polySplitRing4.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing4.mp";
connectAttr "polyTweak7.out" "polySplitRing5.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing5.mp";
connectAttr "polySplitRing4.out" "polyTweak7.ip";
connectAttr "polySplitRing5.out" "polyExtrudeEdge5.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge5.mp";
connectAttr "polyTweak8.out" "polySplitRing6.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing6.mp";
connectAttr "polyExtrudeEdge5.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polySplitRing7.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing7.mp";
connectAttr "polySplitRing6.out" "polyTweak9.ip";
connectAttr "polySplitRing7.out" "polySplitRing8.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing8.mp";
connectAttr "polySplitRing8.out" "polySplitRing9.ip";
connectAttr "pCylinderShape1.wm" "polySplitRing9.mp";
connectAttr "polyCube1.out" "polySmoothFace1.ip";
connectAttr "polySmoothFace1.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "polyTweak10.ip";
connectAttr "polyTweak10.out" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "polyTweak11.out" "polySplitRing10.ip";
connectAttr "pCubeShape1.wm" "polySplitRing10.mp";
connectAttr "deleteComponent3.og" "polyTweak11.ip";
connectAttr "polyTweak12.out" "polyExtrudeEdge6.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeEdge6.mp";
connectAttr "polySplitRing10.out" "polyTweak12.ip";
connectAttr "polyTweak13.out" "polySplitRing11.ip";
connectAttr "pCubeShape1.wm" "polySplitRing11.mp";
connectAttr "polyExtrudeEdge6.out" "polyTweak13.ip";
connectAttr "pCubeShape1.o" "polyUnite1.ip[0]";
connectAttr "pCylinderShape1.o" "polyUnite1.ip[1]";
connectAttr "pCubeShape1.wm" "polyUnite1.im[0]";
connectAttr "pCylinderShape1.wm" "polyUnite1.im[1]";
connectAttr "polySplitRing11.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "polySplitRing9.out" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
connectAttr "polyUnite1.out" "groupParts3.ig";
connectAttr "groupId5.id" "groupParts3.gi";
connectAttr "groupParts3.og" "polyMergeVert4.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert4.mp";
connectAttr "polyMergeVert4.out" "polyMergeVert5.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert5.mp";
connectAttr "polyMergeVert5.out" "polyMergeVert6.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert6.mp";
connectAttr "polyMergeVert6.out" "polyMergeVert7.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert7.mp";
connectAttr "polyMergeVert7.out" "polyMergeVert8.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert8.mp";
connectAttr "polyMergeVert8.out" "polyMergeVert9.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert9.mp";
connectAttr "polyMergeVert9.out" "polyMergeVert10.ip";
connectAttr "polySurfaceShape2.wm" "polyMergeVert10.mp";
connectAttr "polyMergeVert10.out" "polySplitRing12.ip";
connectAttr "polySurfaceShape2.wm" "polySplitRing12.mp";
connectAttr "surfaceShader1SG.pa" ":renderPartition.st" -na;
connectAttr "surfaceShader2SG.pa" ":renderPartition.st" -na;
connectAttr "pCubeShape1.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape1.iog.og[4]" ":initialShadingGroup.dsm" -na;
connectAttr "pCylinderShape1.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId3.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId4.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "FrontRef_Mat.msg" ":defaultShaderList1.s" -na;
connectAttr "SideRef_Mat.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of Blocking_3.ma
