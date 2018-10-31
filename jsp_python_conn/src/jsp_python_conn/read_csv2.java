package jsp_python_conn;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class read_csv2{
	
	public static void main (String[] args) {
		
		//��ȯ�� ����Ʈ
		List<List<String>> ret = new ArrayList<List<String>>();
		BufferedReader br = null;
		
		try {
			br = Files.newBufferedReader(Paths.get("src\\final.csv"));
			//�����ּ� C:\\Users\\Bit\\eclipse-workspace\\jsp_python_conn\\final.csv
			Charset.forName("UTF-8");
			String line = "";
			
			while((line = br.readLine()) != null) {
				//csv 1���� �����ϴ� ����Ʈ
				List<String> tmpList = new ArrayList<String>();
				String array[] = line.split(",");
				//�迭���� ����Ʈ ��ȯ
				tmpList = Arrays.asList(array);
				//System.out.println(tmpList);
				ret.add(tmpList);
			}
			
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(br != null) {
					br.close();
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(ret);
		
		
	}
}