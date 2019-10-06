# Cross Allocate

This example creates a minimal api for cross allocating objects.

the host provides a dispatch function that allows allocating remote memory

```ts
declare function dispatch<T>(val:T,len:i32):i32
```

Currently this is just an experiment, and has some weirdness i.e. when you declare the function you are dispathing to
you must change the type to i32...even though the function takes an object. So that the allocator will leave it alone

If this works out, it could be implemented into the compiler rather easily so that it would pass out the module id with
the dispatch
