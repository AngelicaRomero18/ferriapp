class Marketplace {
  int id;
  String name;
  double price;
  String image;
  String descripcion;

  Marketplace({this.id, this.name, this.price, this.image, this.descripcion});
}

final herraElectricas = [
  Marketplace(
      id: 1,
      name: 'Taladro',
      price: 209900,
      image: 'taladro.jpg',
      descripcion: 'Taladro Inalámbrico 3/8-pulg 20V I-L B+D'),
  Marketplace(
      id: 2,
      name: 'Sierra',
      price: 249900,
      image: 'sierra.jpg',
      descripcion: 'Sierra Circular 7 1/4 1800W 5000RPM Bauker'),
  Marketplace(
      id: 3,
      name: 'Pulidora',
      price: 277900,
      image: 'pulidora.jpg',
      descripcion: 'Pulidora 4 1/2 Pulg 750W 12000Rpm Dewalt'),
  Marketplace(
      id: 4,
      name: 'Cortadora',
      price: 872900,
      image: 'cortadora.jpg',
      descripcion: 'Sierra Corta Piedra 4-7/8 Pulgadas 1400W + Manguera'),
  Marketplace(
      id: 5,
      name: 'Rotomartillo',
      price: 712900,
      image: 'rotomartillo.jpg',
      descripcion: 'Rotomartillo Sds-Plus 720W 2J 2.000Rpm Bosch'),
];

final herraManuales = [
  Marketplace(
      id: 6,
      name: 'Alicate',
      price: 7500,
      image: 'alicate.jpg',
      descripcion: 'Alicate 6 pulgadas punta larga cortante'),
  Marketplace(
      id: 7,
      name: 'Tijera',
      price: 39900,
      image: 'tijera.jpg',
      descripcion: 'Tijera De Aviacion Recta Redline'),
  Marketplace(
      id: 8,
      name: 'Martillo',
      price: 14900,
      image: 'martillo.jpg',
      descripcion: 'Martillo una 13 onzas mango madera 1561331'),
  Marketplace(
      id: 9,
      name: 'Lima',
      price: 19900,
      image: 'lima.jpg',
      descripcion: 'Escofina Mediacaña 8-pulg Profesional Redline'),
  Marketplace(
      id: 10,
      name: 'Remachadora',
      price: 41900,
      image: 'remachadora.png',
      descripcion: 'Remachadora Economica Ref 69-646'),
];

final plomeria = [
  Marketplace(
      id: 11,
      name: 'Tubo pvc',
      price: 132900,
      image: 'tubo.png',
      descripcion: 'Tubo Sanitario 4" x 6 Mts.'),
  Marketplace(
      id: 12,
      name: 'Tanques',
      price: 258900,
      image: 'tanque.png',
      descripcion: 'Tanque de 500 Litros'),
  Marketplace(
      id: 13,
      name: 'Acoples',
      price: 25900,
      image: 'acople.png',
      descripcion: 'Válvula Manguera 16mm'),
  Marketplace(
      id: 14,
      name: 'Rejilla',
      price: 36900,
      image: 'rejilla.jpg',
      descripcion: 'Rejilla Sifón en Acero '),
  Marketplace(
      id: 15,
      name: 'Ducha',
      price: 119900,
      image: 'ducha.jpg',
      descripcion: 'Ducha Con Brazo Altea'),
];
