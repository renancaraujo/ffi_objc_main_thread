import 'dart:ffi';
import 'dart:io';

import 'package:ffi_objc_main_thread/src/dismain_bindings.dart';
import 'package:path/path.dart' as p;

// this may be different in the exe version
const dismainDylibPath = 'DispatchToMain/dismain.dylib';

void main() async {
  print("Starting...");

  final dismainLib = DisMainLib(DynamicLibrary.open(
    p.join(Directory.current.path, dismainDylibPath),
  ));

  print("Lib loaded...");

  print("Queueing block...");

  final block = ObjCBlock21.fromFunction(dismainLib, mainThreadMain);

  // dispatch async
  DispatchToMain.new1(dismainLib).dispatchToMainAsync_(block);

  // dispatch sync
  // DispatchToMain.new1(dismainLib).dispatchToMainSync_(block);

  print("Done");
}


void mainThreadMain() {
  print("Hello from main thread!");
}