package qcg.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author qcg
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView modelAndView = new ModelAndView("menu");
        // 模拟导航
        JSONArray jsonArray1 = new JSONArray();
        // 模拟一级导航
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("title", "一级菜单");
        jsonObject1.put("icon", "");
        jsonObject1.put("href", "javascript:;");
        jsonObject1.put("id", "1111");
        JSONObject jsonObject2 = new JSONObject();
	    jsonObject2.put("title", "用户列表");
	    jsonObject2.put("icon", "");
	    jsonObject2.put("href", "/user/list");
	    jsonObject2.put("id", "222");
        // 二级导航
        JSONArray jsonArray = new JSONArray();
        for (int i = 0 ; i< 3; i ++){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("title", "二级导航" + i + 1);
            jsonObject.put("icon", "");
            jsonObject.put("href", "http://www.baidu.com");
	        jsonObject.put("id", i);
            jsonArray.add(jsonObject);
        }
        jsonObject1.put("childs", jsonArray);
        jsonArray1.add(jsonObject1);
        jsonArray1.add(jsonObject2);
        modelAndView.addObject("menuData", jsonArray1);
        return modelAndView;
    }
}
