spacing = 0.2; // spacing in mm, to make sure males fit females;
height = 4; // piece height in mm;
length = 50; // piece length in mm; do NOT change!
width = 25; // piece width in mm; do NOT change!
tab_small = 5; // length of the tabs on their smaller side in mm; do NOT change!
tab_large = 10; // length of the tabs on their larger side in mm; do NOT change!
X=30; //valor usado para deslocar a figura
L=21; //medida do lado do quadrado a inserir
s_len = (length/2-4)/7-0.5; //comprimento dos quadrados do QR
s_wid = (width-4)/7-0.5; //largura dos quadrados do QR
use <pecinhas_varias.scad>

difference(){
    translate([0,-width/2,0]){
        rotate([0,0,90]){
            cube([length/2 , width, 0.5]);  
        }
    }
    #linear_extrude(height=10);
        piece_A();        
}