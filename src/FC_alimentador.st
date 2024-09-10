
CASE DB_data.steps_alimentador OF
	
	0:  //Etapa de suministro de alimentador
		IF DB_input.in_cilindro_inferior_1 = TRUE AND DB_input.in_cilindro_inferior_2 = TRUE AND DB_input.in_hilo_sensor_1 = FALSE THEN
			DB_output.out_cilindro_1 := TRUE;
			DB_data.steps_alimentador := 1;
		END_IF
	1:	//Etapa de reset de alimentador
		IF DB_input.in_cilindro_superior_1 = TRUE AND DB_input.in_hilo_sensor_1 = TRUE THEN
			DB_output.out_cilindro_1 := FALSE;
			DB_data.steps_alimentador := 0;
		END_IF
		
END_CASE