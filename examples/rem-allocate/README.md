# Remote Allocate Example

This example uses a transform (./wrap-strings) to copy strings created in one module
to another module with a function receiving the string

both modules are simple as the transform does most of the work

```js
//app1/index.ts
@external("app2","concat")
declare function concat(a:string,b:string,repeat:i32):string

export function main():void{
  let val=concat("a","b",10)
  log(val)
}

```

```js
//app2/index.ts
export function concat(a:string,b:string,repeat:i32):string{
  let c:string=""
  for (let i = 0; i < repeat; i++) {
    c=c+a.concat(b)
    
  }
  return c
}
```

build both modules with asc, the package.json has a helper script

```console
.../wrap-strings>npm run asbuild
```
run the index.ts

```console
.../wrap-strings>ts-node index.ts
.../wrap-strings>app1 abababababababababab
```
Requirements to work:

- Have an @external decorator with both module and function name
- That function may contain any number of string arguments as well as other arguments in any order
- That function may return a string, or another type

## This only works with strings and base types

Types other than strings, or wasm types (i32/i64/etc) will not be copied to the destination

## How it works

- The asc compiler parses the target with the `--transform` flag
- The compiler calls the transform and passes in the `Parser` instance
- The transform walks the source files and looks for user files (i.e. non lib files)
- The source files are then queried for `Statements`
- `Statements` that have `@external('module','name')` decorators are selected
- The Statement's module name is placed into a array that will be written as a global in the module
- A wrapper function is generated that makes a call to the hosts `__rem_call(ctx:i32,offset:i32):i32` for
  any arguments of type `string` This call looks up the module(ctx) in the modules imports and allocates and copies
  the string value in that module, it returns the remote offset of the value
- If the Statement returns a string, another wrap is created using the hosts `__rem_return<T>(ctx:i32,offset:T):T` which
  retrieves the value from the other module and allocates a copy back on the calling module
- The wrapper returns the value if the return type was not void

The types are changed slightly to avoid the gc grabbing things it shouldn't and causing an unreachable error

This is not production ready and is just an example of how to transform and communicate between modules
