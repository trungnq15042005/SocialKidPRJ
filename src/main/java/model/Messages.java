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
@Table(name = "Messages")
@NamedQueries({
    @NamedQuery(name = "Messages.findAll", query = "SELECT m FROM Messages m"),
    @NamedQuery(name = "Messages.findByMessageID", query = "SELECT m FROM Messages m WHERE m.messageID = :messageID"),
    @NamedQuery(name = "Messages.findByMessageText", query = "SELECT m FROM Messages m WHERE m.messageText = :messageText"),
    @NamedQuery(name = "Messages.findBySentAt", query = "SELECT m FROM Messages m WHERE m.sentAt = :sentAt"),
    @NamedQuery(name = "Messages.findByIsRead", query = "SELECT m FROM Messages m WHERE m.isRead = :isRead")})
public class Messages implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "MessageID")
    private Integer messageID;
    @Size(max = 2147483647)
    @Column(name = "MessageText")
    private String messageText;
    @Column(name = "SentAt")
    @Temporal(TemporalType.TIMESTAMP)
    private Date sentAt;
    @Column(name = "IsRead")
    private Boolean isRead;
    @JoinColumn(name = "SenderID", referencedColumnName = "UserID")
    @ManyToOne(optional = false)
    private Users senderID;
    @JoinColumn(name = "ReceiverID", referencedColumnName = "UserID")
    @ManyToOne(optional = false)
    private Users receiverID;

    public Messages() {
    }

    public Messages(Integer messageID) {
        this.messageID = messageID;
    }

    public Integer getMessageID() {
        return messageID;
    }

    public void setMessageID(Integer messageID) {
        this.messageID = messageID;
    }

    public String getMessageText() {
        return messageText;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }

    public Date getSentAt() {
        return sentAt;
    }

    public void setSentAt(Date sentAt) {
        this.sentAt = sentAt;
    }

    public Boolean getIsRead() {
        return isRead;
    }

    public void setIsRead(Boolean isRead) {
        this.isRead = isRead;
    }

    public Users getSenderID() {
        return senderID;
    }

    public void setSenderID(Users senderID) {
        this.senderID = senderID;
    }

    public Users getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(Users receiverID) {
        this.receiverID = receiverID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (messageID != null ? messageID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Messages)) {
            return false;
        }
        Messages other = (Messages) object;
        if ((this.messageID == null && other.messageID != null) || (this.messageID != null && !this.messageID.equals(other.messageID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Messages[ messageID=" + messageID + " ]";
    }
    
}
