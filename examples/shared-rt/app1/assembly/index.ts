// The entry file of your WebAssembly module.


@external("app2","addMessage")
declare function addMessage(s:string):string

@external("env","log")
declare function log(start:string,len:i32):void

export function main():void{
  let msg=String.fromCharCode(65)
  log(msg,msg.length)
  let resp=addMessage(msg)
  log(resp,resp.length)

}