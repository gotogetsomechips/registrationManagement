package store.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Immigration;
import store.mapper.ImmigrationMapper;

@Service
public class ImmigrationServiceImpl implements ImmigrationService {

    @Autowired
    private ImmigrationMapper immigrationMapper;

    @Override
    public int addImmigration(Immigration immigration) {
        return immigrationMapper.insert(immigration);
    }
    @Override
    public boolean isImmigrationNumberExists(String immigrationNumber) {
        return immigrationMapper.countByImmigrationNumber(immigrationNumber) > 0;
    }

    @Override
    public boolean isImmigrationNumberExistsExcludeId(String immigrationNumber, Integer id) {
        return immigrationMapper.countByImmigrationNumberExcludeId(immigrationNumber, id) > 0;
    }
    @Override
    public int deleteImmigration(Integer id) {
        return immigrationMapper.deleteById(id);
    }

    @Override
    public int updateImmigration(Immigration immigration) {
        return immigrationMapper.update(immigration);
    }

    @Override
    public Immigration getImmigrationById(Integer id) {
        return immigrationMapper.selectById(id);
    }

    @Override
    public List<Immigration> getAllImmigrations() {
        return immigrationMapper.selectAll();
    }

    @Override
    public List<Immigration> getImmigrationsByCondition(Immigration condition) {
        return immigrationMapper.selectByCondition(condition);
    }

    @Override
    public List<Immigration> getAllImmigrationsWithPagination(int startIndex, int pageSize) {
        return immigrationMapper.selectAllWithPagination(startIndex, pageSize);
    }

    @Override
    public List<Immigration> getImmigrationsByConditionWithPagination(Immigration condition, int startIndex, int pageSize) {
        return immigrationMapper.selectByConditionWithPagination(condition, startIndex, pageSize);
    }

    @Override
    public int countAllImmigrations() {
        return immigrationMapper.countAll();
    }

    @Override
    public int countImmigrationsByCondition(Immigration condition) {
        return immigrationMapper.countByCondition(condition);
    }
}