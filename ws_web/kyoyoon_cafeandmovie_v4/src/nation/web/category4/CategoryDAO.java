package nation.web.category4;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;
 
public class CategoryDAO {
  private Connection con = null;              // DBMS 연결   
  private PreparedStatement pstmt = null; // SQL 실행
  private ResultSet rs = null;                   // SELECT 결과를 저장
  private StringBuffer sql = null;              // SQL 저장
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public CategoryDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
}