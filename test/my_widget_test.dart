import 'package:flutter_test/flutter_test.dart';
import 'package:handclick/test/widget/mywidget.dart';

void main(){
  testWidgets('my widget', (widgetTester) async {
    await widgetTester.pumpWidget(const MyWidget(title: "T", message: "M"));
    final titlefinder = find.text("T");
    final messagefinder = find.text("D");

    expect(titlefinder, findsOneWidget);
    expect(messagefinder, findsOneWidget);
  });
}