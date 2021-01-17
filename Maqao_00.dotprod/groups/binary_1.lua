_group = {
  {
    group_size = 1,
    pattern = "L",
    opcodes = "MOVSD,",
    offsets = "476,",
    addresses = "0x7bc,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "S",
    opcodes = "MOVSD,",
    offsets = "0,",
    addresses = "0x7c4,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 5,
    pattern = "LLLLS",
    opcodes = "MOV,CMP,MOV,MOV,ADD,",
    offsets = "-8,-32,-8,-24,-8,",
    addresses = "0x7cd,0x7d1,0x7a9,0x7b5,0x7c8,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 40,
    accessed_memory_nooverlap = 24,
    accessed_memory_overlap = 16,
    span = 32,
    head = 0,
    unroll_factor = 1,
  },
}
