## devuelve la suma de dos dados
tirada <- function() {
	dado1 = sample(1:6, 1)
	dado2 = sample(1:6, 1)
	return(dado1 + dado2) 
}

## simulando unicamente los dados
jugada <- function() {
	
	primer_resultado <- tirada()
	
	if(primer_resultado == 7 || primer_resultado == 11) 
	{
		return (1)
	}
	else if (primer_resultado == 2 || primer_resultado == 3 || primer_resultado == 12) 
	{
		return (0)
	} 
	else 
	{
		
		while(TRUE) 
		{
			resultado <- tirada()
			if (resultado == 7) return (0)
			if (resultado == primer_resultado) return (1)	
		}	
	}
}

## retorna 0 o 1 dependiendo si se quebro o no
apuesta <- function() {
	
	capital <- 20
	
	while(capital > 0 && capital < 50)
	{
		resultado <- jugada()
		if(resultado == 1) 
		{
			## gane
			capital = capital + 1
		}
		else
		{
			## perdi
			capital = capital - 1
		}
	}
	if (capital == 0) return(0)
	return (1)
}


resultado <- 0
for(sim in 1:1000) 
{	
	resultado = resultado + apuesta()	
}

cat('prob perdida = ', 1 - resultado / 1000)
