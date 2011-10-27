package List::Javascriptish;

# ------------------------------------
# List::Javascriptish - Array iterator like JavaScript
# Author Isao Katayama 2010
# This module is just for personal study and part of code are inspired and borrowed from List::Rubyish
# http://search.cpan.org/~yappo/List-Rubyish-0.03/lib/List/Rubyish.pm
# ------------------------------------

use strict;
use warnings;

our $VERSION = '0.01';

use Carp qw/croak/;
use Data::Dumper;

sub new {
	my $class = CORE::shift;
	$class = ref $class if ref $class;
	my $array =  @_ > 0 ? (@_ == 1 && ref($_[0]) eq 'ARRAY') ? CORE::shift : [ @_ ] : [];
	bless $array, $class;
}

sub push {
	my $self = CORE::shift;
	CORE::push @$self, @_;
	$self;
}

sub unshift {
	my $self = CORE::shift;
	CORE::unshift @$self, @_;
	$self;
}

sub shift {
	CORE::shift @{$_[0]};
}

sub pop {
	CORE::pop @{$_[0]};
}

sub length {
	scalar @{$_[0]};
}

sub concat {
	my ($self, $array) = @_;
	$self->push(@$array);
	$self;
}

sub join {
	my ($self, $delimiter) = @_;
	join $delimiter, @$self;
}

sub reverse {
	my $self = CORE::shift;
	@$self = CORE::reverse @$self;
}

sub slice {
	my $self = CORE::shift;
	my ($start, $end) = @_;
	my $last = $#{$self};
	if (defined $end) {
		if ($start == 0 && $last <= $end) {
			return $self;
		} else {
			$end = $last if $last < $end;
			return $self->new([ @$self[ $start .. $end ] ]);
		}
	} elsif (defined $start && 0 < $start && $last <= $start) {
		return $self->new([]);
	} else {
		return $self;
	}
}

sub sort {
	my ($self, $code) = @_;
	@$self = $code ? CORE::sort { $code->($a, $b) } @$self : CORE::sort @$self;
}

sub splice {
	my $self = CORE::shift;
	my $start = CORE::shift;
	my $count = CORE::shift;
	my @insert = @_;

	return $self unless defined $start;
	
	unless (defined $count) {
		@$self = @$self[ 0 .. $start-1 ];
	}
	else {
		my $last = $#{$self};
		my @ret = ();
		@ret = @$self[ 0 .. $start-1 ];
		CORE::push @ret, @$self[ $start + $count .. $last ];
		@$self = @ret;
	}
	
	if ( @insert ) {
		my $last = $#{$self};
		my @ret = ();
		@ret = @$self[ 0 .. $start-1 ];
		CORE::push @ret, @insert;
		CORE::push @ret, @$self[ $start .. $last ];
		@$self = @ret;
	}
	return $self;
}

sub toString {
	my $self = CORE::shift;
	my @unblessed = @{$self};
	Data::Dumper->new([ \@unblessed ])->Purity(1)->Terse(1)->Dump;
}

1;

__END__
