exports.preInstantiate = function (imports, exports) {
  // compiler generates initial = 1 because it doesn't know the imported value
  // of env.memory_base yet, hence we need to import a suitable memory as well:
  imports["env"] = {
    "abort": (mesg, file, line, colm) => {
      console.log("abort", mesg, file, line, colm)
      assert(false, "abort was called")

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
};

exports.postInstantiate = function (instance) {
  instance.exports.main()
}