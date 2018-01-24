package nation.web.notice3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nation.web.tool.DBOpen;
import nation.web.tool.DBClose;

public class NoticeDAO {
  Connection con = null;              // DBMS ����   
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null;                   // SELECT ����� ����
  StringBuffer sql = null;              // SQL ����

  DBOpen dbopen = null;
  DBClose dbclose = null;
 
  public NoticeDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
   
  }
  
  public int create(NoticeVO noticeVO) {
    
    int count = 0; // ó���� ���ڵ��� ����
    
    try {
       
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" INSERT INTO notice(title, rname, rdate)");
      sql.append(" VALUES(?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getRname());

      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
       
  } 
  
  // ArrayList<NoticeVO>: ArrayList�� ������ NoticeVO Ŭ������ ��ü�� ������.
  public ArrayList<NoticeVO> list() {
    ArrayList<NoticeVO> list = null; // ���� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, rname, rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM notice");
      sql.append(" ORDER BY noticeno DESC");
 
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      rs = pstmt.executeQuery(); // SELECT SQL ����
 
      list = new ArrayList<NoticeVO>();
      while(rs.next()) { // ���ڵ� �̵�
        NoticeVO noticeVO = new NoticeVO(); // ���ڵ忡 ������ ��ü ���� 
        // DBMS �÷��� �� -> JAVA ������ ������ �����մϴ�. 
        noticeVO.setNoticeno(rs.getInt("noticeno"));
        noticeVO.setTitle(rs.getString("title"));
        noticeVO.setRname(rs.getString("rname"));
        noticeVO.setRdate(rs.getString("rdate").substring(0, 10));
        
        list.add(noticeVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
    
    return list;
    
  }
  
  // NoticeVO �� ����Ÿ���� �� => �������� ����� �� ���� ���� ������ �� ��� 
  public NoticeVO read(int noticeno) {
    
    NoticeVO noticeVO = null;
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, rname, rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM notice");
      sql.append(" WHERE noticeno=?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, noticeno);
      rs = pstmt.executeQuery(); // SELECT SQL ����
  
      if(rs.next()) { // ù��° ���ڵ���� ���������� ���ڵ���� �̵�
       
        noticeVO = new NoticeVO();
        noticeVO.setNoticeno(rs.getInt("noticeno"));
        noticeVO.setTitle(rs.getString("title"));
        noticeVO.setRname(rs.getString("rname"));
        noticeVO.setRdate(rs.getString("rdate").substring(0, 10));
        
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
    
    return noticeVO;
    
  }
  
  // update �Լ� - NoticeVO �޾Ƽ� �ش� ���ڵ� ���� 
  public int update(NoticeVO noticeVO) {
    
    int count = 0; // ó���� ���ڵ��� ����

    try {
      
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE notice");
      sql.append(" SET title=?, rname=?, rdate=now()");
      sql.append(" WHERE noticeno=?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setString(1, noticeVO.getTitle());
      pstmt.setString(2, noticeVO.getRname());
      pstmt.setInt(3, noticeVO.getNoticeno());
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }   
    
    return count;
    
  }
  
  
  // delete �Լ� - noticeno �޾Ƽ� �ش� ���ڵ� ���� 
  public int delete(int noticeno) {
    
    int count = 0; // ó���� ���ڵ��� ����
    
    try {
      
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" DELETE FROM notice");
      sql.append(" WHERE noticeno=?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, noticeno);
      
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }   
    
    return count;
    
  }  
  
 /**
  * ������ ���ڵ� ������ ���޹޾� ���ڵ�� ������ ArrayList�� ����
  * @param count ���� 
  * @return
  */
  public ArrayList<NoticeVO> list_home(int count) {
    ArrayList<NoticeVO> list = null; // ���� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, rname, rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM notice");
      sql.append(" ORDER BY noticeno DESC");
      sql.append(" LIMIT ?");
 
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, count);
      rs = pstmt.executeQuery(); // SELECT SQL ����
 
      list = new ArrayList<NoticeVO>();
      while(rs.next()) { // ���ڵ� �̵�
        NoticeVO noticeVO = new NoticeVO(); // ���ڵ忡 ������ ��ü ����
        // DBMS �÷��� �� -> JAVA ������ ������ �����մϴ�.
        noticeVO.setNoticeno(rs.getInt("noticeno")); 
        noticeVO.setTitle(rs.getString("title"));
        noticeVO.setRname(rs.getString("rname"));
        noticeVO.setRdate(rs.getString("rdate").substring(0, 10));
        
        list.add(noticeVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }
    
    return list;
    
  }  
  
}
