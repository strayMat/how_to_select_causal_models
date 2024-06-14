# Check if exactly three arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 old_string new_string"
    exit 1
fi

# Assign arguments to variables
OLD_STRING=$1
NEW_STRING=$2

# Replace string in how_to_select.tex
sed -i "s/$OLD_STRING/$NEW_STRING/g" ../how_to_select.tex

# Check if the file exists in the images folder
if [ -f "$OLD_STRING" ]; then
    # Rename the file in the images folder
    mv "$OLD_STRING" "$NEW_STRING"
    echo "Renamed $OLD_STRING to $NEW_STRING"
else
    echo "File $OLD_STRING does not exist."
fi

echo "String replacement in how_to_select.tex complete."