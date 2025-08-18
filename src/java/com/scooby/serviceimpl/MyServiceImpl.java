/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.scooby.serviceimpl;

import com.scooby.beans.Beans;
import com.scooby.repository.MyRepository;
import com.scooby.service.MyService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author sahil
 */
@Service
public class MyServiceImpl implements MyService {
    
    @Autowired
    MyRepository repository;

    @Override
    public List<Map<String, Object>> getAccountData() {
        return repository.getAccountData();
    }

    @Override
    public int InsertAccountData(Beans beans) {
        return repository.InsertAccountData(beans);
    }

    @Override
    public int DeleteAccount(Beans beans) {
        return repository.DeleteAccount(beans);
    }

    @Override
    public Map<String, Object> LoadDataInFormForUpdate(int id) {
        return repository.LoadDataInFormForUpdate(id);
    }

    @Override
    public int updateAccountData(Beans beans) {
        return repository.updateAccountData(beans);
    }
    
}
