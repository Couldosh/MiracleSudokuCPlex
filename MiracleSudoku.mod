/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Couldosh
 * Creation Date: 21 août 2020 at 08:29:39
 *********************************************/
using CP;
range N = 1..9;
int grid[N][N] = ...;
range nbMouvementKnight = 1..8;
int possibleMovementKnightX[nbMouvementKnight] = [ 2, 1, -1, -2, -2, -1, 1, 2 ];
int possibleMovementKnightY[nbMouvementKnight] = [ 1, 2, 2, 1, -1, -2, -2, -1 ];


dvar int choice[N][N] in N;

subject to{
  forall(i in N){
    forall(j in N){
      forall(j2 in N : j!=j2){
        choice[i][j] != choice[i][j2];//Chaque cases de la ligne differentes
        choice[j][i] != choice[j2][i];//Chaque cases de la colonne differentes
      }
      
      if(grid[i][j]!=0){
        choice[i][j]==grid[i][j]; //Ajout des cases déjà remplies de la grille
      }
      
      forall(m in nbMouvementKnight){ //Contrainte mouvement d'un cavalier
        if(i+possibleMovementKnightX[m]>=1 && i+possibleMovementKnightX[m]<=9
      						&& j+possibleMovementKnightY[m]>=1 && j+possibleMovementKnightY[m]<=9){
        choice[i][j] != choice[i+possibleMovementKnightX[m]][j+possibleMovementKnightY[m]];
      	}
   }    	      	
      
      forall(i2 in i-1..i+1,j2 in j-1..j+1: i2 >=1 && i2 <=9 && j2 >= 1 && j2 <= 9 && i != i2 && j != j2){ //Contrainte mouvement roi
        choice[i][j] != choice[i2][j2];
      }
      
      
      if(i-1>=1)choice[i-1][j] != choice[i][j]-1 && choice[i-1][j] != choice[i][j]+1;
      if(j-1>=1)choice[i][j-1] != choice[i][j]-1 && choice[i][j-1] != choice[i][j]+1;    
      if(i+1<=9)choice[i+1][j] != choice[i][j]-1 && choice[i+1][j] != choice[i][j]+1;    
      if(j+1<=9)choice[i][j+1] != choice[i][j]-1 && choice[i][j+1] != choice[i][j]+1;       
      
    }
  }

  //Contrainte des boites 3x3
  forall(p in 1..3,q in 1..3){
    forall(i1 in 3*p-2..3*p,j1 in 3*q-2..3*q,i2 in 3*p-2..3*p,j2 in 3*q-2..3*q : i1!=i2 && j1!=j2){
      choice[i1][j1]!=choice[i2][j2];
    }
  }
  

}