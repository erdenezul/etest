/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modls;

/**
 *
 * @author tulga
 */
public class FAnswer implements Comparable {

    private int id;
    private int order;
    private Double point;
    private String answer;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }

    public int compareTo(Object o) {
//        throw new UnsupportedOperationException("Not supported yet.");
        FAnswer f = (FAnswer)o;
        return this.getOrder()-f.getOrder();
    }
}
