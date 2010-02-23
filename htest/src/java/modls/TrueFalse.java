/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modls;

/**
 *
 * @author tulga
 */
public class TrueFalse extends Question {

    boolean value;
    double point;

    @Override
    public String getTemplate() {
        return "true-false.jsp";
    }

    public boolean getValue() {
        return value;
    }

    public void setValue(boolean value) {
        this.value = value;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    
}
