abstract class OkeanApi {
  Future<int> ping();

  // Future<Map<String, dynamic>> rootGroup();

  // Future<List<Map<String, dynamic>>> children({
  //   required int parent,
  // });

  // Future<List<Map<String, dynamic>>> blocks({
  //   required int parent,
  // });

  Future<List<Map<String, dynamic>>> events({
    required int block,
  });
}