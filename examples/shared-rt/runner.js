
require("util").inspect.defaultOptions.depth = 1;
let asr=build("asr","/asr/build/untouched.wasm")
console.log(asr)
let app2=build("app2","/app2/build/untouched.wasm",{"asr":asr},asr)
asr.__rtti_base=512
let app1=build("app1","/app1/build/untouched.wasm",{"app2":app2},asr)
console.log(asr.memory.buffer)
app1.main()


function build(name,path,imports,env){
    const fs = require("fs");
    const compiled = new WebAssembly.Module(fs.readFileSync(__dirname + path));
    let buffer
    const defImports = {
      env: {
        abort(_msg, _file, line, column) {
           console.error("abort called at index.ts:" + line + ":" + column);
        },
        log(offset,length){
          let view=new Uint16Array(buffer,offset,length)
          let string = '';
          for (let i = 0; i < length; i++) {
            string += String.fromCharCode(view[i]);
          }
          console.log(name,offset,length,string);
        }
      }
    };
    defImports.env={...defImports.env,...env}
    let inst=new WebAssembly.Instance(compiled, {...defImports,...imports})
    buffer=inst.exports.memory.buffer
    return inst.exports
}

