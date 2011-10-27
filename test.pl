#!/usr/bin/perl

use strict;
use warnings;
use 5.010000;

use feature 'say';

use Carp qw/croak/;
use Data::Dumper;
use List::Javascriptish;

my $array = List::Javascriptish->new([1,2,3,4]);

$array->push(5,6);
say $array->toString; # 1,2,3,4,5,6

$array->splice(2,2,7,8);
say $array->toString; # 1,2,7,8,5,6

$array->shift;
say $array->toString; # 2,7,8,5,6

$array->pop;
say $array->toString; # 2,7,8,5

$array->reverse;
say $array->toString; # 5,8,7,2

$array->unshift(9);
say $array->toString; # 9,5,8,7,2

$array->sort;
say $array->toString; # 2,5,7,8,9
