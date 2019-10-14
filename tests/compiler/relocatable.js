let loader=require("../../lib/loader")
exports.preInstantiate = function (imports, exports) {
  // compiler generates initial = 1 because it doesn't know the imported value
  // of env.memory_base yet, hence we need to import a suitable memory as well:
  imports["env"] = {
    "abort": (mesg, file, line, colm) =>{
      const memory = imports["env"].memory.buffer // prefer exported, otherwise try imported
      throw Error("abort: " + getString(memory, mesg) + " at " + getString(memory, file) + ":" + line + ":" + colm);
    },
    "memory": new WebAssembly.Memory({ initial: 2 }),
    "memory_base": 1000,
    "table_base": 100,
    "log": (offset, length) => {
      imports["env"].checkPtr(offset)
      let view = new Uint16Array(imports["env"].memory.buffer, offset, length)
      let str = String.fromCharCode.apply(null, view)
      console.log("val",offset,length,str)
      assert(str === "relocatable", `expected relocatable got'${str}' at index ${offset} with length ${length}`)
    },
    "checkPtr":(offset)=>{
      assert(offset>imports["env"].memory_base, `offset ${offset} is less than memory_base ${imports["env"].memory_base}`)
    }
  };
}
exports.preInstantiate = function(imports, exports, module) {
  // compiler generates initial = 1 because it doesn't know the imported value
  // of env.memory_base yet, hence we need to import a suitable memory as well:
  imports["env"]["memory"] = new WebAssembly.Memory({ initial: 2 });
  imports["env"]["memory_base"] = 65536;
  imports["env"]["table"] = new WebAssembly.Table({ element: "anyfunc", initial: 20 });
  imports["env"]["table_base"] = 10;
};

exports.postInstantiate = function (instance) {
  instance.exports.main()
}

const SIZE_OFFSET = -4;
const CHUNKSIZE = 1024;
function getString(buffer, ptr) {
  const U32 = new Uint32Array(buffer);
  const U16 = new Uint16Array(buffer);
  var length = U32[(ptr + SIZE_OFFSET) >>> 2] >>> 1;
  var offset = ptr >>> 1;
  if (length <= CHUNKSIZE) return String.fromCharCode.apply(String, U16.subarray(offset, offset + length));
  const parts = [];
  do {
    const last = U16[offset + CHUNKSIZE - 1];
    const size = last >= 0xD800 && last < 0xDC00 ? CHUNKSIZE - 1 : CHUNKSIZE;
    parts.push(String.fromCharCode.apply(String, U16.subarray(offset, offset += size)));
    length -= size;
  } while (length > CHUNKSIZE);
  return parts.join("") + String.fromCharCode.apply(String, U16.subarray(offset, offset + length));
}