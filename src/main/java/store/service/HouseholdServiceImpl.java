package store.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Household;
import store.mapper.HouseholdMapper;

@Service
public class HouseholdServiceImpl implements HouseholdService {

    @Autowired
    private HouseholdMapper householdMapper;

    @Override
    public int addHousehold(Household household) {
        return householdMapper.insert(household);
    }
    @Override
    public Household getHouseholdByName(String householdName) {
        return householdMapper.selectByName(householdName);
    }

    @Override
    public boolean isHouseholdNameExists(String householdName, Integer excludeId) {
        return householdMapper.countByName(householdName, excludeId) > 0;
    }
    @Override
    public int deleteHousehold(Integer id) {
        return householdMapper.deleteById(id);
    }

    @Override
    public int updateHousehold(Household household) {
        return householdMapper.update(household);
    }

    @Override
    public Household getHouseholdById(Integer id) {
        return householdMapper.selectById(id);
    }

    @Override
    public List<Household> getAllHouseholds() {
        return householdMapper.selectAll();
    }

    @Override
    public List<Household> getHouseholdsByCondition(Household condition) {
        return householdMapper.selectByCondition(condition);
    }

    @Override
    public List<Household> getAllHouseholdsWithPagination(int startIndex, int pageSize) {
        return householdMapper.selectAllWithPagination(startIndex, pageSize);
    }

    @Override
    public List<Household> getHouseholdsByConditionWithPagination(Household condition, int startIndex, int pageSize) {
        return householdMapper.selectByConditionWithPagination(condition, startIndex, pageSize);
    }

    @Override
    public int countAllHouseholds() {
        return householdMapper.countAll();
    }

    @Override
    public int countHouseholdsByCondition(Household condition) {
        return householdMapper.countByCondition(condition);
    }
}