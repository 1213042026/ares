package org.ares.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.ares.entity.User;
import org.ares.service.IUserService;
import org.ares.vo.pageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	IUserService userServiceImpl;
	
	/**
	 * 查询全部用户
	 * @param model
	 * @param pagemodel
	 * @return
	 */
	@RequestMapping("/select")
	public String select(Model model,pageModel pagemodel){
 		pageModel<HashMap> _pagemodel=null;
 		try {
			_pagemodel = userServiceImpl.selectUser(pagemodel);
			System.out.println("size:"+_pagemodel.getList().size());
			System.out.println(_pagemodel.getRows());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("pagemodel", _pagemodel);
		return "/cms/user";
	}
	/**
	 * 删除单个用户
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteUserByid")
	public String deleteUserByid(String id){
		userServiceImpl.deleteUserByid(id);
		return "redirect:/user/select";
	}
	
	/**
	 * 模糊查询用户
	 * @param keyword
	 * @param model
	 * @param pagemodel
	 * @return
	 */
	@RequestMapping("/selectBycondition")
	public String selectBycondition(String keyword,Model model,pageModel pagemodel) {
 		pageModel<HashMap> _pagemodel=null;
 		String keywords="'%"+keyword+"%'";
 		System.out.println(keywords);
 		try {
			_pagemodel=userServiceImpl.selectBycondition(keywords, pagemodel);
			System.out.println("size:"+_pagemodel.getList().size());
			System.out.println(_pagemodel.getRows());
		} catch (Exception e) {
			e.printStackTrace();
		}
 		model.addAttribute("pagemodels", _pagemodel);
 		return "/cms/userBycondition";
 	}
	/**
	 * 删除多个用户
	 * @param listval
	 * @return
	 */
	@RequestMapping("/deleteAll")
	public String deleteAll(String[]  listvals ){
		/*System.out.println(listval!=null?listval[0]:"");
		System.out.println(listval!=null?listval[1]:"");*/
		System.out.println("coming in");
		System.out.println(listvals[0]);
		userServiceImpl.deleteManyUser(listvals);
		System.out.println("zhiqian");
		return "redirect:/user/select";
		
	}
	
	@RequestMapping("/addUser")
	public String addUser(String uid,String psw1,String email,String nickname,String sex,String tel,String QQ,String role){
		
		User user=new User();
		user.setCms_user_uname(uid);
		user.setCms_user_pwd(psw1);
		user.setCms_user_email(email);
		user.setCms_user_nickname(nickname);
		user.setCms_user_sex(sex);
		user.setCms_user_tel(tel);
		user.setCms_user_qq(QQ);
		user.setCms_user_role(role);
		
		userServiceImpl.addUser(user);
		return  "redirect:/user/select";
	}
	
	@RequestMapping("/selectByid")
	public String selectByid(String id,Model model){
		HashMap map=null;
		System.out.println(id);
		map=userServiceImpl.selectByid(id);
		model.addAttribute("userms", map);
		return "/cms/upUser";
		
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(String id,String uid,String psw1,String email,String nickname,String sex,String tel,String QQ,String role){
		User user=new User();
		user.setCms_user_uname(uid);
		user.setCms_user_pwd(psw1);
		user.setCms_user_email(email);
		user.setCms_user_nickname(nickname);
		user.setCms_user_sex(sex);
		user.setCms_user_tel(tel);
		user.setCms_user_qq(QQ);
		user.setCms_user_role(role);
		user.setId(id);
		
		userServiceImpl.updateUser(user);
		return "redirect:/user/select";
		
	}
	
	/**
	 * 查询个人用户信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectuserImf")
	public String selectuserImf(String id,Model model){
		HashMap map=null;
		map=userServiceImpl.selectuserImf(id);
		model.addAttribute("usersf", map);
		return "/cms/userimf";
	}
	
	
	
	@RequestMapping("/selectuserData")
	@ResponseBody
	public HashMap selectuserData(HttpSession session){
		HashMap map=  (HashMap) session.getAttribute("loginUser");
		int id =   (int) map.get("id");
		map=userServiceImpl.selectuserId(id);
		System.out.println(map.get("cms_user_nickname"));
		return map;
	}
	@RequestMapping("/resetUser")
	public String updateuserData(HttpSession session,User user){
		HashMap map=(HashMap)session.getAttribute("loginUser");
		String  id=map.get("id").toString();
		System.out.println(id);
		user.setId(id);
		
		userServiceImpl.updateuserDate(user);
		return "redirect:/inc/news/updatesuccessmes";
	}
	//查看个人信息（前台）
	@RequestMapping("/selectAuser")
	public String selectAImf(HttpSession session,Model model){
		HashMap map=(HashMap)session.getAttribute("loginUser");
		String id=map.get("id").toString();
		map=userServiceImpl.selectuserImf(id);
		model.addAttribute("auser", map);
		return "/news/user_imf";
	}
	
}