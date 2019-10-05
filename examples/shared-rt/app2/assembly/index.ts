//app 2 will be called from app 1

@external("env","log")
declare function log(start:string,len:i32):void

export function addMessage(msg: string):string{
  let s=String.fromCharCode(66)
  log(s,s.length)
  let resp=msg+s
  log(resp,resp.length)
  return resp
}
