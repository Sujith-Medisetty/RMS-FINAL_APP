package com.Anurag.demo.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Anurag.demo.dao.SuperUserDao;
import com.Anurag.demo.dao.SuperUserRepo;
import com.Anurag.demo.dao.TellerMasterDao;
import com.Anurag.demo.dto.AdminAnalysisDetails;
import com.Anurag.demo.dto.AllResponse;
import com.Anurag.demo.dto.DropDownTellerList;
import com.Anurag.demo.dto.LocationResponse;
import com.Anurag.demo.exporter.SuperUserTellerAnalysisExcel;
import com.Anurag.demo.exporter.SuperUserTellerReportExcel;
import com.Anurag.demo.exporter.superuserTellerCompleteAnalysisExcel;
import com.Anurag.demo.exporter.superuserTellerCompleteReportExcel;


@Controller
public class SuperUserController {
	
	String sid;
	String spass;
	ArrayList<AllResponse> responses;
	ArrayList<DropDownTellerList> responses2;
	List<String> responses3;
	ArrayList<LocationResponse> responses4;
	
	ArrayList<AllResponse> completeData1;
	ArrayList<AdminAnalysisDetails> summary1;
	ArrayList<AdminAnalysisDetails> analysisDetails1;

	@Autowired
	SuperUserDao dao;
	
	@Autowired
	TellerMasterDao dao2;
	
	@Autowired
	SuperUserRepo repo;
	
	@RequestMapping("/SuperUserLogOut")
	public String SuperUserLogOut() {
		
		return "redirect:Login.jsp";
	}
	
	@RequestMapping("/SuperUserLogin")
	public String SuperUserLogin(@RequestParam String sid,@RequestParam String spass,HttpSession session) {
		
		if(dao.findBySuperUser(sid, spass)>0) {
			
			this.sid=sid;
			this.spass=spass;
			
			responses=repo.getAllDetails();
			responses2=repo.getDropDownTellerList();
			responses3=repo.getDropDownLocationList();			
			responses4=repo.getLocationList();
		
			for(LocationResponse i:responses4) {
				System.out.println("location is "+i);
			}
			
			session.setAttribute("repo", repo);
			session.setAttribute("responses4",responses4);
			session.setAttribute("responses", responses);
			session.setAttribute("responses2", responses2);
			session.setAttribute("responses3", responses3);
			
		
			
			return "SuperUserLogin.jsp";
		}else {
			return "redirect:Login.jsp ";
		}
		
		
	}
	
	@RequestMapping("/SuperUserTellerReport")
	public String SuperUserTellerReport(@RequestParam(value = "tellerid", required = false) String tellerid,@RequestParam(value = "location", required = false) String location,@RequestParam(value = "date1", required = false) String date1,@RequestParam(value = "date2", required = false) String date2,HttpSession session) {
		
		ArrayList<AllResponse> completeData = repo.getIdAndLocation(tellerid,location,date1,date2);
		session.setAttribute("completeData", completeData);
		System.out.println(completeData);
		completeData1=completeData;
		
		session.setAttribute("sid", sid);
		session.setAttribute("spass",spass);
		
		
		return "SuperUserTellerReport.jsp";
	}
	
	
	@RequestMapping("/SuperUserAddTeller")
	public String SuperUserAddTeller(@RequestParam String tid,@RequestParam String tname,@RequestParam String tpno,@RequestParam String tpass,@RequestParam String location_lid,HttpServletResponse res,HttpSession session) {
		

		
		repo.tellerInsert(tid, tname, tpno, tpass, location_lid);
		System.out.println("Insert Success");
		
		 return "redirect:SuperUserLogin.jsp";
			
	}
	
	@RequestMapping("/SuperUserLoginBack")
	public String SuperUserLoginBack(HttpSession session) {
		
		session.setAttribute("repo", repo);
		session.setAttribute("responses4",responses4);
		session.setAttribute("responses", responses);
		session.setAttribute("responses2", responses2);
		session.setAttribute("responses3", responses3);
		
		return "SuperUserLogin.jsp";
	}
	
	@RequestMapping("/SuperUserAddAdmin")
	public String SuperUserAddAdmin(@RequestParam String aid,@RequestParam String aname,@RequestParam String apno,@RequestParam String apass,@RequestParam String location_lid,HttpServletResponse res,HttpSession session) {
	
		repo.adminInsert(aid, aname, apno, apass, location_lid);
		System.out.println("Insert Success");
		
		 return "redirect:SuperUserLogin.jsp";
		 
	}
	
	@RequestMapping("/SuperUserAddLocation")
	public String SuperUserAddLocation(@RequestParam String lid,@RequestParam String lname,@RequestParam String lpno) {
		
		repo.locationInsert(lid, lname, lpno);
		System.out.println("Insert Success");
		
		return "redirect:SuperUserLogin.jsp";
	}
	
	@RequestMapping("/SuperUserTellerAnalysis")
	public String SuperUserTellerAnalysis(@RequestParam(value = "tellerid", required = false) String tellerid,@RequestParam(value = "location", required = false) String location,@RequestParam(value = "date1", required = false) String date1,@RequestParam(value = "date2", required = false) String date2,HttpSession session) {

		ArrayList<AdminAnalysisDetails> summary=repo.getSuperUserTellerAnalysis(tellerid, location,date1,date2);
		session.setAttribute("summary", summary);
		summary1=summary;
		return "superUserAnalysis.jsp";
	}
	
	@RequestMapping("/update2")
	public String update(@RequestParam String new1,@RequestParam String confirm) {
		
		if(new1.equals(confirm)) {
			System.out.println("yes buddy they are same ... ");
            if(new1.equals(confirm)) {
            	repo.updatePassword(sid, new1);
            }
		}
		
	return "Login.jsp";	
	}
	
	
	@RequestMapping("/superuserTellerCompleteReport")
	public String superuserTellerCompleteReport(HttpSession session) {
		
		session.setAttribute("responses", responses);
		
		return "superuserTellerCompleteReport.jsp";
	}
	
	@RequestMapping("/superuserTellerCompleteAnalysis")
	public String superuserTellerCompleteAnalysis(HttpSession session) {
		
		ArrayList<AdminAnalysisDetails> analysisDetails=repo.getSuperUserTellerCompleteAnalysis();
		session.setAttribute("analysisDetails", analysisDetails);
		analysisDetails1=analysisDetails;
		return "superuserTellerCompleteAnalysis.jsp";
	}
	
	
	@RequestMapping("SuperUserTellerReportExcel")
	public void SuperUserTellerReportExcel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=sid+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= SuperUserTellerReportExcel.exportCustomerListToExcelFile(completeData1);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	@RequestMapping("superuserTellerCompleteReportExcel")
	public void SuperUserTellerCompleteReportExcel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=sid+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= superuserTellerCompleteReportExcel.exportCustomerListToExcelFile(responses);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	@RequestMapping("SuperUserTellerAnalysisExcel")
	public void SuperUserTellerAnalysisExcel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=sid+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= SuperUserTellerAnalysisExcel.exportCustomerListToExcelFile(summary1);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	@RequestMapping("superuserTellerCompleteAnalysisExcel")
	public void superuserTellerCompleteAnalysisExcel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=sid+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= superuserTellerCompleteAnalysisExcel.exportCustomerListToExcelFile(analysisDetails1);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	
}
