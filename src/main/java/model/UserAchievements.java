/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "UserAchievements")
@NamedQueries({
    @NamedQuery(name = "UserAchievements.findAll", query = "SELECT u FROM UserAchievements u"),
    @NamedQuery(name = "UserAchievements.findByUserID", query = "SELECT u FROM UserAchievements u WHERE u.userAchievementsPK.userID = :userID"),
    @NamedQuery(name = "UserAchievements.findByAchievementID", query = "SELECT u FROM UserAchievements u WHERE u.userAchievementsPK.achievementID = :achievementID"),
    @NamedQuery(name = "UserAchievements.findByEarnedAt", query = "SELECT u FROM UserAchievements u WHERE u.earnedAt = :earnedAt")})
public class UserAchievements implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserAchievementsPK userAchievementsPK;
    @Column(name = "EarnedAt")
    @Temporal(TemporalType.TIMESTAMP)
    private Date earnedAt;
    @JoinColumn(name = "AchievementID", referencedColumnName = "AchievementID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Achievements achievements;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Users users;

    public UserAchievements() {
    }

    public UserAchievements(UserAchievementsPK userAchievementsPK) {
        this.userAchievementsPK = userAchievementsPK;
    }

    public UserAchievements(int userID, int achievementID) {
        this.userAchievementsPK = new UserAchievementsPK(userID, achievementID);
    }

    public UserAchievementsPK getUserAchievementsPK() {
        return userAchievementsPK;
    }

    public void setUserAchievementsPK(UserAchievementsPK userAchievementsPK) {
        this.userAchievementsPK = userAchievementsPK;
    }

    public Date getEarnedAt() {
        return earnedAt;
    }

    public void setEarnedAt(Date earnedAt) {
        this.earnedAt = earnedAt;
    }

    public Achievements getAchievements() {
        return achievements;
    }

    public void setAchievements(Achievements achievements) {
        this.achievements = achievements;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userAchievementsPK != null ? userAchievementsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserAchievements)) {
            return false;
        }
        UserAchievements other = (UserAchievements) object;
        if ((this.userAchievementsPK == null && other.userAchievementsPK != null) || (this.userAchievementsPK != null && !this.userAchievementsPK.equals(other.userAchievementsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.UserAchievements[ userAchievementsPK=" + userAchievementsPK + " ]";
    }
    
}
