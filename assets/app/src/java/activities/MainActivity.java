package $PACKAGE_NAME.activities;

import android.app.Activity;
import android.os.Bundle;

import $PACKAGE_NAME.R;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
