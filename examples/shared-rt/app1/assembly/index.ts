// The entry file of your WebAssembly module.


@external("app2","addMessage")
declare function addMessage(s:string):string

@external("env","log")
declare function log(msg:string):void

export function main():void{
  let test="app1 global"
  let some="this is another global from app1"
  log(test)
  // let msg=String.fromCharCode(65)
  // log(msg)
  // let resp=addMessage(msg)
  // log(resp)
}