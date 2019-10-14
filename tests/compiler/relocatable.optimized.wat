(module
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (global.get $__memory_base) "\00\00\00\00\00\00\00\00\04\00\00\00\01\00\00\00\01\00\00\00\04\00\00\004\002\00\00\00\00\00\04\00\00\00\01\00\00\00\00\00\00\00\04\00\00\00*\00\00\00\00\00\00\00\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\000\00\00\000\00\00\00\04\00\00\00\01\00\00\00\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00r\00e\00l\00o\00c\00a\00t\00a\00b\00l\00e\00.\00t\00s\00\00\00\00\00$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00\04\00\00\00\01\00\00\00\00\00\00\00\04\00\00\00+\00\00\00\00\00\00\00\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\00\01\00\00\00\01\00\00\04\00\00\00\01\00\00\00\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00h\00e\00l\00l\00o\00")
 (import "env" "table" (table $0 2 funcref))
 (elem (global.get $__table_base) $null $start:relocatable~anonymous|0)
 (import "env" "memory_base" (global $__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "memory_base" (global $relocatable/__memory_base i32))
 (import "env" "table_base" (global $relocatable/__table_base i32))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "offset" (func $relocatable/offset<~lib/string/String> (param i32)))
 (import "peer" "sayHello" (func $relocatable/peerHello (param i32)))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $__memory_size i32 (i32.const 336))
 (global $__table_size i32 (i32.const 2))
 (export "__start" (func $start))
 (export "memory" (memory $0))
 (export "__memory_base" (global $relocatable/__memory_base))
 (export "__table_base" (global $relocatable/__table_base))
 (export "main" (func $relocatable/main))
 (export "sayHello" (func $relocatable/sayHello))
 (export "__memory_size" (global $__memory_size))
 (export "__table_size" (global $__table_size))
 (func $start:relocatable~anonymous|0 (; 3 ;) (type $FUNCSIG$i) (result i32)
  i32.const 42
 )
 (func $~lib/string/String#get:length (; 4 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  global.get $__memory_base
  local.get $0
  i32.const 16
  i32.sub
  i32.add
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/string/compareImpl (; 5 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.const 7
  i32.and
  local.get $1
  i32.const 7
  i32.and
  i32.or
  i32.eqz
  i32.const 0
  local.get $2
  i32.const 4
  i32.ge_u
  select
  if
   loop $continue|0
    global.get $__memory_base
    local.get $0
    i32.add
    i64.load
    global.get $__memory_base
    local.get $1
    i32.add
    i64.load
    i64.eq
    if
     local.get $0
     i32.const 8
     i32.add
     local.set $0
     local.get $1
     i32.const 8
     i32.add
     local.set $1
     local.get $2
     i32.const 4
     i32.sub
     local.tee $2
     i32.const 4
     i32.ge_u
     br_if $continue|0
    end
   end
  end
  loop $continue|1
   block $break|1
    local.get $2
    local.tee $3
    i32.const 1
    i32.sub
    local.set $2
    local.get $3
    i32.eqz
    br_if $break|1
    global.get $__memory_base
    local.get $0
    i32.add
    i32.load16_u
    local.tee $3
    global.get $__memory_base
    local.get $1
    i32.add
    i32.load16_u
    local.tee $4
    i32.ne
    if
     local.get $3
     local.get $4
     i32.sub
     return
    else
     local.get $0
     i32.const 2
     i32.add
     local.set $0
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $continue|1
    end
    unreachable
   end
  end
  i32.const 0
 )
 (func $~lib/string/String.__eq (; 6 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 1
   return
  end
  block $folding-inner0
   local.get $1
   i32.eqz
   i32.const 1
   local.get $0
   select
   br_if $folding-inner0
   local.get $0
   call $~lib/string/String#get:length
   local.tee $2
   local.get $1
   call $~lib/string/String#get:length
   i32.ne
   br_if $folding-inner0
   local.get $0
   local.get $1
   local.get $2
   call $~lib/util/string/compareImpl
   i32.eqz
   return
  end
  i32.const 0
 )
 (func $~lib/array/Array<i32>#__get (; 7 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  global.get $__memory_base
  local.get $0
  i32.add
  i32.load offset=12
  i32.ge_u
  if
   i32.const 152
   i32.const 208
   i32.const 92
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  global.get $__memory_base
  global.get $__memory_base
  local.get $0
  i32.add
  i32.load offset=4
  i32.add
  i32.load
 )
 (func $start:relocatable (; 8 ;) (type $FUNCSIG$v)
  i32.const 24
  i32.const 24
  call $~lib/string/String.__eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 21
   i32.const 0
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 72
  call $~lib/array/Array<i32>#__get
  i32.const 42
  i32.ne
  if
   i32.const 0
   i32.const 104
   i32.const 22
   i32.const 0
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 0
  global.set $~lib/argc
  global.get $__table_base
  i32.const 1
  i32.add
  call_indirect (type $FUNCSIG$i)
  i32.const 42
  i32.ne
  if
   i32.const 0
   i32.const 104
   i32.const 23
   i32.const 0
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 280
  call $~lib/array/Array<i32>#__get
  i32.const 43
  i32.ne
  if
   i32.const 0
   i32.const 104
   i32.const 26
   i32.const 0
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $relocatable/main (; 9 ;) (type $FUNCSIG$v)
  i32.const 312
  call $relocatable/offset<~lib/string/String>
  global.get $relocatable/__memory_base
  call $relocatable/offset<~lib/string/String>
  i32.const 312
  call $relocatable/peerHello
 )
 (func $relocatable/sayHello (; 10 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $relocatable/offset<~lib/string/String>
  global.get $relocatable/__memory_base
  call $relocatable/offset<~lib/string/String>
  local.get $0
  global.get $relocatable/__memory_base
  i32.ge_u
  if
   i32.const 0
   i32.const 104
   i32.const 37
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 312
  call $~lib/string/String.__eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start (; 11 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  if
   return
  else
   i32.const 1
   global.set $~lib/started
  end
  call $start:relocatable
 )
 (func $null (; 12 ;) (type $FUNCSIG$v)
  nop
 )
)
