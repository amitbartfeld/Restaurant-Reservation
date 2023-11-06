/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class OpeningHours {
    private final int[] startingHours;
    private final int[] endingHours;
    
    public OpeningHours(int[] startingHours, int[] endingHours) {
        this.startingHours = startingHours;
        this.endingHours = endingHours;
    }

    @Override
    public String toString() {
        String openingHoursString = "";
        for (int i = 0; i < startingHours.length; i++) {
            openingHoursString+=startingHours[i]+"-"+endingHours[i]+" ";
        }
        openingHoursString = openingHoursString.trim();
        return openingHoursString;
    }

    public int[] getEndingHours() {
        return endingHours;
    }

    public int[] getStartingHours() {
        return startingHours;
    }
    
}
