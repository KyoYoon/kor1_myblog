package nation.web.category4;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;
 
public class CategoryDAO {
  private Connection con = null;              // DBMS ����   
  private PreparedStatement pstmt = null; // SQL ����
  private ResultSet rs = null;                   // SELECT ����� ����
  private StringBuffer sql = null;              // SQL ����
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public CategoryDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
}