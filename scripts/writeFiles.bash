ASSETS="$SCRIPT_PATH/../assets"

# Copy Gradle files
cd $ASSETS
cp -r 'build.gradle' 'gradle' 'gradle.properties' 'gradlew' 'gradlew.bat' 'settings.gradle' "$PROJECT_ROOT"
cp 'app/build.gradle' "$PROJECT_ROOT/app"

# Creating java files
# Write MainActivity java file
cd "$PROJECT_ROOT/app/src/main/java/$PACKAGE_PATH_NAME/activities"
envsubst < "$ASSETS/app/src/java/activities/MainActivity.java" > MainActivity.java

# Write BaseApplication java file
cd ..
envsubst < "$ASSETS/app/src/java/BaseApplication.java" > BaseApplication.java

# Write java files in utils package
cd "utils"
envsubst < "$ASSETS/app/src/java/utils/AppConstants.java" > AppConstants.java

# Creating resource files
# Layouts
cd "$PROJECT_ROOT/app/src/main/res/layout"
envsubst < "$ASSETS/app/src/res/layout/activity_main.xml" > activity_main.xml
# Values
cd ../values
envsubst < "$ASSETS/app/src/res/values/strings.xml" > strings.xml
envsubst < "$ASSETS/app/src/res/values/do_not_translate.xml" > do_not_translate.xml
envsubst < "$ASSETS/app/src/res/values/colors.xml" > colors.xml
envsubst < "$ASSETS/app/src/res/values/styles.xml" > styles.xml
# Copy laucher icon
cd ..
cp -r "$ASSETS/app/src/res/mipmap"* .
# AndroidManifest.xml
cd ..
envsubst < "$ASSETS/app/src/AndroidManifest.xml" > AndroidManifest.xml
