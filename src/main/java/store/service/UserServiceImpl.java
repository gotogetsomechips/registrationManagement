package store.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.User;
import store.mapper.UserMapper;
import store.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int addUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.update(user);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.selectAll();
    }

    @Override
    public List<User> getUsersByCondition(User condition) {
        return userMapper.selectByCondition(condition);
    }

    @Override
    public boolean isUsernameExist(String username) {
        return userMapper.countByUsername(username) > 0;
    }

    @Override
    public List<User> getAllUsersOrderBy(String orderBy) {
        return userMapper.selectAllOrderBy(orderBy);
    }

    @Override
    public List<User> getAllUsersWithPagination(int startIndex, int pageSize) {
        return userMapper.selectAllWithPagination(startIndex, pageSize);
    }

    @Override
    public List<User> getUsersByConditionWithPagination(User condition, int startIndex, int pageSize) {
        return userMapper.selectByConditionWithPagination(condition, startIndex, pageSize);
    }

    @Override
    public List<User> getAllUsersOrderByWithPagination(String orderBy, int startIndex, int pageSize) {
        return userMapper.selectAllOrderByWithPagination(orderBy, startIndex, pageSize);
    }

    @Override
    public List<User> getUsersByConditionOrderByWithPagination(User condition, String orderBy, int startIndex, int pageSize) {
        return userMapper.selectByConditionOrderByWithPagination(condition, orderBy, startIndex, pageSize);
    }

    @Override
    public int countAllUsers() {
        return userMapper.countAll();
    }

    @Override
    public int countUsersByCondition(User condition) {
        return userMapper.countByCondition(condition);
    }
}