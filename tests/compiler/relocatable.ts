const someStaticStuff: i32[] = [0];

someStaticStuff;

@external("env","log")
declare function log<T>(obj:T,length:i32):void
@external("env","checkPtr")
declare function checkPtr<T>(obj:T):void
const test1="relocatable"
export function main():void{
    someStaticStuff[0]=1
    checkPtr(someStaticStuff)
    log(test1,test1.length)
    const test2="relocatable"    
    log(test2,test2.length)
    let test3=String.UTF16.encode(test2)
    log(test3,test2.length)
}