(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "memory" (memory $0 1))
 (data (global.get $~lib/relocatable/__memory_base) "\00\00\00\00\00\00\00\00\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00a\00p\00p\002\00\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00a\00p\00p\002\00 \00s\00t\00a\00t\00i\00c\00\00\00\0c\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00H\00e\00l\00l\00o\00 \00\00\00\00\00\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00n\00u\00l\00l\00\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00 \00I\00\'\00m\00 \00")
 (import "env" "memory_base" (global $~lib/relocatable/__memory_base i32))
 (import "env" "table_base" (global $__table_base i32))
 (import "env" "__alloc" (func $~lib/rt/index-import/__alloc (param i32 i32) (result i32)))
 (import "env" "__realloc" (func $~lib/rt/index-import/__realloc (param i32 i32) (result i32)))
 (import "env" "__free" (func $~lib/rt/index-import/__free (param i32)))
 (import "env" "__retain" (func $~lib/rt/index-import/__retain (param i32) (result i32)))
 (import "env" "__release" (func $~lib/rt/index-import/__release (param i32)))
 (import "env" "__collect" (func $~lib/rt/index-import/__collect))
 (import "env" "__visit" (func $~lib/rt/index-import/__visit (param i32 i32)))
 (import "env" "log" (func $app2/assembly/index/log (param i32)))
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/heap/__heap_base (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base (mut i32) (i32.const 0))
 (global $app2/assembly/index/myName (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $__memory_size i32 (i32.const 176))
 (global $__table_size i32 (i32.const 1))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/index-import/__alloc))
 (export "__realloc" (func $~lib/rt/index-import/__realloc))
 (export "__free" (func $~lib/rt/index-import/__free))
 (export "__retain" (func $~lib/rt/index-import/__retain))
 (export "__release" (func $~lib/rt/index-import/__release))
 (export "__collect" (func $~lib/rt/index-import/__collect))
 (export "__visit" (func $~lib/rt/index-import/__visit))
 (export "sayHello" (func $app2/assembly/index/sayHello))
 (export "__memory_size" (global $__memory_size))
 (export "__table_size" (global $__table_size))
 (start $start)
 (func $start:app2/assembly/index (; 8 ;) (type $FUNCSIG$v)
  global.get $~lib/relocatable/__memory_base
  i32.const 24
  i32.add
  call $~lib/rt/index-import/__retain
  global.set $app2/assembly/index/myName
 )
 (func $~lib/string/String#get:length (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/memory/memcpy (; 10 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $break|0
   loop $continue|0
    local.get $2
    if (result i32)
     local.get $1
     i32.const 3
     i32.and
    else
     i32.const 0
    end
    i32.eqz
    br_if $break|0
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $continue|0
   end
   unreachable
  end
  local.get $0
  i32.const 3
  i32.and
  i32.const 0
  i32.eq
  if
   block $break|1
    loop $continue|1
     local.get $2
     i32.const 16
     i32.ge_u
     i32.eqz
     br_if $break|1
     local.get $0
     local.get $1
     i32.load
     i32.store
     local.get $0
     i32.const 4
     i32.add
     local.get $1
     i32.const 4
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 8
     i32.add
     local.get $1
     i32.const 8
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 12
     i32.add
     local.get $1
     i32.const 12
     i32.add
     i32.load
     i32.store
     local.get $1
     i32.const 16
     i32.add
     local.set $1
     local.get $0
     i32.const 16
     i32.add
     local.set $0
     local.get $2
     i32.const 16
     i32.sub
     local.set $2
     br $continue|1
    end
    unreachable
   end
   local.get $2
   i32.const 8
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.get $1
    i32.const 4
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 8
    i32.add
    local.set $0
    local.get $1
    i32.const 8
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 4
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $1
    i32.const 4
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 2
   i32.and
   if
    local.get $0
    local.get $1
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 1
   i32.and
   if
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
   end
   return
  end
  local.get $2
  i32.const 32
  i32.ge_u
  if
   block $break|2
    block $case2|2
     block $case1|2
      block $case0|2
       local.get $0
       i32.const 3
       i32.and
       local.set $5
       local.get $5
       i32.const 1
       i32.eq
       br_if $case0|2
       local.get $5
       i32.const 2
       i32.eq
       br_if $case1|2
       local.get $5
       i32.const 3
       i32.eq
       br_if $case2|2
       br $break|2
      end
      local.get $1
      i32.load
      local.set $3
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $2
      i32.const 3
      i32.sub
      local.set $2
      block $break|3
       loop $continue|3
        local.get $2
        i32.const 17
        i32.ge_u
        i32.eqz
        br_if $break|3
        local.get $1
        i32.const 1
        i32.add
        i32.load
        local.set $4
        local.get $0
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 5
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 4
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 9
        i32.add
        i32.load
        local.set $4
        local.get $0
        i32.const 8
        i32.add
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 13
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 12
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 16
        i32.add
        local.set $1
        local.get $0
        i32.const 16
        i32.add
        local.set $0
        local.get $2
        i32.const 16
        i32.sub
        local.set $2
        br $continue|3
       end
       unreachable
      end
      br $break|2
     end
     local.get $1
     i32.load
     local.set $3
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $2
     i32.const 2
     i32.sub
     local.set $2
     block $break|4
      loop $continue|4
       local.get $2
       i32.const 18
       i32.ge_u
       i32.eqz
       br_if $break|4
       local.get $1
       i32.const 2
       i32.add
       i32.load
       local.set $4
       local.get $0
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 6
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 4
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 10
       i32.add
       i32.load
       local.set $4
       local.get $0
       i32.const 8
       i32.add
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 14
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 12
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 16
       i32.add
       local.set $1
       local.get $0
       i32.const 16
       i32.add
       local.set $0
       local.get $2
       i32.const 16
       i32.sub
       local.set $2
       br $continue|4
      end
      unreachable
     end
     br $break|2
    end
    local.get $1
    i32.load
    local.set $3
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    block $break|5
     loop $continue|5
      local.get $2
      i32.const 19
      i32.ge_u
      i32.eqz
      br_if $break|5
      local.get $1
      i32.const 3
      i32.add
      i32.load
      local.set $4
      local.get $0
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 7
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 4
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 11
      i32.add
      i32.load
      local.set $4
      local.get $0
      i32.const 8
      i32.add
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 15
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 12
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 16
      i32.add
      local.set $1
      local.get $0
      i32.const 16
      i32.add
      local.set $0
      local.get $2
      i32.const 16
      i32.sub
      local.set $2
      br $continue|5
     end
     unreachable
    end
    br $break|2
   end
  end
  local.get $2
  i32.const 16
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 8
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 4
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
 )
 (func $~lib/memory/memory.copy (; 11 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $5
   local.get $4
   i32.eq
   if
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $4
   local.get $3
   i32.add
   local.get $5
   i32.le_u
   if (result i32)
    i32.const 1
   else
    local.get $5
    local.get $3
    i32.add
    local.get $4
    i32.le_u
   end
   if
    local.get $5
    local.get $4
    local.get $3
    call $~lib/util/memory/memcpy
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $5
   local.get $4
   i32.lt_u
   if
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|0
      loop $continue|0
       local.get $5
       i32.const 7
       i32.and
       i32.eqz
       br_if $break|0
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       local.get $5
       local.tee $6
       i32.const 1
       i32.add
       local.set $5
       local.get $6
       local.get $4
       local.tee $6
       i32.const 1
       i32.add
       local.set $4
       local.get $6
       i32.load8_u
       i32.store8
       br $continue|0
      end
      unreachable
     end
     block $break|1
      loop $continue|1
       local.get $3
       i32.const 8
       i32.ge_u
       i32.eqz
       br_if $break|1
       local.get $5
       local.get $4
       i64.load
       i64.store
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       i32.const 8
       i32.add
       local.set $5
       local.get $4
       i32.const 8
       i32.add
       local.set $4
       br $continue|1
      end
      unreachable
     end
    end
    block $break|2
     loop $continue|2
      local.get $3
      i32.eqz
      br_if $break|2
      local.get $5
      local.tee $6
      i32.const 1
      i32.add
      local.set $5
      local.get $6
      local.get $4
      local.tee $6
      i32.const 1
      i32.add
      local.set $4
      local.get $6
      i32.load8_u
      i32.store8
      local.get $3
      i32.const 1
      i32.sub
      local.set $3
      br $continue|2
     end
     unreachable
    end
   else
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|3
      loop $continue|3
       local.get $5
       local.get $3
       i32.add
       i32.const 7
       i32.and
       i32.eqz
       br_if $break|3
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $5
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.add
       local.get $4
       local.get $3
       i32.add
       i32.load8_u
       i32.store8
       br $continue|3
      end
      unreachable
     end
     block $break|4
      loop $continue|4
       local.get $3
       i32.const 8
       i32.ge_u
       i32.eqz
       br_if $break|4
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       local.get $3
       i32.add
       local.get $4
       local.get $3
       i32.add
       i64.load
       i64.store
       br $continue|4
      end
      unreachable
     end
    end
    block $break|5
     loop $continue|5
      local.get $3
      i32.eqz
      br_if $break|5
      local.get $5
      local.get $3
      i32.const 1
      i32.sub
      local.tee $3
      i32.add
      local.get $4
      local.get $3
      i32.add
      i32.load8_u
      i32.store8
      br $continue|5
     end
     unreachable
    end
   end
  end
 )
 (func $~lib/string/String#concat (; 12 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  call $~lib/rt/index-import/__retain
  drop
  local.get $1
  i32.const 0
  i32.eq
  if
   global.get $~lib/relocatable/__memory_base
   i32.const 120
   i32.add
   local.tee $2
   local.get $1
   local.tee $3
   i32.ne
   if
    local.get $2
    call $~lib/rt/index-import/__retain
    drop
    local.get $3
    call $~lib/rt/index-import/__release
   end
   local.get $2
   local.set $1
  end
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $4
  local.get $1
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $5
  local.get $4
  local.get $5
  i32.add
  local.set $6
  local.get $6
  i32.const 0
  i32.eq
  if
   global.get $~lib/relocatable/__memory_base
   i32.const 144
   i32.add
   call $~lib/rt/index-import/__retain
   local.set $2
   local.get $1
   call $~lib/rt/index-import/__release
   local.get $2
   return
  end
  local.get $6
  i32.const 1
  call $~lib/rt/index-import/__alloc
  call $~lib/rt/index-import/__retain
  local.set $7
  local.get $7
  local.get $0
  local.get $4
  call $~lib/memory/memory.copy
  local.get $7
  local.get $4
  i32.add
  local.get $1
  local.get $5
  call $~lib/memory/memory.copy
  local.get $7
  local.set $2
  local.get $1
  call $~lib/rt/index-import/__release
  local.get $2
 )
 (func $~lib/string/String.__concat (; 13 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/index-import/__retain
  drop
  local.get $1
  call $~lib/rt/index-import/__retain
  drop
  local.get $0
  global.get $~lib/relocatable/__memory_base
  i32.const 120
  i32.add
  local.get $0
  i32.const 0
  i32.ne
  select
  local.get $1
  call $~lib/string/String#concat
  local.set $2
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $1
  call $~lib/rt/index-import/__release
  local.get $2
 )
 (func $app2/assembly/index/sayHello (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $~lib/rt/index-import/__retain
  drop
  global.get $~lib/relocatable/__memory_base
  i32.const 48
  i32.add
  call $~lib/rt/index-import/__retain
  local.set $1
  local.get $1
  call $app2/assembly/index/log
  local.get $0
  call $app2/assembly/index/log
  global.get $~lib/relocatable/__memory_base
  i32.const 88
  i32.add
  local.get $0
  call $~lib/string/String.__concat
  local.tee $2
  global.get $~lib/relocatable/__memory_base
  i32.const 160
  i32.add
  call $~lib/string/String.__concat
  local.tee $3
  global.get $app2/assembly/index/myName
  call $~lib/string/String.__concat
  local.tee $4
  call $~lib/rt/index-import/__retain
  local.set $5
  local.get $1
  call $~lib/rt/index-import/__release
  local.get $2
  call $~lib/rt/index-import/__release
  local.get $3
  call $~lib/rt/index-import/__release
  local.get $4
  call $~lib/rt/index-import/__release
  local.get $0
  call $~lib/rt/index-import/__release
  local.get $5
 )
 (func $start (; 15 ;) (type $FUNCSIG$v)
  call $start:app2/assembly/index
 )
 (func $null (; 16 ;) (type $FUNCSIG$v)
 )
)
