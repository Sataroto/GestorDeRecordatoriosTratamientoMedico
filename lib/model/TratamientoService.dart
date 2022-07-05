class  Tratamiento{
  final int tratamiento_id;
  final String nombre;
  final int estado;
  final String? comentario;

  Tratamiento(
      { required this.tratamiento_id,
        required this.nombre,
        required this.estado,
        this.comentario
      }
      );
  factory Tratamiento.fromJson(Map<String, dynamic> json){
    return Tratamiento(
        tratamiento_id: json['tratamiento_id'] as int,
        nombre: json['nombre'] as String,
        estado: json['estado'] as int,
        comentario: json['comentario'] as String?
    );

  }
  String get_nombre(){
    return nombre;
  }
  int get_id(){
    return tratamiento_id;
  }
  int get_estado(){
    return estado;
  }
  String traducir_estado(){
    switch(get_estado()){
      case 0:
          return "sin medicamento";
      case 1:
        return "Activo";
      case 2:
          return "Finalizado";
      case 3:
          return "Finalizado por cancelacion";
      default:
        return "Discrepancia";
    }

  }
  /*TODO:
    String get_nombre();/
  int get_id();
  DateTime get_inicio_fecha();/
  get_estado();
  traducir_estado();
  set_name(String nombre,int id);
*/
}