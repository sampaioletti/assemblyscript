// The entry file of your WebAssembly module.

@external("env","dispatch")
declare function dispatch<T>(val:T,len:i32):i32

@external("env","log")
declare function log(str:string,len:i32):void

export function sayHello(msg:string):i32{
  log(msg,msg.length)
  let s="hello from app2"
 return dispatch(s,s.length)
}

export function add(a: i32, b: i32): i32 {
  return a + b;
}
