
	use strict;
	use warnings;
	use Encode;
	use Data::Dumper;

	my %hash1 = ( aaa=> 1111, bbb=> 2222, ccc=> 3333, );
	my %hash2 = ( bbb=> 4444, );
	my %hash3 = ( eee=> 'eeee', );

	my %addhash1= &myHasuAdd(\%hash1, \%hash2);
	my %addhash2= &myHasuAdd(\%addhash1, \%hash3);

	print Dumper \%addhash2;

sub myHasuAdd
{
	my %org = %{$_[0]};
	my %add = %{$_[1]};
	foreach my $key(keys(%add))
	{
		if( $org{$key} eq "" )
		{
			$org{$key} = $add{$key};
		}else{
			if( ref($org{$key}) eq 'ARRAY')
			{
				push(@{$org{$key}},$add{$key});
			}else{
				my @list;
				push(@list,$org{$key});
				push(@list,$add{$key});
				$org{$key} = \@list;
			}
		}
	}
	return %org;
}

0;
