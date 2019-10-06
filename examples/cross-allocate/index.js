const fs = require("fs");

let app1
let app2

const app1Compile = new WebAssembly.Module(fs.readFileSync(__dirname + "/app1/build/untouched.wasm"));
const app2Compile = new WebAssembly.Module(fs.readFileSync(__dirname + "/app2/build/untouched.wasm"));
const app1Env = {

  abort(_msg, _file, line, column) {
    console.error("abort called at index.ts:" + line + ":" + column);
  },
  log(offset, length) {
    let view = new Uint16Array(app1.memory.buffer, offset, length)
    let string = '';
    for (let i = 0; i < length; i++) {
      string += String.fromCharCode(view[i]);
    }
    console.log("app1", offset, length, string);
  },
  dispatch(offset, len) {
    let view=new Uint16Array(app1.memory.buffer,offset,len)
    let newOffset=app2.__retain(app2.__alloc(len*2,1))

    new Uint16Array(app2.memory.buffer,newOffset,len).set(view)
    return newOffset
  }

};
const app2Env = {

  abort(_msg, _file, line, column) {
    console.error("abort called at index.ts:" + line + ":" + column);
  },
  log(offset, length) {
    let view = new Uint16Array(app2.memory.buffer, offset, length)
    let string = '';
    for (let i = 0; i < length; i++) {
      string += String.fromCharCode(view[i]);
    }
    console.log("app2", offset, length, string);
  },
  dispatch(offset, len) {
    let view=new Uint16Array(app2.memory.buffer,offset,len)
    let newOffset=app1.__retain(app1.__alloc(len*2,1))

    new Uint16Array(app1.memory.buffer,newOffset,len).set(view)
    return newOffset
  }
};
app2 = new WebAssembly.Instance(app2Compile, { "env": app2Env }).exports
app1 = new WebAssembly.Instance(app1Compile, { "env": app1Env, "app2": app2 }).exports

app1.main()