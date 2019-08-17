package com.SLJMH.dao.impl;



import java.io.File;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.FileDao;
import com.SLJMH.entity.Files;



public class FileDaoImpl extends BaseDaoImpl<Files> implements FileDao{

	@Override
	public Files deleteById(Integer id) {
		// TODO Auto-generated method stub
		 List<Files> fList=getHibernateTemplate().find("from  Files where fileId="+id);
		 if(fList.size()>0){
			 return    fList.get(0);
		 }else{
			 return new Files();
		 }
		
	}

	@Override
	public void deleteFile(String Path, String fileUuuName) {
		// TODO Auto-generated method stub
		File file=new File(Path);
		File[] flist = file.listFiles();
		if(flist==null){
			file.delete();
		}else{
			   for (File f : flist) {
				 if (f.isDirectory()) {
			        	//        
			      } else {
			          if(fileUuuName.equals(f.getName())){
			        	  f.delete();	
			           break;
			          }
			      }
			      } 
		}
		
			
		
		
		
		}
		
		
	
	
	
	
	
	
	
		 
	}
	


	
