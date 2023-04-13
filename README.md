# Dart FFI Objective-C example to main thread

This sample of code tries to run a dart code block in the main thread on macOS via [the Objective-C biding generation](https://dart.dev/guides/libraries/objective-c-interop).

### Preparing:

```shell
## Install dependencies
dart pub get

## Generate the header file and dylib from the swift script
dart run :compile

## Generate the dart bindings via ffi gen
dart run :generate dismain
```

### Running the example:

```shell
## Run the example
dart run lib/ffi_objc_main_thread.dart
```

If you see the message `Hello from main thread` in the console, it means that the dart code block was executed in the main thread.

To run ina sync way, chaneg the dart code to call `dispatchToMainSync_` instead of `dispatchToMainAsync_`.

### Important files to understand this thing

- The swift code to be called by the FFI is [here](https://github.com/renancaraujo/ffi_objc_main_thread/blob/main/DispatchToMain/DispatchToMain.swift#L6).
- The dart code that calls these swift functions is [here](https://github.com/renancaraujo/ffi_objc_main_thread/blob/main/lib/ffi_objc_main_thread.dart#L24).
