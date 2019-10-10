// declare imports that will be required and put them into the asr namespace
@global @external("env","__alloc")
export declare function __alloc(size: usize, id: u32): usize;
@global @external("env","__realloc")
export declare function __realloc(ref: usize, size: usize): usize;
@global @external("env","__free")
export declare function __free(ref: usize): void;
@global @external("env","__retain")
export declare function __retain(ref: usize): usize;
@global @external("env","__release")
export declare function __release(ref: usize): void;
@global @external("env","__collect")
export declare function __collect(): void;
@global @external("env","__visit")
export declare function __visit(ref: usize, cookie: i32): void;
