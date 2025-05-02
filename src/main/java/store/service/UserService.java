package store.service;

import java.util.List;
import store.bean.User;

public interface UserService {
    int addUser(User user);
    int deleteUser(Integer id);
    int updateUser(User user);
    User getUserById(Integer id);
    User getUserByUsername(String username); // 新增方法
    List<User> getAllUsers();
    List<User> getUsersByCondition(User condition);
    boolean isUsernameExist(String username);
    List<User> getAllUsersOrderBy(String orderBy);

    // 分页相关的方法
    List<User> getAllUsersWithPagination(int startIndex, int pageSize);
    List<User> getUsersByConditionWithPagination(User condition, int startIndex, int pageSize);
    List<User> getAllUsersOrderByWithPagination(String orderBy, int startIndex, int pageSize);

    // 新增：同时处理条件查询和排序的方法
    List<User> getUsersByConditionOrderByWithPagination(User condition, String orderBy, int startIndex, int pageSize);

    int countAllUsers();
    int countUsersByCondition(User condition);
}