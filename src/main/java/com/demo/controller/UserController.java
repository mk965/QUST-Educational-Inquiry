package com.demo.controller;

import com.demo.bean.User;
import com.demo.jiaowu.ConnectJWGL;
import com.demo.service.UserService;
//import org.apache.log4j.LogManager;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
@RequestMapping(value = "/")
public class UserController {

    //private Logger logger = LogManager.getLogger();

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User findUserById(@PathVariable("id") Integer id) {
        User user = userService.findUserById(id);
        //logger.info(user.toString());
        return user;
    }
    @RequestMapping(value = "login3", method = RequestMethod.GET)
    @ResponseBody
    public void login(@PathVariable("name") String name, @PathVariable("password") String password){
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        System.out.println(user.getName() + user.getPassword());
        //userService.findUserByNameAndPwd(user);
    }
    @RequestMapping(value = "allUser", method = RequestMethod.GET)
    @ResponseBody
    public List allUser(){
        List<User> userList = userService.allUser();
        return userList;
    }
    @RequestMapping(value = "login2", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView login(){
    	String stuNum = "1608620411";
    	String password = "ky";
		ConnectJWGL connectJWGL = new ConnectJWGL(stuNum,password);
		try {
			connectJWGL.init();
		}catch (Exception e){
			System.out.println("初始化失败！");
		}
        return new ModelAndView("login");
    }







	@RequestMapping(value = "index", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView index(HttpSession session){
    	System.out.println(session.getAttribute("name")+"进入首页");
		if(session.getAttribute("name") != null){
			return new ModelAndView("/main");
		}
		return new ModelAndView("/login");
	}

	/*
	 * 登录
	 * Parameter stuNum
	 * Parameter password
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login3(HttpServletRequest request){
		//接收传值
		String stuNum = request.getParameter("stuNum");
		String password = request.getParameter("password");
		System.out.println("收到登录信息：" + stuNum + "   " + password);
		ConnectJWGL connectJWGL = new ConnectJWGL(stuNum,password);
		try {
			if (!connectJWGL.init()){//如果连接失败
				System.out.println("连接失败哦，准备跳转info/linkError");
				return new ModelAndView("info/linkError");
			}
			//登录教务系统
			String res = connectJWGL.beginLogin();//等
			if (res == "1"){
				//登录成功，设置session
				HttpSession session = request.getSession();
				session.setAttribute("name",stuNum);
				session.setAttribute("password",password);
				connectJWGL.logout();
				//跳转到主页
				return new ModelAndView("redirect:index");
			}
			else {
				//密码错误，跳转提示页面并传提示
				ModelAndView model = new ModelAndView();
				model.addObject("tips",res);
				model.setViewName("info/pwdError");
				return model;
			}
		}catch (Exception e){
			System.out.println("初始化失败！");
			return new ModelAndView("../error/404");
		}
	}
	/*
	 * 登出
	 */
	@RequestMapping(value = "logout")
	@ResponseBody
	public ModelAndView logout(HttpServletRequest request){
		//删除session
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("name") + "退出登录");
		session.removeAttribute("name");
		session.removeAttribute("password");
		//登出成功，跳转首页
		return new ModelAndView("main");
	}

	/*
	 * 当前学期成绩
	 */
	@RequestMapping(value = "currentTermScore", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView currentTermScore(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView();
		if ((String)session.getAttribute("name") == null || (String)session.getAttribute("password") == null)
			return new ModelAndView("/login");
		ConnectJWGL connectJWGL = new ConnectJWGL((String)session.getAttribute("name"),(String)session.getAttribute("password"));
		//计算当前时间的学年和学期
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH ) + 1;
		int term = 1;
		if(month < 9)
			year = year - 1;
		if (month>2 && month<9)
			term = 2;
		else
			term = 1;
		try {
			if (!connectJWGL.init()){//如果连接失败
				System.out.println("连接失败哦，准备跳转info/linkError");
				return new ModelAndView("info/linkError");
			}
			if (connectJWGL.beginLogin() == "1"){
				//查询当前学期成绩
				//connectJWGL.getStudentGrade(year,term);
				List<Map<String,Object>> listMap = connectJWGL.getStudentGrade(year,term);
				model.addObject("scoreList",listMap);
				model.addObject("dataType","scoreList");//数据类型为当前学期成绩
				model.addObject("year",year);
				model.addObject("term",term);
				model.addObject("stuNum",(String)session.getAttribute("name"));
				model.setViewName("scoreList");
				return model;
			}
			connectJWGL.logout();
		} catch (Exception e){
			System.out.println("系统错误！");
			model.addObject("test","error");
			model.setViewName("../error/505");
			return model;
		}
		return model;
    }

	/*
	 * 按学期查询成绩
	 */
	@RequestMapping(value = "termTermScore", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView termTermScore(HttpServletRequest request){
		System.out.println("========按学期查询成绩========");
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView();
		if ((String)session.getAttribute("name") == null || (String)session.getAttribute("password") == null)
			return new ModelAndView("/login");
		ConnectJWGL connectJWGL = new ConnectJWGL((String)session.getAttribute("name"),(String)session.getAttribute("password"));
		String xuenianxueqi = request.getParameter("year");
		//System.out.println(xuenianxueqi);
		String year = xuenianxueqi.substring(0, 4);
		String term = xuenianxueqi.substring(13, 14);
		System.out.println("========按学期查询成绩：第" + year + "学年，第" + term + "学期========");
		//System.out.println(year + "     " + term);

		try {
			if (!connectJWGL.init()){//如果连接失败
				System.out.println("连接失败哦，准备跳转info/linkError");
				return new ModelAndView("info/linkError");
			}
			if (connectJWGL.beginLogin() == "1"){
				//查询当前学期成绩
				//connectJWGL.getStudentGrade(year,term);
				List<Map<String,Object>> listMap = connectJWGL.getStudentGrade(Integer.parseInt(year),Integer.parseInt(term));
				model.addObject("scoreList",listMap);
				model.addObject("dataType","scoreList");//数据类型为当前学期成绩
				model.addObject("xuenianxueqi",xuenianxueqi);
				model.addObject("stuNum",(String)session.getAttribute("name"));
				model.setViewName("scoreList");
				return model;
			}
			connectJWGL.logout();
		} catch (Exception e){
			System.out.println("系统错误！");
			model.addObject("test","error");
			model.setViewName("../error/505");
			return model;
		}
		return model;
	}




	@RequestMapping(value = "main", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView main1(HttpServletRequest request){
		return new ModelAndView("main");
	}
}
