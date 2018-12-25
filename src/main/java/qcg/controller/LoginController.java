package qcg.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import qcg.bean.User;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2018/12/25 13:06
 */
@Controller
@RequestMapping("/user")
public class LoginController {

	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(User user){
		JSONObject jsonObject = new JSONObject();
		if ("admin".equals(user.getUsername()) && "admin".equals(user.getPassword())){
			jsonObject.put("status", "1");
			jsonObject.put("msg", "登录成功!");
		}else {
			jsonObject.put("status", "0");
			jsonObject.put("msg", "登录失败！");
		}
		return jsonObject;
	}
}
