package nation.web.visitor4;

import java.util.ArrayList;

public class VisitorProc {
  private VisitorDAO visitorDAO;
  
  public VisitorProc() {
    visitorDAO = new VisitorDAO();
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);
    
    return count;
  }  
  
  /**
   * �Խù� ����� ���� (���� ���� ���ڵ�) ����� ������ null�� ���� 
   * @return ArrayList<VisitorVO>
   */
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = visitorDAO.list();
    
    return list;
  }
  
  /***
   * �� ���� ���ڵ� ��ȸ 
   * @param visitorno ��ȣ 
   * @return VisitorVO 
   */
  public VisitorVO read(int visitorno) {
    
    VisitorVO visitorVO = visitorDAO.read(visitorno);
    
    return visitorVO;
    
  }
  
  /**
   * ���ڵ��� ��ȣ�� ����ڰ� �Է��� �н����尡 ���� DB�� �����ϴ��� üũ�Ͽ� ������ 1 ������ 0�� ���� 
   * @param visitorno
   * @param passwd
   * @return 
   */
  public int passwordCheck(int visitorno, String passwd) {
    
    int count = visitorDAO.passwordCheck(visitorno, passwd);
    
    return count;
    
  }
  
  /**
   * �� ���� ���ڵ忡 �������� �Է��� ������ ���� ó���ϴ� �Լ� 
   * @param visitorVO (����ڰ� ������ ���ڵ� ������ ���� ��ü)
   * @return
   */
  public int update(VisitorVO visitorVO) {
    int count = visitorDAO.update(visitorVO);
    
    return count;  
    
  }
  
  /**
   * ���ڵ� �� �� ���� 
   * @param visitorno
   * @return 0: ���� ���� or 1: ���� ���� 
   */
  public int delete(int visitorno) {
    
    int count = visitorDAO.delete(visitorno);
    
    return count;
    
  }
  
  /**
   * ������ ���ڵ� ������ ���޹޾� ���ڵ�� ������ ArrayList�� ����
   * @param count ���� 
   * @return
   */  
  public ArrayList<VisitorVO> list_home(int count) {
    ArrayList<VisitorVO> list = visitorDAO.list_home(count);
    
    return list;
    
  }
  
}