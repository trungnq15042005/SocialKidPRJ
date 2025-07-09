/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Reactions")
@NamedQueries({
    @NamedQuery(name = "Reactions.findAll", query = "SELECT r FROM Reactions r"),
    @NamedQuery(name = "Reactions.findByReactionID", query = "SELECT r FROM Reactions r WHERE r.reactionID = :reactionID"),
    @NamedQuery(name = "Reactions.findByReactionType", query = "SELECT r FROM Reactions r WHERE r.reactionType = :reactionType"),
    @NamedQuery(name = "Reactions.findByReactedAt", query = "SELECT r FROM Reactions r WHERE r.reactedAt = :reactedAt")})
public class Reactions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ReactionID")
    private Integer reactionID;
    @Size(max = 20)
    @Column(name = "ReactionType")
    private String reactionType;
    @Column(name = "ReactedAt")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reactedAt;
    @JoinColumn(name = "PostID", referencedColumnName = "PostID")
    @ManyToOne(optional = false)
    private Posts postID;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne(optional = false)
    private Users userID;

    public Reactions() {
    }

    public Reactions(Integer reactionID) {
        this.reactionID = reactionID;
    }

    public Integer getReactionID() {
        return reactionID;
    }

    public void setReactionID(Integer reactionID) {
        this.reactionID = reactionID;
    }

    public String getReactionType() {
        return reactionType;
    }

    public void setReactionType(String reactionType) {
        this.reactionType = reactionType;
    }

    public Date getReactedAt() {
        return reactedAt;
    }

    public void setReactedAt(Date reactedAt) {
        this.reactedAt = reactedAt;
    }

    public Posts getPostID() {
        return postID;
    }

    public void setPostID(Posts postID) {
        this.postID = postID;
    }

    public Users getUserID() {
        return userID;
    }

    public void setUserID(Users userID) {
        this.userID = userID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reactionID != null ? reactionID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reactions)) {
            return false;
        }
        Reactions other = (Reactions) object;
        if ((this.reactionID == null && other.reactionID != null) || (this.reactionID != null && !this.reactionID.equals(other.reactionID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Reactions[ reactionID=" + reactionID + " ]";
    }
    
}
