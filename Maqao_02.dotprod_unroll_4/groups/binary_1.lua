_group = {
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVAPD,",
    offsets = "0,",
    addresses = "0x7ec,",
    stride_status = "Success",
    stride = 128,
    memory_status = "Success",
    accessed_memory = 32,
    accessed_memory_nooverlap = 32,
    accessed_memory_overlap = 0,
    span = 32,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 3,
    pattern = "LLL",
    opcodes = "VMOVAPD,VMOVAPD,VMOVAPD,",
    offsets = "-96,-64,-32,",
    addresses = "0x80b,0x818,0x81d,",
    stride_status = "Success",
    stride = 128,
    memory_status = "Success",
    accessed_memory = 96,
    accessed_memory_nooverlap = 96,
    accessed_memory_overlap = 0,
    span = 96,
    head = 0,
    unroll_factor = 3,
  },
  {
    group_size = 3,
    pattern = "LLL",
    opcodes = "VMOVAPD,VMOVAPD,VMOVAPD,",
    offsets = "0,64,96,",
    addresses = "0x7e8,0x7f8,0x7fd,",
    stride_status = "Success",
    stride = 128,
    memory_status = "Success",
    accessed_memory = 96,
    accessed_memory_nooverlap = 96,
    accessed_memory_overlap = 0,
    span = 128,
    head = 96,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVAPD,",
    offsets = "-96,",
    addresses = "0x806,",
    stride_status = "Success",
    stride = 128,
    memory_status = "Success",
    accessed_memory = 32,
    accessed_memory_nooverlap = 32,
    accessed_memory_overlap = 0,
    span = 32,
    head = 0,
    unroll_factor = 1,
  },
}
