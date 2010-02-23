<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%
            try {
                FillInBlank q = (FillInBlank) request.getAttribute("question");
                int i = 0;
                out.print(-1);
                while (q.getQuestion().indexOf("<x" + i + "x>") != -1) {
                    out.print(-1);
                    FAnswer fa = null;
                    for (FAnswer fr : q.getAnswers()) {
                        if (fr.getOrder() == i) {
                            fa = fr;
                        }
                    }
                    //q.getQuestion().replaceAll("<x" + i + "x>", "<input type=\"text\" name=\"q" +fa.getOrder()+ "\"");
                }
            } catch (Exception e) {
                //e.printStackTrace(out);
                out.print(e);
            }
%>
<p>${question.question}</p>