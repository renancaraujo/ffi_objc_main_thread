import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) async {
  final runner = CompileCommandRunner();
  final result = await runner.run(args);
  exit(result ?? 0);
}

class CompileCommandRunner extends CommandRunner<int> {
  CompileCommandRunner()
      : super('compile',
            'compiles the swift project geenrating headerr files and dylib');

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    final process = await Process.start(
      'swiftc',
      'DispatchToMain/DispatchToMain.swift '
              '-module-name dismain '
              '-emit-objc-header-path DispatchToMain/dismain.h '
              '-emit-library -o DispatchToMain/dismain.dylib'
          .split(' '),
      runInShell: true,
      mode: ProcessStartMode.inheritStdio,
    );

    final result = await process.exitCode;

    return result;
  }
}
