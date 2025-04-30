package store.service;

import java.util.List;
import store.bean.Feed;

public interface FeedbackService {
    int addFeedback(Feedback feedback);
    int deleteFeedback(Integer id);
    int updateFeedback(Feedback feedback);
    Feedback getFeedbackById(Integer id);
    List<Feedback> getAllFeedbacks();
    List<Feedback> getFeedbacksByCondition(Feedback condition);
    List<Feedback> getAllFeedbacksOrderBy(String orderBy);
    
    // 分页相关的方法
    List<Feedback> getAllFeedbacksWithPagination(int startIndex, int pageSize);
    List<Feedback> getFeedbacksByConditionWithPagination(Feedback condition, int startIndex, int pageSize);
    List<Feedback> getAllFeedbacksOrderByWithPagination(String orderBy, int startIndex, int pageSize);
    List<Feedback> getFeedbacksByConditionOrderByWithPagination(Feedback condition, String orderBy, int startIndex, int pageSize);
    
    int countAllFeedbacks();
    int countFeedbacksByCondition(Feedback condition);
}