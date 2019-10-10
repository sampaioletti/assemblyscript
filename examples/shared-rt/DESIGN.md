# Shared Runtime

Shared runtime is designed to allow for mutiple AS modules (plugins) to share a single assemblyscript runtime (asr) 
running on a wasm interpreter (host)

- One shared linear memory
  - asr exports its memory and runtime methods (i.e. __alloc, etc)
  - plugin import memory and runtime methods from asr

## Instantiation sequence

1. The host specifies a starting index (offset) of 8 for the memory offsets
2. The asr module is compiled and instantiated
   1. asr has no start method or has delayed dynamic allocations with --explicitStart (since heap base will move)
   2. importing the offset as env.memory_base
   3. The offset is increased by the value of asr.exports.__memorysize
3. The plugins are compiled and instantiated 1 at a time
   1. importing the offset as env.memory_base
   2. importing the runtime methods from asr into env
   3. The offset is increased by the value of plugin.exports.__memorysize
4. Pass the final Dynamic back to asr to use as the basis for dynamic allocations

## Issues/Haven't tried

- [ ] Does RTTI sync between instances?
- [ ] Shared Tables
- [ ] More to come (:
