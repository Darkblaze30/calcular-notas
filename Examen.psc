Funcion op <- menu 
	Escribir "----------MENU----------"
	Escribir "(1) asignar notas parciales"
	Escribir "(2) registrar el numero de inasistencias de cada estudiante"
	Escribir "(3) listado de estudiantes"
	Escribir "(4) Calcular nota final"
	Escribir "(5) Registrar estudiantes"
	Escribir "(0) Calcular nota final"
	Leer op
FinFuncion

Funcion listaEstudiantes(Estudiantes, index, Inasistencias, Notas)	
	si index > 1 Entonces
		Escribir "---Lista de estudiantes---"
		Para i = 1 Hasta index-1 Hacer
			Escribir "codigo: " Estudiantes(i, 1) " nombre: " Estudiantes(i,2) 
			//Escribir "Inasistencias: " Inasistencias(i,1)
			//Escribir "Nota #1: " Notas(i, 1) " nota #2: "  Notas(i, 2) " nota #3: " Notas(i, 3)
			Escribir "--------------------------------------------"
		FinPara
	SiNo
		Escribir "No ahi usuarios creados"
	FinSi
	
	
FinFuncion

Funcion index <- buscarEstudiante(codigo, Estudiantes)
	encontrado = Falso
	index = 0
	Para i = 1 Hasta 10 Hacer
		si codigo = Estudiantes(i,1)
			index = i
			encontrado = Verdadero
		FinSi
	FinPara
	si encontrado = Verdadero 
		Escribir "codigo: " Estudiantes(index, 1) " nombre: " Estudiantes(index,2)
		encontrado = Falso
	FinSi	
FinFuncion

Funcion registrarEstudiantes(Estudiantes, index)
	i = 1
	si index <= 10 Entonces
		Escribir "registro de Estudiante"	
	Mientras i <> 0 Hacer
		Escribir "digite el codigo del nuevo estudiante"
		Leer codigo
		i <- buscarEstudiante(codigo, Estudiantes)
		si i = 0 Entonces
			Escribir "digite el nombre del estudiante"
			Leer nombre
			Estudiantes(index, 1) = codigo
			Estudiantes(index, 2) = nombre
			Escribir "se ha registrado el estudiante con estos datos"
			Escribir "codigo: " Estudiantes(index, 1) " nombre: " Estudiantes(index,2) 
			Escribir "---------------------------------------"
			Escribir "la base de datos contiene " index " estudiantes"
			Escribir "---------------------------------------"
		SiNo
			Escribir "existe un usuario con este codigo"
			Escribir "pruebe con otro codigo"
		FinSi	
	Fin Mientras
			
	SiNo
		Escribir "ya ahi 10 estudiantes registrados"
	FinSi
	
	
FinFuncion


 
Funcion registrarAsistencias(Estudiantes, Inasistencias) 
	Escribir "digite el codigo del estudiante a registrar inasistencias"
	Leer codigo
	index <- buscarEstudiante(codigo, Estudiantes)
	si index <> 0 Entonces
		escribir"registre numero de inasistencias"
		Leer num
		Inasistencias(index, 1) = num	
	SiNo
		Escribir "Codigo incorrecto, estudiante no encontrado"	
	FinSi
FinFuncion

Funcion registrarNotas(Estudiantes, Notas) 
	Escribir "digite el codigo del estudiante a las notas parciales"
	Leer codigo
	index <- buscarEstudiante(codigo, Estudiantes)
	si index <> 0 Entonces
		escribir"ingrese nota parcial #1"
		Leer nota1
		escribir"ingrese nota parcial #2"
		Leer nota2
		escribir"ingrese nota parcial #3"
		Leer nota3
		Notas(index, 1) = nota1	
		Notas(index, 2) = nota2	
		Notas(index, 3) = nota3
		Escribir "Nota #1: " Notas(index, 1) " nota #2: "  Notas(index, 2) " nota #3: " Notas(index, 3)
	SiNo
		Escribir "Codigo incorrecto, estudiante no encontrado"	
	FinSi
FinFuncion

Funcion calcularNota(Estudiantes, Inasistencias, Notas)
	notaFinal = 0
	Escribir "digite el codigo del estudiante para saber su nota final"
	Leer codigo
	index <- buscarEstudiante(codigo, Estudiantes)
	Escribir index
	
	
	si index <> 0 Entonces
		notaFinal = (Notas(index, 1) + Notas(index, 2) + Notas(index, 3)) / 3
		si Inasistencias(index,1) > 0 Entonces
				si Inasistencias(index,1) >= 10 y Inasistencias(index,1) < 15 Entonces
					notaFinal = notaFinal -0.5
				SiNo
					si Inasistencias(index,1) >= 15 Entonces
						notaFinal = notaFinal -1
					FinSi
				FinSi
		FinSi		
		Escribir "COD | NOMBRE | N1 | N2 | N3 | INASISTENCIAS | NOTA FINAL"
		Escribir " " Estudiantes(index, 1) " | " Estudiantes(index,2) " | " Notas(index, 1) " | "  Notas(index, 2) " | " Notas(index, 3) " |      " Inasistencias(index,1) "    | " notaFinal
	SiNo
		Escribir "Codigo incorrecto, estudiante no encontrado"	
	FinSi	
FinFuncion

Algoritmo Examen
	Dimensionar Estudiantes(10,2)
	Dimensionar Inasistencias(10,1)
	Dimensionar Notas(10,3)
	index = 1
	Repetir
		op <- menu
		Segun op Hacer
			1: 
				registrarNotas(Estudiantes, Notas)
			2: 
				registrarAsistencias(Estudiantes, Inasistencias)
			3: 
				listaEstudiantes(Estudiantes, index, Inasistencias, Notas)
			4: 
				calcularNota(Estudiantes, Inasistencias, Notas)
			5: 
				registrarEstudiantes(Estudiantes, index)
				index = index + 1
			0: 
				Escribir "saliendo......"
				esperar 2 Segundos
		De Otro Modo:
			Escribir "escribir numero de 0 a 4"
		FinSegun
	Hasta Que op = 0
FinAlgoritmo
