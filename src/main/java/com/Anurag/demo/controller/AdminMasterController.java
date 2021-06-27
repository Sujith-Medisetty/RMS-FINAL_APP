package com.Anurag.demo.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Anurag.demo.dao.AdminMasterDao;
import com.Anurag.demo.dao.AdminMasterRepo;
import com.Anurag.demo.dto.AdminAnalysisDetails;
import com.Anurag.demo.dto.AllResponse;
import com.Anurag.demo.dto.DropDownAdminList;
import com.Anurag.demo.dto.TellerPerformance;
import com.Anurag.demo.exporter.AdminCompleteReportExcel;
import com.Anurag.demo.exporter.AdminTellerReportExcel;
import com.Anurag.demo.exporter.showDetails2Excel;
import com.Anurag.demo.exporter.showDetailsExcel;

@Controller
public class AdminMasterController {

	ArrayList<DropDownAdminList> admins;
	ArrayList<AllResponse> allDetails;
	ArrayList<AllResponse>  complete1;
	ArrayList<AdminAnalysisDetails> showDetails1;
	ArrayList<TellerPerformance> showDetails2;
	String aaid;
	
	@Autowired
	AdminMasterRepo repo;
	
	@Autowired
	AdminMasterDao dao;
	
	
	
	@RequestMapping("/AdminLogin")
	public String AdminLogin(@RequestParam String aid, @RequestParam String apass, HttpSession session) {
		
		if(dao.findByAdminMaster(aid, apass)>0) {
		
		this.aaid=aid;
			
		
		
		session.setAttribute("repo", repo);
		this.admins=repo.getDropDownAdminList(aid);
		this.allDetails=repo.getAllDetails(admins.get(0).getLocation_lid());
		session.setAttribute("location", admins.get(0).getLocation_lid());
		
		session.setAttribute("location_lid",admins.get(0).getLocation_lid());
		session.setAttribute("aid", aid);
		System.out.println("details are "+aid+" and "+admins.get(0).getLocation_lid());
		session.setAttribute("allDetails", allDetails);
		System.out.println("admin login Success");
		
		return "AdminLogin.jsp";
		
		}else {
		
			return "redirect:Login.jsp";
			
		}
		
	}
	
	@RequestMapping("/AdminTellerReport")
	public String AdminTellerReport(@RequestParam(value = "tellerid", required = false) String tellerid,@RequestParam(value = "date1", required = false) String date1,@RequestParam(value = "date2", required = false) String date2,HttpSession session) {
		
		ArrayList<AllResponse>  complete=repo.getCompleteTellerDetails(admins.get(0).getLocation_lid(),tellerid,date1,date2);
		complete1=complete;
				
		session.setAttribute("complete", complete);
		
		return "AdminTellerReport.jsp";
	}
	
	@RequestMapping("/AdminLoginBack")
	public String AdminLoginBack() {
		
		return "redirect:AdminLogin.jsp";
	}
	
	@RequestMapping("/AdminAddTeller")
	public String SuperUserAddTeller(@RequestParam String tid,@RequestParam String tname,@RequestParam String tpno,@RequestParam String tpass,@RequestParam String location_lid,HttpServletResponse res,HttpSession session) {
		

		
		repo.tellerInsert(tid, tname, tpno, tpass, location_lid);
		System.out.println("Insert Success");
		
		 return "redirect:AdminLogin.jsp";
			
	}
	
	@RequestMapping("/AdminLogOut")
	public String AdminLogOut() {
		
		return "redirect:Login.jsp";
	}
	
	@RequestMapping("/showDetails")
	public String showDetails(@RequestParam(value = "tid", required = false) String tid,@RequestParam(value = "date1", required = false) String date1,@RequestParam(value = "date2", required = false) String date2,HttpSession session) {
		
		session.setAttribute("repo", repo);
		session.setAttribute("tid", tid);
        session.setAttribute("date1", date1);
        session.setAttribute("date2", date2);
		session.setAttribute("lid",admins.get(0).getLocation_lid());
		String lid=admins.get(0).getLocation_lid();

		ArrayList<AdminAnalysisDetails> details;
		
		if(tid!=null && date1!=null && date2!=null) {
			
			details=repo.getAdminAnalysisDetails3(lid, tid, date1, date2);
			
		}else if(tid!=null && date1==null && date2==null) {
			
			details=repo.getAdminAnalysisDetails2(lid, tid);
			
		}else if(tid==null && date1!=null && date2!=null){
			
			details=repo.getAdminAnalysisDetails1(lid, date1, date2);
			
		}else {
			
			details=repo.getAdminAnalysisDetails4(lid);
			
		}
		showDetails1=details;
		session.setAttribute("details", details);
		
		return "showDetails.jsp";
	}
	
	@RequestMapping("/showDetails2")
	public String showDetails2(HttpSession session) {
		session.setAttribute("repo", repo);
		session.setAttribute("lid",admins.get(0).getLocation_lid());
		  ArrayList<TellerPerformance> pricelist1=repo.getTellersPerformance(admins.get(0).getLocation_lid());
		  showDetails2=pricelist1;
		return "showDetails2.jsp";
	}
	
	@RequestMapping("/AdminTellerCompleteReport")
	public String AdminTellerCompleteReport(HttpSession session) {
		
		session.setAttribute("allDetails", allDetails);
		
		
		return "AdminTellerCompleteReport.jsp";
	}
	
	@RequestMapping("/ExcelAdminCompleteReport")
	public void ExcelAdminCompleteReport(HttpServletResponse response) throws IOException {
		
		
		  //--------------------------------------------------
		  
		  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy--HH:mm:ss");
		  LocalDateTime now = LocalDateTime.now(); String
		  appendingDate=dtf.format(now); System.out.println();
		  
		  
		  
		  //---------------------------------------------------

		  String stri=admins.get(0).getAname()+" Complete Report "+appendingDate+".xlsx";
		  System.out.println(stri);
		  
		  
		  
		  //------------------------------------------------------
		 
		
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename="+stri);
		
		ByteArrayInputStream inputstream = AdminCompleteReportExcel.exportCustomerListToExcelFile(allDetails);
		
		IOUtils.copy(inputstream, response.getOutputStream());
		
				
	}
	
	@RequestMapping("/update1")
	public String Update1(@RequestParam String new1,@RequestParam String confirm)
	{
		if(new1.equals(confirm)) {
			repo.updatePassword(aaid, new1);
		}
		
		return "Login.jsp";
	}
	

	
	
	@RequestMapping("/AdminTellerReportExcel")
	public void AdminTellerReportExcel(HttpServletResponse response) throws IOException {
		
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		   
	        String stri=admins.get(0).getAname()+" Report "+appendingDate+".xlsx";
			System.out.println(stri);
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename="+stri);
		
		ByteArrayInputStream inputstream= AdminTellerReportExcel.exportCustomerListToExcelFile(complete1);
		
		IOUtils.copy(inputstream, response.getOutputStream());
		

	}
	
	
	@RequestMapping("showDetailsExcel")
	public void showDetailsExcel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=admins.get(0).getAname()+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= showDetailsExcel.exportCustomerListToExcelFile(showDetails1);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	
	@RequestMapping("showDetails2Excel")
	public void showDetails2Excel(HttpServletResponse response) throws IOException {
		
		   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		   LocalDateTime now = LocalDateTime.now();
		   String appendingDate=dtf.format(now);
		   System.out.println();
		
        String stri=admins.get(0).getAname()+" Report"+appendingDate+".xlsx";
		System.out.println(stri);
	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename="+stri);
	
	ByteArrayInputStream inputstream= showDetails2Excel.exportCustomerListToExcelFile(showDetails2);
	
	IOUtils.copy(inputstream, response.getOutputStream());
		
	}
	
	
}
