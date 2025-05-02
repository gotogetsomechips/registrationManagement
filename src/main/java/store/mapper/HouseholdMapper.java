package store.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import store.bean.Household;

public interface HouseholdMapper {
    Household selectByName(String householdName);
    int countByName(@Param("householdName") String householdName, @Param("excludeId") Integer excludeId);
    int insert(Household household);
    int deleteById(Integer id);
    int update(Household household);
    Household selectById(Integer id);
    List<Household> selectAll();
    List<Household> selectByCondition(Household condition);
    List<Household> selectAllWithPagination(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Household> selectByConditionWithPagination(@Param("condition") Household condition, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    int countAll();
    int countByCondition(Household condition);
}