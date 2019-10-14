var mem = new WebAssembly.Memory({ initial: 2 });
var table = new WebAssembly.Table({ element: "anyfunc", initial: 20 });
var mem_base = 0
var table_base = 0
var sayHello=function(offset){
}
exports.preInstantiate = function (imports, exports, module) {
  // compiler generates initial = 1 because it doesn't know the imported value
  // of env.memory_base yet, hence we need to import a suitable memory as well:
  imports["env"]["memory"] = mem
  imports["env"]["memory_base"] = mem_base;
  imports["env"]["table"] = table
  imports["env"]["table_base"] = table_base;
  imports["env"]["offset"]=function(offset){
    console.log("offset",offset)
  }
  imports["peer"]={"sayHello": sayHello}
  mem_base = 65536
  table_base = 10
};
var count=0
exports.postInstantiate=function(instance){
  if(count>0){
    //both are instantiated call main on the second one
    console.log("mem",instance.exports.__memory_base)
    instance.exports.main()

  }
  sayHello=instance.exports.sayHello
  count++
  
}