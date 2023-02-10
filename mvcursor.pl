use Term::TermKey;
use X11::GUITest qw(MoveMouseAbs);
use X11::GUITest qw(GetMousePos);

my ($screen_with, $screen_height) = @ARGV;
my ($x, $y) = GetMousePos();
my $speed_y = 0;
my $speed_x = 0;
my $angle = 0;
my $tk = Term::TermKey->new( \*STDIN );

while(1) {

  $tk->waitkey( my $key );
  
  if($tk->format_key( $key, 0 ) eq "Up") {
    $speed_y = $speed_y - 1;
  }

  if($tk->format_key( $key, 0 ) eq "Down" && $speed_y != 0) {
    $speed_y = $speed_y + 1;
  }

  if($tk->format_key( $key, 0 ) eq "Left") {
    #$x = $x - $speed_x;
    #$y = $y;
    #MoveMouseAbs($x, $y);
    $speed_x = $speed_x - 10;
  }

  if($tk->format_key( $key, 0 ) eq "Right") {
    #$x = $x + $speed_x;
    #$y = $y;
    #MoveMouseAbs($x, $y);
    $speed_x = $speed_x + 10;
  }

  # Limit the ship's velocity to the maximum velocity
  $vx = $max_velocity if abs($vx) > $max_velocity;
  $vy = $max_velocity if abs($vy) > $max_velocity;


  if($tk->format_key( $key, 0 ) eq "Up") {
    $x = $x + $speed_x;
    $y = $y + $speed_y;
    MoveMouseAbs($x, $y);
  } 
}

print "You pressed: " . $tk->format_key( $key, 0 );
