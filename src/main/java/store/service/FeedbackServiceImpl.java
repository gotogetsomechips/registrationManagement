package store.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Feedback;
import store.mapper.FeedbackMapper;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    @Override
    public int addFeedback(Feedback feedback) {
        return feedbackMapper.insert(feedback);
    }

    @Override
    public int deleteFeedback(Integer id) {
        return feedbackMapper.deleteById(id);
    }

    @Override
    public int updateFeedback(Feedback feedback) {
        return feedbackMapper.update(feedback);
    }

    @Override
    public Feedback getFeedbackById(Integer id) {
        return feedbackMapper.selectById(id);
    }

    @Override
    public List<Feedback> getAllFeedbacks() {
        return feedbackMapper.selectAll();
    }

    @Override
    public List<Feedback> getFeedbacksByCondition(Feedback condition) {
        return feedbackMapper.selectByCondition(condition);
    }

    @Override
    public List<Feedback> getAllFeedbacksOrderBy(String orderBy) {
        return feedbackMapper.selectAllOrderBy(orderBy);
    }
    @Override
    public boolean isFeedbackNameExist(String feedbackName) {
        Feedback condition = new Feedback();
        condition.setFeedbackName(feedbackName);
        return feedbackMapper.countByCondition(condition) > 0;
    }

    @Override
    public boolean isFeedbackNameExistExcludeId(String feedbackName, Integer excludeId) {
        return feedbackMapper.countByNameExcludeId(feedbackName, excludeId) > 0;
    }
    @Override
    public List<Feedback> getAllFeedbacksWithPagination(int startIndex, int pageSize) {
        return feedbackMapper.selectAllWithPagination(startIndex, pageSize);
    }

    @Override
    public List<Feedback> getFeedbacksByConditionWithPagination(Feedback condition, int startIndex, int pageSize) {
        return feedbackMapper.selectByConditionWithPagination(condition, startIndex, pageSize);
    }

    @Override
    public List<Feedback> getAllFeedbacksOrderByWithPagination(String orderBy, int startIndex, int pageSize) {
        return feedbackMapper.selectAllOrderByWithPagination(orderBy, startIndex, pageSize);
    }

    @Override
    public List<Feedback> getFeedbacksByConditionOrderByWithPagination(Feedback condition, String orderBy, int startIndex, int pageSize) {
        return feedbackMapper.selectByConditionOrderByWithPagination(condition, orderBy, startIndex, pageSize);
    }

    @Override
    public int countAllFeedbacks() {
        return feedbackMapper.countAll();
    }

    @Override
    public int countFeedbacksByCondition(Feedback condition) {
        return feedbackMapper.countByCondition(condition);
    }
}