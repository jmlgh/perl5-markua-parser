use strict;
use warnings;

use Test::More;
use JSON::MaybeXS qw(decode_json);
use Path::Tiny qw(path);

use Markua::Parser;

plan tests => 2;

my $m = Markua::Parser->new;
isa_ok $m, 'Markua::Parser';

my $result = $m->parse_file('t/input/simple.md');
is_deeply $result, decode_json(path('t/dom/simple.json')->slurp_utf8);
