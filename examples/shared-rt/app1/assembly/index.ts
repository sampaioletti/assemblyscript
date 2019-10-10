// The entry file of your WebAssembly module.



@external("app2","sayHello")
declare function sayHello(name:string):string

@external("env","log")
declare function log(msg:string):void
const name="app1"
export function main():void{
  let test="app1 static"
  log(test)
  let msg=sayHello(name)
  log(msg)
}
