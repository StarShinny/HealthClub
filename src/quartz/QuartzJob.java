package quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

public class QuartzJob {

	public void work() {
		Date date = new Date();
		SimpleDateFormat formatter =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = formatter.format(date);
		System.out.println(now);		
	}

}
