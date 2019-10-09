(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.add
  (global.get $__memory_base)
  (i32.const 8)
 ) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00a\00p\00p\001\00 \00g\00l\00o\00b\00a\00l\00")
 (data (i32.add
  (global.get $__memory_base)
  (i32.const 48)
 ) "@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00t\00h\00i\00s\00 \00i\00s\00 \00a\00n\00o\00t\00h\00e\00r\00 \00g\00l\00o\00b\00a\00l\00 \00f\00r\00o\00m\00 \00a\00p\00p\001\00")
 (import "env" "memory_base" (global $__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "__alloc" (func $~lib/rt/index-import/__alloc (param i32 i32) (result i32)))
 (import "env" "__realloc" (func $~lib/rt/index-import/__realloc (param i32 i32) (result i32)))
 (import "env" "__free" (func $~lib/rt/index-import/__free (param i32)))
 (import "env" "__retain" (func $~lib/rt/index-import/__retain (param i32) (result i32)))
 (import "env" "__release" (func $~lib/rt/index-import/__release (param i32)))
 (import "env" "__collect" (func $~lib/rt/index-import/__collect))
 (import "env" "__visit" (func $~lib/rt/index-import/__visit (param i32 i32)))
 (import "env" "log" (func $app1/assembly/index/log (param i32 i32)))
 (import "app2" "addMessage" (func $app1/assembly/index/addMessage (param i32) (result i32)))
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $__memory_size i32 (i32.const 128))
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
 (func $~lib/string/String#get:length (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  global.get $__memory_base
  local.get $0
  i32.const 16
  i32.sub
  i32.add
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String.fromCharCode (; 10 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 0
  i32.gt_s
  local.set $2
  i32.const 2
  local.get $2
  i32.shl
  i32.const 1
  call $~lib/rt/index-import/__alloc
  local.set $3
  global.get $__memory_base
  local.get $3
  i32.add
  local.get $0
  i32.store16
  local.get $2
  if
   global.get $__memory_base
   local.get $3
   i32.add
   local.get $1
   i32.store16 offset=2
  end
  local.get $3
  call $~lib/rt/index-import/__retain
 )
 (func $~lib/string/String.fromCharCode|trampoline (; 11 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~lib/argc
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $1
  end
  local.get $0
  local.get $1
  call $~lib/string/String.fromCharCode
 )
 (func $app1/assembly/index/main (; 12 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 24
  call $~lib/rt/index-import/__retain
  local.set $0
  i32.const 64
  call $~lib/rt/index-import/__retain
  local.set $1
  local.get $0
  local.get $0
  call $~lib/string/String#get:length
  call $app1/assembly/index/log
  i32.const 1
  global.set $~lib/argc
  i32.const 65
  i32.const 0
  call $~lib/string/String.fromCharCode|trampoline
  local.set $2
  local.get $2
  local.get $2
  call $~lib/string/String#get:length
  call $app1/assembly/index/log
  local.get $2
  call $app1/assembly/index/addMessage
  local.set $3
  local.get $3
  local.get $3
  call $~lib/string/String#get:length
  call $app1/assembly/index/log
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $1
  call $~lib/rt/index-import/__release
  local.get $2
  call $~lib/rt/index-import/__release
  local.get $3
  call $~lib/rt/index-import/__release
 )
 (func $null (; 13 ;) (type $FUNCSIG$v)
 )
)
