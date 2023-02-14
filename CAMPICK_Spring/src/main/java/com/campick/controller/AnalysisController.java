package com.campick.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/pick")
public class AnalysisController {
   
   @RequestMapping("/list")
   public String list(Model model) {
      System.out.println("pick list!");
      return "analysis_chart";
   }
   
    @ResponseBody
    @GetMapping("/test")
     public String test(@RequestParam("startDate") String startDate, @RequestParam("lastDate") String lastDate) {
       System.out.println("pick controller 진입");
       System.out.println(startDate);
       System.out.println(lastDate);
       return "analysis_chart";
    }
}