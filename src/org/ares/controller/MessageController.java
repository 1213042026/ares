package org.ares.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.ares.service.IMessageService;
import org.ares.vo.pageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	IMessageService messageServiceImpl;
	
	/**
	 * 查询未读留言条数
	 * @return
	 */
	@RequestMapping("/selectnoreadrows")
	@ResponseBody
	public HashMap selectnoreadrows(){
		HashMap map=null;
		map=messageServiceImpl.selectMessagerows();
		return map;
		
	}
	/**
	 * 查询未读留言
	 * @param model
	 * @param pagemodel
	 * @return
	 */
	@RequestMapping("/selectnoread")
	public String selectnoread(Model model,pageModel pagemodel){
		pageModel<HashMap> pageModel2=null;
		try {
			pageModel2=messageServiceImpl.selectnoreadmes(pagemodel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pagemodel", pageModel2);
		return "/cms/message";
	}
	
	
	/**
	 * 查询全部留言条数
	 * @return
	 */
	@RequestMapping("/selectallrows")
	@ResponseBody
	public HashMap selectallrows(){
		HashMap map=null;
		map=messageServiceImpl.selectallrows();
		return map;
		
	}
	/**
	 * 查询全部留言
	 * @param model
	 * @param pagemodel
	 * @return
	 */
	@RequestMapping("/selectall")
	public String selectall(Model model,pageModel pagemodel){
		pageModel<HashMap> pageModel2=null;
		try {
			pageModel2=messageServiceImpl.selectmes(pagemodel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pagemodel", pageModel2);
		return "/cms/message";
	}
	/**
	 * 单个删除留言
	 * @param id
	 * @return
	 */
	@RequestMapping("/deletemesByid")
	public String deleteTxtByid(String id){
		messageServiceImpl.deleteMesByid(id);
		return "redirect:/message/selectall";
	}
	/**
	 * 多个删除留言
	 * @param listmsg
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAll")
	public String deleteAll(String[]  listmsg ){
		
		System.out.println("coming in");
		messageServiceImpl.deleteAll(listmsg);
		return "/ares/message/selectall";
	}
	@RequestMapping("/insertMessage")
	public String insertmessageData(HttpSession session,String message){
		HashMap map=  (HashMap) session.getAttribute("loginUser");
		int id =   (int) map.get("id");
		
		messageServiceImpl.insertMessage(id,message);
		
		return "redirect:/inc/news/successmes";
	}
}
