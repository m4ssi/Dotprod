_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "8 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 64 FP arithmetical operations:\n - 32: addition or subtraction\n - 32: multiply\nThe binary loop is loading 512 bytes (64 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 8b2\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------\nVMOVAPD (%RBX,%R11,1),%YMM10               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD (%R12,%R11,1),%YMM10,%YMM9     | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nADD $0x8,%RCX                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVAPD 0x20(%RBX,%R11,1),%YMM11           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x20(%R12,%R11,1),%YMM11,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x40(%RBX,%R11,1),%YMM12           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x40(%R12,%R11,1),%YMM12,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x60(%RBX,%R11,1),%YMM13           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x60(%R12,%R11,1),%YMM13,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x80(%RBX,%R11,1),%YMM14           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x80(%R12,%R11,1),%YMM14,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xa0(%RBX,%R11,1),%YMM15           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xa0(%R12,%R11,1),%YMM15,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xc0(%RBX,%R11,1),%YMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xc0(%R12,%R11,1),%YMM0,%YMM9  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xe0(%RBX,%R11,1),%YMM2            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xe0(%R12,%R11,1),%YMM2,%YMM9  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nADD $0x100,%R11                            | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RAX,%RCX                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 8b2 <main+0x1f2>                        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 20\nnb uops            : 19\nloop length        : 154\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 9\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 6.75 cycles\nfront end            : 6.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 4.00 | 8.00 | 8.00 | 0.00 | 1.50 | 1.50 | 0.00\ncycles | 4.00 | 4.00 | 8.00 | 8.00 | 0.00 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 40.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 6.75\nDispatch  : 8.00\nData deps.: 40.00\nOverall L1: 40.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 40.00 cycles. At this rate:\n - 20% of peak load performance is reached (12.80 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "10% of peak computational performance is used (1.60 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is fully vectorized, using full register length.\n",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 32 FMA (fused multiply-add) operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "8 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 64 FP arithmetical operations:\n - 32: addition or subtraction\n - 32: multiply\nThe binary loop is loading 512 bytes (64 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 8b2\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------\nVMOVAPD (%RBX,%R11,1),%YMM10               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD (%R12,%R11,1),%YMM10,%YMM9     | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nADD $0x8,%RCX                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVAPD 0x20(%RBX,%R11,1),%YMM11           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x20(%R12,%R11,1),%YMM11,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x40(%RBX,%R11,1),%YMM12           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x40(%R12,%R11,1),%YMM12,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x60(%RBX,%R11,1),%YMM13           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x60(%R12,%R11,1),%YMM13,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0x80(%RBX,%R11,1),%YMM14           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0x80(%R12,%R11,1),%YMM14,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xa0(%RBX,%R11,1),%YMM15           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xa0(%R12,%R11,1),%YMM15,%YMM9 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xc0(%RBX,%R11,1),%YMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xc0(%R12,%R11,1),%YMM0,%YMM9  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVMOVAPD 0xe0(%RBX,%R11,1),%YMM2            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PD 0xe0(%R12,%R11,1),%YMM2,%YMM9  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nADD $0x100,%R11                            | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RAX,%RCX                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 8b2 <main+0x1f2>                        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 20\nnb uops            : 19\nloop length        : 154\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 9\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 6.75 cycles\nfront end            : 6.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 4.00 | 8.00 | 8.00 | 0.00 | 1.50 | 1.50 | 0.00\ncycles | 4.00 | 4.00 | 8.00 | 8.00 | 0.00 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 40.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 6.75\nDispatch  : 8.00\nData deps.: 40.00\nOverall L1: 40.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 40.00 cycles. At this rate:\n - 20% of peak load performance is reached (12.80 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "10% of peak computational performance is used (1.60 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is fully vectorized, using full register length.\n",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 32 FMA (fused multiply-add) operations.",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /home/m4ssi/Documents/Test/Dotprod/03.dotprod.c:7.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
