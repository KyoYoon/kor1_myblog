package nation.web.tool;

public class Tool {
  /**
   * 문장의 특수문자를 엔티티로 (html entity) 변환 
   * @param src
   * @return
   */
  public static synchronized String convertChar(String src) {
    
    src = src.replaceAll("<", "&lt;");  // entity로 변환 
    src = src.replaceAll(">", "&gt;");
    src = src.replaceAll("'", "&#39;");
    src = src.replaceAll("\"", "&quot;");
    src = src.replaceAll("\r\n", "<BR>"); // 엔터키 
    
    
    return src;
    
  }

}
