// import "rt/index-full";
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
// @global @external("env","__rtti_base ")
// export declare const __rtti_base:usize;
// @global @external("env","__typeinfo ")
// export declare function __typeinfo(id: u32): u32;
// @global @external("env","__instanceof ")
// export declare function __instanceof(ref: usize, superId: u32): bool;
@global @external("env","__visit")
export declare function __visit(ref: usize, cookie: i32): void;
// @global @external("env","__visit_globals ")
// export declare function __visit_globals(cookie: u32): void;
// @global @external("env","__visit_members ")
// export declare function __visit_members(ref: usize, cookie: u32): void;
// @global @external("env","__allocArray ")
// export declare function __allocArray(length: i32, alignLog2: usize, id: u32, data?: usize): usize;
// @global @external("env","ASC_RTRACE ")
// export declare const ASC_RTRACE: boolean;
