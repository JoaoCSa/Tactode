use <pecinhas_varias.scad>

//------------------letra A-------------------------
module letraA(){
    linear_extrude(height=0.3){
        rotate([0,180,0])
            translate([-17,-5,0.3])
            text("A");
    }
}
//-------------------------------------------------------
//------------------letra B-------------------------
module letraB(){
    linear_extrude(height=0.3){
        rotate([0,180,0])
            translate([-17,-5,0.3])
                text("B");
    }
}
//-------------------------------------------------------
//------------------letra C-------------------------
module letraC(){
    linear_extrude(height=0.3){
        rotate([0,180,0])
            translate([-17,-5,0.3])
            text("C");
    }
}
//-------------------------------------------------------
rotate([180,0,0]){
piece_A();
}

//letraA();
letraB();
//letraC();