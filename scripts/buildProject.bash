set -a

SCRIPT_PATH=$(pwd)
# Get project and package name from user
read -p "Enter project name: " PROJECT_NAME
read -p "Enter package name: " PACKAGE_NAME

PROJECT_ROOT="$(pwd)/$PROJECT_NAME"

# Make basic directory structure for application
printf "Creating directories..."
mkdir -p "$PROJECT_NAME/app/src" "$PROJECT_NAME/app/src/main" "$PROJECT_NAME/app/libs" "$PROJECT_NAME/app/build"
cd "$PROJECT_NAME/app/src/main"
mkdir -p "java" "res" "assets/fonts"

# Direcroy structure for java files
PACKAGE_PATH_NAME=$(echo "$PACKAGE_NAME" | tr . /)
mkdir -p "java/$PACKAGE_PATH_NAME"
cd "java/$PACKAGE_PATH_NAME"
mkdir "activities" "broadcasts" "services" "utils"

# Directory structure for resource files
cd "$PROJECT_ROOT/app/src/main/res"
mkdir "anim" "drawable" "drawable-mdpi" "drawable-hdpi" "drawable-xhdpi" "drawable-xxhdpi" "mipmap-mdpi" "mipmap-hdpi" "mipmap-xhdpi" "mipmap-xxhdpi" "layout" "values" "xml"
echo "	Done"

# Create files for application through another scripts
printf "Creating files..."
bash "$SCRIPT_PATH/writeFiles.bash"
echo "	Done"
