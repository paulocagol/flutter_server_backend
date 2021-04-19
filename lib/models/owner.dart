class Owner {
  int id = 0;
  String name = '';

  Owner({
    this.id = -1,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nam': name,
    };
    return map;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'task': name,
      };
}

class ListOwners {
  List<Owner> owners = [];

  ListOwners();

  ListOwners.add(Owner owner) {
    owners.add(owner);
  }

  List<Map<String, dynamic>> toJson() => owners.map((e) => e.toJson()).toList();
}
