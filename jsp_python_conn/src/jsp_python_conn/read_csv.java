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
				
				
				//System.out.println(token); //csv���� ������ ,������ ���� �ּҰ� [Ljava.lang.String;@15db9742
				for(String output : token) { //token�迭�� ����ִ� ������ �ϳ��� output�� ����
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
