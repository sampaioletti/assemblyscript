



const fs = require("fs");
import * as loader from "../../lib/loader"
class WASM {
  module: WebAssembly.Module
  exports: loader.ASUtil & { [key: string]: any }
  memory:WebAssembly.Memory
  static externs: Map<number, { length: number, set: (dest: Uint8Array) => void }> = new Map()
  constructor(public name: string) { }
  compile(dir: string) {
    this.module = new WebAssembly.Module(fs.readFileSync(dir))
  }
  instantiate(imports?) {
    this.imports = { ...this.imports, ...imports }
    this.exports = loader.instantiate(this.module, this.imports)
    this.memory=this.exports.memory||this.imports.env.memory
  }
  imports:{[key:string]:any} = {
    env: {
      memory_base:0,
      table_base:0,
      abort: (_msg, _file, line, column) => {
        console.error(this.name, "abort called at index.ts:" + line + ":" + column);
      },
      log: (val:number) => {
        console.log("log",this.name,val)
        let dataview=new Uint16Array(this.memory.buffer,val,20)
        console.log(String.fromCharCode.apply(null,dataview))
        // console.log(this.name,this.exports.__getString(val))
      },
    }
  }
  call(method: string, ...args: any[]): any {
    this.exports[method].apply(this, args)
  }
  getStringArray(idx: number): string[] {
    let arr = this.exports.__getArray(idx)
    let res = []
    arr.forEach(i => {
      res.push(this.exports.__getString(i))
    })
    return res
  }
}

let asr = new WASM("asr")
let app1 = new WASM("app1")
let app2 = new WASM("app2")
asr.compile(__dirname + "/asr/build/untouched.wasm")
app1.compile(__dirname + "/app1/build/untouched.wasm")
app2.compile(__dirname + "/app2/build/untouched.wasm")
let idx=8
console.log(idx)
asr.imports.env={...asr.imports.env,memory_base:8}
asr.instantiate()
idx+=asr.exports.__memory_size+8
console.log("asr end",idx)

app2.imports.env={...app2.imports.env,...asr.exports,memory_base:idx}

app2.instantiate()
idx+=app2.exports.__memory_size+8

app1.imports.env={...app1.imports.env,...asr.exports,memory_base:idx}
app1.instantiate()

let view=new Uint16Array(asr.exports.memory.buffer,idx,app1.exports.__memory_size)
console.log(String.fromCharCode.apply(null,view))

asr.call("main")

