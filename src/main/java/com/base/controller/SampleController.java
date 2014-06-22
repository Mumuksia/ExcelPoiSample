package com.base.controller;

import com.base.services.ExcelService;
import com.base.services.HttpRequestSplitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class SampleController {

    @Autowired
    ExcelService excelService;

    @Autowired
    HttpRequestSplitService httpRequestSplitService;

    @RequestMapping("home")
    public String loadHomePage(Model m) {
        m.addAttribute("name", "CodeTutr");
        m.addAttribute("test", "UGAGAGA");
        return "home";
    }

    @RequestMapping("some")
    public String loadSome(Model m) {
        m.addAttribute("name", "CodeTutr");
        m.addAttribute("test", excelService.parseWorkBook());
        return "excel";
    }

    @RequestMapping("uploadExcel")
    public String testExcel(Model m, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        m.addAttribute("name", "RESULT");
        m.addAttribute("test", excelService.parseExcelFile(httpRequestSplitService.getFile(req)));
        return "excel";
    }
}
