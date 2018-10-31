package jsp_python_conn;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.*;

public class read_csv {
	
	public static void main(String[] args) {
		try {
			File csv = new File("final.csv");
					
			BufferedReader br = new BufferedReader(new FileReader(csv));
			
			String line="";
			

			while ((line = br.readLine()) != null) {
				String[] token = line.split(",",-1); 
				
				
				//System.out.println(token); //csv파일 내용을 ,단위로 나눈 주소값 [Ljava.lang.String;@15db9742
				for(String output : token) { //token배열에 들어있는 값들을 하나씩 output에 대입
					System.out.println(output);	
			}
				
		}br.close();
			
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
