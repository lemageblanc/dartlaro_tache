import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:dartlero_tache/dartlero_tache.dart';

testProjects(Projects projects) {
  group("Testing Projects", () {
    setUp(() {
      var projectCount = 0;
      expect(projects.length, equals(projectCount));

      var decoupe = new Project();
      expect(decoupe, isNotNull);
      decoupe.name = 'Dartling decoupe';
      decoupe.description = 'Creating a model of steel cutting.';
      projects.add(decoupe);
      expect(projects.length, equals(++projectCount));

      var assemblage = new Project();
      expect(assemblage, isNotNull);
      assemblage.name = 'Steel assemblage';
      assemblage.description = 'Programming of steel assemblage.';
      projects.add(assemblage);
      expect(projects.length, equals(++projectCount));

      var finition = new Project();
      expect(finition, isNotNull);
      finition.name = 'Dartling';
      finition.description = 'Programming of steel finition.';
      projects.add(finition);
      expect(projects.length, equals(++projectCount));

      //projects.display('Projects');
    });
    tearDown(() {
      projects.clear();
      expect(projects.isEmpty, isTrue);
    });
    test('Add Project', () {
      var project = new Project();
      expect(project, isNotNull);
      project.name = 'modelibra';
      project.description = 'domain model framework for educational purposes';
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project');
    });
    test('Add Project Without Data', () {
      var projectCount = projects.length;
      var project = new Project();
      expect(project, isNotNull);
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project Without Data');
    });

    test('Select Projects by Function', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);
      expect(programmingProjects.length, equals(2));
      programmingProjects.display('Select Projects by Function');
    });
    test('Select Projects by Function then Add', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);

      var dartlingTesting = 'Dartling Testing';
      var programmingProject = new Project();
      programmingProject.name = dartlingTesting;
      programmingProject.description = 'Programming unit tests.';
      var added = programmingProjects.add(programmingProject);
      expect(added, isTrue);
      programmingProjects.display('Select Projects by Function then Add');

      var project = projects.find(dartlingTesting);
      expect(project, isNull);
      projects.display('Projects');
    });

    test('Order Projects by Name', () {
      projects.orderByFunction((m,n) => m.compareTo(n));
      projects.display('Order Projects by Name');
    });
    test('New Project', () {
      var projectCount = projects.length;
      var marketing = new Project();
      expect(marketing, isNotNull);
      marketing.name = 'Dartlng Marketing';
      marketing.description = 'Making Dartling known to the Dart community.';
      var added = projects.add(marketing);
      expect(added, isTrue);
      expect(projects.length, equals(++projectCount));
      projects.display('New Project');
    });

    test('From Projects to JSON', () {
      var json = projects.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Project Model', () {
      List<Map<String, Object>> json = projects.toJson();
      projects.clear();
      expect(projects.isEmpty, isTrue);
      projects.fromJson(json);
      expect(projects.isEmpty, isFalse);
      projects.display('From JSON to Projects');
    });
  });
}

initDisplayModel() {
  ProjectModel projectModel = new ProjectModel();
  projectModel.init();
  projectModel.display();
}

testModel() {
  ProjectModel projectModel = new ProjectModel();
  Projects projects = projectModel.projects;
  testProjects(projects);
}

main() {
  //initDisplayModel();
  testModel();
}
