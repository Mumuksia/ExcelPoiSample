package com.base.services;

import org.apache.commons.fileupload.FileItem;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: y.zavada
 * Date: 6/22/14
 * Time: 9:52 PM
 */
@Component
public class ExcelService {

    public String parseWorkBook() {
        return "it works";
    }

    public String parseExcelFile(FileItem item) throws IOException {
        if (!item.isFormField()) {
            String fileName = item.getName();
            System.out.println("filename:- " + fileName);
            Workbook wb = new HSSFWorkbook(item.getInputStream());
            Sheet sheet = wb.getSheetAt(0);
            for (Iterator<Row> rit = sheet.rowIterator(); rit.hasNext(); ) {
                Row row = rit.next();
                for (Iterator<Cell> cit = row.cellIterator(); cit
                        .hasNext(); ) {
                    Cell cell = cit.next();
                    System.out.println("cell value :- " + cell.toString());//printing content inside each row
                }
            }
        }
        return "success";
    }
}
