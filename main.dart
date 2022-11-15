import 'dart:math';

void main() {

  final util = Util();
  util.test();
}


extension numExtension on num {
  num nthRoot(double n) {
    num nthRoot = pow(this, (1/n));
    return nthRoot;
  }
}

class RootDegreeException implements Exception {
  String cause;
  RootDegreeException(this.cause);
}

class PoiUsernt { 
  late String email;
}

class Point {
  late int x;
  late int y;
  late int z;
  
  Point(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  String description() {
    return "($x, $y, $z)";
  }
}

class Util {

  int gcd(int a, int b) {
    a = a.abs();
    b = b.abs();
    
    if (a < b) {
        a = a + b;
        b = a - b;
        a = a - b;
    }
    
    if (b > 0) {
        return gcd(b, a % b);
    } else {
        return a;
    }
  }

  int lcm(int a, int b) {
      a = a.abs();
      b = b.abs();
      var c = gcd(a, b);
      var d = a / c;
      return d.round() * b;
  }

  List smpl(int a) {
    var result = [];

    for (var i = 2; i <= (a - 1); i++) {
      if (a % i == 0) {
        var check = smpl(i);
        if (check.length == 0) {
          result.add(i);
        }
      }
    }
    return result;
  }

  String decimal2binary(int d) {
    return d.toRadixString(2);
  }

  int binary2int(String s) {
    return int.parse(s, radix: 2);
  }

  List<num> string2num(String s) {
    var list = s.split(',');
    List<num> result = [];
    for(var i = 0 ; i < list.length; i++ ) { 
      var word = list[i].trim();
      switch (word.toLowerCase()) {
        case "zero":
          result.add(0);
          break;
        case "one":
          result.add(1);
          break;
        case "two":
          result.add(2);
          break;
        case "three":
          result.add(3);
          break;
        case "four":
          result.add(4);
          break;
        case "five":
          result.add(5);
          break;
        case "six":
          result.add(6);
          break;
        case "seven":
          result.add(7);
          break;
        case "eight":
          result.add(8);
          break;
        case "nine":
          result.add(9);
          break;
        case "ten":
          result.add(10);
          break;
        default:
          var value;
          if (word.contains(".")) {
            value = double.tryParse(word) ?? null;  
          } else {
            value = int.tryParse(word) ?? null;
          }
          if (value != null) {
            result.add(value);
          }

          break;
      }
    } 
    return result;
  }

  Map mapContains(String s) {
    var list = s.split(',');
    var result = Map();
    for(var i = 0 ; i < list.length; i++ ) {
      var word = list[i].trim();
      var count = result[word] ?? 0;
      count += 1;
      result[word] = count;
    }
    return result;
  }

  Set<num> listString2num(String s) {
    var list = s.split(',');
    Set<num> result = {};
    for(var i = 0 ; i < list.length; i++ ) { 
      var word = list[i].trim();
      switch (word.toLowerCase()) {
        case "zero":
          result.add(0);
          break;
        case "one":
          result.add(1);
          break;
        case "two":
          result.add(2);
          break;
        case "three":
          result.add(3);
          break;
        case "four":
          result.add(4);
          break;
        case "five":
          result.add(5);
          break;
        case "six":
          result.add(6);
          break;
        case "seven":
          result.add(7);
          break;
        case "eight":
          result.add(8);
          break;
        case "nine":
          result.add(9);
          break;
      }
    } 
    return result;
  }

  double distanceToPoint(Point a, Point b) {
    double retult = 0;
    var mx = (a.x - b.x).abs();
    var my = (a.y - b.y).abs();
    var mz = (a.z - b.z).abs();
    retult = sqrt(pow(mx,2) + pow(my, 2) + pow(mz,2));
    return retult;
  }

  //MARK:- Test
  void test() {
    testGCD(); //1.1
    testLCM(); //1.2
    testSMPL(); //1.3
    testDecimal2binary(); //2
    testBinary2int(); //3
    testString2num(); //4
    testMapContains();  //5.1
    testListString2num(); //5.2
    testDistanceToPoint(); //6
    testRootOfNumberFromDegree(); //7
  }

  void testGCD() {
    var a = 30;
    var b = 12; 
    var c = gcd(a, b);
    print("1.1 gcd($a,$b) = $c");
  }

  void testLCM() {
    var a = 30;
    var b = 12; 
    var d = lcm(a, b);
    print("1.2 lcm($a,$b) = $d");
  }

  void testSMPL() {
    var a = 30;
    var b = 12; 
    var e = smpl(a);
    print("1.3 smpl($a) = $e");
  }

  void testDecimal2binary() {
    var a = 30;
    var f = decimal2binary(a);
    print("2. decimal2binary($a) = $f");
  }

  void testBinary2int() {
    var a = 30;
    var f = decimal2binary(a);
    var g = binary2int(f);
    print("3. binary2int($f) = $g");
  }

  void testString2num() {
    var a = '1,4,one,erfbh,ten,6,cvuv,TWo,3gf';
    var r = string2num(a);
    print("4. test_string2num($a) = $r");
  } 
    
  void testMapContains() {
    var a = '1,4,one,erfbh,ten,6,cvuv,TWo,3gf,one , ten,  one,';
    var r = mapContains(a);
    print("5.1 mapContains($a) = $r");
  }

  void testListString2num() {
    var a = 'one, two, three, cat, dog';
    var r = listString2num(a);
    print("5.2 listString2num($a) = $r");
  }

  void testDistanceToPoint() {
    var a = Point(1, 1, 1);
    var b = Point(2, 2, 2);
    var d = distanceToPoint(a, b);
    var descriptionA = a.description();
    var descriptionB = b.description();
    print("6. distanceToPoint($descriptionA, $descriptionB) = $d");
  }

  void testRootOfNumberFromDegree() {
    var a = 81;
    double n = 4;
    var result = a.nthRoot(n);
    print("7. nth root of $a from Degree $n = $result");
  }
}
