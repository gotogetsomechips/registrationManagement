package store.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import store.bean.Immigration;

public interface ImmigrationMapper {
    int countByImmigrationNumber(@Param("immigrationNumber") String immigrationNumber);
    int countByImmigrationNumberExcludeId(@Param("immigrationNumber") String immigrationNumber, @Param("id") Integer id);
    int insert(Immigration immigration);
    int deleteById(Integer id);
    int update(Immigration immigration);
    Immigration selectById(Integer id);
    List<Immigration> selectAll();
    List<Immigration> selectByCondition(Immigration condition);
    
    // 分页相关方法
    List<Immigration> selectAllWithPagination(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Immigration> selectByConditionWithPagination(@Param("condition") Immigration condition, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    
    int countAll();
    int countByCondition(Immigration condition);
}