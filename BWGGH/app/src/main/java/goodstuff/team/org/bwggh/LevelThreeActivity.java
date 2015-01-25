package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.widget.TextView;

/**
 * Created by justine on 1/25/2015.
 */
public class LevelThreeActivity extends Activity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent countDown = new Intent(this, LevelCountActivity.class);
        startActivity(countDown);
        setContentView(R.layout.activity_level_three);
        final Intent intent = new Intent(this, GameActivity.class);
        CountDownTimer count = new CountDownTimer(4000, 1000) {
            @Override
            public void onTick(long l) {
            }

            @Override
            public void onFinish() {
                startActivity(intent);
            }
        }.start();
    }
}
