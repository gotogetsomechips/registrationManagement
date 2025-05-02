package store.service;

import java.util.List;
import store.bean.Immigration;

public interface ImmigrationService {
    boolean isImmigrationNumberExists(String immigrationNumber);
    boolean isImmigrationNumberExistsExcludeId(String immigrationNumber, Integer id);
    int addImmigration(Immigration immigration);
    int deleteImmigration(Integer id);
    int updateImmigration(Immigration immigration);
    Immigration getImmigrationById(Integer id);
    List<Immigration> getAllImmigrations();
    List<Immigration> getImmigrationsByCondition(Immigration condition);
    
    // 分页相关方法
    List<Immigration> getAllImmigrationsWithPagination(int startIndex, int pageSize);
    List<Immigration> getImmigrationsByConditionWithPagination(Immigration condition, int startIndex, int pageSize);
    
    int countAllImmigrations();
    int countImmigrationsByCondition(Immigration condition);
}