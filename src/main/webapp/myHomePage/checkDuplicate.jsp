<%@page import="java.util.*, java.io.*" %>
<%@ page language="java" %>

<%!
	public boolean checkDuplicate(String userName, String email, String strPath) throws IOException{
		
			boolean duplicate = false;
			BufferedReader reader = new BufferedReader(new FileReader(strPath));
			String record = null;
			while((record = reader.readLine()) != null){
				String[] dataList = record.split(",");
				// the user information is stored in the form of line and separated each field by comma
				// dataList[0] is userName
				// dataList[1] is email
				// dataList[2] is password
		
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

