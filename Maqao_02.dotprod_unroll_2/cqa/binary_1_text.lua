_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 64 FP arithmetical operations:\n - 32: addition or subtraction\n - 32: multiply\nThe binary loop is loading 512 bytes (64 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 966\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------\nVMOVAPD (%RDX),%YMM15           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD 0x20(%RDX),%YMM4        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x4,%RSI                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x100,%RCX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVAPD -0x100(%RCX),%YMM9      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0xe0(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x100,%RDX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVUNPCKHPD %YMM4,%YMM15,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM4,%YMM15,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0xc0(%RDX),%YMM15      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0xa0(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM2,%YMM9,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM3,%YMM10     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM2,%YMM9,%YMM13    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0xc0(%RCX),%YMM9       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM6,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0xa0(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM13,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM5      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM11,%YMM10,%YMM12     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM4,%YMM15,%YMM10   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM4,%YMM15,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x60(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM2,%YMM9,%YMM11    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM10,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM3      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0x80(%RDX),%YMM1       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD132PD %YMM14,%YMM12,%YMM5 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM11,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM2,%YMM9,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x60(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMULPD %YMM12,%YMM6,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM14,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM4,%YMM1,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM6,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVADDPD %YMM5,%YMM0,%YMM0        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVMOVAPD %YMM3,%YMM5             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVMOVAPD -0x80(%RCX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD132PD %YMM15,%YMM13,%YMM5 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM2,%YMM3,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM2,%YMM3,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x20(%RDX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0x40(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM12,%YMM13    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM13,%YMM11,%YMM14     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM5,%YMM0,%YMM9        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM4,%YMM1,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM15,%YMM5     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0x40(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM0,%YMM10     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM3,%YMM4,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM3,%YMM4,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVFMADD132PD %YMM5,%YMM14,%YMM10 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM6,%YMM12     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM0,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVADDPD %YMM10,%YMM9,%YMM9       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVMOVAPD -0x20(%RCX),%YMM10      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM10,%YMM2,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM10,%YMM2,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM13,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM5,%YMM1      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM14,%YMM12,%YMM15     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD132PD %YMM11,%YMM15,%YMM1 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM1,%YMM9,%YMM0        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %R9,%RSI                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 966 <main+0x2a6>             | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 66\nnb uops            : 65\nloop length        : 347\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 16.25 cycles\nfront end            : 16.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 6.00 | 6.00 | 8.00 | 8.00 | 0.00 | 32.00 | 4.00 | 0.00\ncycles | 6.00 | 6.00 | 8.00 | 8.00 | 0.00 | 32.00 | 4.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 12.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 16.25\nDispatch  : 32.00\nData deps.: 12.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 86%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 78%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "12% of peak computational performance is used (2.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 86% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 24.00 cycles (1.33x speedup).",
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
          txt = "Detected 16 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 64 FP arithmetical operations:\n - 32: addition or subtraction\n - 32: multiply\nThe binary loop is loading 512 bytes (64 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 966\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------\nVMOVAPD (%RDX),%YMM15           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD 0x20(%RDX),%YMM4        | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x4,%RSI                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nADD $0x100,%RCX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVMOVAPD -0x100(%RCX),%YMM9      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0xe0(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nADD $0x100,%RDX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nVUNPCKHPD %YMM4,%YMM15,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM4,%YMM15,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0xc0(%RDX),%YMM15      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0xa0(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM2,%YMM9,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM3,%YMM10     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM2,%YMM9,%YMM13    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0xc0(%RCX),%YMM9       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM6,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0xa0(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM13,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM5      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM11,%YMM10,%YMM12     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM4,%YMM15,%YMM10   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM4,%YMM15,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x60(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM2,%YMM9,%YMM11    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM10,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM1,%YMM3      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0x80(%RDX),%YMM1       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD132PD %YMM14,%YMM12,%YMM5 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM11,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM2,%YMM9,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x60(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMULPD %YMM12,%YMM6,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM14,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM4,%YMM1,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM6,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVADDPD %YMM5,%YMM0,%YMM0        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVMOVAPD %YMM3,%YMM5             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVMOVAPD -0x80(%RCX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVFMADD132PD %YMM15,%YMM13,%YMM5 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVUNPCKHPD %YMM2,%YMM3,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM2,%YMM3,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVAPD -0x20(%RDX),%YMM3       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVMOVAPD -0x40(%RCX),%YMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM12,%YMM13    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM13,%YMM11,%YMM14     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM5,%YMM0,%YMM9        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVUNPCKLPD %YMM4,%YMM1,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM15,%YMM5     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMOVAPD -0x40(%RDX),%YMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVPERMPD $-0x28,%YMM0,%YMM10     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVUNPCKHPD %YMM3,%YMM4,%YMM6     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM3,%YMM4,%YMM0     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVFMADD132PD %YMM5,%YMM14,%YMM10 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPERMPD $-0x28,%YMM6,%YMM12     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM0,%YMM11     | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVADDPD %YMM10,%YMM9,%YMM9       | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nVMOVAPD -0x20(%RCX),%YMM10      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 3       | 0.50\nVUNPCKHPD %YMM10,%YMM2,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVUNPCKLPD %YMM10,%YMM2,%YMM5    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPERMPD $-0x28,%YMM13,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPERMPD $-0x28,%YMM5,%YMM1      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMULPD %YMM14,%YMM12,%YMM15     | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD132PD %YMM11,%YMM15,%YMM1 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVADDPD %YMM1,%YMM9,%YMM0        | 1     | 0    | 1    | 0    | 0    | 0  | 0    | 0    | 0  | 3       | 1\nCMP %R9,%RSI                    | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJB 966 <main+0x2a6>             | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 66\nnb uops            : 65\nloop length        : 347\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 16.25 cycles\nfront end            : 16.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 6.00 | 6.00 | 8.00 | 8.00 | 0.00 | 32.00 | 4.00 | 0.00\ncycles | 6.00 | 6.00 | 8.00 | 8.00 | 0.00 | 32.00 | 4.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 12.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 16.25\nDispatch  : 32.00\nData deps.: 12.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 100%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 86%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 78%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "12% of peak computational performance is used (2.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 32 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 32) and use it instead of 'foo' in the loop.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 86% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 24.00 cycles (1.33x speedup).",
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
          txt = "Detected 16 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /home/m4ssi/Documents/Test/Dotprod/02.dotprod.c:7-8.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
