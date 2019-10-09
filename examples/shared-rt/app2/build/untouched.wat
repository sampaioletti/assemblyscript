(module
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$v (func))
 (import "env" "memory" (memory $0 1))
 (data (global.get $__memory_base) "\00\00\00\00\00\00\00\00\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00a\00p\00p\002\00 \00g\00l\00o\00b\00a\00l\00\00\00@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00t\00h\00i\00s\00 \00i\00s\00 \00a\00n\00o\00t\00h\00e\00r\00 \00g\00l\00o\00b\00a\00l\00 \00f\00r\00o\00m\00 \00a\00p\00p\002\00")
 (import "env" "memory_base" (global $__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "__retain" (func $~lib/rt/index-import/__retain (param i32) (result i32)))
 (import "env" "__alloc" (func $~lib/rt/index-import/__alloc (param i32 i32) (result i32)))
 (import "env" "__release" (func $~lib/rt/index-import/__release (param i32)))
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $__memory_size i32 (i32.const 128))
 (global $__table_size i32 (i32.const 1))
 (export "memory" (memory $0))
 (export "addMessage" (func $app2/assembly/index/addMessage))
 (export "__memory_size" (global $__memory_size))
 (export "__table_size" (global $__table_size))
 (func $~lib/string/String.fromCharCode (; 3 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/string/String.fromCharCode|trampoline (; 4 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $app2/assembly/index/addMessage (; 5 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/index-import/__retain
  drop
  i32.const 24
  call $~lib/rt/index-import/__retain
  local.set $1
  i32.const 64
  call $~lib/rt/index-import/__retain
  local.set $2
  i32.const 1
  global.set $~lib/argc
  i32.const 66
  i32.const 0
  call $~lib/string/String.fromCharCode|trampoline
  local.set $3
  local.get $3
  local.set $4
  local.get $1
  call $~lib/rt/index-import/__release
  local.get $2
  call $~lib/rt/index-import/__release
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $4
 )
 (func $null (; 6 ;) (type $FUNCSIG$v)
 )
)
