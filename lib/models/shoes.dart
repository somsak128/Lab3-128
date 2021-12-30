class Shoes {

  late String engName;
  late String enName;
  late String shoesvalue;
  late int price;
  bool checked = false;
  
  Shoes(this.engName, this.enName, this.price, this.checked);

    static List<Shoes> getShoes(){
      return[
        Shoes('NIKE Air Zoom Rival Fly 3', 'NIKE', 3300, false),
        Shoes('NIKE Quest 4', 'NIKE', 2700, false),
        Shoes('ADIDAS Supernova+', 'ADIDAS', 4500, false),
        Shoes('ADIDAS Galaxy 5 ', 'ADIDAS', 1800, false)
      ];
    }
}