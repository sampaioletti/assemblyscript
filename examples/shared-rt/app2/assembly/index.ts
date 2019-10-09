//app 2 will be called from app 1

@external("env","log")
declare function log(msg:string):void

export function addMessage(msg: string):string{
  let test="app2 global"
  let some="this is another global from app2"
  let s=String.fromCharCode(66)
  // log(s)
  return s
}
