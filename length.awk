function data_match(a,u,  a_data)
{
  if(u == "miles" || u == "mile")  j = 1
	else if(u == "yards" || u == "yard") j= 2
	else if(u == "inches" || u == "inch") j = 3	
	else if(u == "feet" || u == "foot") j = 4
	else if(u == "faths" || u == "fath") j = 5
	else if(u == "furlong") j = 6

	a_data = a * m[j]		

	return a_data
}

function data_ch(data_in, data_out)
{
	data_out = int(data_in * 100)
	data_in  = int(data_in * 1000)
	data_in  = data_in % 10
	if(data_in > 4)
		data_out = data_out + 1

	data_out = data_out / 100
	
	return data_out
}




BEGIN {
	print "zeagle219@163.com\n"
	
}
{
	i = FNR
	num = NF

	if( i < 7 )
	{		
		unit[i] = $2
		m[i] = $4
	}
	else if( i > 7 )
	{
		if( num == 2 )
		{
			j=i-7
			data = m[j] * $1
			data = data_ch(data)
			print data " m"
		}
		if( num == 5 )
		{
			data1 = data_match($1,$2)					
			data2 = data_match($4,$5)
			if( $3 == "+" )
				data = data1 + data2
			else
				data = data1 - data2
			
			data = data_ch(data)
			print data " m"
  		}
		if( num == 8 )
		{			
			data1 = data_match($1,$2)					
			data2 = data_match($4,$5)
			data3 = data_match($7,$8)	
		
			if( $3 == "+" )
			{
				if( $6 == "+")
					data = data1 + data2 + data3
				else
					data = data1 + data2 - data3
			}
			if( $3 == "-")				
			{
				if( $6 == "+")
					data = data1 - data2 + data3
				else
					data = data1 - data2 - data3
			}
			data = data_ch(data)
			print data " m"
		}

	}

}




