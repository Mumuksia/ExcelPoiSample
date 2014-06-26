package com.base.controller;

import com.base.services.ExcelService;
import com.base.services.HttpRequestSplitService;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class SampleController {

    @Autowired
    ExcelService excelService;

    @Autowired
    HttpRequestSplitService httpRequestSplitService;

    @RequestMapping("home")
    public String loadHomePage(Model m, @RequestParam("file") String path) {
        m.addAttribute("name", "CodeTutr");
        m.addAttribute("test", path);
        return "home";
    }

    @RequestMapping("try")
    public String loadHomePage(Model m) {
        return "try";
    }

    @RequestMapping("excel")
    public String loadHomePage(@RequestParam("file") Object path) {
        System.out.println("kykaracha" + path);
        return "home";
    }

    @RequestMapping("tabExcel")
    public String loadTabExcel() {
        return "excel";
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
        FileItem fi = httpRequestSplitService.getFile(req);
        File saveTo = new File("temp.xls");
        try {
            fi.write(saveTo);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        m.addAttribute("test", excelService.parseExcelFile(httpRequestSplitService.getFile(req)));
        return "excel";
    }
}
