package pe.edu.uni.mecafab.controller;

import java.sql.SQLException;
import java.util.List;
import pe.edu.uni.mecafab.dto.EmpleadoConsultaDto;
import pe.edu.uni.mecafab.dto.EmpleadoRegistroDto;
import pe.edu.uni.mecafab.dto.RolEmpleadoDto;
import pe.edu.uni.mecafab.service.EmpleadoService;

public class EmpleadoController {
	
	EmpleadoService service = new EmpleadoService();
	
	// Registrar Empleado
	public int procesarRegistrarEmpleado(EmpleadoRegistroDto dto) throws SQLException, Exception {
		return service.registrarEmpleado(dto);
	}
	
	// Consultar Empleado
	public List<EmpleadoConsultaDto> procesarConsultarEmpleado(String patron) throws SQLException, Exception {
		return service.consultarEmpleado(patron);
	}
	
	// OBTENER LOS ROLES DE LOS EMPLEADOS
	public List<RolEmpleadoDto> procesarObtenerRoles() throws SQLException, Exception {
		return service.obtenerRoles();
	}
	
}
