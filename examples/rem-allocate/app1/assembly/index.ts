// The entry file of your WebAssembly module.

import {log} from "../../env/env"

@external("app2","concat")
declare function concat(a:string,b:string,repeat:i32):string

export function main():void{
  let val=concat("a","b",10)
  log(val)
}


