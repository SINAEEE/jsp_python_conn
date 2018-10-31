package jsp_python_conn;

public class prac01 {
	
	public static void main(String[] args) {
		System.out.println("test");
		
		int[] odds = {1,3,5,7,9};
		
 
		for (int i=0; i<odds.length; i++) {
			System.out.println(odds[i]);
		}
		
		String[] weeks = new String[7];
		weeks[0] = "월";
		weeks[1] = "화";
		weeks[2] = "수";
		weeks[3] = "목";
		weeks[4] = "금";
		weeks[5] = "토";
		weeks[6] = "일";
		
		int j=0;
		for (int i=0; i<weeks.length; i++) {
			System.out.println(weeks[i]);
			
			if(weeks[i] == "월") {
				j = j+1;
			}
		}
		System.out.println(j);
	}

}
