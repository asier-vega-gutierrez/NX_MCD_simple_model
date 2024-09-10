	
CASE DB_data.steps_consumidor OF
	
	0:  //Etapa de consumo de consumidro
		IF DB_input.in_hilo_sensor_2 = TRUE AND DB_input.in_cilindro_inferior_3 = TRUE AND DB_input.in_eje_z_inferior = TRUE THEN
			DB_output.out_cilindro_3 := TRUE;
			DB_data.steps_consumidor := 1;
		END_IF
	1:	//Etapa de reset de consumidor
		IF DB_input.in_cilindro_superior_3 = TRUE THEN
			DB_output.out_cilindro_3 := FALSE;
			DB_data.steps_consumidor := 0;
		END_IF
	
END_CASE