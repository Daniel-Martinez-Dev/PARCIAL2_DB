--1
SELECT COUNT(*) AS 'NUMERO DE EMPLEADOS' FROM [dbo].[EMPLEADO$]
--2
SELECT COUNT(*) AS 'NORTE' FROM [dbo].[EMPLEADO$]
WHERE SEDE = 1
SELECT COUNT(*) AS 'CENTRO' FROM [dbo].[EMPLEADO$]
WHERE SEDE = 2
SELECT COUNT(*) AS 'SUR' FROM [dbo].[EMPLEADO$]
WHERE SEDE = 3
SELECT COUNT(*) AS 'OCCIDENTE' FROM [dbo].[EMPLEADO$]
WHERE SEDE = 4
SELECT COUNT(*) AS 'ORIENTE' FROM [dbo].[EMPLEADO$]
WHERE SEDE = 5
--3
SELECT COUNT(*) AS 'ESTRATO 1' FROM [dbo].[PERSONA$]
WHERE [estrato] = 1
SELECT COUNT(*) AS 'ESTRATO 2' FROM [dbo].[PERSONA$]
WHERE [estrato] = 2
SELECT COUNT(*) AS 'ESTRATO 3' FROM [dbo].[PERSONA$]
WHERE [estrato] = 3
SELECT COUNT(*) AS 'ESTRATO 4' FROM [dbo].[PERSONA$]
WHERE [estrato] = 4
SELECT COUNT(*) AS 'ESTRATO 5' FROM [dbo].[PERSONA$]
WHERE [estrato] = 5
SELECT COUNT(*) AS 'ESTRATO 6' FROM [dbo].[PERSONA$]
WHERE [estrato] = 6
--4
SELECT  TOP 1 A.[Cc],A.[nombres],A.[primer_apellido],A.[segundo_apellido],B.[fecha_de_contratacion] FROM
[dbo].[PERSONA$] AS A 
LEFT JOIN [dbo].[EMPLEADO$] AS B 
ON A.empleado_n = B.empleado_n
ORDER BY fecha_de_contratacion DESC
--5
SELECT  TOP 1 A.[Cc],A.[nombres],A.[primer_apellido],A.[segundo_apellido],B.[fecha_de_contratacion] FROM
[dbo].[PERSONA$] AS A 
LEFT JOIN [dbo].[EMPLEADO$] AS B 
ON A.empleado_n = B.empleado_n
ORDER BY fecha_de_contratacion ASC
--6
SELECT A.[nombres],B.[sede],B.[cargo] FROM [dbo].[PERSONA$] AS A
JOIN [dbo].[EMPLEADO$] AS B ON A.empleado_n = B.empleado_n
WHERE A.Cc = 10188530
--7
DELETE FROM [dbo].[PERSONA$] WHERE CC = 10188530
SELECT * FROM [dbo].[PERSONA$] WHERE CC = 10188530
--8
SELECT * FROM [dbo].[EMPLEADO$] 
WHERE fecha_de_contratacion BETWEEN '1/1/2000' AND '1/1/2005'
--9
--ANTIGUOS
SELECT TOP 5 A.[nombres], A.[edad ] FROM [dbo].[PERSONA$] AS A 
JOIN [dbo].[EMPLEADO$] AS B
ON A.empleado_n = B.empleado_n
ORDER BY fecha_de_contratacion ASC
--NUEVOS
SELECT TOP 5 A.[nombres], A.[edad ] FROM [dbo].[PERSONA$] AS A 
JOIN [dbo].[EMPLEADO$] AS B
ON A.empleado_n = B.empleado_n
ORDER BY fecha_de_contratacion DESC
--10
SELECT * FROM [dbo].[PERSONA$]
WHERE [edad ] BETWEEN 16 AND 25;
--11 
SELECT AVG([edad ]) AS 'PROM EDAD' FROM [dbo].[PERSONA$]
--12
SELECT SUM([sueldo]) AS 'TOTAL SUELDOS' FROM [dbo].[EMPLEADO$]
--13
SELECT TOP 1 A.[nombres], B.[sede], A.[estrato], B.[fecha_de_contratacion],B.[cargo] 
FROM [dbo].[PERSONA$] AS A JOIN[dbo].[EMPLEADO$] AS B ON A.empleado_n = B.empleado_n
ORDER BY B.[sueldo] DESC 
--14
SELECT TOP 1 A.[nombres] AS 'MEDICO MAS JOVEN SUR'
FROM [dbo].[PERSONA$] AS A JOIN[dbo].[EMPLEADO$] AS B ON A.empleado_n = B.empleado_n
WHERE B.cargo = 'MEDICO' AND B.sede = 3 ORDER BY [edad ] ASC
--15
SELECT ESTRATO, COUNT(*) AS EMPLEADOS FROM [dbo].[PERSONA$]
GROUP BY [estrato]
--16
SELECT [sede], COUNT(*) AS EMPLEADOS FROM [dbo].[EMPLEADO$]
GROUP BY [sede]
