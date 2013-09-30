part of dartlero_tache;

class ProjectModel extends ConceptModel {

  static final String project = 'Project';

  Map<String, ConceptEntities> newEntries() {
    var projects = new Projects();
    var map = new Map<String, ConceptEntities>();
    map[project] = projects;
    return map;
  }

  Projects get projects => getEntry(project);

  init() {
    var decoupe = new Project();
    decoupe.name = 'Dartling decoupe';
    decoupe.description = 'Creating a model of steel cutting.';
    projects.add(decoupe);

    var assemblage = new Project();
    assemblage.name = 'Steel assemblage';
    assemblage.description = 'Programming of steel assemblage.';
    projects.add(assemblage);

    var finition = new Project();
    finition.name = 'Dartling';
    finition.description = 'Programming of steel finition.';
    projects.add(finition);
  }

  display() {
    print('Project Model');
    print('=============');
    projects.display('Projects');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


