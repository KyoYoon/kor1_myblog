package nation.web.tool;

public class Tool {
  /**
   * ������ Ư�����ڸ� ��ƼƼ�� (html entity) ��ȯ 
   * @param src
   * @return
   */
  public static synchronized String convertChar(String src) {
    
    src = src.replaceAll("<", "&lt;");  // entity�� ��ȯ 
    src = src.replaceAll(">", "&gt;");
    src = src.replaceAll("'", "&#39;");
    src = src.replaceAll("\"", "&quot;");
    src = src.replaceAll("\r\n", "<BR>"); // ����Ű 
    
    
    return src;
    
  }

}
