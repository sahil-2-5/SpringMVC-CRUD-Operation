/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.scooby.controller;

import com.scooby.beans.Beans;
import com.scooby.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sahil
 */
@Controller
public class MyController {

    @Autowired
    MyService service;

    @RequestMapping("AccountMaster.com")
    public String LoadIndexPage() {
        return "index";
    }

    @RequestMapping(value = "AccountMaster.com", params = "cmdAction=LoadForm")
    public ModelAndView LoadForm() {
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("process", "LoadForm");
        return mv;
    }
    
    @RequestMapping(value="AccountMaster.com",params="cmdAction=LoadAccountData")
    public ModelAndView LoadAccountData(){
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("process","showData");
        mv.addObject("data",service.getAccountData());
        return mv;
    }
    
    @RequestMapping(value="AccountMaster.com" , params="cmdAction=InsertAccountData")
    public ModelAndView InsertAccountData(Beans beans){
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("successToInsert",service.InsertAccountData(beans));
        return mv;
    }

    @RequestMapping(value="AccountMaster.com",params="cmdAction=DeleteAccount")
    public ModelAndView DeleteAccount(Beans beans){
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("successToDelete",service.DeleteAccount(beans));
        return mv;
    }
    
    @RequestMapping(value="AccountMaster.com",params="cmdAction=LoadDataInFormForUpdate")
    public ModelAndView LoadDataInFormForUpdate(@RequestParam("id") int id){
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("FormData",service.LoadDataInFormForUpdate(id));
        mv.addObject("process","LoadUpdateForm");
        return mv;
    }
    
    @RequestMapping(value="AccountMaster.com",params="cmdAction=UpdateAccountData")
    public ModelAndView updateAccountData(Beans beans){
        ModelAndView mv = new ModelAndView("common");
        mv.addObject("successToUpdate",service.updateAccountData(beans));
        return mv;
    }
   
}
