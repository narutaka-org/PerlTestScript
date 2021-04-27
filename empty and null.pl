	sub defex
	{
		if (defined $_[0])
		{
			if( $_[0] ne "" )
			{
				return 1;
			}
		}
		return 0;
	}