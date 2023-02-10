use Term::TermKey;
use X11::GUITest qw(MoveMouseAbs);
use X11::GUITest qw(GetMousePos);

my ($screen_with, $screen_height, $speed) = @ARGV;
my ($x, $y) = GetMousePos();

my $tk = Term::TermKey->new( \*STDIN );

for(;;) {

  $tk->waitkey( my $key );

  if($tk->format_key( $key, 0 ) eq "Left") {
    $x = $x - $speed;
    $y = $y;
    MoveMouseAbs($x, $y);
  }elsif($tk->format_key( $key, 0 ) eq "Right") {
    $x = $x + $speed;
    $y = $y;
    MoveMouseAbs($x, $y);
  } elsif($tk->format_key( $key, 0 ) eq "Up") {
    $x = $x;
    $y = $y - $speed;
    MoveMouseAbs($x, $y);
  } elsif($tk->format_key( $key, 0 ) eq "Down") {
    $x = $x;
    $y = $y + $speed;
    MoveMouseAbs($x, $y);
  }
}

print "You pressed: " . $tk->format_key( $key, 0 );
