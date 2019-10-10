//app 2 will be called from app 1

@external("env", "log")
declare function log(msg: string): void
const myName="app2"
export function sayHello(name: string): string {
  let test="app2 static"
  log(test)
  log(name)
  return "Hello " + name + " I'm "+myName
}
