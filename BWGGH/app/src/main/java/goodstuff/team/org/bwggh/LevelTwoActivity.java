package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;

/**
 * Created by justine on 1/25/2015.
 */
public class LevelTwoActivity extends Activity{
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent countDown = new Intent(this,LevelCountActivity.class);
        startActivity(countDown);
        setContentView(R.layout.activity_level_two);
        final Intent intent = new Intent(this, GameActivity.class);
        CountDownTimer count = new CountDownTimer(8000, 1000) {
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
