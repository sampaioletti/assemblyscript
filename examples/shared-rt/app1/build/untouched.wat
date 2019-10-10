(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "env" "memory" (memory $0 1))
 (data (global.get $~lib/relocatable/__memory_base) "\00\00\00\00\00\00\00\00\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00a\00p\00p\001\00\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00a\00p\00p\001\00 \00s\00t\00a\00t\00i\00c\00")
 (import "env" "memory_base" (global $~lib/relocatable/__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "__alloc" (func $~lib/rt/index-import/__alloc (param i32 i32) (result i32)))
 (import "env" "__realloc" (func $~lib/rt/index-import/__realloc (param i32 i32) (result i32)))
 (import "env" "__free" (func $~lib/rt/index-import/__free (param i32)))
 (import "env" "__retain" (func $~lib/rt/index-import/__retain (param i32) (result i32)))
 (import "env" "__release" (func $~lib/rt/index-import/__release (param i32)))
 (import "env" "__collect" (func $~lib/rt/index-import/__collect))
 (import "env" "__visit" (func $~lib/rt/index-import/__visit (param i32 i32)))
 (import "env" "log" (func $app1/assembly/index/log (param i32)))
 (import "app2" "sayHello" (func $app1/assembly/index/sayHello (param i32) (result i32)))
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/heap/__heap_base (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base (mut i32) (i32.const 0))
 (global $app1/assembly/index/name (mut i32) (i32.const 0))
 (global $__memory_size i32 (i32.const 80))
 (global $__table_size i32 (i32.const 1))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/index-import/__alloc))
 (export "__realloc" (func $~lib/rt/index-import/__realloc))
 (export "__free" (func $~lib/rt/index-import/__free))
 (export "__retain" (func $~lib/rt/index-import/__retain))
 (export "__release" (func $~lib/rt/index-import/__release))
 (export "__collect" (func $~lib/rt/index-import/__collect))
 (export "__visit" (func $~lib/rt/index-import/__visit))
 (export "main" (func $app1/assembly/index/main))
 (export "__memory_size" (global $__memory_size))
 (export "__table_size" (global $__table_size))
 (start $start)
 (func $start:app1/assembly/index (; 9 ;) (type $FUNCSIG$v)
  global.get $~lib/relocatable/__memory_base
  i32.const 24
  i32.add
  call $~lib/rt/index-import/__retain
  global.set $app1/assembly/index/name
 )
 (func $app1/assembly/index/main (; 10 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/relocatable/__memory_base
  i32.const 48
  i32.add
  call $~lib/rt/index-import/__retain
  local.set $0
  local.get $0
  call $app1/assembly/index/log
  global.get $app1/assembly/index/name
  call $app1/assembly/index/sayHello
  local.set $1
  local.get $1
  call $app1/assembly/index/log
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $1
  call $~lib/rt/index-import/__release
 )
 (func $start (; 11 ;) (type $FUNCSIG$v)
  call $start:app1/assembly/index
 )
 (func $null (; 12 ;) (type $FUNCSIG$v)
 )
)
