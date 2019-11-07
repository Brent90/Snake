enum GameConstants {
   GRID_SCALE(20);
   
    private int gridScale;
    
    private GameConstants(int val) {
       this.gridScale = val; 
    }
  
    public int getScale() {
     return this.gridScale; 
    }
  
}
