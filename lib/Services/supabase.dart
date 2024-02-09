import 'package:sgold/Views/MainPage/ring.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sgold/main.dart';

class DatabaseService {
  static String supabaseURL = "https://hloarmxwfypsacdusxhi.supabase.co";
  static String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhsb2FybXh3Znlwc2FjZHVzeGhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY1ODA5NDQsImV4cCI6MjAyMjE1Njk0NH0.nFMZaGyj30QHVb0ODh6idME5EXrkQIz8Jb83Sqgn6Ew";

  Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final _future = await supabase.from('products').select();
    return _future;
  }

  Future<List<Map<String, dynamic>>> fetchRingProducts() async {
    final _future = await supabase.from('products').select().eq('category', 'ring');
    return _future;
  }


  Future<List<Map<String, dynamic>>> fetchNecklaceProducts() async {
    final _future = await supabase.from('products').select().eq('category', 'necklace');
    return _future;
  }

Future<List<Map<String, dynamic>>> fetchBraceletProducts() async {
    final _future = await supabase.from('products').select().eq('category', 'bracelet');
    return _future;
  }




 
}
