package jp.gr.netfort.dancer;

import android.app.Activity;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.widget.ImageButton;
import android.widget.TextView;
import java.io.*;

public class TopView extends Activity {

	/** Called in timer intervals, to output the result of 'top' 
	 * command and repaint the text field. */
	private void redrawRoutine(TextView tv) {
		String [] command = { "top", "-n", "1"};
		String output = "";
		
		Runtime runtime = Runtime.getRuntime();
		Process process = null;
		try { 
			process = runtime.exec(command);
		} catch (Exception exception){
			System.exit(1);
		}
		BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line;
		try {
			while((line = reader.readLine()) != null) {
				if (line.length() > 0) {
					output = output + line + "\n";
				}
			}
		} catch (Exception exception) {
			System.exit(1);
		} finally {
			try {
				reader.close();
			} catch (Exception exception) {
				System.exit(1);
			}
		}
		tv.setText(output);
	}

	private TextView tv_;
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		tv_ = new TextView(this);
		redrawRoutine(tv_);
		setContentView(tv_);

		/* try to make a countdown timer for next 100 seconds, with 5 sec interval */
		new CountDownTimer(100000, 5000) {
			public void onTick(long mRemain) {
				redrawRoutine(tv_);
			}
			public void onFinish() {
			}
		}.start();
	}
}