import 'package:flutter_test/flutter_test.dart';
import 'package:handclick/test/album.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_post_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('测试网络请求的失败和异常', () {
    test('成功', () async {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('失败', () async {
      final client = MockClient();
      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
          http.Response('Not find', 404));

      expect(await fetchAlbum(client), throwsException);
    });

  });
}
