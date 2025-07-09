/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Achievements")
@NamedQueries({
    @NamedQuery(name = "Achievements.findAll", query = "SELECT a FROM Achievements a"),
    @NamedQuery(name = "Achievements.findByAchievementID", query = "SELECT a FROM Achievements a WHERE a.achievementID = :achievementID"),
    @NamedQuery(name = "Achievements.findByName", query = "SELECT a FROM Achievements a WHERE a.name = :name"),
    @NamedQuery(name = "Achievements.findByDescription", query = "SELECT a FROM Achievements a WHERE a.description = :description"),
    @NamedQuery(name = "Achievements.findByIconUrl", query = "SELECT a FROM Achievements a WHERE a.iconUrl = :iconUrl")})
public class Achievements implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "AchievementID")
    private Integer achievementID;
    @Size(max = 50)
    @Column(name = "Name")
    private String name;
    @Size(max = 255)
    @Column(name = "Description")
    private String description;
    @Size(max = 255)
    @Column(name = "IconUrl")
    private String iconUrl;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "achievements")
    private List<UserAchievements> userAchievementsList;

    public Achievements() {
    }

    public Achievements(Integer achievementID) {
        this.achievementID = achievementID;
    }

    public Integer getAchievementID() {
        return achievementID;
    }

    public void setAchievementID(Integer achievementID) {
        this.achievementID = achievementID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public List<UserAchievements> getUserAchievementsList() {
        return userAchievementsList;
    }

    public void setUserAchievementsList(List<UserAchievements> userAchievementsList) {
        this.userAchievementsList = userAchievementsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (achievementID != null ? achievementID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Achievements)) {
            return false;
        }
        Achievements other = (Achievements) object;
        if ((this.achievementID == null && other.achievementID != null) || (this.achievementID != null && !this.achievementID.equals(other.achievementID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Achievements[ achievementID=" + achievementID + " ]";
    }
    
}
