package store.service;

import java.util.List;
import store.bean.Outmigration;

public interface OutmigrationService {
    int addOutmigration(Outmigration outmigration);
    int deleteOutmigration(Integer id);
    int updateOutmigration(Outmigration outmigration);
    Outmigration getOutmigrationById(Integer id);
    List<Outmigration> getAllOutmigrations();
    List<Outmigration> getOutmigrationsByCondition(Outmigration condition);
    List<Outmigration> getAllOutmigrationsOrderBy(String orderBy);
    // 添加根据姓名查询的方法
    Outmigration getOutmigrationByName(String name);

    // 添加排除当前ID的姓名查询方法
    Outmigration getOutmigrationByNameExcludeId(String name, Integer id);
    // 分页相关方法
    List<Outmigration> getAllOutmigrationsWithPagination(int startIndex, int pageSize);
    List<Outmigration> getOutmigrationsByConditionWithPagination(Outmigration condition, int startIndex, int pageSize);
    List<Outmigration> getOutmigrationsByConditionOrderByWithPagination(Outmigration condition, String orderBy, 
                                                                      int startIndex, int pageSize);
    
    int countAllOutmigrations();
    int countOutmigrationsByCondition(Outmigration condition);
}