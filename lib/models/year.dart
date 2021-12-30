class Year {

  late String thName;
  late String enName;
  late String yearvalue;

  
  Year(this.enName, this.thName, this.yearvalue);

    static List<Year> getYear(){
      return[
        Year('Freshman', 'นักศึกษาปี 1','freshman1'),
        Year('Sophomore', 'นักศึกษาปี 2','sophomore2'),
        Year('Junior', 'นักศึกษาปี 3', 'junior3'),
        Year('Senior', 'นักศึกษาปี 4', 'senior4')
      ];
    }
}