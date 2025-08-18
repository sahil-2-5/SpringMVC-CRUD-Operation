/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.scooby.service;

import com.scooby.beans.Beans;
import java.util.List;
import java.util.Map;

/**
 *
 * @author sahil
 */
public interface MyService {

    public List<Map<String, Object>> getAccountData();

    public int InsertAccountData(Beans beans);
    
    public int DeleteAccount(Beans beans);
    
    public Map<String,Object> LoadDataInFormForUpdate(int id);
    
    public int updateAccountData(Beans beans);
}
