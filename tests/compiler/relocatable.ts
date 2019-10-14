const staticString = "42";
const staticArray: i32[] = [ 42 ];
const staticFunction = (): i32 => { return 42; };

@external("env", "memory_base")
export declare const __memory_base: usize;
@external("env", "table_base")
export declare const __table_base: usize;

@external("env","offset")
declare function offset<T>(s:T):void

@external("peer","sayHello")
declare function peerHello(s:string):void

// stored internal pointers are zero-based
// assert(changetype<usize>(staticString) < __memory_base);
// assert(changetype<usize>(staticArray) < __memory_base);
// assert(changetype<u32>(staticFunction) < __table_base);

assert(staticString == "42");
assert(staticArray[0] == 42);
assert(staticFunction() == 42);

var normalArray: i32[] = [ 43 ];
assert(normalArray[0] == 43);
export function main():void{
    let t="hello"
    offset(t)
    offset(__memory_base)
    peerHello(t)
}

export function sayHello(s:string):void{
    offset(s)
    offset(__memory_base)
    assert(changetype<usize>(s)<__memory_base) //assert that it is from other memory
    assert(s=="hello") //make sure we got the message
}