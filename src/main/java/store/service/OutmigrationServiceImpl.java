package store.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Outmigration;
import store.mapper.OutmigrationMapper;

@Service
public class OutmigrationServiceImpl implements OutmigrationService {

    @Autowired
    private OutmigrationMapper outmigrationMapper;

    @Override
    public int addOutmigration(Outmigration outmigration) {
        return outmigrationMapper.insert(outmigration);
    }

    @Override
    public int deleteOutmigration(Integer id) {
        return outmigrationMapper.deleteById(id);
    }
    @Override
    public Outmigration getOutmigrationByName(String name) {
        return outmigrationMapper.selectByName(name);
    }

    @Override
    public Outmigration getOutmigrationByNameExcludeId(String name, Integer id) {
        return outmigrationMapper.selectByNameExcludeId(name, id);
    }
    @Override
    public int updateOutmigration(Outmigration outmigration) {
        return outmigrationMapper.update(outmigration);
    }

    @Override
    public Outmigration getOutmigrationById(Integer id) {
        return outmigrationMapper.selectById(id);
    }

    @Override
    public List<Outmigration> getAllOutmigrations() {
        return outmigrationMapper.selectAll();
    }

    @Override
    public List<Outmigration> getOutmigrationsByCondition(Outmigration condition) {
        return outmigrationMapper.selectByCondition(condition);
    }

    @Override
    public List<Outmigration> getAllOutmigrationsOrderBy(String orderBy) {
        return outmigrationMapper.selectAllOrderBy(orderBy);
    }

    @Override
    public List<Outmigration> getAllOutmigrationsWithPagination(int startIndex, int pageSize) {
        return outmigrationMapper.selectAllWithPagination(startIndex, pageSize);
    }

    @Override
    public List<Outmigration> getOutmigrationsByConditionWithPagination(Outmigration condition, int startIndex, int pageSize) {
        return outmigrationMapper.selectByConditionWithPagination(condition, startIndex, pageSize);
    }

    @Override
    public List<Outmigration> getOutmigrationsByConditionOrderByWithPagination(Outmigration condition, String orderBy, int startIndex, int pageSize) {
        return outmigrationMapper.selectByConditionOrderByWithPagination(condition, orderBy, startIndex, pageSize);
    }

    @Override
    public int countAllOutmigrations() {
        return outmigrationMapper.countAll();
    }

    @Override
    public int countOutmigrationsByCondition(Outmigration condition) {
        return outmigrationMapper.countByCondition(condition);
    }
}