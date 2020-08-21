/*********************************************
 * OPL 12.10.0.0 Model
 * Author: callo
 * Creation Date: 21 août 2020 at 13:06:26
 *********************************************/
range N = 1..3;
dvar int choice[N][N] in 1..9;

subject to{
  forall(i in N, j in N){
    forall(j2 in N : j!=j2){
        choice[i][j] != choice[i][j2];//Chaque cases de la ligne differentes
        choice[j][i] != choice[j2][i];//Chaque cases de la colonne differentes
      }
	/*forall(i2 in i-1..i+1,j2 in j-1..j+1:i2 >=1 && i2 <=3 && j2 >= 1 && j2 <= 3 && i != i2 && j != j2 && abs(i2)!=abs(j2)){
        choice[i2][j2] != choice[i][j]-1 && choice[i2][j2] != choice[i][j]+1;  
      }*/
      if(i-1>=1)choice[i-1][j] != choice[i][j]-1 && choice[i-1][j] != choice[i][j]+1;
      if(j-1>=1)choice[i][j-1] != choice[i][j]-1 && choice[i][j-1] != choice[i][j]+1;    
      if(i+1<=3)choice[i+1][j] != choice[i][j]-1 && choice[i+1][j] != choice[i][j]+1;    
      if(j+1<=3)choice[i][j+1] != choice[i][j]-1 && choice[i][j+1] != choice[i][j]+1;           
  }    
  
  forall(p in 1..1,q in 1..1){
    forall(i1 in 3*p-2..3*p,j1 in 3*q-2..3*q,i2 in 3*p-2..3*p,j2 in 3*q-2..3*q : i1!=i2 && j1!=j2){
      choice[i1][j1]!=choice[i2][j2];
    }
  }
}

/*int[] possibleMovementX = {-1,0,0,1};
  int[] possibleMovementY = {0,-1,1,0}*/