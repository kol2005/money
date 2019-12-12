package com.app.money.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.money.domain.MoneyDTO;

@Controller
public class MoneyController {
	
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String money(Model model) {
		
		return "main";
	}
	
	@RequestMapping(value="/main",method=RequestMethod.POST)
	public String money(MoneyDTO moneyDTO, Model model) {
		
		model.addAttribute("MONEY_DTO",moneyDTO);
		
		return "link";
	}

}
