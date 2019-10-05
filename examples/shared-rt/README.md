# Shared Runtime Example

The example shows the use of a shared runtime, so that AS modules can exchange types stored in
Linear Memory without gc contention

generate the modules from the shared-rt directory with

```console
npm run asbuild
```

and run the example with

```console
node runner.js
```
should give output similar to

```console
[Object: null prototype] {
  memory: Memory [WebAssembly.Memory] {},
  __alloc: [Function: 16],
  __realloc: [Function: 20],
  __free: [Function: 21],
  __retain: [Function: 23],
  __release: [Function: 28],
  __collect: [Function: 12],
  __visit: [Function: 29],
  __rtti_base: 256 }
ArrayBuffer { byteLength: 65536 }
app1 1888 1 A
app2 1920 1 B
app2 1952 2 AB
app1 1952 2 AB
```
the bottom part of the result is | plugin name | mem offset | val
so both apps are operating on the same memory addresses

## Sub Projects

The example has three sub projects

### asr

Short for AssemblyScript Runtime is a project that is build with the added flag --runtime export
It doesn't add any additional methods, but rather exports all required for the runtime to manage
the shared linear memory

### app1

Is the 'main' app, that simply makes a call to app2

### app2

Is the 'extension' app that simple provides an exported method

## Runner

The runner.js script accomplishes the following

1. Instantiates the asr module first
2. Instantiates the app2 module
   1. asr for the shared runtime
   2. host methods abort and log
3. Instantiates the app1 module with imports:
   1. asr for the shared runtime
   2. app2 for the exported method
   3. host methods abort and log
4. Calls main from app1

## Advantages

Both the apps get fully optimized as they rely on the shared memory, so they are tiny
AS types work as expected when calling between modules (see issues for caveats)

Perfect for a plugin type system made with AS (thats the goal)

## Issues

In concept this works in that the asr will manage the memory and provide gc etc without contention however

Memory initializers overwrite each other, which is why we are dynamically creating strings, rather than using
constants in the examples

possible solutions:

- Have compiler recognize the shared mem and use allocations rather than static initializers
- create separate offsets for each shared app to store its initializers using --memoryBase
- or ...

## Other ideas

If this POC proves successful some future plans might be

- move the rt imports out of the "env" namespace, would require changing the namespace for importing memory in the compiler
