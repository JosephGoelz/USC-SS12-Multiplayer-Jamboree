package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.widget.TextView;

/**
 * Created by justine on 1/25/2015.
 */
public class LevelCountActivity extends Activity{
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_level_count);
         //   Gonna do something about a countdown right here
            CountDownTimer count = new CountDownTimer(4000, 1000) {
                @Override
                public void onTick(long l) {
                TextView t = (TextView) findViewById(R.id.timer);
                    t.setText(l/1000+ " ");
                }

                @Override
                public void onFinish() {
                    finish();
                }
            }.start();
        }

}
