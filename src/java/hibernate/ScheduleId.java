package hibernate;
// Generated Jun 4, 2016 6:36:26 PM by Hibernate Tools 4.3.1



/**
 * ScheduleId generated by hbm2java
 */
public class ScheduleId  implements java.io.Serializable {


     private long idConference;
     private long idDocument;

    public ScheduleId() {
    }

    public ScheduleId(long idConference, long idDocument) {
       this.idConference = idConference;
       this.idDocument = idDocument;
    }
   
    public long getIdConference() {
        return this.idConference;
    }
    
    public void setIdConference(long idConference) {
        this.idConference = idConference;
    }
    public long getIdDocument() {
        return this.idDocument;
    }
    
    public void setIdDocument(long idDocument) {
        this.idDocument = idDocument;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ScheduleId) ) return false;
		 ScheduleId castOther = ( ScheduleId ) other; 
         
		 return (this.getIdConference()==castOther.getIdConference())
 && (this.getIdDocument()==castOther.getIdDocument());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getIdConference();
         result = 37 * result + (int) this.getIdDocument();
         return result;
   }   


}


