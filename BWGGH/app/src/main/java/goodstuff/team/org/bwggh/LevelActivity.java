package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

/**
 * Created by Justine Foote on 1/25/2015.
 */
public class LevelActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_level);
    }

    public void gotoLevelOne(View v) {
        Intent intent = new Intent(this, LevelOneActivity.class);
        startActivity(intent);
    }

    public void gotoLevelTwo(View v) {
        Intent intent = new Intent(this, LevelTwoActivity.class);
        startActivity(intent);
    }
    public void gotoLevelThree(View v) {
        Intent intent = new Intent(this, LevelThreeActivity.class);
        startActivity(intent);
    }

  }
