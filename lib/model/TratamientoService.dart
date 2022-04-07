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

}