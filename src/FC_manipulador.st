
	

CASE DB_data.steps_manipulador OF
	
	0: //Etapa de inicio
		DB_output.out_eje_y := 0;
		DB_output.out_eje_z := FALSE;
		DB_output.out_eje_x := FALSE;
		DB_output.out_dedo_1 := 0;
		DB_output.out_dedo_2 := 0;
		IF DB_input.in_eje_y > -1 AND DB_input.in_eje_y < 1 AND DB_input.in_eje_z_inferior = TRUE AND DB_input.in_eje_x_inferior = TRUE AND DB_input.in_pinza_abierta = TRUE THEN
			IF DB_input.in_hilo_sensor_1 = TRUE THEN //comprovar que pieza si no no mover
				DB_data.steps_manipulador := 1;
			END_IF
		END_IF
	1: //Etapa posicion recojida
		DB_output.out_eje_y := 200;
		IF DB_input.in_eje_y > 199 AND DB_input.in_eje_y < 201 THEN
			DB_data.steps_manipulador := 2;
		END_IF
	2: //Etapa de recojida 1
		DB_output.out_eje_z := TRUE;
		IF DB_input.in_eje_z_superior = TRUE THEN
			DB_data.steps_manipulador := 3;
		END_IF
	3: //Etapa de cerrado de pinzas
		DB_output.out_dedo_1 := 1;
		DB_output.out_dedo_2 := 1;
		IF DB_input.in_pinza_cerrada = TRUE THEN
			DB_data.steps_manipulador := 4;
		END_IF
	4:	//Etapa de vuevlea a posicion recojida
		DB_output.out_eje_z := FALSE;
		IF DB_input.in_eje_z_inferior = TRUE THEN
			DB_data.steps_manipulador := 5;
		END_IF
	5:  //Etapa de vuelta a origen
		DB_output.out_eje_y := 0;
		IF DB_input.in_eje_y > -1 AND DB_input.in_eje_y < 1 THEN
			IF DB_input.in_hilo_sensor_2 = FALSE THEN //Comprovar que no pieza
				DB_data.steps_manipulador := 6;
			END_IF
		END_IF
	6:	//Etapa de colocacion
		DB_output.out_eje_z := TRUE;
		IF DB_input.in_eje_z_superior = TRUE THEN
			DB_data.steps_manipulador := 7;
		END_IF
	7:	//Etapa de apertura de pinzas
		DB_output.out_dedo_1 := 0;
		DB_output.out_dedo_2 := 0;
		IF DB_input.in_pinza_abierta = TRUE THEN
			DB_data.steps_manipulador := 0;
		END_IF
		
		
END_CASE