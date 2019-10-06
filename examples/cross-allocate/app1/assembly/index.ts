// The entry file of your WebAssembly module.

@external("env","dispatch")
declare function dispatch<T>(val:T,len:i32):i32

@external("env","log")
declare function log<T>(offset:T,len:i32):void

@external("app2","sayHello")
declare function sayHello(msg:i32):string

export function main():void{
  let s="Hello from app1"
  let resp=sayHello(dispatch(s,s.length))
  log(resp,resp.length)  
}
