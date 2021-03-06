_group = {
  {
    group_size = 8,
    pattern = "LLLLLLLL",
    opcodes = "VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,",
    offsets = "-256,-224,-192,-160,-96,-128,-64,-32,",
    addresses = "0x97a,0x982,0x9b7,0x9c5,0xa0f,0xa31,0xa48,0xa8f,",
    stride_status = "Success",
    stride = 256,
    memory_status = "Success",
    accessed_memory = 256,
    accessed_memory_nooverlap = 256,
    accessed_memory_overlap = 0,
    span = 256,
    head = 256,
    unroll_factor = 1,
  },
  {
    group_size = 6,
    pattern = "LLLLLL",
    opcodes = "VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,VMOVAPD,",
    offsets = "-192,-160,-96,-128,-32,-64,",
    addresses = "0x999,0x9a1,0x9e6,0x9fb,0xa43,0xa66,",
    stride_status = "Success",
    stride = 256,
    memory_status = "Success",
    accessed_memory = 192,
    accessed_memory_nooverlap = 192,
    accessed_memory_overlap = 0,
    span = 192,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 2,
    pattern = "LL",
    opcodes = "VMOVAPD,VMOVAPD,",
    offsets = "0,32,",
    addresses = "0x966,0x96a,",
    stride_status = "Success",
    stride = 256,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 64,
    accessed_memory_overlap = 0,
    span = 64,
    head = 0,
    unroll_factor = 2,
  },
}
