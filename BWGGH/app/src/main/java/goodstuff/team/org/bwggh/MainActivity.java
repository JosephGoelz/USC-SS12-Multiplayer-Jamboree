package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.*;

    public class MainActivity extends Activity {

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);
        }

        public void gotoActivity(View v) {
            Intent intent = new Intent(this, LevelActivity.class);
            startActivity(intent);
        }

    }
