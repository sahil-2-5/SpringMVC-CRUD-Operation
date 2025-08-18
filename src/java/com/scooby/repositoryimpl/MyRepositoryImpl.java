/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.scooby.repositoryimpl;

import com.scooby.beans.Beans;
import com.scooby.repository.MyRepository;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author sahil
 */
@Repository
public class MyRepositoryImpl implements MyRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> getAccountData() {
        String sql = "SELECT id , name , balance FROM AccountData";
        return jdbcTemplate.queryForList(sql);
    }

    @Override
    public int InsertAccountData(Beans beans) {
        String sql = "INSERT INTO AccountData ( name , balance ) VALUES ( ? , ? )";
        return jdbcTemplate.update(sql, beans.getName(), beans.getBalance());
    }

    @Override
    public int DeleteAccount(Beans beans) {
        String sql = "DELETE FROM AccountData WHERE id = ? ";
        return jdbcTemplate.update(sql, beans.getId());
    }

    @Override
    public Map<String, Object> LoadDataInFormForUpdate(int id) {
        String sql = "SELECT id , name , balance FROM AccountData WHERE id = ? ";
        return jdbcTemplate.queryForMap(sql, id);
    }

    @Override
    public int updateAccountData(Beans beans) {
        String sql = "UPDATE AccountData SET name = ? , balance = ? WHERE id = ? ";
        return jdbcTemplate.update(sql, beans.getName(), beans.getBalance(), beans.getId());
    }

}
