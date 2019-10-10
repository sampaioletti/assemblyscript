// The entry file of your WebAssembly module.



@external("env","log")
declare function log(msg:string):void

export function main():void{
    let temp="I'm a ASR global"
    log(temp)
}

export function __set_heap(offset:usize):void{
    //@ts-ignore
    __heap_base=offset
}