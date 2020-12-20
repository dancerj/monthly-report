package jp.gr.netfort.dancer.hebutton;

// import resources
import jp.gr.netfort.dancer.hebutton.R;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;
import android.os.CountDownTimer;

public class HeButton extends Activity {
    private MediaPlayer media_player;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        media_player = MediaPlayer.create(this, R.raw.hakushu);

        final ImageButton button = (ImageButton) findViewById(R.id.ImageButton01);
        button.setOnClickListener(new OnClickListener() {
        	public void onClick(View v) {
        		// Perform action on clicks
        		final ImageButton my_button = (ImageButton) findViewById(R.id.ImageButton01);
        		my_button.setImageResource(R.drawable.he_down);
        		// play music
        		media_player.start();
        		// add a callback to put back button to original shape after a second
        		new CountDownTimer(1000, 1000) {
        			public void onTick(long mRemain) {
        			}
        			public void onFinish() {
        				final ImageButton my_button = (ImageButton) findViewById(R.id.ImageButton01);
        				my_button.setImageResource(R.drawable.he_up);
        			}
        		}.start();
        	}
        });
    }
}