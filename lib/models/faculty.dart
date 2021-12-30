class Faculty {

  late int value;
  late String name;

  
  Faculty(this.value, this.name);

    static List<Faculty> getFaculty(){
      return[
        Faculty(1, 'Faculty of Science'),
        Faculty(2, 'Faculty of Law'),
        Faculty(3, 'Faculty of Engineering'),
        Faculty(4, 'Faculty of Health Sciences and Sports'),
        Faculty(5, 'Faculty of Technology and Community Development'),
        Faculty(6, 'Faculty of Nursing'),
        Faculty(7, 'Faculty of Agro-Industry and Biological Industry'),
        Faculty(7, 'Faculty of Education')
      ];
    }
}
