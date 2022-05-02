<%@page import="java.util.*, java.io.*" %>
<%@ page language="java" %>

<%!
	public boolean checkDuplicate(String userName, String email, String strPath) throws IOException{
		
			boolean duplicate = false;
			BufferedReader reader = new BufferedReader(new FileReader(strPath));
			String record = null;
			while((record = reader.readLine()) != null){
				String[] dataList = record.split(",");
				
				if( userName.equals(dataList[0]) || email.equals(dataList[1]) ){
					duplicate = true;
					break;
				}else{
					duplicate = false;
				}
			}
			
			reader.close();
			reader = null;
			return duplicate;
	}
%>

