_group = {
  {
    group_size = 3,
    pattern = "LLL",
    opcodes = "VMOVUPD,VMOVUPD,VMOVUPD,",
    offsets = "-96,-64,-32,",
    addresses = "0x75b,0x768,0x76d,",
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
    opcodes = "VMOVUPD,VMOVUPD,VMOVUPD,",
    offsets = "0,32,64,",
    addresses = "0x738,0x748,0x74d,",
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
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVUPD,",
    offsets = "0,",
    addresses = "0x73c,",
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
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVUPD,",
    offsets = "-32,",
    addresses = "0x756,",
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