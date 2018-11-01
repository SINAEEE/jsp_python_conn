package jsp_python_conn;

import java.util.*;
import java.util.ArrayList;

public class prac01 {
	
	public static void main(String[] args) {
		
		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.DATE,0);
		
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.MONTH)+1);
		System.out.println(cal.get(Calendar.DAY_OF_MONTH));
		
		Date date = cal.getTime();
		System.out.println(date.toString());
		
		
		/*
		//ㅣist 
		ArrayList pitches = new ArrayList();
		pitches.add("138");
		pitches.add("129");
		pitches.add("142");
		
		System.out.println(pitches);
		
		pitches.add(0,"149");
		System.out.println(pitches);
		System.out.println(pitches.get(1));
		System.out.println(pitches.size());
		System.out.println(pitches.contains("138"));
		System.out.println(pitches.remove("149"));
		System.out.println(pitches);
		*/
		
		
		
		/*
		// 배열
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
		*/
		
	}

}
