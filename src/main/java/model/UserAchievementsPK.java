/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Admin
 */
@Embeddable
public class UserAchievementsPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "UserID")
    private int userID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AchievementID")
    private int achievementID;

    public UserAchievementsPK() {
    }

    public UserAchievementsPK(int userID, int achievementID) {
        this.userID = userID;
        this.achievementID = achievementID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getAchievementID() {
        return achievementID;
    }

    public void setAchievementID(int achievementID) {
        this.achievementID = achievementID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userID;
        hash += (int) achievementID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserAchievementsPK)) {
            return false;
        }
        UserAchievementsPK other = (UserAchievementsPK) object;
        if (this.userID != other.userID) {
            return false;
        }
        if (this.achievementID != other.achievementID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.UserAchievementsPK[ userID=" + userID + ", achievementID=" + achievementID + " ]";
    }
    
}
