	/*
	Taller: seminario de investigacion
	Autor: Edinson Tolentino
	Factores que determinan los trabajadores independientes
	*/
	cls
	cd "C:\Users\et396\Dropbox\Docencia\UPN\Semilleros_Investigacion\Taller281024\Aplicacion"
	
	use "BD1.dta",clear
	d
	*browse 
	
	glo Xs "rmujer redad rexper reduca rpobre"
	glo Zs "rmujer rexper rexpersq reduca rpobre"
	
	*Estadisticas descriptivas
	sum rnegocio $Xs
	
	*grafico
	tw (kdensity redad if rnegocio==1) (kdensity redad if rnegocio==0), legend(label(1 "Voluntario") label(2 "Involuntario")) title("Situacion de trabajadores Independientes")
	
	* MPL
	reg rnegocio rmujer rexper rexpersq reduca rpobre
	reg rnegocio $Zs
	
	* Modelo Probit
	probit rnegocio $Zs
	margins, dydx(*) atmeans
	
	* Modelo Logit
	logit rnegocio $Zs
	margins, dydx(*) atmeans
	
	