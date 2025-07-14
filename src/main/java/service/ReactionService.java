/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ReactionDAO;
import model.Posts;
import model.Reactions;
import model.Users;

/**
 *
 * @author Admin
 */
public class ReactionService {
    private final ReactionDAO reactionDAO = new ReactionDAO();

    public void toggleLike(Users user, Posts post) {
        Reactions existingReaction = reactionDAO.findByUserAndPost(user, post);

        if (existingReaction == null) {
            // Chưa like → tạo mới
            Reactions reaction = new Reactions();
            reaction.setUserID(user);
            reaction.setPostID(post);
            reaction.setReactionType("like");
            reaction.setReactedAt(new java.util.Date());
            reactionDAO.create(reaction);
        } else {
            // Đã like → bỏ like
            reactionDAO.delete(existingReaction.getReactionID());
        }
    }

    public long getLikeCount(Posts post) {
        return reactionDAO.countLikes(post);
    }
}
