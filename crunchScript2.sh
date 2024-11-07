
input_file=hasla.txt
output_file=${input_file%.*}_sha1.txt

while IFS= read -r password
do
    hash=$(echo -n "$password" | openssl dgst -sha1 | awk '{print $2}')
        echo "$hash" >> "$output_file"
done < "$input_file"

echo "Skróty SHA-3 zostały zapisane w pliku $output_file"
