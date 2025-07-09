/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "UserProfiles")
@NamedQueries({
    @NamedQuery(name = "UserProfiles.findAll", query = "SELECT u FROM UserProfiles u"),
    @NamedQuery(name = "UserProfiles.findByUserID", query = "SELECT u FROM UserProfiles u WHERE u.userID = :userID"),
    @NamedQuery(name = "UserProfiles.findByAvatarUrl", query = "SELECT u FROM UserProfiles u WHERE u.avatarUrl = :avatarUrl"),
    @NamedQuery(name = "UserProfiles.findByBio", query = "SELECT u FROM UserProfiles u WHERE u.bio = :bio"),
    @NamedQuery(name = "UserProfiles.findByFavoriteSubject", query = "SELECT u FROM UserProfiles u WHERE u.favoriteSubject = :favoriteSubject")})
public class UserProfiles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "UserID")
    private Integer userID;
    @Size(max = 255)
    @Column(name = "AvatarUrl")
    private String avatarUrl;
    @Size(max = 255)
    @Column(name = "Bio")
    private String bio;
    @Size(max = 50)
    @Column(name = "FavoriteSubject")
    private String favoriteSubject;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Users users;

    public UserProfiles() {
    }

    public UserProfiles(Integer userID) {
        this.userID = userID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getFavoriteSubject() {
        return favoriteSubject;
    }

    public void setFavoriteSubject(String favoriteSubject) {
        this.favoriteSubject = favoriteSubject;
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
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserProfiles)) {
            return false;
        }
        UserProfiles other = (UserProfiles) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.UserProfiles[ userID=" + userID + " ]";
    }
    
}
