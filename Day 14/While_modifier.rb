# Program for While Modifier

=begin
  while modifier syntax:
    begin
      Code
    end while condition
=end

$i = 0
$num = 5

begin
  puts ("We are inside the loop with $i value = #$i");
  $i += 1
end while $i < $num