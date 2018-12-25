package qcg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String main(){

        return "menu";
    }
}
