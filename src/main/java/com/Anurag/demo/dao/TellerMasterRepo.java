package com.Anurag.demo.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.Anurag.demo.dto.Teller2Response;
import com.Anurag.demo.dto.TellerDetails;

@Repository
public class TellerMasterRepo {
	 @PersistenceContext
	    private EntityManager entityManager;

	    
		/*-------------------------------------------------------*/
	    
		  @Transactional
		  public void customerInsert(String cname,String cpno,String teller_tid) {
			    
		      entityManager.createNativeQuery("insert into customer_master (cname,cpno,teller_tid,date) values (?, ?, ? ,date(current_timestamp))")
		        .setParameter(1, cname)
		        .setParameter(2,cpno)
		        .setParameter(3,teller_tid)
		        .executeUpdate();
		  }
		  
		  
		  @Transactional
		  public void TransactionInsert(String paymentmode, String transactionid, int cid) {
		      entityManager.createNativeQuery("insert into transaction_master (paymentmode,transactionid,customer123_cid) values(?,?,?)")
		        .setParameter(1, paymentmode)
		        .setParameter(2,transactionid)
		        .setParameter(3,cid)
		        .executeUpdate();
		  }
			/*-----------------------------------------------------------*/
		  
		  @Transactional
		  public int getCid() {
			  
			 Query query= entityManager.createNativeQuery("SELECT cid FROM customer_master ORDER BY cid DESC").setMaxResults(1);
		     int result = 0;
		     
		     try {
		     
		    System.out.println("result is "+query.getResultList().get(0));
		    result= (int) query.getResultList().get(0);
		     
		     }catch(Exception e) {
		    	 System.out.println("Exception occured");
		     }
			  
			  return result;
			  
		  }
		  
		  /*-----------------------------------------------------------*/
		  
		  @Transactional
		  public void historyInsert(String job_jobid,int customer_cid,int discount,int gst) {
			    
		      entityManager.createNativeQuery("insert into history_master (job_jobid,customer_cid,discount,gst) values (?, ?, ?, ?)")
		        .setParameter(1, job_jobid)
		        .setParameter(2,customer_cid)
		        .setParameter(3, discount)
		        .setParameter(4, gst)
		        .executeUpdate();
		  }
		  
		  public String getJobName(String jobid) {
			  
			  Query query= entityManager.createNativeQuery("SELECT jobname from job_price where jobid=?")
					  .setParameter(1,jobid);
			  
			 
			 String result=(String) query.getResultList().get(0);
			 
			  
			  return result;		  
			  
		  }
		  

		  
		  public int getJobPrice(String jobid) {
			  
			  Query query= entityManager.createNativeQuery("SELECT jobprice from job_price where jobid=?")
					  .setParameter(1,jobid);
			  
			 
			 int result=(int) query.getResultList().get(0);
			  System.out.println( );
			  
			  return result;
					  
		  }
		  
		  
		  
		  	 
		  
			/*------------------------------------------------------------------------------------------*/
			
			public ArrayList<Teller2Response> getTeller2(String tid, String date1, String date2) {
				System.out.println("first");
				List<Object[]> results = this.entityManager.createNativeQuery(
						"select c.cid, cast(array_to_string(array_agg(distinct c.cname),',') as varchar) cname,"
						+ " cast(array_to_string(array_agg(distinct c.cpno),',') as varchar) cpno ,array_to_string(array_agg( j.jobname),',')"
						+ " jobname,cast(sum(j.jobprice) as varchar) jobprice,  cast(array_to_string(array_agg(distinct t.paymentmode),',') as varchar) PaymentMode, cast(array_to_string(array_agg(distinct h.discount),',') as varchar) discount,cast(array_to_string(array_agg(distinct h.gst),',') as varchar) gst, "
						+ "cast(round((sum(j.jobprice)-((sum(j.jobprice)*cast(array_to_string(array_agg(distinct h.discount),',') as integer))/100))+(((sum(j.jobprice)-((sum(j.jobprice)*cast(array_to_string(array_agg(distinct h.discount),',') as integer))/100))*cast(array_to_string(array_agg(distinct h.gst),',') as integer))/100)) as varchar) as amount, cast(array_to_string(array_agg(distinct c.date),',') as date) date from customer_master c inner join history_master h on c.cid = h.customer_cid inner join job_price j on h.job_jobid = j.jobid inner join transaction_master t on c.cid=t.customer123_cid   where c.teller_tid=? and c.date between ? and  ? group by c.cid ;")
						.setParameter(1, tid)
						.setParameter(2, java.sql.Date.valueOf(date1)).setParameter(3, java.sql.Date.valueOf(date2)).getResultList();
				System.out.println(results);
				
				  ArrayList<Teller2Response> responses = new ArrayList<Teller2Response>();
				  
				  results.stream().forEach((record)->{ 
				int cid=(int)record[0]; 
				String cname=(String)record[1];
				String cpno=(String)record[2];
				String jobname=(String)record[3]; 
				String jobprice=(String)record[4];
				String PaymentMode=(String)record[5];
				String discount=(String)record[6]; 
				String gst=(String)record[7];
				String amount=(String)record[8]; 
				Date date=(Date)record[9];
				responses.add(new Teller2Response(cid,cname,cpno,jobname,jobprice,PaymentMode,discount,gst,amount,date));
				  });
				  System.out.println("second");
				 
				return responses;
			}
		     
		     public ArrayList<TellerDetails> getTellerDetails(String tid) {
		    	 
			     	List<Object[]> results= this.entityManager.createNativeQuery("select tid, tname, tpno, tpass, location_lid from teller_master where tid=?")
		                     .setParameter(1,tid)
		                     .getResultList();
		    	 
			      	ArrayList<TellerDetails> responses = new ArrayList<TellerDetails>();
			      	
			     	results.stream().forEach((record)->{
			     		String tellerid=(String)record[0];
			     		String tname=(String)record[1];
			     		String tpno=(String)record[2];
			     		String tpass=(String)record[3];
			     		String location_lid=(String)record[4];
			     		responses.add(new TellerDetails(tellerid,tname,tpno,tpass,location_lid));
			     	});
			     	
		    	 return responses;
		     }
		     
		     @Transactional
		     public void updatePassword(String tid,String tpass) {
		    	 
		    	 entityManager.createNativeQuery("update teller_master set tpass=? where tid=?")
			        .setParameter(1, tpass)
			        .setParameter(2,tid)
			        .executeUpdate();
		     }
		     
		     
		     public Date getDate() {	 
				 Query query= entityManager.createNativeQuery("select date(current_timestamp) from dual").setMaxResults(1);
				 Date result=(Date) query.getResultList().get(0);
		    	 return result;
		     }
}
