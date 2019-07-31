height = 3; // piece height in mm;
length = 50; // piece length in mm; do NOT change!
width = 25; // piece width in mm; do NOT change!
X=30; //valor usado para deslocar a figura
L=21; //medida do lado do quadrado a inserir
M=(L-1.2)/7;


module CubeQRfill(cordX, cordY, height, width, length){ 
    translate([-2.625,-9.9,0]){
        rotate([0,0,90]){
            if ((cordX<=6) && (cordX>=0) && (cordY<=6) && (cordY>=0)){    
                    difference(){
                            cube([L-1.2 , L-1.2, 0.3]);
                        translate([cordX*M-0.15,cordY*M,-1])
                            cube([M+0.35, M+0.35, 2*height]);
                    }    
            }
        }
    }
}



//..............NUMBERS..............
module piece_zero(){
    intersection(){
        CubeQRfill(1,1,height, width, length);
        CubeQRfill(2,1,height, width, length);
        CubeQRfill(3,1,height, width, length);
        CubeQRfill(4,1,height, width, length);
        CubeQRfill(5,1,height, width, length);
    }
}



module piece_one(){
    intersection(){
        CubeQRfill(1,1,height, width, length);
        CubeQRfill(2,1,height, width, length);
        CubeQRfill(3,1,height, width, length);
        CubeQRfill(4,1,height, width, length);
        CubeQRfill(5,1,height, width, length);
        CubeQRfill(5,3,height, width, length);
        CubeQRfill(5,4,height, width, length);
        CubeQRfill(5,5,height, width, length);
    }
}


module piece_nine(){
    intersection(){
        CubeQRfill(1,1,height, width, length);
        CubeQRfill(2,1,height, width, length);
        CubeQRfill(3,1,height, width, length);
        CubeQRfill(4,2,height, width, length);
        CubeQRfill(5,1,height, width, length);
        CubeQRfill(5,3,height, width, length);
        CubeQRfill(5,4,height, width, length);
        CubeQRfill(5,5,height, width, length);
        CubeQRfill(4,5,height, width, length);
    }
}



//..............LETERS...............
module piece_A(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 1, height, width, length);
        CubeQRfill(4, 1, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 2, height, width, length);
        CubeQRfill(2, 3, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(2, 4, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 5, height, width, length);
        CubeQRfill(3, 5, height, width, length);
    }
}

module piece_B(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 1, height, width, length);
        CubeQRfill(4, 1, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 2, height, width, length);
        CubeQRfill(2, 3, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(2, 4, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 5, height, width, length);
        CubeQRfill(3, 5, height, width, length);
        CubeQRfill(5, 5, height, width, length);
        CubeQRfill(5, 4, height, width, length);
        CubeQRfill(5, 3, height, width, length);
    }
}



module piece_Z(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 1, height, width, length);
        CubeQRfill(4, 2, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 2, height, width, length);
        CubeQRfill(2, 3, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(2, 4, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(3, 4, height, width, length);
        CubeQRfill(5, 5, height, width, length);
        CubeQRfill(5, 4, height, width, length);
        CubeQRfill(5, 3, height, width, length);
        CubeQRfill(3, 3, height, width, length);
    }
}

module piece_a(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 2, height, width, length);
        CubeQRfill(4, 1, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 1, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 5, height, width, length);
    }
}
module piece_b(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 2, height, width, length);
        CubeQRfill(4, 1, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 1, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 5, height, width, length);
        CubeQRfill(5, 3, height, width, length);
        CubeQRfill(5, 4, height, width, length);
        CubeQRfill(5, 5, height, width, length);
    }
}

module piece_z(){
    intersection(){
        CubeQRfill(1, 1, height, width, length);
        CubeQRfill(2, 2, height, width, length);
        CubeQRfill(4, 2, height, width, length);
        CubeQRfill(5, 1, height, width, length);
        CubeQRfill(3, 1, height, width, length);
        CubeQRfill(4, 3, height, width, length);
        CubeQRfill(3, 5, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(2, 5, height, width, length);
        CubeQRfill(4, 4, height, width, length);
        CubeQRfill(3, 4, height, width, length);
        CubeQRfill(5, 5, height, width, length);
        CubeQRfill(5, 4, height, width, length);
        CubeQRfill(5, 3, height, width, length);
        CubeQRfill(3, 3, height, width, length);
    }
}

//piece_zero();
//piece_one();
//piece_nine();
piece_A();
//piece_B();
//piece_Z();
//piece_a();
//piece_b();
//piece_z();
