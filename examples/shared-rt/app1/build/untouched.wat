(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (import "env" "memory" (memory $0 1))
 (data (global.get $__memory_base) "\00\00\00\00\00\00\00\00\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00a\00p\00p\001\00 \00g\00l\00o\00b\00a\00l\00\00\00@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00t\00h\00i\00s\00 \00i\00s\00 \00a\00n\00o\00t\00h\00e\00r\00 \00g\00l\00o\00b\00a\00l\00 \00f\00r\00o\00m\00 \00a\00p\00p\001\00")
 (import "env" "memory_base" (global $__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "__retain" (func $~lib/rt/index-import/__retain (param i32) (result i32)))
 (import "env" "log" (func $app1/assembly/index/log (param i32)))
 (import "env" "__release" (func $~lib/rt/index-import/__release (param i32)))
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $__memory_size i32 (i32.const 128))
 (global $__table_size i32 (i32.const 1))
 (export "memory" (memory $0))
 (export "main" (func $app1/assembly/index/main))
 (export "__memory_size" (global $__memory_size))
 (export "__table_size" (global $__table_size))
 (func $app1/assembly/index/main (; 3 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 24
  call $~lib/rt/index-import/__retain
  local.set $0
  i32.const 64
  call $~lib/rt/index-import/__retain
  local.set $1
  local.get $0
  call $app1/assembly/index/log
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $1
  call $~lib/rt/index-import/__release
 )
 (func $null (; 4 ;) (type $FUNCSIG$v)
 )
)
