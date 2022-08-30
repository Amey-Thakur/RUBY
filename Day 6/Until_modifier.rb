# Program for Until Modifier

=begin
  until modifier syntax:
    begin
      Code
    end until condition
=end

$i = 0
$num = 5

begin
  puts ("Inside the loop $i = #$i");
  $i += 1
end until $i > $num