package store.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import store.bean.Outmigration;

public interface OutmigrationMapper {
    int insert(Outmigration outmigration);
    int deleteById(Integer id);
    int update(Outmigration outmigration);
    Outmigration selectById(Integer id);
    List<Outmigration> selectAll();
    List<Outmigration> selectByCondition(Outmigration condition);
    List<Outmigration> selectAllOrderBy(String orderBy);
    // 添加一个根据姓名查询的方法
    Outmigration selectByName(String name);

    // 添加一个排除当前ID的姓名查询方法（用于编辑时检查）
    Outmigration selectByNameExcludeId(@Param("name") String name, @Param("id") Integer id);
    // 分页相关方法
    List<Outmigration> selectAllWithPagination(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Outmigration> selectByConditionWithPagination(@Param("condition") Outmigration condition, 
                                                     @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    List<Outmigration> selectByConditionOrderByWithPagination(@Param("condition") Outmigration condition, 
                                                            @Param("orderBy") String orderBy, 
                                                            @Param("startIndex") int startIndex, 
                                                            @Param("pageSize") int pageSize);
    
    int countAll();
    int countByCondition(Outmigration condition);
}