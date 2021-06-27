package com.Anurag.demo.exporter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.Anurag.demo.dto.AdminAnalysisDetails;

public class superuserTellerCompleteAnalysisExcel {


	public static ByteArrayInputStream exportCustomerListToExcelFile(ArrayList<AdminAnalysisDetails> response) {
		
		
		try {
			
			//create an .xlsx format workbook
			Workbook workbook=new XSSFWorkbook();
			
			//create a new sheet in workbook
			Sheet sh=workbook.createSheet("Invoices");
			
			//create top row with column headings
			String[] columnHeaders= {"Teller Id","Teller Name","Teller Phno","Total Customers","Total Amount"};
			
			//want to make header bold with foreground color
			Font headerFont=workbook.createFont();
			headerFont.setBold(true);
			headerFont.setFontHeightInPoints((short)12);
			headerFont.setColor(IndexedColors.BLACK.index);
			
			
			//create a cellstyle with a font
			CellStyle headerStyle=workbook.createCellStyle();
			headerStyle.setFont(headerFont);
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
			
			//create a row
			Row headerRow=sh.createRow(0);
			
			//iterate over the column headings to crate columns
			for(int i=0;i<columnHeaders.length;i++) {
				Cell cell=headerRow.createCell(i);
				cell.setCellValue(columnHeaders[i]);
				cell.setCellStyle(headerStyle);
			}
			
			//get data and fill the data 
			ArrayList<AdminAnalysisDetails> a=response;
			System.out.println(a);
			int rownum=1;
			for(AdminAnalysisDetails i:a) {
				Row row=sh.createRow(rownum++);
				row.createCell(0).setCellValue(i.getTid());
				row.createCell(1).setCellValue(i.getTname());
				row.createCell(2).setCellValue(i.getTphno());
				row.createCell(3).setCellValue(i.getCustomers());
				row.createCell(4).setCellValue(i.getAmount());
				
			}
			
			for(int i=0;i<columnHeaders.length;i++) {
				sh.autoSizeColumn(i);
			}
			
			ByteArrayOutputStream outputstream = new ByteArrayOutputStream();
			workbook.write(outputstream);
			return new ByteArrayInputStream(outputstream.toByteArray());
			
			/*
			 * Sheet sh2=workbook.createSheet("second"); //write output to the file
			 * FileOutputStream fileout=new FileOutputStream(stri); workbook.write(fileout);
			 * fileout.close(); workbook.close();
			 */
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
}
