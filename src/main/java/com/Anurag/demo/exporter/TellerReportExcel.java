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

import com.Anurag.demo.dto.AllResponse;
import com.Anurag.demo.dto.Teller2Response;

public class TellerReportExcel {

	public static ByteArrayInputStream exportCustomerListToExcelFile(ArrayList<Teller2Response> TellerReportExcel) {
		
		try {
			
			//create an .xlsx format workbook
			Workbook workbook=new XSSFWorkbook();
			
			//create a new sheet in workbook
			Sheet sh=workbook.createSheet("ExcelTellerReport");
			
			//create top row with column headings
			String[] columnHeaders= {"Customer Id","Customer Name","Customer Phno","JobName","JobPrice","Discount","GST","Amount","Date"};
			
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
			ArrayList<Teller2Response> a=TellerReportExcel;
			System.out.println(a);
			int rownum=1;
			for(Teller2Response i:a) {
				Row row=sh.createRow(rownum++);
				row.createCell(0).setCellValue(i.getCid());
				row.createCell(1).setCellValue(i.getCname());
				row.createCell(2).setCellValue(i.getCpno());
				row.createCell(3).setCellValue(i.getJobname());
				row.createCell(4).setCellValue(i.getJobprice());
				row.createCell(5).setCellValue(i.getDiscount());
				row.createCell(6).setCellValue(i.getGst());
				row.createCell(7).setCellValue(i.getAmount());
								
				String[] temp=i.getDate().toString().split("-");
				String final1=temp[2]+"-"+temp[1]+"-"+temp[0];
				row.createCell(8).setCellValue(final1);
				
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
			 * fileout.close(); workbook.close(); System.out.println("completed");
			 */
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
