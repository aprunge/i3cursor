use Term::TermKey;
use X11::GUITest qw(MoveMouseAbs);
use X11::GUITest qw(GetMousePos);

my ($screen_with, $screen_height) = (1920, 1080);
my ($x, $y) = GetMousePos();

my $tk = Term::TermKey->new( \*STDIN );

for(;;) {

  $tk->waitkey( my $key );

  if($tk->format_key( $key, 0 ) eq "Left") {
    $x = $x - 5;
    $y = $y;
    MoveMouseAbs($x, $y);
  }elsif($tk->format_key( $key, 0 ) eq "Right") {
    $x = $x + 5;
    $y = $y;
    MoveMouseAbs($x, $y);
  } elsif($tk->format_key( $key, 0 ) eq "Up") {
    $x = $x;
    $y = $y - 5;
    MoveMouseAbs($x, $y);
  } elsif($tk->format_key( $key, 0 ) eq "Down") {
    $x = $x;
    $y = $y + 5;
    MoveMouseAbs($x, $y);
  }
}

print "You pressed: " . $tk->format_key( $key, 0 );


