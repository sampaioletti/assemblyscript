

const fs = require("fs");
import * as loader from "../../lib/loader"
class WASM {
  module: WebAssembly.Module
  exports: loader.ASUtil & { [key: string]: any }
  static externs: Map<number, { length: number, set: (dest: Uint8Array) => void }> = new Map()
  constructor(public name: string) { }
  ctx: string[] = []
  compile(dir: string) {
    this.module = new WebAssembly.Module(fs.readFileSync(dir))
  }
  instantiate(imports?) {
    this.imports = { ...this.imports, ...imports }
    this.exports = loader.instantiate(this.module, this.imports)
    if ("__ctx" in this.exports) {
      this.ctx = this.getStringArray(this.exports.__ctx)
    }
  }
  imports = {
    env: {
      abort: (_msg, _file, line, column) => {
        console.error(this.name, "abort called at index.ts:" + line + ":" + column);
      },
      log: (val:number) => {
        console.log(this.name,this.exports.__getString(val))
      },

      // peer=import index,dir=0 read 1 write, offset: offset of src 
      __rem_call: (ctx: number, offset: number):number => {
        
        const dest =  this.imports[this.ctx[ctx]] 
        var data=this.exports.__getString(offset) as string
        return dest.__retain(dest.__allocString(data))
      },
      __rem_return:(ctx:number,offset:number):number=>{
        
        const src =  this.imports[this.ctx[ctx]] 
        var data=src.__getString(offset) as string
        return this.exports.__retain(this.exports.__allocString(data))
      }
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

let app1 = new WASM("app1")
let app2 = new WASM("app2")
app1.compile(__dirname + "/app1/build/untouched.wasm")
app2.compile(__dirname + "/app2/build/untouched.wasm")
app2.instantiate()
app1.instantiate({ "app2": app2.exports })

app1.call("main")
