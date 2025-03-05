#!/bin/bash

# Path to APKEditor (update this to your APKEditor path)
APKEDITOR_PATH="APKEditor.jar"

# Function to display usage instructions
usage() {
  echo "Usage: $0 [command]"
  echo "Commands:"
  echo "  1) Decompile APK"
  echo "  2) Build APK"
  echo "  3) Merge APKs"
  echo "  4) Refactor APK"
  echo "  5) Protect APK"
  echo "  6) Get APK Info"
  exit 1
}

# Check if APKEditor exists
if [ ! -f "$APKEDITOR_PATH" ]; then
  echo "Error: APKEditor not found at $APKEDITOR_PATH. Please download it from https://github.com/REAndroid/APKEditor."
  exit 1
fi

# Prompt user for command
echo "Select a command:"
echo "1) Decompile APK"
echo "2) Build APK"
echo "3) Merge APKs"
echo "4) Refactor APK"
echo "5) Protect APK"
echo "6) Get APK Info"
read -p "Enter command number (1-6): " COMMAND

# Execute the selected command
case $COMMAND in
  1)
    # Decompile APK
    read -p "Enter input APK file: " INPUT_APK
    read -p "Enter output directory: " OUTPUT_DIR
    echo "Decompiling $INPUT_APK..."
    java -jar "$APKEDITOR_PATH" d -i "$INPUT_APK" -o "$OUTPUT_DIR"
    ;;
  2)
    # Build APK
    read -p "Enter input directory: " INPUT_DIR
    read -p "Enter output APK file: " OUTPUT_APK
    echo "Building $OUTPUT_APK..."
    java -jar "$APKEDITOR_PATH" b -i "$INPUT_DIR" -o "$OUTPUT_APK"
    ;;
  3)
    # Merge APKs
    read -p "Enter directory containing APK files: " INPUT_DIR
    read -p "Enter output APK file: " OUTPUT_APK
    echo "Merging APKs in $INPUT_DIR..."
    java -jar "$APKEDITOR_PATH" m -i "$INPUT_DIR" -o "$OUTPUT_APK"
    ;;
  4)
    # Refactor APK
    read -p "Enter input APK file: " INPUT_APK
    echo "Refactoring $INPUT_APK..."
    java -jar "$APKEDITOR_PATH" x -i "$INPUT_APK"
    ;;
  5)
    # Protect APK
    read -p "Enter input APK file: " INPUT_APK
    echo "Protecting $INPUT_APK..."
    java -jar "$APKEDITOR_PATH" p -i "$INPUT_APK"
    ;;
  6)
    # Get APK Info
    read -p "Enter input APK file: " INPUT_APK
    echo "Getting info for $INPUT_APK..."
    java -jar "$APKEDITOR_PATH" info -v -resources -i "$INPUT_APK"
    ;;
  *)
    echo "Invalid command number. Please try again."
    usage
    ;;
esac

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Command completed successfully!"
else
  echo "Error: Command failed."
  exit 1
fi
