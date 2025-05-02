package store.service;

import java.util.List;
import store.bean.Household;

public interface HouseholdService {
    Household getHouseholdByName(String householdName);
    boolean isHouseholdNameExists(String householdName, Integer excludeId);
    int addHousehold(Household household);
    int deleteHousehold(Integer id);
    int updateHousehold(Household household);
    Household getHouseholdById(Integer id);
    List<Household> getAllHouseholds();
    List<Household> getHouseholdsByCondition(Household condition);
    List<Household> getAllHouseholdsWithPagination(int startIndex, int pageSize);
    List<Household> getHouseholdsByConditionWithPagination(Household condition, int startIndex, int pageSize);
    int countAllHouseholds();
    int countHouseholdsByCondition(Household condition);
}