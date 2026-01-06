function rot13 --description "Apply ROT13 encoding to text"
    tr "a-zA-Z" "n-za-mN-ZA-M" $argv
end