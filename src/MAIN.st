
CASE DB_data.steps_main OF
	
	0:	//Etapa de ready to start
		IF DB_data.in_marcha = TRUE THEN
			DB_data.steps_main := 1;
		END_IF;
		
	1:	//Etapa de startup
		DB_data.steps_main := DB_data.last_steps_main;
		DB_data.steps_alimentador := DB_data.last_steps_alimentador;
		DB_data.steps_consumidor := DB_data.last_steps_consumidor;
		DB_data.steps_manipulador := DB_data.last_steps_manipulador;
		DB_data.steps_main := 2;
		
	2: //Etapa de funcionamiento
		FC_alimentador();
		FC_consumidor();
		FC_manipulador();
		IF DB_data.in_emergency = TRUE THEN
			DB_data.steps_main := 200;
		END_IF
		IF DB_data.in_stop = TRUE THEN
			DB_data.steps_main := 200;
		END_IF
		IF DB_data.in_reset = TRUE THEN
			DB_data.steps_main := 300;
		END_IF
		
	100: //Etapa de emergencia
	200: //Etapa de stop
	300: //Etapa de reset
	
		
END_CASE




