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
@Table(name = "ModerationLogs")
@NamedQueries({
    @NamedQuery(name = "ModerationLogs.findAll", query = "SELECT m FROM ModerationLogs m"),
    @NamedQuery(name = "ModerationLogs.findByLogID", query = "SELECT m FROM ModerationLogs m WHERE m.logID = :logID"),
    @NamedQuery(name = "ModerationLogs.findByContentType", query = "SELECT m FROM ModerationLogs m WHERE m.contentType = :contentType"),
    @NamedQuery(name = "ModerationLogs.findByContentURL", query = "SELECT m FROM ModerationLogs m WHERE m.contentURL = :contentURL"),
    @NamedQuery(name = "ModerationLogs.findByDetectedLabels", query = "SELECT m FROM ModerationLogs m WHERE m.detectedLabels = :detectedLabels"),
    @NamedQuery(name = "ModerationLogs.findByModerator", query = "SELECT m FROM ModerationLogs m WHERE m.moderator = :moderator"),
    @NamedQuery(name = "ModerationLogs.findByActionTaken", query = "SELECT m FROM ModerationLogs m WHERE m.actionTaken = :actionTaken"),
    @NamedQuery(name = "ModerationLogs.findByCheckedAt", query = "SELECT m FROM ModerationLogs m WHERE m.checkedAt = :checkedAt")})
public class ModerationLogs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "LogID")
    private Integer logID;
    @Size(max = 10)
    @Column(name = "ContentType")
    private String contentType;
    @Size(max = 255)
    @Column(name = "ContentURL")
    private String contentURL;
    @Size(max = 255)
    @Column(name = "DetectedLabels")
    private String detectedLabels;
    @Size(max = 50)
    @Column(name = "Moderator")
    private String moderator;
    @Size(max = 50)
    @Column(name = "ActionTaken")
    private String actionTaken;
    @Column(name = "CheckedAt")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkedAt;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne(optional = false)
    private Users userID;

    public ModerationLogs() {
    }

    public ModerationLogs(Integer logID) {
        this.logID = logID;
    }

    public Integer getLogID() {
        return logID;
    }

    public void setLogID(Integer logID) {
        this.logID = logID;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getContentURL() {
        return contentURL;
    }

    public void setContentURL(String contentURL) {
        this.contentURL = contentURL;
    }

    public String getDetectedLabels() {
        return detectedLabels;
    }

    public void setDetectedLabels(String detectedLabels) {
        this.detectedLabels = detectedLabels;
    }

    public String getModerator() {
        return moderator;
    }

    public void setModerator(String moderator) {
        this.moderator = moderator;
    }

    public String getActionTaken() {
        return actionTaken;
    }

    public void setActionTaken(String actionTaken) {
        this.actionTaken = actionTaken;
    }

    public Date getCheckedAt() {
        return checkedAt;
    }

    public void setCheckedAt(Date checkedAt) {
        this.checkedAt = checkedAt;
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
        hash += (logID != null ? logID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ModerationLogs)) {
            return false;
        }
        ModerationLogs other = (ModerationLogs) object;
        if ((this.logID == null && other.logID != null) || (this.logID != null && !this.logID.equals(other.logID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ModerationLogs[ logID=" + logID + " ]";
    }
    
}
