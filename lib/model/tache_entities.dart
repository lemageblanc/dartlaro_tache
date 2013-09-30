part of dartlero_tache;

class Project extends ConceptEntity<Project> {

  String name;
  String description;


  Project newEntity() => new Project();

  
  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    description: ${description}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['description'] = description;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];
    description = entityMap['description'];
  }

  bool get onProgramming =>
      description.contains('Programming') ? true : false;

  int compareTo(Project other) {
    return name.compareTo(other.name);
  }

}

class Projects extends ConceptEntities<Project> {

  Projects newEntities() => new Projects();
  Project newEntity() => new Project();

}
