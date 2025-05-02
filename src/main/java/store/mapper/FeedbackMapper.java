package store.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import store.bean.Feedback;

public interface FeedbackMapper {
    int insert(Feedback feedback);
    int deleteById(Integer id);
    int update(Feedback feedback);
    Feedback selectById(Integer id);
    List<Feedback> selectAll();
    List<Feedback> selectByCondition(Feedback condition);
    List<Feedback> selectAllOrderBy(String orderBy);
    int countByNameExcludeId(@Param("feedbackName") String feedbackName, @Param("excludeId") Integer excludeId);
    // 分页相关的方法
    List<Feedback> selectAllWithPagination(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Feedback> selectByConditionWithPagination(@Param("condition") Feedback condition, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Feedback> selectAllOrderByWithPagination(@Param("orderBy") String orderBy, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Feedback> selectByConditionOrderByWithPagination(@Param("condition") Feedback condition, @Param("orderBy") String orderBy, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

    int countAll();
    int countByCondition(Feedback condition);
}