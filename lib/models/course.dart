class Course {

  late String thName;
  late String enName;
  late String coursevalue;

  Course(this.enName, this.thName, this.coursevalue);

    static List<Course> getCourse(){
      return[
        Course('Information Technology', 'เทคโนโลยีสารสนเทศ','information technology'),
        Course('Computer Science', 'วิทยาการคอมพิวเตอร์','computer science')
      ];
    }
}