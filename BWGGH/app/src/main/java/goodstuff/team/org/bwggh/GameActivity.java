package goodstuff.team.org.bwggh;

import android.app.Activity;
import android.os.Bundle;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import java.util.Random;

/**
 * Created by justine on 1/25/2015.
 */
public class GameActivity extends Activity implements OnGestureListener  {
    private GestureDetector gDetector;
    private int expected;
    /*
    swipe up = 0
     swipe left = 1
     swipe right = 2
     swipe down= 3
     pass & tap = 4
     tap = 5
     shake = 6
     */
    private void isValid(int random){
        LinearLayout layout = (LinearLayout)findViewById(R.id.background);
        if (random == expected || expected == 5 && random == 4) {
            Random rand = new Random();
            expected = rand.nextInt((6-0)+1)+0;
            if (expected == 0) {
                layout.setBackgroundResource(R.drawable.swipe_up);
            }
            else if (expected == 1) {
                layout.setBackgroundResource(R.drawable.swipe_left);
            }
            else if (expected == 2) {
                layout.setBackgroundResource(R.drawable.swipe_right);

            }
            else if (expected == 3) {
                layout.setBackgroundResource(R.drawable.swipe_down);
            }
            else if (expected == 4) {
                layout.setBackgroundResource(R.drawable.hand_it);
            }
            else if (expected == 5) {
                layout.setBackgroundResource(R.drawable.tap_screen);
            }
            else if (expected == 6) {
                layout.setBackgroundResource(R.drawable.shake_screen);
            }
            // possible log message
        }
        else {
            layout.setBackgroundResource(R.drawable.losing_screen);
        }
    }
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game);
        gDetector = new GestureDetector(this);
        expected = 0;
        LinearLayout layout = (LinearLayout)findViewById(R.id.background);
        layout.setBackgroundResource(R.drawable.swipe_up);
        // create a random screen here
        // create an array of actions and pick the first one here
    }
@Override
    public boolean onDown (MotionEvent arg0) {
    return false;
}

    @Override
    public void onShowPress(MotionEvent motionEvent) {

    }
    @Override
    public boolean onTouchEvent(MotionEvent me){
        return gDetector.onTouchEvent(me);
    }
    @Override
    public boolean onSingleTapUp(MotionEvent motionEvent) {
        isValid(4);
        return true;
    }

    @Override
    public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float v, float v2) {
        return false;
    }

    @Override
    public void onLongPress(MotionEvent motionEvent) {

    }

    @Override
    public boolean onFling(MotionEvent start, MotionEvent finish, float xVelocity, float yVelocity){
        if (start.getRawY() < finish.getRawY()){
            // check to make sure it was the flick down
            // then change the background
            isValid(3);
        }
        else if (start.getRawY() > finish.getRawY()) {
            //check it make sure it was the other one
            // then change the background
            isValid(0);
        }
        else if (start.getRawX() < finish.getRawX()) {
            isValid(2);
        }
        else {
            isValid(1);
        }
        return true;
    }


}


