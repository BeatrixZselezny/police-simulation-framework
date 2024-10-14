
  package crimes;


  public interface Crime {
     private boolean caught;
     private String type;     
     public boolean isCaught (){
        return caught;
     }

     public String getType() {
        return type;
     
     }

     void commitCrime();
     void getCaught();

  }


 
