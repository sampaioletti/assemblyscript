// The entry file of your WebAssembly module.

export function concat(a:string,b:string,repeat:i32):string{
  let c:string=""
  for (let i = 0; i < repeat; i++) {
    c=c+a.concat(b)
    
  }
  return c
}
