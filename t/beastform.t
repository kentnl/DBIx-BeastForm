use strict;
use warnings;
use Test::More;
use BeastForm;

ok( scalar BeastForm->find_drivers, "There is at least one DBD installed" );
TODO: {
  local $TODO = "Write more tests";
  fail("Haven't written tests");
}
done_testing;