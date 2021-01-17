_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = " - VMOVUPD: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 8 optimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 32 FP arithmetical operations:\n - 16: addition or subtraction\n - 16: multiply\nThe binary loop is loading 256 bytes (32 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 738\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------\nVMOVUPD (%RAX),%YMM5           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD (%RCX),%YMM12          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x1,%R14                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nSUB $-0x80,%RCX                | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVUPD 0x20(%RAX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD 0x40(%RAX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSUB $-0x80,%RAX                | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVUPD -0x20(%RAX),%YMM2      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD -0x60(%RCX),%YMM13     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKLPD %YMM4,%YMM5,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM4,%YMM5,%YMM6    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVUPD -0x40(%RCX),%YMM11     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD -0x20(%RCX),%YMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKLPD %YMM2,%YMM3,%YMM7    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM2,%YMM3,%YMM10   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM13,%YMM12,%YMM3  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM13,%YMM12,%YMM2  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM4,%YMM11,%YMM12  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM10,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM6,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM3,%YMM1     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM4,%YMM11,%YMM6   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM12,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM2,%YMM10    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM7,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM3,%YMM10,%YMM11  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM6,%YMM7     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM5,%YMM15,%YMM6   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM7,%YMM1,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM11,%YMM2    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM6,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM13,%YMM4    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM0,%YMM14,%YMM11  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMULPD %YMM12,%YMM2,%YMM13     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM5,%YMM15,%YMM15  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM3,%YMM10,%YMM10  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM11,%YMM6    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM15,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM10,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM7,%YMM1,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM0,%YMM14,%YMM14  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM1,%YMM7     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM14,%YMM0    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVFMADD132PD %YMM4,%YMM13,%YMM6 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVMULPD %YMM3,%YMM5,%YMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD132PD %YMM7,%YMM4,%YMM0  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM0,%YMM6,%YMM2       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVADDPD %YMM2,%YMM8,%YMM8       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %RDX,%R14                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 738 <main+0xe8>             | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 51\nnb uops            : 50\nloop length        : 248\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 15\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 12.50 cycles\nfront end            : 12.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 3.50 | 3.25 | 4.00 | 4.00 | 0.00 | 32.00 | 3.25 | 0.00\ncycles | 3.50 | 3.25 | 4.00 | 4.00 | 0.00 | 32.00 | 3.25 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.50\nDispatch  : 32.00\nData deps.: 3.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 82%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 76%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 12% of peak load performance is reached (8.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "6% of peak computational performance is used (1.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 82% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 24.00 cycles (1.33x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 8 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = " - VMOVUPD: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 8 optimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 32 FP arithmetical operations:\n - 16: addition or subtraction\n - 16: multiply\nThe binary loop is loading 256 bytes (32 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 738\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------\nVMOVUPD (%RAX),%YMM5           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD (%RCX),%YMM12          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x1,%R14                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nSUB $-0x80,%RCX                | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVUPD 0x20(%RAX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD 0x40(%RAX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nSUB $-0x80,%RAX                | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVUPD -0x20(%RAX),%YMM2      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD -0x60(%RCX),%YMM13     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKLPD %YMM4,%YMM5,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM4,%YMM5,%YMM6    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVUPD -0x40(%RCX),%YMM11     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVUPD -0x20(%RCX),%YMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKLPD %YMM2,%YMM3,%YMM7    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM2,%YMM3,%YMM10   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM13,%YMM12,%YMM3  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM13,%YMM12,%YMM2  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM4,%YMM11,%YMM12  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM10,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM6,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM3,%YMM1     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM4,%YMM11,%YMM6   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM12,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM2,%YMM10    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM7,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM3,%YMM10,%YMM11  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM6,%YMM7     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM5,%YMM15,%YMM6   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM7,%YMM1,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM11,%YMM2    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM6,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM13,%YMM4    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM0,%YMM14,%YMM11  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMULPD %YMM12,%YMM2,%YMM13     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM5,%YMM15,%YMM15  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM3,%YMM10,%YMM10  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM11,%YMM6    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM15,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM10,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM7,%YMM1,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKHPD %YMM0,%YMM14,%YMM14  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM1,%YMM7     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM14,%YMM0    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVFMADD132PD %YMM4,%YMM13,%YMM6 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVMULPD %YMM3,%YMM5,%YMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD132PD %YMM7,%YMM4,%YMM0  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM0,%YMM6,%YMM2       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVADDPD %YMM2,%YMM8,%YMM8       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %RDX,%R14                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 738 <main+0xe8>             | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 51\nnb uops            : 50\nloop length        : 248\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 15\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 12.50 cycles\nfront end            : 12.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 3.50 | 3.25 | 4.00 | 4.00 | 0.00 | 32.00 | 3.25 | 0.00\ncycles | 3.50 | 3.25 | 4.00 | 4.00 | 0.00 | 32.00 | 3.25 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.50\nDispatch  : 32.00\nData deps.: 3.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 82%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 76%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 12% of peak load performance is reached (8.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "6% of peak computational performance is used (1.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 82% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 24.00 cycles (1.33x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 8 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /home/m4ssi/Documents/Test/Dotprod/01.dotprod.c:7-10.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
