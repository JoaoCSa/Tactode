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
use <pecinhas_varias.scad>;
use <letras.scad>;



//-------------------PARTE CORRETA DO CODIGO---------------------//


//BASE DA PEÇA
module base(height, thickness = 0, safe = 0) {
    translate([0,0,10]){
        difference(){
            cube([length + thickness, width + thickness, height + safe], true);
            #translate([length/4 , 0, 1.75])
                cube([length/2, width, 0.5], true);
        }
    }
} 
//PARTE DA PEÇA EM QUE SE ENCAIXA
module female(height, thickness = 0) {
    rotate(90, [0, 0, 1]) 
        translate([(tab_large + spacing - 2 * thickness) * sqrt(3) / 4 - (tab_large + spacing - 2 * thickness) / sqrt(3) , 0, 0])         
            cylinder(height + 1, (tab_large + spacing + 1.9 - 2 * thickness) / sqrt(3), (tab_large + spacing + 1.9 /*1.5 funciona para branco e preto*/ - 2 * thickness) / sqrt(3), true, $fn = 3);
  
}
//PARTE DA PEÇA QUE ENCAIXA
module male(height, thickness = 0, safe = 0) {
    difference(){ 
        rotate(90, [0, 0, 1]) 
            translate([(tab_large - spacing+ 2 * thickness) * sqrt(3) / 4 - (tab_large - spacing + 2 *thickness) / sqrt(3) , 0, 0]){ 
                cylinder(height + safe, (tab_large - spacing + 2 * thickness) / sqrt(3) , (tab_large - spacing + 2 * thickness) / sqrt(3), true, $fn = 3);
            } 

                
    }
}
//PARTE DE CIMA DA PEÇA (VISTO DE CIMA)
module top(height, ind, thickness = 0) {
    translate([0,0,10]){
        //intersection(){
            translate([- length / 4 + ind * tab_small, width/2+0.5, 0]) 
                female(height, thickness);
    }
}
//PARTE DE BAIXO DA PEÇA (VISTO DE CIMA)
module bottom(height, ind, thickness = 0, safe = 0) {
    translate([0,0,10]){
        //intersection(){
            translate([- length / 4 + ind * tab_small, - width / 2 + thickness / 3, 0]) 
                male(height, thickness, safe);

    }
}
//PARTE DA ESQUERDA DA PEÇA (VISTO DE CIMA)
module left(height, thickness = 0) {
    translate([0,0,10]){
        //intersection(){
            translate([- length / 2 + thickness / 3-0.5, 0, 0]) rotate(90, [0, 0, 1]) 
                female(height, thickness);

    }
}
//PARTE DA DIREITA DA PEÇA (VISTO DE CIMA)
module right(height, thickness = 0, safe = 0) {
    translate([0,0,10]){
        difference(){
            translate([length / 2 - thickness / 3, 0, 0]) rotate(90, [0, 0, 1]) 
                male(height, thickness, safe);
                #translate([length/4 , 0, 1.75])
                    cube([length/2, width, 0.5], true);
        } 
    }
}
//CALCULO DA PEÇA CONSOANTE OS DADOS FORNECIDOS
module piece(top, bottom, left, right, top_ind, bottom_ind, height, thickness = 0, safe = 0) {
    union() {
        difference() {
            union() {
                difference() {
                    base(height, thickness, safe);
                    if (top) {
                        top(height, top_ind, thickness);
                    }
                }
                if (bottom) {
                    bottom(height, bottom_ind, thickness, safe);
                }        
            }
            if (left) {
                left(height, thickness);
            }
        }
        if(right) {
            right(height, thickness, safe);
        }
    }
}
//CALCULO DA POSIÇAO DE CADA PARTE DE CADA PEÇA
module piece_position(top, bottom, left, right, top_ind, bottom_ind, x, y, height, thickness = 0, safe = 0) {
    translate([x * tab_small, - y * width, 0]) {
        piece(top, bottom, left, right, top_ind, bottom_ind, height, thickness, safe);
    }
}


module one_piece() {
    piece(true, true, false, false, 0, 0, height);
}

module two_piece() {
    union() {
        piece(true, false, false, false, 0, 0, height);
        piece_position(false, true, false, true, -1, -1, 1, 1, height);
    }
}

module three_piece() {
    union() {
        union() {
            piece(true, false, false, false, 0, 0, height);    
            piece_position(false, false, false, true, -1, -1, 1, 1, height);
        }
        piece_position(false, true, false, true, -1, -1, 1, 2, height);
    }
}

module numeric_piece() {
    piece(false, false, true, true, 0, 0, height);
}

module control_piece() {
    piece(true, true, false, true, 0, 1, height);
}

module end_control_piece() {
    piece(true, true, false, false, 1, 0, height);
}

module else_piece() {
    piece(true, true, false, false, 1, 1, height);
}

module forever_piece() {
    piece(true, true, false, false, 0, 1, height);
}

module end_forever_piece() {
    piece(true, false, false, false, 1, 0, height);
}

module event_piece() {
    piece(false, true, false, false, 0, 0, height);
}
difference(){ //---usar para criar o orificio na peca-----------------
translate([0,0,12]){
rotate([0,180,0]){
//translate([0,0,height/2])
one_piece();
//two_piece();
//three_piece();
//numeric_piece();
//control_piece();
//end_control_piece();
//else_piece();
//forever_piece();
//end_forever_piece();
//event_piece();
}
}


//---Bloco principal--------------------
//---usar para pruduzir letra---------------------------
letraB();
//--------------------------------------





//---segundo bloco--------------------
translate([-5, - 1 * width, 0]){
//---usar para pruduzir letra---------------------------
letraB();
}
//--------------------------------------




//---terceiro bloco--------------------
translate([-5, - 2 * width, 0]){
//---usar para pruduzir letra---------------------------
letraB();
}
//--------------------------------------


}


