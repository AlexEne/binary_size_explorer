
simple_wasm_test_with_dwarf.wasm:	file format wasm 0x1
module name: <simple_wasm_test_with_dwarf.wasm>

Code Disassembly:

00020c func[4] <add>:
 00020d: 03 7f                      | local[2..4] type=i32
 00020f: 01 7e                      | local[5] type=i64
 000211: 06 7f                      | local[6..11] type=i32
 000213: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000219: 21 02                      | local.set 2
 00021b: 41 10                      | i32.const 16
 00021d: 21 03                      | local.set 3
 00021f: 20 02                      | local.get 2
 000221: 20 03                      | local.get 3
 000223: 6b                         | i32.sub
 000224: 21 04                      | local.set 4
 000226: 20 04                      | local.get 4
 000228: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00022e: 20 04                      | local.get 4
 000230: 20 00                      | local.get 0
 000232: 37 03 00                   | i64.store 3 0
 000235: 20 04                      | local.get 4
 000237: 20 01                      | local.get 1
 000239: 37 03 08                   | i64.store 3 8
 00023c: 20 00                      | local.get 0
 00023e: 20 01                      | local.get 1
 000240: 7c                         | i64.add
 000241: 21 05                      | local.set 5
 000243: 20 05                      | local.get 5
 000245: 20 00                      | local.get 0
 000247: 54                         | i64.lt_u
 000248: 21 06                      | local.set 6
 00024a: 41 01                      | i32.const 1
 00024c: 21 07                      | local.set 7
 00024e: 20 06                      | local.get 6
 000250: 20 07                      | local.get 7
 000252: 71                         | i32.and
 000253: 21 08                      | local.set 8
 000255: 02 40                      | block
 000257: 20 08                      |   local.get 8
 000259: 0d 00                      |   br_if 0
 00025b: 41 10                      |   i32.const 16
 00025d: 21 09                      |   local.set 9
 00025f: 20 04                      |   local.get 4
 000261: 20 09                      |   local.get 9
 000263: 6a                         |   i32.add
 000264: 21 0a                      |   local.set 10
 000266: 20 0a                      |   local.get 10
 000268: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 00026e: 20 05                      |   local.get 5
 000270: 0f                         |   return
 000271: 0b                         | end
 000272: 41 8c 80 c0 80 00          | i32.const 1048588
 000278: 21 0b                      | local.set 11
 00027a: 20 0b                      | local.get 11
 00027c: 10 94 81 80 80 00          | call 148 <_ZN4core9panicking11panic_const24panic_const_add_overflow17hed5b4e550c49fa6dE>
 000282: 00                         | unreachable
 000283: 0b                         | end
000285 func[5] <__rust_alloc>:
 000286: 01 7f                      | local[2] type=i32
 000288: 20 00                      | local.get 0
 00028a: 20 01                      | local.get 1
 00028c: 10 bf 80 80 80 00          | call 63 <__rdl_alloc>
 000292: 21 02                      | local.set 2
 000294: 20 02                      | local.get 2
 000296: 0f                         | return
 000297: 0b                         | end
000299 func[6] <__rust_dealloc>:
 00029a: 20 00                      | local.get 0
 00029c: 20 01                      | local.get 1
 00029e: 20 02                      | local.get 2
 0002a0: 10 c0 80 80 80 00          | call 64 <__rdl_dealloc>
 0002a6: 0f                         | return
 0002a7: 0b                         | end
0002a9 func[7] <__rust_realloc>:
 0002aa: 01 7f                      | local[4] type=i32
 0002ac: 20 00                      | local.get 0
 0002ae: 20 01                      | local.get 1
 0002b0: 20 02                      | local.get 2
 0002b2: 20 03                      | local.get 3
 0002b4: 10 c1 80 80 80 00          | call 65 <__rdl_realloc>
 0002ba: 21 04                      | local.set 4
 0002bc: 20 04                      | local.get 4
 0002be: 0f                         | return
 0002bf: 0b                         | end
0002c1 func[8] <__rust_alloc_error_handler>:
 0002c2: 20 00                      | local.get 0
 0002c4: 20 01                      | local.get 1
 0002c6: 10 d5 80 80 80 00          | call 85 <__rg_oom>
 0002cc: 0f                         | return
 0002cd: 0b                         | end
0002cf func[9] <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h3c46e9517ad8d839E>:
 0002d0: 20 00                      | local.get 0
 0002d2: 42 8d a8 ef c8 8e e6 e6 e9 | i64.const 7265321258250392589
 0002db: e4 00                      | 
 0002dd: 37 03 08                   | i64.store 3 8
 0002e0: 20 00                      | local.get 0
 0002e2: 42 f2 ae be aa e2 fb a4 c8 | i64.const 2058307612026312562
 0002eb: 1c                         | 
 0002ec: 37 03 00                   | i64.store 3 0
 0002ef: 0b                         | end
0002f1 func[10] <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hfd03f9ac812c0909E>:
 0002f2: 20 00                      | local.get 0
 0002f4: 42 ed ba ad b6 cd 85 d4 f5 | i64.const 7199936582794304877
 0002fd: e3 00                      | 
 0002ff: 37 03 08                   | i64.store 3 8
 000302: 20 00                      | local.get 0
 000304: 42 f8 82 99 bd 95 ee c6 c5 | i64.const 13369810092395217272
 00030d: b9 7f                      | 
 00030f: 37 03 00                   | i64.store 3 0
 000312: 0b                         | end
000314 func[11] <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfb64bc95fda84379E>:
 000315: 20 00                      | local.get 0
 000317: 28 02 00                   | i32.load 2 0
 00031a: 20 01                      | local.get 1
 00031c: 10 8f 81 80 80 00          | call 143 <_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hd7f80a1f6696b855E>
 000322: 0b                         | end
000324 func[12] <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3188ff9e5f3cd37cE>:
 000325: 20 00                      | local.get 0
 000327: 28 02 00                   | i32.load 2 0
 00032a: 20 00                      | local.get 0
 00032c: 28 02 04                   | i32.load 2 4
 00032f: 20 01                      | local.get 1
 000331: 10 90 81 80 80 00          | call 144 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17ha381131a80be27b3E>
 000337: 0b                         | end
00033a func[13] <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdb089f67cbc4c913E>:
 00033b: 03 7f                      | local[2..4] type=i32
 00033d: 01 7e                      | local[5] type=i64
 00033f: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000345: 41 30                      | i32.const 48
 000347: 6b                         | i32.sub
 000348: 22 02                      | local.tee 2
 00034a: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000350: 20 01                      | local.get 1
 000352: 28 02 20                   | i32.load 2 32
 000355: 21 03                      | local.set 3
 000357: 20 01                      | local.get 1
 000359: 28 02 1c                   | i32.load 2 28
 00035c: 21 04                      | local.set 4
 00035e: 20 00                      | local.get 0
 000360: 28 02 00                   | i32.load 2 0
 000363: 21 01                      | local.set 1
 000365: 20 02                      | local.get 2
 000367: 41 03                      | i32.const 3
 000369: 36 02 04                   | i32.store 2 4
 00036c: 20 02                      | local.get 2
 00036e: 41 e4 82 c0 80 00          | i32.const 1048932
 000374: 36 02 00                   | i32.store 2 0
 000377: 20 02                      | local.get 2
 000379: 42 03                      | i64.const 3
 00037b: 37 02 0c                   | i64.store 2 12
 00037e: 20 02                      | local.get 2
 000380: 41 81 80 80 80 00          | i32.const 1
 000386: ad                         | i64.extend_i32_u
 000387: 42 20                      | i64.const 32
 000389: 86                         | i64.shl
 00038a: 20 01                      | local.get 1
 00038c: ad                         | i64.extend_i32_u
 00038d: 84                         | i64.or
 00038e: 37 03 18                   | i64.store 3 24
 000391: 20 02                      | local.get 2
 000393: 41 82 80 80 80 00          | i32.const 2
 000399: ad                         | i64.extend_i32_u
 00039a: 42 20                      | i64.const 32
 00039c: 86                         | i64.shl
 00039d: 22 05                      | local.tee 5
 00039f: 20 01                      | local.get 1
 0003a1: 41 0c                      | i32.const 12
 0003a3: 6a                         | i32.add
 0003a4: ad                         | i64.extend_i32_u
 0003a5: 84                         | i64.or
 0003a6: 37 03 28                   | i64.store 3 40
 0003a9: 20 02                      | local.get 2
 0003ab: 20 05                      | local.get 5
 0003ad: 20 01                      | local.get 1
 0003af: 41 08                      | i32.const 8
 0003b1: 6a                         | i32.add
 0003b2: ad                         | i64.extend_i32_u
 0003b3: 84                         | i64.or
 0003b4: 37 03 20                   | i64.store 3 32
 0003b7: 20 02                      | local.get 2
 0003b9: 20 02                      | local.get 2
 0003bb: 41 18                      | i32.const 24
 0003bd: 6a                         | i32.add
 0003be: 36 02 08                   | i32.store 2 8
 0003c1: 20 04                      | local.get 4
 0003c3: 20 03                      | local.get 3
 0003c5: 20 02                      | local.get 2
 0003c7: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 0003cd: 21 01                      | local.set 1
 0003cf: 20 02                      | local.get 2
 0003d1: 41 30                      | i32.const 48
 0003d3: 6a                         | i32.add
 0003d4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0003da: 20 01                      | local.get 1
 0003dc: 0b                         | end
0003df func[14] <_ZN4core3fmt5Write10write_char17h33bbc8706c1ce782E>:
 0003e0: 01 7f                      | local[2] type=i32
 0003e2: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0003e8: 41 10                      | i32.const 16
 0003ea: 6b                         | i32.sub
 0003eb: 22 02                      | local.tee 2
 0003ed: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0003f3: 20 02                      | local.get 2
 0003f5: 41 00                      | i32.const 0
 0003f7: 36 02 0c                   | i32.store 2 12
 0003fa: 02 40                      | block
 0003fc: 02 40                      |   block
 0003fe: 20 01                      |     local.get 1
 000400: 41 80 01                   |     i32.const 128
 000403: 49                         |     i32.lt_u
 000404: 0d 00                      |     br_if 0
 000406: 02 40                      |     block
 000408: 20 01                      |       local.get 1
 00040a: 41 80 10                   |       i32.const 2048
 00040d: 49                         |       i32.lt_u
 00040e: 0d 00                      |       br_if 0
 000410: 02 40                      |       block
 000412: 20 01                      |         local.get 1
 000414: 41 80 80 04                |         i32.const 65536
 000418: 49                         |         i32.lt_u
 000419: 0d 00                      |         br_if 0
 00041b: 20 02                      |         local.get 2
 00041d: 20 01                      |         local.get 1
 00041f: 41 3f                      |         i32.const 63
 000421: 71                         |         i32.and
 000422: 41 80 01                   |         i32.const 128
 000425: 72                         |         i32.or
 000426: 3a 00 0f                   |         i32.store8 0 15
 000429: 20 02                      |         local.get 2
 00042b: 20 01                      |         local.get 1
 00042d: 41 12                      |         i32.const 18
 00042f: 76                         |         i32.shr_u
 000430: 41 f0 01                   |         i32.const 240
 000433: 72                         |         i32.or
 000434: 3a 00 0c                   |         i32.store8 0 12
 000437: 20 02                      |         local.get 2
 000439: 20 01                      |         local.get 1
 00043b: 41 06                      |         i32.const 6
 00043d: 76                         |         i32.shr_u
 00043e: 41 3f                      |         i32.const 63
 000440: 71                         |         i32.and
 000441: 41 80 01                   |         i32.const 128
 000444: 72                         |         i32.or
 000445: 3a 00 0e                   |         i32.store8 0 14
 000448: 20 02                      |         local.get 2
 00044a: 20 01                      |         local.get 1
 00044c: 41 0c                      |         i32.const 12
 00044e: 76                         |         i32.shr_u
 00044f: 41 3f                      |         i32.const 63
 000451: 71                         |         i32.and
 000452: 41 80 01                   |         i32.const 128
 000455: 72                         |         i32.or
 000456: 3a 00 0d                   |         i32.store8 0 13
 000459: 41 04                      |         i32.const 4
 00045b: 21 01                      |         local.set 1
 00045d: 0c 03                      |         br 3
 00045f: 0b                         |       end
 000460: 20 02                      |       local.get 2
 000462: 20 01                      |       local.get 1
 000464: 41 3f                      |       i32.const 63
 000466: 71                         |       i32.and
 000467: 41 80 01                   |       i32.const 128
 00046a: 72                         |       i32.or
 00046b: 3a 00 0e                   |       i32.store8 0 14
 00046e: 20 02                      |       local.get 2
 000470: 20 01                      |       local.get 1
 000472: 41 0c                      |       i32.const 12
 000474: 76                         |       i32.shr_u
 000475: 41 e0 01                   |       i32.const 224
 000478: 72                         |       i32.or
 000479: 3a 00 0c                   |       i32.store8 0 12
 00047c: 20 02                      |       local.get 2
 00047e: 20 01                      |       local.get 1
 000480: 41 06                      |       i32.const 6
 000482: 76                         |       i32.shr_u
 000483: 41 3f                      |       i32.const 63
 000485: 71                         |       i32.and
 000486: 41 80 01                   |       i32.const 128
 000489: 72                         |       i32.or
 00048a: 3a 00 0d                   |       i32.store8 0 13
 00048d: 41 03                      |       i32.const 3
 00048f: 21 01                      |       local.set 1
 000491: 0c 02                      |       br 2
 000493: 0b                         |     end
 000494: 20 02                      |     local.get 2
 000496: 20 01                      |     local.get 1
 000498: 41 3f                      |     i32.const 63
 00049a: 71                         |     i32.and
 00049b: 41 80 01                   |     i32.const 128
 00049e: 72                         |     i32.or
 00049f: 3a 00 0d                   |     i32.store8 0 13
 0004a2: 20 02                      |     local.get 2
 0004a4: 20 01                      |     local.get 1
 0004a6: 41 06                      |     i32.const 6
 0004a8: 76                         |     i32.shr_u
 0004a9: 41 c0 01                   |     i32.const 192
 0004ac: 72                         |     i32.or
 0004ad: 3a 00 0c                   |     i32.store8 0 12
 0004b0: 41 02                      |     i32.const 2
 0004b2: 21 01                      |     local.set 1
 0004b4: 0c 01                      |     br 1
 0004b6: 0b                         |   end
 0004b7: 20 02                      |   local.get 2
 0004b9: 20 01                      |   local.get 1
 0004bb: 3a 00 0c                   |   i32.store8 0 12
 0004be: 41 01                      |   i32.const 1
 0004c0: 21 01                      |   local.set 1
 0004c2: 0b                         | end
 0004c3: 20 00                      | local.get 0
 0004c5: 20 02                      | local.get 2
 0004c7: 41 0c                      | i32.const 12
 0004c9: 6a                         | i32.add
 0004ca: 20 01                      | local.get 1
 0004cc: 10 8f 80 80 80 00          | call 15 <_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hf04d045a475cb086E>
 0004d2: 21 01                      | local.set 1
 0004d4: 20 02                      | local.get 2
 0004d6: 41 10                      | i32.const 16
 0004d8: 6a                         | i32.add
 0004d9: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0004df: 20 01                      | local.get 1
 0004e1: 0b                         | end
0004e4 func[15] <_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hf04d045a475cb086E>:
 0004e5: 02 7f                      | local[3..4] type=i32
 0004e7: 01 7e                      | local[5] type=i64
 0004e9: 02 7f                      | local[6..7] type=i32
 0004eb: 01 7e                      | local[8] type=i64
 0004ed: 02 7f                      | local[9..10] type=i32
 0004ef: 41 00                      | i32.const 0
 0004f1: 21 03                      | local.set 3
 0004f3: 02 40                      | block
 0004f5: 02 40                      |   block
 0004f7: 20 02                      |     local.get 2
 0004f9: 45                         |     i32.eqz
 0004fa: 0d 00                      |     br_if 0
 0004fc: 20 00                      |     local.get 0
 0004fe: 28 02 08                   |     i32.load 2 8
 000501: 22 04                      |     local.tee 4
 000503: 29 03 08                   |     i64.load 3 8
 000506: 21 05                      |     local.set 5
 000508: 20 04                      |     local.get 4
 00050a: 28 02 00                   |     i32.load 2 0
 00050d: 21 06                      |     local.set 6
 00050f: 20 04                      |     local.get 4
 000511: 28 02 04                   |     i32.load 2 4
 000514: 22 07                      |     local.tee 7
 000516: ad                         |     i64.extend_i32_u
 000517: 21 08                      |     local.set 8
 000519: 03 40                      |     loop
 00051b: 20 07                      |       local.get 7
 00051d: 20 07                      |       local.get 7
 00051f: 20 05                      |       local.get 5
 000521: a7                         |       i32.wrap_i64
 000522: 20 05                      |       local.get 5
 000524: 20 08                      |       local.get 8
 000526: 56                         |       i64.gt_u
 000527: 1b                         |       select
 000528: 22 09                      |       local.tee 9
 00052a: 49                         |       i32.lt_u
 00052b: 0d 02                      |       br_if 2
 00052d: 20 06                      |       local.get 6
 00052f: 20 09                      |       local.get 9
 000531: 6a                         |       i32.add
 000532: 20 01                      |       local.get 1
 000534: 20 07                      |       local.get 7
 000536: 20 09                      |       local.get 9
 000538: 6b                         |       i32.sub
 000539: 22 0a                      |       local.tee 10
 00053b: 20 02                      |       local.get 2
 00053d: 20 0a                      |       local.get 10
 00053f: 20 02                      |       local.get 2
 000541: 49                         |       i32.lt_u
 000542: 1b                         |       select
 000543: 22 0a                      |       local.tee 10
 000545: 10 ee 80 80 80 00          |       call 110 <memcpy>
 00054b: 1a                         |       drop
 00054c: 20 04                      |       local.get 4
 00054e: 20 05                      |       local.get 5
 000550: 20 0a                      |       local.get 10
 000552: ad                         |       i64.extend_i32_u
 000553: 7c                         |       i64.add
 000554: 22 05                      |       local.tee 5
 000556: 37 03 08                   |       i64.store 3 8
 000559: 02 40                      |       block
 00055b: 20 07                      |         local.get 7
 00055d: 20 09                      |         local.get 9
 00055f: 46                         |         i32.eq
 000560: 0d 00                      |         br_if 0
 000562: 20 01                      |         local.get 1
 000564: 20 0a                      |         local.get 10
 000566: 6a                         |         i32.add
 000567: 21 01                      |         local.set 1
 000569: 20 02                      |         local.get 2
 00056b: 20 0a                      |         local.get 10
 00056d: 6b                         |         i32.sub
 00056e: 22 02                      |         local.tee 2
 000570: 0d 01                      |         br_if 1
 000572: 0c 02                      |         br 2
 000574: 0b                         |       end
 000575: 0b                         |     end
 000576: 41 00                      |     i32.const 0
 000578: 21 03                      |     local.set 3
 00057a: 41 00                      |     i32.const 0
 00057c: 29 03 a0 86 c0 80 00       |     i64.load 3 1049376
 000583: 22 05                      |     local.tee 5
 000585: 42 ff 01                   |     i64.const 255
 000588: 83                         |     i64.and
 000589: 42 04                      |     i64.const 4
 00058b: 51                         |     i64.eq
 00058c: 0d 00                      |     br_if 0
 00058e: 20 00                      |     local.get 0
 000590: 28 02 04                   |     i32.load 2 4
 000593: 21 07                      |     local.set 7
 000595: 02 40                      |     block
 000597: 02 40                      |       block
 000599: 20 00                      |         local.get 0
 00059b: 2d 00 00                   |         i32.load8_u 0 0
 00059e: 22 02                      |         local.tee 2
 0005a0: 41 04                      |         i32.const 4
 0005a2: 4b                         |         i32.gt_u
 0005a3: 0d 00                      |         br_if 0
 0005a5: 20 02                      |         local.get 2
 0005a7: 41 03                      |         i32.const 3
 0005a9: 47                         |         i32.ne
 0005aa: 0d 01                      |         br_if 1
 0005ac: 0b                         |       end
 0005ad: 20 07                      |       local.get 7
 0005af: 28 02 00                   |       i32.load 2 0
 0005b2: 21 09                      |       local.set 9
 0005b4: 02 40                      |       block
 0005b6: 20 07                      |         local.get 7
 0005b8: 41 04                      |         i32.const 4
 0005ba: 6a                         |         i32.add
 0005bb: 28 02 00                   |         i32.load 2 0
 0005be: 22 02                      |         local.tee 2
 0005c0: 28 02 00                   |         i32.load 2 0
 0005c3: 22 0a                      |         local.tee 10
 0005c5: 45                         |         i32.eqz
 0005c6: 0d 00                      |         br_if 0
 0005c8: 20 09                      |         local.get 9
 0005ca: 20 0a                      |         local.get 10
 0005cc: 11 80 80 80 80 00 80 80 80 |         call_indirect 0 (type 0)
 0005d5: 80 00                      | 
 0005d7: 0b                         |       end
 0005d8: 02 40                      |       block
 0005da: 20 02                      |         local.get 2
 0005dc: 28 02 04                   |         i32.load 2 4
 0005df: 22 0a                      |         local.tee 10
 0005e1: 45                         |         i32.eqz
 0005e2: 0d 00                      |         br_if 0
 0005e4: 20 09                      |         local.get 9
 0005e6: 20 0a                      |         local.get 10
 0005e8: 20 02                      |         local.get 2
 0005ea: 28 02 08                   |         i32.load 2 8
 0005ed: 10 86 80 80 80 00          |         call 6 <__rust_dealloc>
 0005f3: 0b                         |       end
 0005f4: 20 07                      |       local.get 7
 0005f6: 41 0c                      |       i32.const 12
 0005f8: 41 04                      |       i32.const 4
 0005fa: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 000600: 0b                         |     end
 000601: 20 00                      |     local.get 0
 000603: 20 05                      |     local.get 5
 000605: 37 02 00                   |     i64.store 2 0
 000608: 41 01                      |     i32.const 1
 00060a: 21 03                      |     local.set 3
 00060c: 0b                         |   end
 00060d: 20 03                      |   local.get 3
 00060f: 0f                         |   return
 000610: 0b                         | end
 000611: 20 09                      | local.get 9
 000613: 20 07                      | local.get 7
 000615: 41 94 84 c0 80 00          | i32.const 1049108
 00061b: 10 fd 80 80 80 00          | call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 000621: 00                         | unreachable
 000622: 0b                         | end
000625 func[16] <_ZN4core3fmt5Write10write_char17ha008c27deae15db2E>:
 000626: 02 7f                      | local[2..3] type=i32
 000628: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00062e: 41 10                      | i32.const 16
 000630: 6b                         | i32.sub
 000631: 22 02                      | local.tee 2
 000633: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000639: 20 02                      | local.get 2
 00063b: 41 00                      | i32.const 0
 00063d: 36 02 0c                   | i32.store 2 12
 000640: 02 40                      | block
 000642: 02 40                      |   block
 000644: 20 01                      |     local.get 1
 000646: 41 80 01                   |     i32.const 128
 000649: 49                         |     i32.lt_u
 00064a: 0d 00                      |     br_if 0
 00064c: 02 40                      |     block
 00064e: 20 01                      |       local.get 1
 000650: 41 80 10                   |       i32.const 2048
 000653: 49                         |       i32.lt_u
 000654: 0d 00                      |       br_if 0
 000656: 02 40                      |       block
 000658: 20 01                      |         local.get 1
 00065a: 41 80 80 04                |         i32.const 65536
 00065e: 49                         |         i32.lt_u
 00065f: 0d 00                      |         br_if 0
 000661: 20 02                      |         local.get 2
 000663: 20 01                      |         local.get 1
 000665: 41 3f                      |         i32.const 63
 000667: 71                         |         i32.and
 000668: 41 80 01                   |         i32.const 128
 00066b: 72                         |         i32.or
 00066c: 3a 00 0f                   |         i32.store8 0 15
 00066f: 20 02                      |         local.get 2
 000671: 20 01                      |         local.get 1
 000673: 41 12                      |         i32.const 18
 000675: 76                         |         i32.shr_u
 000676: 41 f0 01                   |         i32.const 240
 000679: 72                         |         i32.or
 00067a: 3a 00 0c                   |         i32.store8 0 12
 00067d: 20 02                      |         local.get 2
 00067f: 20 01                      |         local.get 1
 000681: 41 06                      |         i32.const 6
 000683: 76                         |         i32.shr_u
 000684: 41 3f                      |         i32.const 63
 000686: 71                         |         i32.and
 000687: 41 80 01                   |         i32.const 128
 00068a: 72                         |         i32.or
 00068b: 3a 00 0e                   |         i32.store8 0 14
 00068e: 20 02                      |         local.get 2
 000690: 20 01                      |         local.get 1
 000692: 41 0c                      |         i32.const 12
 000694: 76                         |         i32.shr_u
 000695: 41 3f                      |         i32.const 63
 000697: 71                         |         i32.and
 000698: 41 80 01                   |         i32.const 128
 00069b: 72                         |         i32.or
 00069c: 3a 00 0d                   |         i32.store8 0 13
 00069f: 41 04                      |         i32.const 4
 0006a1: 21 03                      |         local.set 3
 0006a3: 0c 03                      |         br 3
 0006a5: 0b                         |       end
 0006a6: 20 02                      |       local.get 2
 0006a8: 20 01                      |       local.get 1
 0006aa: 41 3f                      |       i32.const 63
 0006ac: 71                         |       i32.and
 0006ad: 41 80 01                   |       i32.const 128
 0006b0: 72                         |       i32.or
 0006b1: 3a 00 0e                   |       i32.store8 0 14
 0006b4: 20 02                      |       local.get 2
 0006b6: 20 01                      |       local.get 1
 0006b8: 41 0c                      |       i32.const 12
 0006ba: 76                         |       i32.shr_u
 0006bb: 41 e0 01                   |       i32.const 224
 0006be: 72                         |       i32.or
 0006bf: 3a 00 0c                   |       i32.store8 0 12
 0006c2: 20 02                      |       local.get 2
 0006c4: 20 01                      |       local.get 1
 0006c6: 41 06                      |       i32.const 6
 0006c8: 76                         |       i32.shr_u
 0006c9: 41 3f                      |       i32.const 63
 0006cb: 71                         |       i32.and
 0006cc: 41 80 01                   |       i32.const 128
 0006cf: 72                         |       i32.or
 0006d0: 3a 00 0d                   |       i32.store8 0 13
 0006d3: 41 03                      |       i32.const 3
 0006d5: 21 03                      |       local.set 3
 0006d7: 0c 02                      |       br 2
 0006d9: 0b                         |     end
 0006da: 20 02                      |     local.get 2
 0006dc: 20 01                      |     local.get 1
 0006de: 41 3f                      |     i32.const 63
 0006e0: 71                         |     i32.and
 0006e1: 41 80 01                   |     i32.const 128
 0006e4: 72                         |     i32.or
 0006e5: 3a 00 0d                   |     i32.store8 0 13
 0006e8: 20 02                      |     local.get 2
 0006ea: 20 01                      |     local.get 1
 0006ec: 41 06                      |     i32.const 6
 0006ee: 76                         |     i32.shr_u
 0006ef: 41 c0 01                   |     i32.const 192
 0006f2: 72                         |     i32.or
 0006f3: 3a 00 0c                   |     i32.store8 0 12
 0006f6: 41 02                      |     i32.const 2
 0006f8: 21 03                      |     local.set 3
 0006fa: 0c 01                      |     br 1
 0006fc: 0b                         |   end
 0006fd: 20 02                      |   local.get 2
 0006ff: 20 01                      |   local.get 1
 000701: 3a 00 0c                   |   i32.store8 0 12
 000704: 41 01                      |   i32.const 1
 000706: 21 03                      |   local.set 3
 000708: 0b                         | end
 000709: 02 40                      | block
 00070b: 20 00                      |   local.get 0
 00070d: 28 02 08                   |   i32.load 2 8
 000710: 22 01                      |   local.tee 1
 000712: 28 02 00                   |   i32.load 2 0
 000715: 20 01                      |   local.get 1
 000717: 28 02 08                   |   i32.load 2 8
 00071a: 22 00                      |   local.tee 0
 00071c: 6b                         |   i32.sub
 00071d: 20 03                      |   local.get 3
 00071f: 4f                         |   i32.ge_u
 000720: 0d 00                      |   br_if 0
 000722: 20 01                      |   local.get 1
 000724: 20 00                      |   local.get 0
 000726: 20 03                      |   local.get 3
 000728: 41 01                      |   i32.const 1
 00072a: 41 01                      |   i32.const 1
 00072c: 10 91 80 80 80 00          |   call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 000732: 20 01                      |   local.get 1
 000734: 28 02 08                   |   i32.load 2 8
 000737: 21 00                      |   local.set 0
 000739: 0b                         | end
 00073a: 20 01                      | local.get 1
 00073c: 28 02 04                   | i32.load 2 4
 00073f: 20 00                      | local.get 0
 000741: 6a                         | i32.add
 000742: 20 02                      | local.get 2
 000744: 41 0c                      | i32.const 12
 000746: 6a                         | i32.add
 000747: 20 03                      | local.get 3
 000749: 10 ee 80 80 80 00          | call 110 <memcpy>
 00074f: 1a                         | drop
 000750: 20 01                      | local.get 1
 000752: 20 00                      | local.get 0
 000754: 20 03                      | local.get 3
 000756: 6a                         | i32.add
 000757: 36 02 08                   | i32.store 2 8
 00075a: 20 02                      | local.get 2
 00075c: 41 10                      | i32.const 16
 00075e: 6a                         | i32.add
 00075f: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000765: 41 00                      | i32.const 0
 000767: 0b                         | end
00076a func[17] <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>:
 00076b: 03 7f                      | local[5..7] type=i32
 00076d: 01 7e                      | local[8] type=i64
 00076f: 01 7f                      | local[9] type=i32
 000771: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000777: 41 20                      | i32.const 32
 000779: 6b                         | i32.sub
 00077a: 22 05                      | local.tee 5
 00077c: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000782: 02 40                      | block
 000784: 02 40                      |   block
 000786: 02 40                      |     block
 000788: 20 01                      |       local.get 1
 00078a: 20 02                      |       local.get 2
 00078c: 6a                         |       i32.add
 00078d: 22 02                      |       local.tee 2
 00078f: 20 01                      |       local.get 1
 000791: 4f                         |       i32.ge_u
 000792: 0d 00                      |       br_if 0
 000794: 41 00                      |       i32.const 0
 000796: 21 06                      |       local.set 6
 000798: 0c 01                      |       br 1
 00079a: 0b                         |     end
 00079b: 41 00                      |     i32.const 0
 00079d: 21 06                      |     local.set 6
 00079f: 02 40                      |     block
 0007a1: 20 03                      |       local.get 3
 0007a3: 20 04                      |       local.get 4
 0007a5: 6a                         |       i32.add
 0007a6: 41 7f                      |       i32.const 4294967295
 0007a8: 6a                         |       i32.add
 0007a9: 41 00                      |       i32.const 0
 0007ab: 20 03                      |       local.get 3
 0007ad: 6b                         |       i32.sub
 0007ae: 71                         |       i32.and
 0007af: ad                         |       i64.extend_i32_u
 0007b0: 20 02                      |       local.get 2
 0007b2: 20 00                      |       local.get 0
 0007b4: 28 02 00                   |       i32.load 2 0
 0007b7: 22 01                      |       local.tee 1
 0007b9: 41 01                      |       i32.const 1
 0007bb: 74                         |       i32.shl
 0007bc: 22 07                      |       local.tee 7
 0007be: 20 02                      |       local.get 2
 0007c0: 20 07                      |       local.get 7
 0007c2: 4b                         |       i32.gt_u
 0007c3: 1b                         |       select
 0007c4: 22 02                      |       local.tee 2
 0007c6: 41 08                      |       i32.const 8
 0007c8: 41 04                      |       i32.const 4
 0007ca: 20 04                      |       local.get 4
 0007cc: 41 01                      |       i32.const 1
 0007ce: 46                         |       i32.eq
 0007cf: 1b                         |       select
 0007d0: 22 07                      |       local.tee 7
 0007d2: 20 02                      |       local.get 2
 0007d4: 20 07                      |       local.get 7
 0007d6: 4b                         |       i32.gt_u
 0007d7: 1b                         |       select
 0007d8: 22 07                      |       local.tee 7
 0007da: ad                         |       i64.extend_i32_u
 0007db: 7e                         |       i64.mul
 0007dc: 22 08                      |       local.tee 8
 0007de: 42 20                      |       i64.const 32
 0007e0: 88                         |       i64.shr_u
 0007e1: a7                         |       i32.wrap_i64
 0007e2: 45                         |       i32.eqz
 0007e3: 0d 00                      |       br_if 0
 0007e5: 0c 01                      |       br 1
 0007e7: 0b                         |     end
 0007e8: 20 08                      |     local.get 8
 0007ea: a7                         |     i32.wrap_i64
 0007eb: 22 09                      |     local.tee 9
 0007ed: 41 80 80 80 80 78          |     i32.const 2147483648
 0007f3: 20 03                      |     local.get 3
 0007f5: 6b                         |     i32.sub
 0007f6: 4b                         |     i32.gt_u
 0007f7: 0d 00                      |     br_if 0
 0007f9: 41 00                      |     i32.const 0
 0007fb: 21 02                      |     local.set 2
 0007fd: 02 40                      |     block
 0007ff: 20 01                      |       local.get 1
 000801: 45                         |       i32.eqz
 000802: 0d 00                      |       br_if 0
 000804: 20 05                      |       local.get 5
 000806: 20 01                      |       local.get 1
 000808: 20 04                      |       local.get 4
 00080a: 6c                         |       i32.mul
 00080b: 36 02 1c                   |       i32.store 2 28
 00080e: 20 05                      |       local.get 5
 000810: 20 00                      |       local.get 0
 000812: 28 02 04                   |       i32.load 2 4
 000815: 36 02 14                   |       i32.store 2 20
 000818: 20 03                      |       local.get 3
 00081a: 21 02                      |       local.set 2
 00081c: 0b                         |     end
 00081d: 20 05                      |     local.get 5
 00081f: 20 02                      |     local.get 2
 000821: 36 02 18                   |     i32.store 2 24
 000824: 20 05                      |     local.get 5
 000826: 41 08                      |     i32.const 8
 000828: 6a                         |     i32.add
 000829: 20 03                      |     local.get 3
 00082b: 20 09                      |     local.get 9
 00082d: 20 05                      |     local.get 5
 00082f: 41 14                      |     i32.const 20
 000831: 6a                         |     i32.add
 000832: 10 a4 80 80 80 00          |     call 36 <_ZN5alloc7raw_vec11finish_grow17ha4a54e019481127bE>
 000838: 20 05                      |     local.get 5
 00083a: 28 02 08                   |     i32.load 2 8
 00083d: 41 01                      |     i32.const 1
 00083f: 47                         |     i32.ne
 000840: 0d 01                      |     br_if 1
 000842: 20 05                      |     local.get 5
 000844: 28 02 10                   |     i32.load 2 16
 000847: 21 02                      |     local.set 2
 000849: 20 05                      |     local.get 5
 00084b: 28 02 0c                   |     i32.load 2 12
 00084e: 21 06                      |     local.set 6
 000850: 0b                         |   end
 000851: 20 06                      |   local.get 6
 000853: 20 02                      |   local.get 2
 000855: 41 d0 82 c0 80 00          |   i32.const 1048912
 00085b: 10 f8 80 80 80 00          |   call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 000861: 00                         |   unreachable
 000862: 0b                         | end
 000863: 20 05                      | local.get 5
 000865: 28 02 0c                   | i32.load 2 12
 000868: 21 03                      | local.set 3
 00086a: 20 00                      | local.get 0
 00086c: 20 07                      | local.get 7
 00086e: 36 02 00                   | i32.store 2 0
 000871: 20 00                      | local.get 0
 000873: 20 03                      | local.get 3
 000875: 36 02 04                   | i32.store 2 4
 000878: 20 05                      | local.get 5
 00087a: 41 20                      | i32.const 32
 00087c: 6a                         | i32.add
 00087d: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000883: 0b                         | end
000886 func[18] <_ZN4core3fmt5Write10write_char17he4f1265a6c4db811E>:
 000887: 01 7f                      | local[2] type=i32
 000889: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00088f: 41 10                      | i32.const 16
 000891: 6b                         | i32.sub
 000892: 22 02                      | local.tee 2
 000894: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00089a: 20 02                      | local.get 2
 00089c: 41 00                      | i32.const 0
 00089e: 36 02 0c                   | i32.store 2 12
 0008a1: 02 40                      | block
 0008a3: 02 40                      |   block
 0008a5: 20 01                      |     local.get 1
 0008a7: 41 80 01                   |     i32.const 128
 0008aa: 49                         |     i32.lt_u
 0008ab: 0d 00                      |     br_if 0
 0008ad: 02 40                      |     block
 0008af: 20 01                      |       local.get 1
 0008b1: 41 80 10                   |       i32.const 2048
 0008b4: 49                         |       i32.lt_u
 0008b5: 0d 00                      |       br_if 0
 0008b7: 02 40                      |       block
 0008b9: 20 01                      |         local.get 1
 0008bb: 41 80 80 04                |         i32.const 65536
 0008bf: 49                         |         i32.lt_u
 0008c0: 0d 00                      |         br_if 0
 0008c2: 20 02                      |         local.get 2
 0008c4: 20 01                      |         local.get 1
 0008c6: 41 3f                      |         i32.const 63
 0008c8: 71                         |         i32.and
 0008c9: 41 80 01                   |         i32.const 128
 0008cc: 72                         |         i32.or
 0008cd: 3a 00 0f                   |         i32.store8 0 15
 0008d0: 20 02                      |         local.get 2
 0008d2: 20 01                      |         local.get 1
 0008d4: 41 12                      |         i32.const 18
 0008d6: 76                         |         i32.shr_u
 0008d7: 41 f0 01                   |         i32.const 240
 0008da: 72                         |         i32.or
 0008db: 3a 00 0c                   |         i32.store8 0 12
 0008de: 20 02                      |         local.get 2
 0008e0: 20 01                      |         local.get 1
 0008e2: 41 06                      |         i32.const 6
 0008e4: 76                         |         i32.shr_u
 0008e5: 41 3f                      |         i32.const 63
 0008e7: 71                         |         i32.and
 0008e8: 41 80 01                   |         i32.const 128
 0008eb: 72                         |         i32.or
 0008ec: 3a 00 0e                   |         i32.store8 0 14
 0008ef: 20 02                      |         local.get 2
 0008f1: 20 01                      |         local.get 1
 0008f3: 41 0c                      |         i32.const 12
 0008f5: 76                         |         i32.shr_u
 0008f6: 41 3f                      |         i32.const 63
 0008f8: 71                         |         i32.and
 0008f9: 41 80 01                   |         i32.const 128
 0008fc: 72                         |         i32.or
 0008fd: 3a 00 0d                   |         i32.store8 0 13
 000900: 41 04                      |         i32.const 4
 000902: 21 01                      |         local.set 1
 000904: 0c 03                      |         br 3
 000906: 0b                         |       end
 000907: 20 02                      |       local.get 2
 000909: 20 01                      |       local.get 1
 00090b: 41 3f                      |       i32.const 63
 00090d: 71                         |       i32.and
 00090e: 41 80 01                   |       i32.const 128
 000911: 72                         |       i32.or
 000912: 3a 00 0e                   |       i32.store8 0 14
 000915: 20 02                      |       local.get 2
 000917: 20 01                      |       local.get 1
 000919: 41 0c                      |       i32.const 12
 00091b: 76                         |       i32.shr_u
 00091c: 41 e0 01                   |       i32.const 224
 00091f: 72                         |       i32.or
 000920: 3a 00 0c                   |       i32.store8 0 12
 000923: 20 02                      |       local.get 2
 000925: 20 01                      |       local.get 1
 000927: 41 06                      |       i32.const 6
 000929: 76                         |       i32.shr_u
 00092a: 41 3f                      |       i32.const 63
 00092c: 71                         |       i32.and
 00092d: 41 80 01                   |       i32.const 128
 000930: 72                         |       i32.or
 000931: 3a 00 0d                   |       i32.store8 0 13
 000934: 41 03                      |       i32.const 3
 000936: 21 01                      |       local.set 1
 000938: 0c 02                      |       br 2
 00093a: 0b                         |     end
 00093b: 20 02                      |     local.get 2
 00093d: 20 01                      |     local.get 1
 00093f: 41 3f                      |     i32.const 63
 000941: 71                         |     i32.and
 000942: 41 80 01                   |     i32.const 128
 000945: 72                         |     i32.or
 000946: 3a 00 0d                   |     i32.store8 0 13
 000949: 20 02                      |     local.get 2
 00094b: 20 01                      |     local.get 1
 00094d: 41 06                      |     i32.const 6
 00094f: 76                         |     i32.shr_u
 000950: 41 c0 01                   |     i32.const 192
 000953: 72                         |     i32.or
 000954: 3a 00 0c                   |     i32.store8 0 12
 000957: 41 02                      |     i32.const 2
 000959: 21 01                      |     local.set 1
 00095b: 0c 01                      |     br 1
 00095d: 0b                         |   end
 00095e: 20 02                      |   local.get 2
 000960: 20 01                      |   local.get 1
 000962: 3a 00 0c                   |   i32.store8 0 12
 000965: 41 01                      |   i32.const 1
 000967: 21 01                      |   local.set 1
 000969: 0b                         | end
 00096a: 20 00                      | local.get 0
 00096c: 20 02                      | local.get 2
 00096e: 41 0c                      | i32.const 12
 000970: 6a                         | i32.add
 000971: 20 01                      | local.get 1
 000973: 10 93 80 80 80 00          | call 19 <_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hd2c98f7575206c07E>
 000979: 21 01                      | local.set 1
 00097b: 20 02                      | local.get 2
 00097d: 41 10                      | i32.const 16
 00097f: 6a                         | i32.add
 000980: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000986: 20 01                      | local.get 1
 000988: 0b                         | end
00098b func[19] <_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17hd2c98f7575206c07E>:
 00098c: 03 7f                      | local[3..5] type=i32
 00098e: 01 7e                      | local[6] type=i64
 000990: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000996: 41 10                      | i32.const 16
 000998: 6b                         | i32.sub
 000999: 22 03                      | local.tee 3
 00099b: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0009a1: 41 00                      | i32.const 0
 0009a3: 21 04                      | local.set 4
 0009a5: 02 40                      | block
 0009a7: 20 02                      |   local.get 2
 0009a9: 45                         |   i32.eqz
 0009aa: 0d 00                      |   br_if 0
 0009ac: 02 40                      |   block
 0009ae: 03 40                      |     loop
 0009b0: 20 03                      |       local.get 3
 0009b2: 20 02                      |       local.get 2
 0009b4: 36 02 04                   |       i32.store 2 4
 0009b7: 20 03                      |       local.get 3
 0009b9: 20 01                      |       local.get 1
 0009bb: 36 02 00                   |       i32.store 2 0
 0009be: 20 03                      |       local.get 3
 0009c0: 41 08                      |       i32.const 8
 0009c2: 6a                         |       i32.add
 0009c3: 41 02                      |       i32.const 2
 0009c5: 20 03                      |       local.get 3
 0009c7: 41 01                      |       i32.const 1
 0009c9: 10 d7 80 80 80 00          |       call 87 <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>
 0009cf: 02 40                      |       block
 0009d1: 02 40                      |         block
 0009d3: 02 40                      |           block
 0009d5: 20 03                      |             local.get 3
 0009d7: 2f 01 08                   |             i32.load16_u 1 8
 0009da: 0d 00                      |             br_if 0
 0009dc: 02 40                      |             block
 0009de: 20 03                      |               local.get 3
 0009e0: 28 02 0c                   |               i32.load 2 12
 0009e3: 22 05                      |               local.tee 5
 0009e5: 0d 00                      |               br_if 0
 0009e7: 41 00                      |               i32.const 0
 0009e9: 29 03 a0 86 c0 80 00       |               i64.load 3 1049376
 0009f0: 21 06                      |               local.set 6
 0009f2: 0c 05                      |               br 5
 0009f4: 0b                         |             end
 0009f5: 20 02                      |             local.get 2
 0009f7: 20 05                      |             local.get 5
 0009f9: 4f                         |             i32.ge_u
 0009fa: 0d 01                      |             br_if 1
 0009fc: 20 05                      |             local.get 5
 0009fe: 20 02                      |             local.get 2
 000a00: 41 a8 86 c0 80 00          |             i32.const 1049384
 000a06: 10 fd 80 80 80 00          |             call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 000a0c: 00                         |             unreachable
 000a0d: 0b                         |           end
 000a0e: 20 03                      |           local.get 3
 000a10: 33 01 0a                   |           i64.load16_u 1 10
 000a13: 22 06                      |           local.tee 6
 000a15: 42 1b                      |           i64.const 27
 000a17: 51                         |           i64.eq
 000a18: 0d 01                      |           br_if 1
 000a1a: 20 06                      |           local.get 6
 000a1c: 42 20                      |           i64.const 32
 000a1e: 86                         |           i64.shl
 000a1f: 21 06                      |           local.set 6
 000a21: 0c 03                      |           br 3
 000a23: 0b                         |         end
 000a24: 20 01                      |         local.get 1
 000a26: 20 05                      |         local.get 5
 000a28: 6a                         |         i32.add
 000a29: 21 01                      |         local.set 1
 000a2b: 20 02                      |         local.get 2
 000a2d: 20 05                      |         local.get 5
 000a2f: 6b                         |         i32.sub
 000a30: 21 02                      |         local.set 2
 000a32: 0b                         |       end
 000a33: 20 02                      |       local.get 2
 000a35: 0d 00                      |       br_if 0
 000a37: 0c 02                      |       br 2
 000a39: 0b                         |     end
 000a3a: 0b                         |   end
 000a3b: 20 06                      |   local.get 6
 000a3d: 42 ff 01                   |   i64.const 255
 000a40: 83                         |   i64.and
 000a41: 42 04                      |   i64.const 4
 000a43: 51                         |   i64.eq
 000a44: 0d 00                      |   br_if 0
 000a46: 20 00                      |   local.get 0
 000a48: 28 02 04                   |   i32.load 2 4
 000a4b: 21 01                      |   local.set 1
 000a4d: 02 40                      |   block
 000a4f: 02 40                      |     block
 000a51: 20 00                      |       local.get 0
 000a53: 2d 00 00                   |       i32.load8_u 0 0
 000a56: 22 02                      |       local.tee 2
 000a58: 41 04                      |       i32.const 4
 000a5a: 4b                         |       i32.gt_u
 000a5b: 0d 00                      |       br_if 0
 000a5d: 20 02                      |       local.get 2
 000a5f: 41 03                      |       i32.const 3
 000a61: 47                         |       i32.ne
 000a62: 0d 01                      |       br_if 1
 000a64: 0b                         |     end
 000a65: 20 01                      |     local.get 1
 000a67: 28 02 00                   |     i32.load 2 0
 000a6a: 21 05                      |     local.set 5
 000a6c: 02 40                      |     block
 000a6e: 20 01                      |       local.get 1
 000a70: 41 04                      |       i32.const 4
 000a72: 6a                         |       i32.add
 000a73: 28 02 00                   |       i32.load 2 0
 000a76: 22 02                      |       local.tee 2
 000a78: 28 02 00                   |       i32.load 2 0
 000a7b: 22 04                      |       local.tee 4
 000a7d: 45                         |       i32.eqz
 000a7e: 0d 00                      |       br_if 0
 000a80: 20 05                      |       local.get 5
 000a82: 20 04                      |       local.get 4
 000a84: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 000a8d: 80 00                      | 
 000a8f: 0b                         |     end
 000a90: 02 40                      |     block
 000a92: 20 02                      |       local.get 2
 000a94: 28 02 04                   |       i32.load 2 4
 000a97: 22 04                      |       local.tee 4
 000a99: 45                         |       i32.eqz
 000a9a: 0d 00                      |       br_if 0
 000a9c: 20 05                      |       local.get 5
 000a9e: 20 04                      |       local.get 4
 000aa0: 20 02                      |       local.get 2
 000aa2: 28 02 08                   |       i32.load 2 8
 000aa5: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 000aab: 0b                         |     end
 000aac: 20 01                      |     local.get 1
 000aae: 41 0c                      |     i32.const 12
 000ab0: 41 04                      |     i32.const 4
 000ab2: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 000ab8: 0b                         |   end
 000ab9: 20 00                      |   local.get 0
 000abb: 20 06                      |   local.get 6
 000abd: 37 02 00                   |   i64.store 2 0
 000ac0: 41 01                      |   i32.const 1
 000ac2: 21 04                      |   local.set 4
 000ac4: 0b                         | end
 000ac5: 20 03                      | local.get 3
 000ac7: 41 10                      | i32.const 16
 000ac9: 6a                         | i32.add
 000aca: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000ad0: 20 04                      | local.get 4
 000ad2: 0b                         | end
000ad4 func[20] <_ZN4core3fmt5Write9write_fmt17h1daa19c627aa5892E>:
 000ad5: 20 00                      | local.get 0
 000ad7: 41 fc 82 c0 80 00          | i32.const 1048956
 000add: 20 01                      | local.get 1
 000adf: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 000ae5: 0b                         | end
000ae7 func[21] <_ZN4core3fmt5Write9write_fmt17h219ef3e4f9a9e1b1E>:
 000ae8: 20 00                      | local.get 0
 000aea: 41 c4 83 c0 80 00          | i32.const 1049028
 000af0: 20 01                      | local.get 1
 000af2: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 000af8: 0b                         | end
000afa func[22] <_ZN4core3fmt5Write9write_fmt17h7087f89ed2a3988cE>:
 000afb: 20 00                      | local.get 0
 000afd: 41 ac 83 c0 80 00          | i32.const 1049004
 000b03: 20 01                      | local.get 1
 000b05: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 000b0b: 0b                         | end
000b0d func[23] <_ZN4core3fmt5Write9write_fmt17hd346919713340ca3E>:
 000b0e: 20 00                      | local.get 0
 000b10: 41 94 83 c0 80 00          | i32.const 1048980
 000b16: 20 01                      | local.get 1
 000b18: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 000b1e: 0b                         | end
000b21 func[24] <_ZN3std9panicking12default_hook17h4324e29e9e5e8541E>:
 000b22: 03 7f                      | local[1..3] type=i32
 000b24: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000b2a: 41 e0 00                   | i32.const 96
 000b2d: 6b                         | i32.sub
 000b2e: 22 01                      | local.tee 1
 000b30: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000b36: 02 40                      | block
 000b38: 02 40                      |   block
 000b3a: 20 00                      |     local.get 0
 000b3c: 2d 00 0d                   |     i32.load8_u 0 13
 000b3f: 0d 00                      |     br_if 0
 000b41: 02 40                      |     block
 000b43: 41 00                      |       i32.const 0
 000b45: 28 02 e0 95 c0 80 00       |       i32.load 2 1051360
 000b4c: 41 01                      |       i32.const 1
 000b4e: 4b                         |       i32.gt_u
 000b4f: 0d 00                      |       br_if 0
 000b51: 20 01                      |       local.get 1
 000b53: 10 b7 80 80 80 00          |       call 55 <_ZN3std5panic19get_backtrace_style17h6332bb26ad628d28E>
 000b59: 41 ff 01                   |       i32.const 255
 000b5c: 71                         |       i32.and
 000b5d: 3a 00 1f                   |       i32.store8 0 31
 000b60: 0c 02                      |       br 2
 000b62: 0b                         |     end
 000b63: 20 01                      |     local.get 1
 000b65: 41 01                      |     i32.const 1
 000b67: 3a 00 1f                   |     i32.store8 0 31
 000b6a: 0c 01                      |     br 1
 000b6c: 0b                         |   end
 000b6d: 20 01                      |   local.get 1
 000b6f: 41 03                      |   i32.const 3
 000b71: 3a 00 1f                   |   i32.store8 0 31
 000b74: 0b                         | end
 000b75: 20 01                      | local.get 1
 000b77: 20 00                      | local.get 0
 000b79: 28 02 08                   | i32.load 2 8
 000b7c: 36 02 20                   | i32.store 2 32
 000b7f: 20 01                      | local.get 1
 000b81: 41 10                      | i32.const 16
 000b83: 6a                         | i32.add
 000b84: 20 00                      | local.get 0
 000b86: 28 02 00                   | i32.load 2 0
 000b89: 20 00                      | local.get 0
 000b8b: 28 02 04                   | i32.load 2 4
 000b8e: 10 c2 80 80 80 00          | call 66 <_ZN3std9panicking14payload_as_str17hbd23a0452b22d5e1E>
 000b94: 20 01                      | local.get 1
 000b96: 20 01                      | local.get 1
 000b98: 29 03 10                   | i64.load 3 16
 000b9b: 37 02 24                   | i64.store 2 36
 000b9e: 20 01                      | local.get 1
 000ba0: 20 01                      | local.get 1
 000ba2: 41 1f                      | i32.const 31
 000ba4: 6a                         | i32.add
 000ba5: 36 02 34                   | i32.store 2 52
 000ba8: 20 01                      | local.get 1
 000baa: 20 01                      | local.get 1
 000bac: 41 24                      | i32.const 36
 000bae: 6a                         | i32.add
 000baf: 36 02 30                   | i32.store 2 48
 000bb2: 20 01                      | local.get 1
 000bb4: 20 01                      | local.get 1
 000bb6: 41 20                      | i32.const 32
 000bb8: 6a                         | i32.add
 000bb9: 36 02 2c                   | i32.store 2 44
 000bbc: 20 01                      | local.get 1
 000bbe: 41 08                      | i32.const 8
 000bc0: 6a                         | i32.add
 000bc1: 41 00                      | i32.const 0
 000bc3: 10 b1 80 80 80 00          | call 49 <_ZN3std2io5stdio22try_set_output_capture17hfc9c4b818ccd04deE>
 000bc9: 20 01                      | local.get 1
 000bcb: 20 01                      | local.get 1
 000bcd: 28 02 08                   | i32.load 2 8
 000bd0: 22 02                      | local.tee 2
 000bd2: 36 02 38                   | i32.store 2 56
 000bd5: 20 01                      | local.get 1
 000bd7: 20 01                      | local.get 1
 000bd9: 28 02 0c                   | i32.load 2 12
 000bdc: 22 00                      | local.tee 0
 000bde: 36 02 3c                   | i32.store 2 60
 000be1: 02 40                      | block
 000be3: 02 40                      |   block
 000be5: 02 40                      |     block
 000be7: 20 02                      |       local.get 2
 000be9: 45                         |       i32.eqz
 000bea: 20 00                      |       local.get 0
 000bec: 41 00                      |       i32.const 0
 000bee: 47                         |       i32.ne
 000bef: 71                         |       i32.and
 000bf0: 22 03                      |       local.tee 3
 000bf2: 41 01                      |       i32.const 1
 000bf4: 47                         |       i32.ne
 000bf5: 0d 00                      |       br_if 0
 000bf7: 20 00                      |       local.get 0
 000bf9: 2d 00 08                   |       i32.load8_u 0 8
 000bfc: 21 02                      |       local.set 2
 000bfe: 20 00                      |       local.get 0
 000c00: 41 01                      |       i32.const 1
 000c02: 3a 00 08                   |       i32.store8 0 8
 000c05: 20 01                      |       local.get 1
 000c07: 20 02                      |       local.get 2
 000c09: 3a 00 43                   |       i32.store8 0 67
 000c0c: 20 02                      |       local.get 2
 000c0e: 41 01                      |       i32.const 1
 000c10: 46                         |       i32.eq
 000c11: 0d 02                      |       br_if 2
 000c13: 20 01                      |       local.get 1
 000c15: 41 2c                      |       i32.const 44
 000c17: 6a                         |       i32.add
 000c18: 20 00                      |       local.get 0
 000c1a: 41 0c                      |       i32.const 12
 000c1c: 6a                         |       i32.add
 000c1d: 41 c4 8a c0 80 00          |       i32.const 1049924
 000c23: 10 c3 80 80 80 00          |       call 67 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h87631b483d7e558cE>
 000c29: 20 00                      |       local.get 0
 000c2b: 41 00                      |       i32.const 0
 000c2d: 3a 00 08                   |       i32.store8 0 8
 000c30: 20 01                      |       local.get 1
 000c32: 20 00                      |       local.get 0
 000c34: 10 b1 80 80 80 00          |       call 49 <_ZN3std2io5stdio22try_set_output_capture17hfc9c4b818ccd04deE>
 000c3a: 20 01                      |       local.get 1
 000c3c: 28 02 00                   |       i32.load 2 0
 000c3f: 0d 01                      |       br_if 1
 000c41: 20 01                      |       local.get 1
 000c43: 28 02 04                   |       i32.load 2 4
 000c46: 21 00                      |       local.set 0
 000c48: 20 01                      |       local.get 1
 000c4a: 41 01                      |       i32.const 1
 000c4c: 36 02 44                   |       i32.store 2 68
 000c4f: 20 01                      |       local.get 1
 000c51: 20 00                      |       local.get 0
 000c53: 36 02 48                   |       i32.store 2 72
 000c56: 20 00                      |       local.get 0
 000c58: 45                         |       i32.eqz
 000c59: 0d 01                      |       br_if 1
 000c5b: 20 00                      |       local.get 0
 000c5d: 20 00                      |       local.get 0
 000c5f: 28 02 00                   |       i32.load 2 0
 000c62: 22 02                      |       local.tee 2
 000c64: 41 7f                      |       i32.const 4294967295
 000c66: 6a                         |       i32.add
 000c67: 36 02 00                   |       i32.store 2 0
 000c6a: 20 02                      |       local.get 2
 000c6c: 41 01                      |       i32.const 1
 000c6e: 47                         |       i32.ne
 000c6f: 0d 01                      |       br_if 1
 000c71: 20 01                      |       local.get 1
 000c73: 41 c8 00                   |       i32.const 72
 000c76: 6a                         |       i32.add
 000c77: 10 a3 80 80 80 00          |       call 35 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hb34b9f365f2589d9E>
 000c7d: 0c 01                      |       br 1
 000c7f: 0b                         |     end
 000c80: 20 01                      |     local.get 1
 000c82: 41 2c                      |     i32.const 44
 000c84: 6a                         |     i32.add
 000c85: 20 01                      |     local.get 1
 000c87: 41 df 00                   |     i32.const 95
 000c8a: 6a                         |     i32.add
 000c8b: 41 ec 8a c0 80 00          |     i32.const 1049964
 000c91: 10 c3 80 80 80 00          |     call 67 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h87631b483d7e558cE>
 000c97: 20 03                      |     local.get 3
 000c99: 20 02                      |     local.get 2
 000c9b: 20 00                      |     local.get 0
 000c9d: 45                         |     i32.eqz
 000c9e: 72                         |     i32.or
 000c9f: 72                         |     i32.or
 000ca0: 41 01                      |     i32.const 1
 000ca2: 71                         |     i32.and
 000ca3: 0d 00                      |     br_if 0
 000ca5: 20 00                      |     local.get 0
 000ca7: 20 00                      |     local.get 0
 000ca9: 28 02 00                   |     i32.load 2 0
 000cac: 22 02                      |     local.tee 2
 000cae: 41 7f                      |     i32.const 4294967295
 000cb0: 6a                         |     i32.add
 000cb1: 36 02 00                   |     i32.store 2 0
 000cb4: 20 02                      |     local.get 2
 000cb6: 41 01                      |     i32.const 1
 000cb8: 47                         |     i32.ne
 000cb9: 0d 00                      |     br_if 0
 000cbb: 20 01                      |     local.get 1
 000cbd: 41 3c                      |     i32.const 60
 000cbf: 6a                         |     i32.add
 000cc0: 10 a3 80 80 80 00          |     call 35 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hb34b9f365f2589d9E>
 000cc6: 0b                         |   end
 000cc7: 20 01                      |   local.get 1
 000cc9: 41 e0 00                   |   i32.const 96
 000ccc: 6a                         |   i32.add
 000ccd: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 000cd3: 0f                         |   return
 000cd4: 0b                         | end
 000cd5: 20 01                      | local.get 1
 000cd7: 42 00                      | i64.const 0
 000cd9: 37 02 50                   | i64.store 2 80
 000cdc: 20 01                      | local.get 1
 000cde: 42 81 80 80 80 c0 00       | i64.const 17179869185
 000ce5: 37 02 48                   | i64.store 2 72
 000ce8: 20 01                      | local.get 1
 000cea: 41 d8 87 c0 80 00          | i32.const 1049560
 000cf0: 36 02 44                   | i32.store 2 68
 000cf3: 41 00                      | i32.const 0
 000cf5: 20 01                      | local.get 1
 000cf7: 41 c3 00                   | i32.const 67
 000cfa: 6a                         | i32.add
 000cfb: 41 b8 80 c0 80 00          | i32.const 1048632
 000d01: 20 01                      | local.get 1
 000d03: 41 c4 00                   | i32.const 68
 000d06: 6a                         | i32.add
 000d07: 41 8c 88 c0 80 00          | i32.const 1049612
 000d0d: 10 9f 80 80 80 00          | call 31 <_ZN4core9panicking13assert_failed17heba9922af64b9ecaE>
 000d13: 00                         | unreachable
 000d14: 0b                         | end
000d16 func[25] <_ZN4core3ptr118drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..cursor..Cursor$LT$$RF$mut$u20$$u5b$u8$u5d$$GT$$GT$$GT$17h4c7fc790c3eb2b74E>:
 000d17: 03 7f                      | local[1..3] type=i32
 000d19: 20 00                      | local.get 0
 000d1b: 28 02 04                   | i32.load 2 4
 000d1e: 21 01                      | local.set 1
 000d20: 02 40                      | block
 000d22: 02 40                      |   block
 000d24: 20 00                      |     local.get 0
 000d26: 2d 00 00                   |     i32.load8_u 0 0
 000d29: 22 00                      |     local.tee 0
 000d2b: 41 04                      |     i32.const 4
 000d2d: 4b                         |     i32.gt_u
 000d2e: 0d 00                      |     br_if 0
 000d30: 20 00                      |     local.get 0
 000d32: 41 03                      |     i32.const 3
 000d34: 47                         |     i32.ne
 000d35: 0d 01                      |     br_if 1
 000d37: 0b                         |   end
 000d38: 20 01                      |   local.get 1
 000d3a: 28 02 00                   |   i32.load 2 0
 000d3d: 21 02                      |   local.set 2
 000d3f: 02 40                      |   block
 000d41: 20 01                      |     local.get 1
 000d43: 41 04                      |     i32.const 4
 000d45: 6a                         |     i32.add
 000d46: 28 02 00                   |     i32.load 2 0
 000d49: 22 00                      |     local.tee 0
 000d4b: 28 02 00                   |     i32.load 2 0
 000d4e: 22 03                      |     local.tee 3
 000d50: 45                         |     i32.eqz
 000d51: 0d 00                      |     br_if 0
 000d53: 20 02                      |     local.get 2
 000d55: 20 03                      |     local.get 3
 000d57: 11 80 80 80 80 00 80 80 80 |     call_indirect 0 (type 0)
 000d60: 80 00                      | 
 000d62: 0b                         |   end
 000d63: 02 40                      |   block
 000d65: 20 00                      |     local.get 0
 000d67: 28 02 04                   |     i32.load 2 4
 000d6a: 22 03                      |     local.tee 3
 000d6c: 45                         |     i32.eqz
 000d6d: 0d 00                      |     br_if 0
 000d6f: 20 02                      |     local.get 2
 000d71: 20 03                      |     local.get 3
 000d73: 20 00                      |     local.get 0
 000d75: 28 02 08                   |     i32.load 2 8
 000d78: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 000d7e: 0b                         |   end
 000d7f: 20 01                      |   local.get 1
 000d81: 41 0c                      |   i32.const 12
 000d83: 41 04                      |   i32.const 4
 000d85: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 000d8b: 0b                         | end
 000d8c: 0b                         | end
000d8e func[26] <_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h6e90be3fd0098867E>:
 000d8f: 01 7f                      | local[1] type=i32
 000d91: 02 40                      | block
 000d93: 20 00                      |   local.get 0
 000d95: 28 02 00                   |   i32.load 2 0
 000d98: 22 01                      |   local.tee 1
 000d9a: 45                         |   i32.eqz
 000d9b: 0d 00                      |   br_if 0
 000d9d: 20 00                      |   local.get 0
 000d9f: 28 02 04                   |   i32.load 2 4
 000da2: 20 01                      |   local.get 1
 000da4: 41 01                      |   i32.const 1
 000da6: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 000dac: 0b                         | end
 000dad: 0b                         | end
000daf func[27] <_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17hdd4f431b4f5a3f76E>:
 000db0: 01 7f                      | local[1] type=i32
 000db2: 02 40                      | block
 000db4: 20 00                      |   local.get 0
 000db6: 28 02 00                   |   i32.load 2 0
 000db9: 22 01                      |   local.tee 1
 000dbb: 45                         |   i32.eqz
 000dbc: 0d 00                      |   br_if 0
 000dbe: 20 00                      |   local.get 0
 000dc0: 28 02 04                   |   i32.load 2 4
 000dc3: 20 01                      |   local.get 1
 000dc5: 41 01                      |   i32.const 1
 000dc7: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 000dcd: 0b                         | end
 000dce: 0b                         | end
000dd0 func[28] <_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17hcd21d2666f419e5aE>:
 000dd1: 01 7f                      | local[1] type=i32
 000dd3: 02 40                      | block
 000dd5: 20 00                      |   local.get 0
 000dd7: 28 02 00                   |   i32.load 2 0
 000dda: 22 01                      |   local.tee 1
 000ddc: 41 80 80 80 80 78          |   i32.const 2147483648
 000de2: 72                         |   i32.or
 000de3: 41 80 80 80 80 78          |   i32.const 2147483648
 000de9: 46                         |   i32.eq
 000dea: 0d 00                      |   br_if 0
 000dec: 20 00                      |   local.get 0
 000dee: 28 02 04                   |   i32.load 2 4
 000df1: 20 01                      |   local.get 1
 000df3: 41 01                      |   i32.const 1
 000df5: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 000dfb: 0b                         | end
 000dfc: 0b                         | end
000dfe func[29] <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>:
 000dff: 02 7f                      | local[2..3] type=i32
 000e01: 02 40                      | block
 000e03: 02 40                      |   block
 000e05: 20 00                      |     local.get 0
 000e07: 41 ff 01                   |     i32.const 255
 000e0a: 71                         |     i32.and
 000e0b: 22 00                      |     local.tee 0
 000e0d: 41 04                      |     i32.const 4
 000e0f: 4b                         |     i32.gt_u
 000e10: 0d 00                      |     br_if 0
 000e12: 20 00                      |     local.get 0
 000e14: 41 03                      |     i32.const 3
 000e16: 47                         |     i32.ne
 000e17: 0d 01                      |     br_if 1
 000e19: 0b                         |   end
 000e1a: 20 01                      |   local.get 1
 000e1c: 28 02 00                   |   i32.load 2 0
 000e1f: 21 02                      |   local.set 2
 000e21: 02 40                      |   block
 000e23: 20 01                      |     local.get 1
 000e25: 41 04                      |     i32.const 4
 000e27: 6a                         |     i32.add
 000e28: 28 02 00                   |     i32.load 2 0
 000e2b: 22 00                      |     local.tee 0
 000e2d: 28 02 00                   |     i32.load 2 0
 000e30: 22 03                      |     local.tee 3
 000e32: 45                         |     i32.eqz
 000e33: 0d 00                      |     br_if 0
 000e35: 20 02                      |     local.get 2
 000e37: 20 03                      |     local.get 3
 000e39: 11 80 80 80 80 00 80 80 80 |     call_indirect 0 (type 0)
 000e42: 80 00                      | 
 000e44: 0b                         |   end
 000e45: 02 40                      |   block
 000e47: 20 00                      |     local.get 0
 000e49: 28 02 04                   |     i32.load 2 4
 000e4c: 22 03                      |     local.tee 3
 000e4e: 45                         |     i32.eqz
 000e4f: 0d 00                      |     br_if 0
 000e51: 20 02                      |     local.get 2
 000e53: 20 03                      |     local.get 3
 000e55: 20 00                      |     local.get 0
 000e57: 28 02 08                   |     i32.load 2 8
 000e5a: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 000e60: 0b                         |   end
 000e61: 20 01                      |   local.get 1
 000e63: 41 0c                      |   i32.const 12
 000e65: 41 04                      |   i32.const 4
 000e67: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 000e6d: 0b                         | end
 000e6e: 0b                         | end
000e70 func[30] <_ZN4core5panic12PanicPayload6as_str17h06bf0618d5a45dd5E>:
 000e71: 20 00                      | local.get 0
 000e73: 41 00                      | i32.const 0
 000e75: 36 02 00                   | i32.store 2 0
 000e78: 0b                         | end
000e7a func[31] <_ZN4core9panicking13assert_failed17heba9922af64b9ecaE>:
 000e7b: 01 7f                      | local[5] type=i32
 000e7d: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000e83: 41 10                      | i32.const 16
 000e85: 6b                         | i32.sub
 000e86: 22 05                      | local.tee 5
 000e88: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000e8e: 20 05                      | local.get 5
 000e90: 20 02                      | local.get 2
 000e92: 36 02 0c                   | i32.store 2 12
 000e95: 20 05                      | local.get 5
 000e97: 20 01                      | local.get 1
 000e99: 36 02 08                   | i32.store 2 8
 000e9c: 20 00                      | local.get 0
 000e9e: 20 05                      | local.get 5
 000ea0: 41 08                      | i32.const 8
 000ea2: 6a                         | i32.add
 000ea3: 41 bc 80 c0 80 00          | i32.const 1048636
 000ea9: 20 05                      | local.get 5
 000eab: 41 0c                      | i32.const 12
 000ead: 6a                         | i32.add
 000eae: 41 bc 80 c0 80 00          | i32.const 1048636
 000eb4: 20 03                      | local.get 3
 000eb6: 20 04                      | local.get 4
 000eb8: 10 89 81 80 80 00          | call 137 <_ZN4core9panicking19assert_failed_inner17h2ae9db04c28d43e1E>
 000ebe: 00                         | unreachable
 000ebf: 0b                         | end
000ec1 func[32] <_ZN52_$LT$$RF$mut$u20$T$u20$as$u20$core..fmt..Display$GT$3fmt17hd855e2c6c591881dE>:
 000ec2: 20 00                      | local.get 0
 000ec4: 28 02 00                   | i32.load 2 0
 000ec7: 20 01                      | local.get 1
 000ec9: 20 00                      | local.get 0
 000ecb: 28 02 04                   | i32.load 2 4
 000ece: 28 02 0c                   | i32.load 2 12
 000ed1: 11 81 80 80 80 00 80 80 80 | call_indirect 0 (type 1)
 000eda: 80 00                      | 
 000edc: 0b                         | end
000edf func[33] <_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17hb72ef58da038d7e1E>:
 000ee0: 02 7f                      | local[2..3] type=i32
 000ee2: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 000ee8: 41 10                      | i32.const 16
 000eea: 6b                         | i32.sub
 000eeb: 22 02                      | local.tee 2
 000eed: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 000ef3: 02 40                      | block
 000ef5: 02 40                      |   block
 000ef7: 20 01                      |     local.get 1
 000ef9: 41 80 01                   |     i32.const 128
 000efc: 49                         |     i32.lt_u
 000efd: 0d 00                      |     br_if 0
 000eff: 20 02                      |     local.get 2
 000f01: 41 00                      |     i32.const 0
 000f03: 36 02 0c                   |     i32.store 2 12
 000f06: 02 40                      |     block
 000f08: 02 40                      |       block
 000f0a: 20 01                      |         local.get 1
 000f0c: 41 80 10                   |         i32.const 2048
 000f0f: 49                         |         i32.lt_u
 000f10: 0d 00                      |         br_if 0
 000f12: 02 40                      |         block
 000f14: 20 01                      |           local.get 1
 000f16: 41 80 80 04                |           i32.const 65536
 000f1a: 49                         |           i32.lt_u
 000f1b: 0d 00                      |           br_if 0
 000f1d: 20 02                      |           local.get 2
 000f1f: 20 01                      |           local.get 1
 000f21: 41 3f                      |           i32.const 63
 000f23: 71                         |           i32.and
 000f24: 41 80 01                   |           i32.const 128
 000f27: 72                         |           i32.or
 000f28: 3a 00 0f                   |           i32.store8 0 15
 000f2b: 20 02                      |           local.get 2
 000f2d: 20 01                      |           local.get 1
 000f2f: 41 12                      |           i32.const 18
 000f31: 76                         |           i32.shr_u
 000f32: 41 f0 01                   |           i32.const 240
 000f35: 72                         |           i32.or
 000f36: 3a 00 0c                   |           i32.store8 0 12
 000f39: 20 02                      |           local.get 2
 000f3b: 20 01                      |           local.get 1
 000f3d: 41 06                      |           i32.const 6
 000f3f: 76                         |           i32.shr_u
 000f40: 41 3f                      |           i32.const 63
 000f42: 71                         |           i32.and
 000f43: 41 80 01                   |           i32.const 128
 000f46: 72                         |           i32.or
 000f47: 3a 00 0e                   |           i32.store8 0 14
 000f4a: 20 02                      |           local.get 2
 000f4c: 20 01                      |           local.get 1
 000f4e: 41 0c                      |           i32.const 12
 000f50: 76                         |           i32.shr_u
 000f51: 41 3f                      |           i32.const 63
 000f53: 71                         |           i32.and
 000f54: 41 80 01                   |           i32.const 128
 000f57: 72                         |           i32.or
 000f58: 3a 00 0d                   |           i32.store8 0 13
 000f5b: 41 04                      |           i32.const 4
 000f5d: 21 01                      |           local.set 1
 000f5f: 0c 02                      |           br 2
 000f61: 0b                         |         end
 000f62: 20 02                      |         local.get 2
 000f64: 20 01                      |         local.get 1
 000f66: 41 3f                      |         i32.const 63
 000f68: 71                         |         i32.and
 000f69: 41 80 01                   |         i32.const 128
 000f6c: 72                         |         i32.or
 000f6d: 3a 00 0e                   |         i32.store8 0 14
 000f70: 20 02                      |         local.get 2
 000f72: 20 01                      |         local.get 1
 000f74: 41 0c                      |         i32.const 12
 000f76: 76                         |         i32.shr_u
 000f77: 41 e0 01                   |         i32.const 224
 000f7a: 72                         |         i32.or
 000f7b: 3a 00 0c                   |         i32.store8 0 12
 000f7e: 20 02                      |         local.get 2
 000f80: 20 01                      |         local.get 1
 000f82: 41 06                      |         i32.const 6
 000f84: 76                         |         i32.shr_u
 000f85: 41 3f                      |         i32.const 63
 000f87: 71                         |         i32.and
 000f88: 41 80 01                   |         i32.const 128
 000f8b: 72                         |         i32.or
 000f8c: 3a 00 0d                   |         i32.store8 0 13
 000f8f: 41 03                      |         i32.const 3
 000f91: 21 01                      |         local.set 1
 000f93: 0c 01                      |         br 1
 000f95: 0b                         |       end
 000f96: 20 02                      |       local.get 2
 000f98: 20 01                      |       local.get 1
 000f9a: 41 3f                      |       i32.const 63
 000f9c: 71                         |       i32.and
 000f9d: 41 80 01                   |       i32.const 128
 000fa0: 72                         |       i32.or
 000fa1: 3a 00 0d                   |       i32.store8 0 13
 000fa4: 20 02                      |       local.get 2
 000fa6: 20 01                      |       local.get 1
 000fa8: 41 06                      |       i32.const 6
 000faa: 76                         |       i32.shr_u
 000fab: 41 c0 01                   |       i32.const 192
 000fae: 72                         |       i32.or
 000faf: 3a 00 0c                   |       i32.store8 0 12
 000fb2: 41 02                      |       i32.const 2
 000fb4: 21 01                      |       local.set 1
 000fb6: 0b                         |     end
 000fb7: 02 40                      |     block
 000fb9: 20 00                      |       local.get 0
 000fbb: 28 02 00                   |       i32.load 2 0
 000fbe: 20 00                      |       local.get 0
 000fc0: 28 02 08                   |       i32.load 2 8
 000fc3: 22 03                      |       local.tee 3
 000fc5: 6b                         |       i32.sub
 000fc6: 20 01                      |       local.get 1
 000fc8: 4f                         |       i32.ge_u
 000fc9: 0d 00                      |       br_if 0
 000fcb: 20 00                      |       local.get 0
 000fcd: 20 03                      |       local.get 3
 000fcf: 20 01                      |       local.get 1
 000fd1: 41 01                      |       i32.const 1
 000fd3: 41 01                      |       i32.const 1
 000fd5: 10 91 80 80 80 00          |       call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 000fdb: 20 00                      |       local.get 0
 000fdd: 28 02 08                   |       i32.load 2 8
 000fe0: 21 03                      |       local.set 3
 000fe2: 0b                         |     end
 000fe3: 20 00                      |     local.get 0
 000fe5: 28 02 04                   |     i32.load 2 4
 000fe8: 20 03                      |     local.get 3
 000fea: 6a                         |     i32.add
 000feb: 20 02                      |     local.get 2
 000fed: 41 0c                      |     i32.const 12
 000fef: 6a                         |     i32.add
 000ff0: 20 01                      |     local.get 1
 000ff2: 10 ee 80 80 80 00          |     call 110 <memcpy>
 000ff8: 1a                         |     drop
 000ff9: 20 00                      |     local.get 0
 000ffb: 20 03                      |     local.get 3
 000ffd: 20 01                      |     local.get 1
 000fff: 6a                         |     i32.add
 001000: 36 02 08                   |     i32.store 2 8
 001003: 0c 01                      |     br 1
 001005: 0b                         |   end
 001006: 02 40                      |   block
 001008: 20 00                      |     local.get 0
 00100a: 28 02 08                   |     i32.load 2 8
 00100d: 22 03                      |     local.tee 3
 00100f: 20 00                      |     local.get 0
 001011: 28 02 00                   |     i32.load 2 0
 001014: 47                         |     i32.ne
 001015: 0d 00                      |     br_if 0
 001017: 20 00                      |     local.get 0
 001019: 41 f4 81 c0 80 00          |     i32.const 1048820
 00101f: 10 f7 80 80 80 00          |     call 119 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h6df1577f21db3553E>
 001025: 0b                         |   end
 001026: 20 00                      |   local.get 0
 001028: 28 02 04                   |   i32.load 2 4
 00102b: 20 03                      |   local.get 3
 00102d: 6a                         |   i32.add
 00102e: 20 01                      |   local.get 1
 001030: 3a 00 00                   |   i32.store8 0 0
 001033: 20 00                      |   local.get 0
 001035: 20 03                      |   local.get 3
 001037: 41 01                      |   i32.const 1
 001039: 6a                         |   i32.add
 00103a: 36 02 08                   |   i32.store 2 8
 00103d: 0b                         | end
 00103e: 20 02                      | local.get 2
 001040: 41 10                      | i32.const 16
 001042: 6a                         | i32.add
 001043: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001049: 41 00                      | i32.const 0
 00104b: 0b                         | end
00104d func[34] <_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h787c900847b8686bE>:
 00104e: 01 7f                      | local[3] type=i32
 001050: 02 40                      | block
 001052: 20 00                      |   local.get 0
 001054: 28 02 00                   |   i32.load 2 0
 001057: 20 00                      |   local.get 0
 001059: 28 02 08                   |   i32.load 2 8
 00105c: 22 03                      |   local.tee 3
 00105e: 6b                         |   i32.sub
 00105f: 20 02                      |   local.get 2
 001061: 4f                         |   i32.ge_u
 001062: 0d 00                      |   br_if 0
 001064: 20 00                      |   local.get 0
 001066: 20 03                      |   local.get 3
 001068: 20 02                      |   local.get 2
 00106a: 41 01                      |   i32.const 1
 00106c: 41 01                      |   i32.const 1
 00106e: 10 91 80 80 80 00          |   call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 001074: 20 00                      |   local.get 0
 001076: 28 02 08                   |   i32.load 2 8
 001079: 21 03                      |   local.set 3
 00107b: 0b                         | end
 00107c: 20 00                      | local.get 0
 00107e: 28 02 04                   | i32.load 2 4
 001081: 20 03                      | local.get 3
 001083: 6a                         | i32.add
 001084: 20 01                      | local.get 1
 001086: 20 02                      | local.get 2
 001088: 10 ee 80 80 80 00          | call 110 <memcpy>
 00108e: 1a                         | drop
 00108f: 20 00                      | local.get 0
 001091: 20 03                      | local.get 3
 001093: 20 02                      | local.get 2
 001095: 6a                         | i32.add
 001096: 36 02 08                   | i32.store 2 8
 001099: 41 00                      | i32.const 0
 00109b: 0b                         | end
00109d func[35] <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hb34b9f365f2589d9E>:
 00109e: 01 7f                      | local[1] type=i32
 0010a0: 02 40                      | block
 0010a2: 20 00                      |   local.get 0
 0010a4: 28 02 00                   |   i32.load 2 0
 0010a7: 22 00                      |   local.tee 0
 0010a9: 41 0c                      |   i32.const 12
 0010ab: 6a                         |   i32.add
 0010ac: 28 02 00                   |   i32.load 2 0
 0010af: 22 01                      |   local.tee 1
 0010b1: 45                         |   i32.eqz
 0010b2: 0d 00                      |   br_if 0
 0010b4: 20 00                      |   local.get 0
 0010b6: 41 10                      |   i32.const 16
 0010b8: 6a                         |   i32.add
 0010b9: 28 02 00                   |   i32.load 2 0
 0010bc: 20 01                      |   local.get 1
 0010be: 41 01                      |   i32.const 1
 0010c0: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 0010c6: 0b                         | end
 0010c7: 02 40                      | block
 0010c9: 20 00                      |   local.get 0
 0010cb: 41 7f                      |   i32.const 4294967295
 0010cd: 46                         |   i32.eq
 0010ce: 0d 00                      |   br_if 0
 0010d0: 20 00                      |   local.get 0
 0010d2: 20 00                      |   local.get 0
 0010d4: 28 02 04                   |   i32.load 2 4
 0010d7: 22 01                      |   local.tee 1
 0010d9: 41 7f                      |   i32.const 4294967295
 0010db: 6a                         |   i32.add
 0010dc: 36 02 04                   |   i32.store 2 4
 0010df: 20 01                      |   local.get 1
 0010e1: 41 01                      |   i32.const 1
 0010e3: 47                         |   i32.ne
 0010e4: 0d 00                      |   br_if 0
 0010e6: 20 00                      |   local.get 0
 0010e8: 41 18                      |   i32.const 24
 0010ea: 41 04                      |   i32.const 4
 0010ec: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 0010f2: 0b                         | end
 0010f3: 0b                         | end
0010f6 func[36] <_ZN5alloc7raw_vec11finish_grow17ha4a54e019481127bE>:
 0010f7: 01 7f                      | local[4] type=i32
 0010f9: 02 40                      | block
 0010fb: 02 40                      |   block
 0010fd: 20 02                      |     local.get 2
 0010ff: 41 00                      |     i32.const 0
 001101: 48                         |     i32.lt_s
 001102: 0d 00                      |     br_if 0
 001104: 02 40                      |     block
 001106: 02 40                      |       block
 001108: 02 40                      |         block
 00110a: 20 03                      |           local.get 3
 00110c: 28 02 04                   |           i32.load 2 4
 00110f: 45                         |           i32.eqz
 001110: 0d 00                      |           br_if 0
 001112: 02 40                      |           block
 001114: 20 03                      |             local.get 3
 001116: 28 02 08                   |             i32.load 2 8
 001119: 22 04                      |             local.tee 4
 00111b: 0d 00                      |             br_if 0
 00111d: 02 40                      |             block
 00111f: 20 02                      |               local.get 2
 001121: 0d 00                      |               br_if 0
 001123: 20 01                      |               local.get 1
 001125: 21 03                      |               local.set 3
 001127: 0c 04                      |               br 4
 001129: 0b                         |             end
 00112a: 41 00                      |             i32.const 0
 00112c: 2d 00 b1 95 c0 80 00       |             i32.load8_u 0 1051313
 001133: 1a                         |             drop
 001134: 0c 02                      |             br 2
 001136: 0b                         |           end
 001137: 20 03                      |           local.get 3
 001139: 28 02 00                   |           i32.load 2 0
 00113c: 20 04                      |           local.get 4
 00113e: 20 01                      |           local.get 1
 001140: 20 02                      |           local.get 2
 001142: 10 87 80 80 80 00          |           call 7 <__rust_realloc>
 001148: 21 03                      |           local.set 3
 00114a: 0c 02                      |           br 2
 00114c: 0b                         |         end
 00114d: 02 40                      |         block
 00114f: 20 02                      |           local.get 2
 001151: 0d 00                      |           br_if 0
 001153: 20 01                      |           local.get 1
 001155: 21 03                      |           local.set 3
 001157: 0c 02                      |           br 2
 001159: 0b                         |         end
 00115a: 41 00                      |         i32.const 0
 00115c: 2d 00 b1 95 c0 80 00       |         i32.load8_u 0 1051313
 001163: 1a                         |         drop
 001164: 0b                         |       end
 001165: 20 02                      |       local.get 2
 001167: 20 01                      |       local.get 1
 001169: 10 85 80 80 80 00          |       call 5 <__rust_alloc>
 00116f: 21 03                      |       local.set 3
 001171: 0b                         |     end
 001172: 02 40                      |     block
 001174: 20 03                      |       local.get 3
 001176: 45                         |       i32.eqz
 001177: 0d 00                      |       br_if 0
 001179: 20 00                      |       local.get 0
 00117b: 20 02                      |       local.get 2
 00117d: 36 02 08                   |       i32.store 2 8
 001180: 20 00                      |       local.get 0
 001182: 20 03                      |       local.get 3
 001184: 36 02 04                   |       i32.store 2 4
 001187: 20 00                      |       local.get 0
 001189: 41 00                      |       i32.const 0
 00118b: 36 02 00                   |       i32.store 2 0
 00118e: 0f                         |       return
 00118f: 0b                         |     end
 001190: 20 00                      |     local.get 0
 001192: 20 02                      |     local.get 2
 001194: 36 02 08                   |     i32.store 2 8
 001197: 20 00                      |     local.get 0
 001199: 20 01                      |     local.get 1
 00119b: 36 02 04                   |     i32.store 2 4
 00119e: 0c 01                      |     br 1
 0011a0: 0b                         |   end
 0011a1: 20 00                      |   local.get 0
 0011a3: 41 00                      |   i32.const 0
 0011a5: 36 02 04                   |   i32.store 2 4
 0011a8: 0b                         | end
 0011a9: 20 00                      | local.get 0
 0011ab: 41 01                      | i32.const 1
 0011ad: 36 02 00                   | i32.store 2 0
 0011b0: 0b                         | end
0011b3 func[37] <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>:
 0011b4: 02 7f                      | local[3..4] type=i32
 0011b6: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0011bc: 41 30                      | i32.const 48
 0011be: 6b                         | i32.sub
 0011bf: 22 03                      | local.tee 3
 0011c1: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0011c7: 20 03                      | local.get 3
 0011c9: 41 04                      | i32.const 4
 0011cb: 3a 00 08                   | i32.store8 0 8
 0011ce: 20 03                      | local.get 3
 0011d0: 20 01                      | local.get 1
 0011d2: 36 02 10                   | i32.store 2 16
 0011d5: 02 40                      | block
 0011d7: 02 40                      |   block
 0011d9: 20 03                      |     local.get 3
 0011db: 41 08                      |     i32.const 8
 0011dd: 6a                         |     i32.add
 0011de: 41 94 83 c0 80 00          |     i32.const 1048980
 0011e4: 20 02                      |     local.get 2
 0011e6: 10 82 81 80 80 00          |     call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 0011ec: 0d 00                      |     br_if 0
 0011ee: 20 00                      |     local.get 0
 0011f0: 41 04                      |     i32.const 4
 0011f2: 3a 00 00                   |     i32.store8 0 0
 0011f5: 20 03                      |     local.get 3
 0011f7: 28 02 0c                   |     i32.load 2 12
 0011fa: 21 02                      |     local.set 2
 0011fc: 02 40                      |     block
 0011fe: 20 03                      |       local.get 3
 001200: 2d 00 08                   |       i32.load8_u 0 8
 001203: 22 01                      |       local.tee 1
 001205: 41 04                      |       i32.const 4
 001207: 4b                         |       i32.gt_u
 001208: 0d 00                      |       br_if 0
 00120a: 20 01                      |       local.get 1
 00120c: 41 03                      |       i32.const 3
 00120e: 47                         |       i32.ne
 00120f: 0d 02                      |       br_if 2
 001211: 0b                         |     end
 001212: 20 02                      |     local.get 2
 001214: 28 02 00                   |     i32.load 2 0
 001217: 21 00                      |     local.set 0
 001219: 02 40                      |     block
 00121b: 20 02                      |       local.get 2
 00121d: 41 04                      |       i32.const 4
 00121f: 6a                         |       i32.add
 001220: 28 02 00                   |       i32.load 2 0
 001223: 22 01                      |       local.tee 1
 001225: 28 02 00                   |       i32.load 2 0
 001228: 22 04                      |       local.tee 4
 00122a: 45                         |       i32.eqz
 00122b: 0d 00                      |       br_if 0
 00122d: 20 00                      |       local.get 0
 00122f: 20 04                      |       local.get 4
 001231: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 00123a: 80 00                      | 
 00123c: 0b                         |     end
 00123d: 02 40                      |     block
 00123f: 20 01                      |       local.get 1
 001241: 28 02 04                   |       i32.load 2 4
 001244: 22 04                      |       local.tee 4
 001246: 45                         |       i32.eqz
 001247: 0d 00                      |       br_if 0
 001249: 20 00                      |       local.get 0
 00124b: 20 04                      |       local.get 4
 00124d: 20 01                      |       local.get 1
 00124f: 28 02 08                   |       i32.load 2 8
 001252: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 001258: 0b                         |     end
 001259: 20 02                      |     local.get 2
 00125b: 41 0c                      |     i32.const 12
 00125d: 41 04                      |     i32.const 4
 00125f: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 001265: 0c 01                      |     br 1
 001267: 0b                         |   end
 001268: 02 40                      |   block
 00126a: 20 03                      |     local.get 3
 00126c: 2d 00 08                   |     i32.load8_u 0 8
 00126f: 41 04                      |     i32.const 4
 001271: 46                         |     i32.eq
 001272: 0d 00                      |     br_if 0
 001274: 20 00                      |     local.get 0
 001276: 20 03                      |     local.get 3
 001278: 29 03 08                   |     i64.load 3 8
 00127b: 37 02 00                   |     i64.store 2 0
 00127e: 0c 01                      |     br 1
 001280: 0b                         |   end
 001281: 20 03                      |   local.get 3
 001283: 41 00                      |   i32.const 0
 001285: 36 02 28                   |   i32.store 2 40
 001288: 20 03                      |   local.get 3
 00128a: 41 01                      |   i32.const 1
 00128c: 36 02 1c                   |   i32.store 2 28
 00128f: 20 03                      |   local.get 3
 001291: 41 90 87 c0 80 00          |   i32.const 1049488
 001297: 36 02 18                   |   i32.store 2 24
 00129a: 20 03                      |   local.get 3
 00129c: 42 04                      |   i64.const 4
 00129e: 37 02 20                   |   i64.store 2 32
 0012a1: 20 03                      |   local.get 3
 0012a3: 41 18                      |   i32.const 24
 0012a5: 6a                         |   i32.add
 0012a6: 41 98 87 c0 80 00          |   i32.const 1049496
 0012ac: 10 81 81 80 80 00          |   call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 0012b2: 00                         |   unreachable
 0012b3: 0b                         | end
 0012b4: 20 03                      | local.get 3
 0012b6: 41 30                      | i32.const 48
 0012b8: 6a                         | i32.add
 0012b9: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0012bf: 0b                         | end
0012c1 func[38] <_ZN3std3sys3pal4wasi7helpers14abort_internal17h22e0957f477c4b9fE>:
 0012c2: 10 e8 80 80 80 00          | call 104 <abort>
 0012c8: 00                         | unreachable
 0012c9: 0b                         | end
0012cc func[39] <_ZN3std3env11current_dir17h5764d887fbb6b47dE>:
 0012cd: 05 7f                      | local[1..5] type=i32
 0012cf: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0012d5: 41 10                      | i32.const 16
 0012d7: 6b                         | i32.sub
 0012d8: 22 01                      | local.tee 1
 0012da: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0012e0: 41 00                      | i32.const 0
 0012e2: 2d 00 b1 95 c0 80 00       | i32.load8_u 0 1051313
 0012e9: 1a                         | drop
 0012ea: 41 80 04                   | i32.const 512
 0012ed: 21 02                      | local.set 2
 0012ef: 02 40                      | block
 0012f1: 02 40                      |   block
 0012f3: 02 40                      |     block
 0012f5: 02 40                      |       block
 0012f7: 02 40                      |         block
 0012f9: 02 40                      |           block
 0012fb: 41 80 04                   |             i32.const 512
 0012fe: 41 01                      |             i32.const 1
 001300: 10 85 80 80 80 00          |             call 5 <__rust_alloc>
 001306: 22 03                      |             local.tee 3
 001308: 45                         |             i32.eqz
 001309: 0d 00                      |             br_if 0
 00130b: 20 01                      |             local.get 1
 00130d: 20 03                      |             local.get 3
 00130f: 36 02 08                   |             i32.store 2 8
 001312: 20 01                      |             local.get 1
 001314: 41 80 04                   |             i32.const 512
 001317: 36 02 04                   |             i32.store 2 4
 00131a: 20 03                      |             local.get 3
 00131c: 41 80 04                   |             i32.const 512
 00131f: 10 e9 80 80 80 00          |             call 105 <getcwd>
 001325: 0d 03                      |             br_if 3
 001327: 02 40                      |             block
 001329: 02 40                      |               block
 00132b: 41 00                      |                 i32.const 0
 00132d: 28 02 e4 99 c0 80 00       |                 i32.load 2 1051876
 001334: 22 02                      |                 local.tee 2
 001336: 41 c4 00                   |                 i32.const 68
 001339: 47                         |                 i32.ne
 00133a: 0d 00                      |                 br_if 0
 00133c: 41 80 04                   |                 i32.const 512
 00133f: 21 02                      |                 local.set 2
 001341: 0c 01                      |                 br 1
 001343: 0b                         |               end
 001344: 20 00                      |               local.get 0
 001346: 20 02                      |               local.get 2
 001348: 36 02 08                   |               i32.store 2 8
 00134b: 20 00                      |               local.get 0
 00134d: 42 80 80 80 80 08          |               i64.const 2147483648
 001353: 37 02 00                   |               i64.store 2 0
 001356: 41 80 04                   |               i32.const 512
 001359: 21 02                      |               local.set 2
 00135b: 0c 03                      |               br 3
 00135d: 0b                         |             end
 00135e: 03 40                      |             loop
 001360: 20 01                      |               local.get 1
 001362: 20 02                      |               local.get 2
 001364: 36 02 0c                   |               i32.store 2 12
 001367: 20 01                      |               local.get 1
 001369: 41 04                      |               i32.const 4
 00136b: 6a                         |               i32.add
 00136c: 20 02                      |               local.get 2
 00136e: 41 01                      |               i32.const 1
 001370: 41 01                      |               i32.const 1
 001372: 41 01                      |               i32.const 1
 001374: 10 91 80 80 80 00          |               call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 00137a: 20 01                      |               local.get 1
 00137c: 28 02 08                   |               i32.load 2 8
 00137f: 22 03                      |               local.tee 3
 001381: 20 01                      |               local.get 1
 001383: 28 02 04                   |               i32.load 2 4
 001386: 22 02                      |               local.tee 2
 001388: 10 e9 80 80 80 00          |               call 105 <getcwd>
 00138e: 0d 04                      |               br_if 4
 001390: 41 00                      |               i32.const 0
 001392: 28 02 e4 99 c0 80 00       |               i32.load 2 1051876
 001399: 22 04                      |               local.tee 4
 00139b: 41 c4 00                   |               i32.const 68
 00139e: 47                         |               i32.ne
 00139f: 0d 02                      |               br_if 2
 0013a1: 0c 00                      |               br 0
 0013a3: 0b                         |             end
 0013a4: 0b                         |           end
 0013a5: 41 01                      |           i32.const 1
 0013a7: 41 80 04                   |           i32.const 512
 0013aa: 41 c8 8f c0 80 00          |           i32.const 1050568
 0013b0: 10 f8 80 80 80 00          |           call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 0013b6: 00                         |           unreachable
 0013b7: 0b                         |         end
 0013b8: 20 00                      |         local.get 0
 0013ba: 20 04                      |         local.get 4
 0013bc: 36 02 08                   |         i32.store 2 8
 0013bf: 20 00                      |         local.get 0
 0013c1: 42 80 80 80 80 08          |         i64.const 2147483648
 0013c7: 37 02 00                   |         i64.store 2 0
 0013ca: 20 02                      |         local.get 2
 0013cc: 45                         |         i32.eqz
 0013cd: 0d 02                      |         br_if 2
 0013cf: 0b                         |       end
 0013d0: 20 03                      |       local.get 3
 0013d2: 20 02                      |       local.get 2
 0013d4: 41 01                      |       i32.const 1
 0013d6: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 0013dc: 0c 01                      |       br 1
 0013de: 0b                         |     end
 0013df: 20 01                      |     local.get 1
 0013e1: 20 03                      |     local.get 3
 0013e3: 10 f4 80 80 80 00          |     call 116 <strlen>
 0013e9: 22 04                      |     local.tee 4
 0013eb: 36 02 0c                   |     i32.store 2 12
 0013ee: 02 40                      |     block
 0013f0: 20 02                      |       local.get 2
 0013f2: 20 04                      |       local.get 4
 0013f4: 4d                         |       i32.le_u
 0013f5: 0d 00                      |       br_if 0
 0013f7: 02 40                      |       block
 0013f9: 02 40                      |         block
 0013fb: 20 04                      |           local.get 4
 0013fd: 0d 00                      |           br_if 0
 0013ff: 41 01                      |           i32.const 1
 001401: 21 05                      |           local.set 5
 001403: 20 03                      |           local.get 3
 001405: 20 02                      |           local.get 2
 001407: 41 01                      |           i32.const 1
 001409: 10 86 80 80 80 00          |           call 6 <__rust_dealloc>
 00140f: 0c 01                      |           br 1
 001411: 0b                         |         end
 001412: 20 03                      |         local.get 3
 001414: 20 02                      |         local.get 2
 001416: 41 01                      |         i32.const 1
 001418: 20 04                      |         local.get 4
 00141a: 10 87 80 80 80 00          |         call 7 <__rust_realloc>
 001420: 22 05                      |         local.tee 5
 001422: 45                         |         i32.eqz
 001423: 0d 03                      |         br_if 3
 001425: 0b                         |       end
 001426: 20 01                      |       local.get 1
 001428: 20 04                      |       local.get 4
 00142a: 36 02 04                   |       i32.store 2 4
 00142d: 20 01                      |       local.get 1
 00142f: 20 05                      |       local.get 5
 001431: 36 02 08                   |       i32.store 2 8
 001434: 0b                         |     end
 001435: 20 00                      |     local.get 0
 001437: 20 01                      |     local.get 1
 001439: 29 02 04                   |     i64.load 2 4
 00143c: 37 02 00                   |     i64.store 2 0
 00143f: 20 00                      |     local.get 0
 001441: 41 08                      |     i32.const 8
 001443: 6a                         |     i32.add
 001444: 20 01                      |     local.get 1
 001446: 41 04                      |     i32.const 4
 001448: 6a                         |     i32.add
 001449: 41 08                      |     i32.const 8
 00144b: 6a                         |     i32.add
 00144c: 28 02 00                   |     i32.load 2 0
 00144f: 36 02 00                   |     i32.store 2 0
 001452: 0b                         |   end
 001453: 20 01                      |   local.get 1
 001455: 41 10                      |   i32.const 16
 001457: 6a                         |   i32.add
 001458: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 00145e: 0f                         |   return
 00145f: 0b                         | end
 001460: 41 01                      | i32.const 1
 001462: 20 04                      | local.get 4
 001464: 41 d8 8f c0 80 00          | i32.const 1050584
 00146a: 10 f8 80 80 80 00          | call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 001470: 00                         | unreachable
 001471: 0b                         | end
001474 func[40] <_ZN3std3env7_var_os17h819d6264ed566a61E>:
 001475: 03 7f                      | local[3..5] type=i32
 001477: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00147d: 41 a0 03                   | i32.const 416
 001480: 6b                         | i32.sub
 001481: 22 03                      | local.tee 3
 001483: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001489: 02 40                      | block
 00148b: 02 40                      |   block
 00148d: 02 40                      |     block
 00148f: 20 02                      |       local.get 2
 001491: 41 ff 02                   |       i32.const 383
 001494: 4b                         |       i32.gt_u
 001495: 0d 00                      |       br_if 0
 001497: 20 03                      |       local.get 3
 001499: 41 14                      |       i32.const 20
 00149b: 6a                         |       i32.add
 00149c: 20 01                      |       local.get 1
 00149e: 20 02                      |       local.get 2
 0014a0: 10 ee 80 80 80 00          |       call 110 <memcpy>
 0014a6: 1a                         |       drop
 0014a7: 20 03                      |       local.get 3
 0014a9: 41 14                      |       i32.const 20
 0014ab: 6a                         |       i32.add
 0014ac: 20 02                      |       local.get 2
 0014ae: 6a                         |       i32.add
 0014af: 41 00                      |       i32.const 0
 0014b1: 3a 00 00                   |       i32.store8 0 0
 0014b4: 20 03                      |       local.get 3
 0014b6: 41 94 03                   |       i32.const 404
 0014b9: 6a                         |       i32.add
 0014ba: 20 03                      |       local.get 3
 0014bc: 41 14                      |       i32.const 20
 0014be: 6a                         |       i32.add
 0014bf: 20 02                      |       local.get 2
 0014c1: 41 01                      |       i32.const 1
 0014c3: 6a                         |       i32.add
 0014c4: 10 85 81 80 80 00          |       call 133 <_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h64494a15f58030c4E>
 0014ca: 02 40                      |       block
 0014cc: 20 03                      |         local.get 3
 0014ce: 28 02 94 03                |         i32.load 2 404
 0014d2: 0d 00                      |         br_if 0
 0014d4: 02 40                      |         block
 0014d6: 20 03                      |           local.get 3
 0014d8: 28 02 98 03                |           i32.load 2 408
 0014dc: 10 eb 80 80 80 00          |           call 107 <getenv>
 0014e2: 22 01                      |           local.tee 1
 0014e4: 0d 00                      |           br_if 0
 0014e6: 41 80 80 80 80 78          |           i32.const 2147483648
 0014ec: 21 02                      |           local.set 2
 0014ee: 0c 03                      |           br 3
 0014f0: 0b                         |         end
 0014f1: 41 00                      |         i32.const 0
 0014f3: 21 04                      |         local.set 4
 0014f5: 20 01                      |         local.get 1
 0014f7: 10 f4 80 80 80 00          |         call 116 <strlen>
 0014fd: 22 02                      |         local.tee 2
 0014ff: 41 00                      |         i32.const 0
 001501: 48                         |         i32.lt_s
 001502: 0d 03                      |         br_if 3
 001504: 02 40                      |         block
 001506: 02 40                      |           block
 001508: 20 02                      |             local.get 2
 00150a: 0d 00                      |             br_if 0
 00150c: 41 01                      |             i32.const 1
 00150e: 21 05                      |             local.set 5
 001510: 0c 01                      |             br 1
 001512: 0b                         |           end
 001513: 41 00                      |           i32.const 0
 001515: 2d 00 b1 95 c0 80 00       |           i32.load8_u 0 1051313
 00151c: 1a                         |           drop
 00151d: 41 01                      |           i32.const 1
 00151f: 21 04                      |           local.set 4
 001521: 20 02                      |           local.get 2
 001523: 41 01                      |           i32.const 1
 001525: 10 85 80 80 80 00          |           call 5 <__rust_alloc>
 00152b: 22 05                      |           local.tee 5
 00152d: 45                         |           i32.eqz
 00152e: 0d 04                      |           br_if 4
 001530: 0b                         |         end
 001531: 20 05                      |         local.get 5
 001533: 20 01                      |         local.get 1
 001535: 20 02                      |         local.get 2
 001537: 10 ee 80 80 80 00          |         call 110 <memcpy>
 00153d: 21 01                      |         local.set 1
 00153f: 20 03                      |         local.get 3
 001541: 20 02                      |         local.get 2
 001543: 36 02 10                   |         i32.store 2 16
 001546: 20 03                      |         local.get 3
 001548: 20 01                      |         local.get 1
 00154a: 36 02 0c                   |         i32.store 2 12
 00154d: 0c 02                      |         br 2
 00154f: 0b                         |       end
 001550: 20 03                      |       local.get 3
 001552: 41 00                      |       i32.const 0
 001554: 29 03 d8 88 c0 80 00       |       i64.load 3 1049688
 00155b: 37 02 0c                   |       i64.store 2 12
 00155e: 41 81 80 80 80 78          |       i32.const 2147483649
 001564: 21 02                      |       local.set 2
 001566: 0c 01                      |       br 1
 001568: 0b                         |     end
 001569: 20 03                      |     local.get 3
 00156b: 41 08                      |     i32.const 8
 00156d: 6a                         |     i32.add
 00156e: 20 01                      |     local.get 1
 001570: 20 02                      |     local.get 2
 001572: 10 a9 80 80 80 00          |     call 41 <_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17hc6f79cdfd87226cbE>
 001578: 20 03                      |     local.get 3
 00157a: 28 02 08                   |     i32.load 2 8
 00157d: 21 02                      |     local.set 2
 00157f: 0b                         |   end
 001580: 02 40                      |   block
 001582: 02 40                      |     block
 001584: 20 02                      |       local.get 2
 001586: 41 81 80 80 80 78          |       i32.const 2147483649
 00158c: 46                         |       i32.eq
 00158d: 0d 00                      |       br_if 0
 00158f: 20 00                      |       local.get 0
 001591: 20 03                      |       local.get 3
 001593: 29 02 0c                   |       i64.load 2 12
 001596: 37 02 04                   |       i64.store 2 4
 001599: 20 00                      |       local.get 0
 00159b: 20 02                      |       local.get 2
 00159d: 36 02 00                   |       i32.store 2 0
 0015a0: 0c 01                      |       br 1
 0015a2: 0b                         |     end
 0015a3: 02 40                      |     block
 0015a5: 20 03                      |       local.get 3
 0015a7: 2d 00 0c                   |       i32.load8_u 0 12
 0015aa: 41 03                      |       i32.const 3
 0015ac: 47                         |       i32.ne
 0015ad: 0d 00                      |       br_if 0
 0015af: 20 03                      |       local.get 3
 0015b1: 28 02 10                   |       i32.load 2 16
 0015b4: 22 02                      |       local.tee 2
 0015b6: 28 02 00                   |       i32.load 2 0
 0015b9: 21 05                      |       local.set 5
 0015bb: 02 40                      |       block
 0015bd: 20 02                      |         local.get 2
 0015bf: 41 04                      |         i32.const 4
 0015c1: 6a                         |         i32.add
 0015c2: 28 02 00                   |         i32.load 2 0
 0015c5: 22 01                      |         local.tee 1
 0015c7: 28 02 00                   |         i32.load 2 0
 0015ca: 22 04                      |         local.tee 4
 0015cc: 45                         |         i32.eqz
 0015cd: 0d 00                      |         br_if 0
 0015cf: 20 05                      |         local.get 5
 0015d1: 20 04                      |         local.get 4
 0015d3: 11 80 80 80 80 00 80 80 80 |         call_indirect 0 (type 0)
 0015dc: 80 00                      | 
 0015de: 0b                         |       end
 0015df: 02 40                      |       block
 0015e1: 20 01                      |         local.get 1
 0015e3: 28 02 04                   |         i32.load 2 4
 0015e6: 22 04                      |         local.tee 4
 0015e8: 45                         |         i32.eqz
 0015e9: 0d 00                      |         br_if 0
 0015eb: 20 05                      |         local.get 5
 0015ed: 20 04                      |         local.get 4
 0015ef: 20 01                      |         local.get 1
 0015f1: 28 02 08                   |         i32.load 2 8
 0015f4: 10 86 80 80 80 00          |         call 6 <__rust_dealloc>
 0015fa: 0b                         |       end
 0015fb: 20 02                      |       local.get 2
 0015fd: 41 0c                      |       i32.const 12
 0015ff: 41 04                      |       i32.const 4
 001601: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 001607: 0b                         |     end
 001608: 20 00                      |     local.get 0
 00160a: 41 80 80 80 80 78          |     i32.const 2147483648
 001610: 36 02 00                   |     i32.store 2 0
 001613: 0b                         |   end
 001614: 20 03                      |   local.get 3
 001616: 41 a0 03                   |   i32.const 416
 001619: 6a                         |   i32.add
 00161a: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 001620: 0f                         |   return
 001621: 0b                         | end
 001622: 20 04                      | local.get 4
 001624: 20 02                      | local.get 2
 001626: 41 98 81 c0 80 00          | i32.const 1048728
 00162c: 10 f8 80 80 80 00          | call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 001632: 00                         | unreachable
 001633: 0b                         | end
001636 func[41] <_ZN3std3sys3pal6common14small_c_string24run_with_cstr_allocating17hc6f79cdfd87226cbE>:
 001637: 05 7f                      | local[3..7] type=i32
 001639: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00163f: 41 10                      | i32.const 16
 001641: 6b                         | i32.sub
 001642: 22 03                      | local.tee 3
 001644: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00164a: 20 03                      | local.get 3
 00164c: 20 01                      | local.get 1
 00164e: 20 02                      | local.get 2
 001650: 10 fb 80 80 80 00          | call 123 <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h2a7f5495f35dd8d5E>
 001656: 02 40                      | block
 001658: 02 40                      |   block
 00165a: 02 40                      |     block
 00165c: 20 03                      |       local.get 3
 00165e: 28 02 00                   |       i32.load 2 0
 001661: 22 02                      |       local.tee 2
 001663: 41 80 80 80 80 78          |       i32.const 2147483648
 001669: 47                         |       i32.ne
 00166a: 0d 00                      |       br_if 0
 00166c: 20 03                      |       local.get 3
 00166e: 28 02 08                   |       i32.load 2 8
 001671: 21 01                      |       local.set 1
 001673: 02 40                      |       block
 001675: 02 40                      |         block
 001677: 20 03                      |           local.get 3
 001679: 28 02 04                   |           i32.load 2 4
 00167c: 22 04                      |           local.tee 4
 00167e: 10 eb 80 80 80 00          |           call 107 <getenv>
 001684: 22 05                      |           local.tee 5
 001686: 0d 00                      |           br_if 0
 001688: 20 00                      |           local.get 0
 00168a: 41 80 80 80 80 78          |           i32.const 2147483648
 001690: 36 02 00                   |           i32.store 2 0
 001693: 0c 01                      |           br 1
 001695: 0b                         |         end
 001696: 41 00                      |         i32.const 0
 001698: 21 06                      |         local.set 6
 00169a: 20 05                      |         local.get 5
 00169c: 10 f4 80 80 80 00          |         call 116 <strlen>
 0016a2: 22 02                      |         local.tee 2
 0016a4: 41 00                      |         i32.const 0
 0016a6: 48                         |         i32.lt_s
 0016a7: 0d 02                      |         br_if 2
 0016a9: 02 40                      |         block
 0016ab: 02 40                      |           block
 0016ad: 20 02                      |             local.get 2
 0016af: 0d 00                      |             br_if 0
 0016b1: 41 01                      |             i32.const 1
 0016b3: 21 07                      |             local.set 7
 0016b5: 0c 01                      |             br 1
 0016b7: 0b                         |           end
 0016b8: 41 00                      |           i32.const 0
 0016ba: 2d 00 b1 95 c0 80 00       |           i32.load8_u 0 1051313
 0016c1: 1a                         |           drop
 0016c2: 41 01                      |           i32.const 1
 0016c4: 21 06                      |           local.set 6
 0016c6: 20 02                      |           local.get 2
 0016c8: 41 01                      |           i32.const 1
 0016ca: 10 85 80 80 80 00          |           call 5 <__rust_alloc>
 0016d0: 22 07                      |           local.tee 7
 0016d2: 45                         |           i32.eqz
 0016d3: 0d 03                      |           br_if 3
 0016d5: 0b                         |         end
 0016d6: 20 07                      |         local.get 7
 0016d8: 20 05                      |         local.get 5
 0016da: 20 02                      |         local.get 2
 0016dc: 10 ee 80 80 80 00          |         call 110 <memcpy>
 0016e2: 21 05                      |         local.set 5
 0016e4: 20 00                      |         local.get 0
 0016e6: 20 02                      |         local.get 2
 0016e8: 36 02 08                   |         i32.store 2 8
 0016eb: 20 00                      |         local.get 0
 0016ed: 20 05                      |         local.get 5
 0016ef: 36 02 04                   |         i32.store 2 4
 0016f2: 20 00                      |         local.get 0
 0016f4: 20 02                      |         local.get 2
 0016f6: 36 02 00                   |         i32.store 2 0
 0016f9: 0b                         |       end
 0016fa: 20 04                      |       local.get 4
 0016fc: 41 00                      |       i32.const 0
 0016fe: 3a 00 00                   |       i32.store8 0 0
 001701: 20 01                      |       local.get 1
 001703: 45                         |       i32.eqz
 001704: 0d 02                      |       br_if 2
 001706: 20 04                      |       local.get 4
 001708: 20 01                      |       local.get 1
 00170a: 41 01                      |       i32.const 1
 00170c: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 001712: 0c 02                      |       br 2
 001714: 0b                         |     end
 001715: 20 00                      |     local.get 0
 001717: 41 81 80 80 80 78          |     i32.const 2147483649
 00171d: 36 02 00                   |     i32.store 2 0
 001720: 20 00                      |     local.get 0
 001722: 41 00                      |     i32.const 0
 001724: 29 03 d8 88 c0 80 00       |     i64.load 3 1049688
 00172b: 37 02 04                   |     i64.store 2 4
 00172e: 20 02                      |     local.get 2
 001730: 45                         |     i32.eqz
 001731: 0d 01                      |     br_if 1
 001733: 20 03                      |     local.get 3
 001735: 28 02 04                   |     i32.load 2 4
 001738: 20 02                      |     local.get 2
 00173a: 41 01                      |     i32.const 1
 00173c: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 001742: 0c 01                      |     br 1
 001744: 0b                         |   end
 001745: 20 06                      |   local.get 6
 001747: 20 02                      |   local.get 2
 001749: 41 98 81 c0 80 00          |   i32.const 1048728
 00174f: 10 f8 80 80 80 00          |   call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 001755: 00                         |   unreachable
 001756: 0b                         | end
 001757: 20 03                      | local.get 3
 001759: 41 10                      | i32.const 16
 00175b: 6a                         | i32.add
 00175c: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001762: 0b                         | end
001764 func[42] <_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5write17hf0a12c60b99c1ac1E>:
 001765: 01 7f                      | local[4] type=i32
 001767: 02 40                      | block
 001769: 20 01                      |   local.get 1
 00176b: 28 02 00                   |   i32.load 2 0
 00176e: 20 01                      |   local.get 1
 001770: 28 02 08                   |   i32.load 2 8
 001773: 22 04                      |   local.tee 4
 001775: 6b                         |   i32.sub
 001776: 20 03                      |   local.get 3
 001778: 4f                         |   i32.ge_u
 001779: 0d 00                      |   br_if 0
 00177b: 20 01                      |   local.get 1
 00177d: 20 04                      |   local.get 4
 00177f: 20 03                      |   local.get 3
 001781: 41 01                      |   i32.const 1
 001783: 41 01                      |   i32.const 1
 001785: 10 91 80 80 80 00          |   call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 00178b: 20 01                      |   local.get 1
 00178d: 28 02 08                   |   i32.load 2 8
 001790: 21 04                      |   local.set 4
 001792: 0b                         | end
 001793: 20 01                      | local.get 1
 001795: 28 02 04                   | i32.load 2 4
 001798: 20 04                      | local.get 4
 00179a: 6a                         | i32.add
 00179b: 20 02                      | local.get 2
 00179d: 20 03                      | local.get 3
 00179f: 10 ee 80 80 80 00          | call 110 <memcpy>
 0017a5: 1a                         | drop
 0017a6: 20 00                      | local.get 0
 0017a8: 20 03                      | local.get 3
 0017aa: 36 02 04                   | i32.store 2 4
 0017ad: 20 01                      | local.get 1
 0017af: 20 04                      | local.get 4
 0017b1: 20 03                      | local.get 3
 0017b3: 6a                         | i32.add
 0017b4: 36 02 08                   | i32.store 2 8
 0017b7: 20 00                      | local.get 0
 0017b9: 41 04                      | i32.const 4
 0017bb: 3a 00 00                   | i32.store8 0 0
 0017be: 0b                         | end
0017c1 func[43] <_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$14write_vectored17h6c3c5834246e3e13E>:
 0017c2: 05 7f                      | local[4..8] type=i32
 0017c4: 02 40                      | block
 0017c6: 02 40                      |   block
 0017c8: 20 03                      |     local.get 3
 0017ca: 0d 00                      |     br_if 0
 0017cc: 41 00                      |     i32.const 0
 0017ce: 21 04                      |     local.set 4
 0017d0: 0c 01                      |     br 1
 0017d2: 0b                         |   end
 0017d3: 20 03                      |   local.get 3
 0017d5: 41 03                      |   i32.const 3
 0017d7: 71                         |   i32.and
 0017d8: 21 05                      |   local.set 5
 0017da: 02 40                      |   block
 0017dc: 02 40                      |     block
 0017de: 20 03                      |       local.get 3
 0017e0: 41 04                      |       i32.const 4
 0017e2: 4f                         |       i32.ge_u
 0017e3: 0d 00                      |       br_if 0
 0017e5: 41 00                      |       i32.const 0
 0017e7: 21 04                      |       local.set 4
 0017e9: 41 00                      |       i32.const 0
 0017eb: 21 06                      |       local.set 6
 0017ed: 0c 01                      |       br 1
 0017ef: 0b                         |     end
 0017f0: 20 02                      |     local.get 2
 0017f2: 41 1c                      |     i32.const 28
 0017f4: 6a                         |     i32.add
 0017f5: 21 07                      |     local.set 7
 0017f7: 20 03                      |     local.get 3
 0017f9: 41 7c                      |     i32.const 4294967292
 0017fb: 71                         |     i32.and
 0017fc: 21 08                      |     local.set 8
 0017fe: 41 00                      |     i32.const 0
 001800: 21 04                      |     local.set 4
 001802: 41 00                      |     i32.const 0
 001804: 21 06                      |     local.set 6
 001806: 03 40                      |     loop
 001808: 20 07                      |       local.get 7
 00180a: 28 02 00                   |       i32.load 2 0
 00180d: 20 07                      |       local.get 7
 00180f: 41 78                      |       i32.const 4294967288
 001811: 6a                         |       i32.add
 001812: 28 02 00                   |       i32.load 2 0
 001815: 20 07                      |       local.get 7
 001817: 41 70                      |       i32.const 4294967280
 001819: 6a                         |       i32.add
 00181a: 28 02 00                   |       i32.load 2 0
 00181d: 20 07                      |       local.get 7
 00181f: 41 68                      |       i32.const 4294967272
 001821: 6a                         |       i32.add
 001822: 28 02 00                   |       i32.load 2 0
 001825: 20 04                      |       local.get 4
 001827: 6a                         |       i32.add
 001828: 6a                         |       i32.add
 001829: 6a                         |       i32.add
 00182a: 6a                         |       i32.add
 00182b: 21 04                      |       local.set 4
 00182d: 20 07                      |       local.get 7
 00182f: 41 20                      |       i32.const 32
 001831: 6a                         |       i32.add
 001832: 21 07                      |       local.set 7
 001834: 20 08                      |       local.get 8
 001836: 20 06                      |       local.get 6
 001838: 41 04                      |       i32.const 4
 00183a: 6a                         |       i32.add
 00183b: 22 06                      |       local.tee 6
 00183d: 47                         |       i32.ne
 00183e: 0d 00                      |       br_if 0
 001840: 0b                         |     end
 001841: 0b                         |   end
 001842: 02 40                      |   block
 001844: 20 05                      |     local.get 5
 001846: 45                         |     i32.eqz
 001847: 0d 00                      |     br_if 0
 001849: 20 06                      |     local.get 6
 00184b: 41 03                      |     i32.const 3
 00184d: 74                         |     i32.shl
 00184e: 20 02                      |     local.get 2
 001850: 6a                         |     i32.add
 001851: 41 04                      |     i32.const 4
 001853: 6a                         |     i32.add
 001854: 21 07                      |     local.set 7
 001856: 03 40                      |     loop
 001858: 20 07                      |       local.get 7
 00185a: 28 02 00                   |       i32.load 2 0
 00185d: 20 04                      |       local.get 4
 00185f: 6a                         |       i32.add
 001860: 21 04                      |       local.set 4
 001862: 20 07                      |       local.get 7
 001864: 41 08                      |       i32.const 8
 001866: 6a                         |       i32.add
 001867: 21 07                      |       local.set 7
 001869: 20 05                      |       local.get 5
 00186b: 41 7f                      |       i32.const 4294967295
 00186d: 6a                         |       i32.add
 00186e: 22 05                      |       local.tee 5
 001870: 0d 00                      |       br_if 0
 001872: 0b                         |     end
 001873: 0b                         |   end
 001874: 20 03                      |   local.get 3
 001876: 41 03                      |   i32.const 3
 001878: 74                         |   i32.shl
 001879: 21 07                      |   local.set 7
 00187b: 02 40                      |   block
 00187d: 20 01                      |     local.get 1
 00187f: 28 02 00                   |     i32.load 2 0
 001882: 20 01                      |     local.get 1
 001884: 28 02 08                   |     i32.load 2 8
 001887: 22 05                      |     local.tee 5
 001889: 6b                         |     i32.sub
 00188a: 20 04                      |     local.get 4
 00188c: 4f                         |     i32.ge_u
 00188d: 0d 00                      |     br_if 0
 00188f: 20 01                      |     local.get 1
 001891: 20 05                      |     local.get 5
 001893: 20 04                      |     local.get 4
 001895: 41 01                      |     i32.const 1
 001897: 41 01                      |     i32.const 1
 001899: 10 91 80 80 80 00          |     call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 00189f: 0b                         |   end
 0018a0: 20 02                      |   local.get 2
 0018a2: 20 07                      |   local.get 7
 0018a4: 6a                         |   i32.add
 0018a5: 21 08                      |   local.set 8
 0018a7: 20 01                      |   local.get 1
 0018a9: 28 02 08                   |   i32.load 2 8
 0018ac: 21 07                      |   local.set 7
 0018ae: 03 40                      |   loop
 0018b0: 20 02                      |     local.get 2
 0018b2: 28 02 00                   |     i32.load 2 0
 0018b5: 21 06                      |     local.set 6
 0018b7: 02 40                      |     block
 0018b9: 20 01                      |       local.get 1
 0018bb: 28 02 00                   |       i32.load 2 0
 0018be: 20 07                      |       local.get 7
 0018c0: 6b                         |       i32.sub
 0018c1: 20 02                      |       local.get 2
 0018c3: 28 02 04                   |       i32.load 2 4
 0018c6: 22 05                      |       local.tee 5
 0018c8: 4f                         |       i32.ge_u
 0018c9: 0d 00                      |       br_if 0
 0018cb: 20 01                      |       local.get 1
 0018cd: 20 07                      |       local.get 7
 0018cf: 20 05                      |       local.get 5
 0018d1: 41 01                      |       i32.const 1
 0018d3: 41 01                      |       i32.const 1
 0018d5: 10 91 80 80 80 00          |       call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 0018db: 20 01                      |       local.get 1
 0018dd: 28 02 08                   |       i32.load 2 8
 0018e0: 21 07                      |       local.set 7
 0018e2: 0b                         |     end
 0018e3: 20 01                      |     local.get 1
 0018e5: 28 02 04                   |     i32.load 2 4
 0018e8: 20 07                      |     local.get 7
 0018ea: 6a                         |     i32.add
 0018eb: 20 06                      |     local.get 6
 0018ed: 20 05                      |     local.get 5
 0018ef: 10 ee 80 80 80 00          |     call 110 <memcpy>
 0018f5: 1a                         |     drop
 0018f6: 20 01                      |     local.get 1
 0018f8: 20 07                      |     local.get 7
 0018fa: 20 05                      |     local.get 5
 0018fc: 6a                         |     i32.add
 0018fd: 22 07                      |     local.tee 7
 0018ff: 36 02 08                   |     i32.store 2 8
 001902: 20 02                      |     local.get 2
 001904: 41 08                      |     i32.const 8
 001906: 6a                         |     i32.add
 001907: 22 02                      |     local.tee 2
 001909: 20 08                      |     local.get 8
 00190b: 47                         |     i32.ne
 00190c: 0d 00                      |     br_if 0
 00190e: 0b                         |   end
 00190f: 0b                         | end
 001910: 20 00                      | local.get 0
 001912: 41 04                      | i32.const 4
 001914: 3a 00 00                   | i32.store8 0 0
 001917: 20 00                      | local.get 0
 001919: 20 04                      | local.get 4
 00191b: 36 02 04                   | i32.store 2 4
 00191e: 0b                         | end
001920 func[44] <_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$17is_write_vectored17h6cda4baa60501520E>:
 001921: 41 01                      | i32.const 1
 001923: 0b                         | end
001925 func[45] <_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$9write_all17h5a9441dc1f98549cE>:
 001926: 01 7f                      | local[4] type=i32
 001928: 02 40                      | block
 00192a: 20 01                      |   local.get 1
 00192c: 28 02 00                   |   i32.load 2 0
 00192f: 20 01                      |   local.get 1
 001931: 28 02 08                   |   i32.load 2 8
 001934: 22 04                      |   local.tee 4
 001936: 6b                         |   i32.sub
 001937: 20 03                      |   local.get 3
 001939: 4f                         |   i32.ge_u
 00193a: 0d 00                      |   br_if 0
 00193c: 20 01                      |   local.get 1
 00193e: 20 04                      |   local.get 4
 001940: 20 03                      |   local.get 3
 001942: 41 01                      |   i32.const 1
 001944: 41 01                      |   i32.const 1
 001946: 10 91 80 80 80 00          |   call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 00194c: 20 01                      |   local.get 1
 00194e: 28 02 08                   |   i32.load 2 8
 001951: 21 04                      |   local.set 4
 001953: 0b                         | end
 001954: 20 01                      | local.get 1
 001956: 28 02 04                   | i32.load 2 4
 001959: 20 04                      | local.get 4
 00195b: 6a                         | i32.add
 00195c: 20 02                      | local.get 2
 00195e: 20 03                      | local.get 3
 001960: 10 ee 80 80 80 00          | call 110 <memcpy>
 001966: 1a                         | drop
 001967: 20 00                      | local.get 0
 001969: 41 04                      | i32.const 4
 00196b: 3a 00 00                   | i32.store8 0 0
 00196e: 20 01                      | local.get 1
 001970: 20 04                      | local.get 4
 001972: 20 03                      | local.get 3
 001974: 6a                         | i32.add
 001975: 36 02 08                   | i32.store 2 8
 001978: 0b                         | end
00197a func[46] <_ZN3std2io5impls74_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$5flush17hee060fef41450135E>:
 00197b: 20 00                      | local.get 0
 00197d: 41 04                      | i32.const 4
 00197f: 3a 00 00                   | i32.store8 0 0
 001982: 0b                         | end
001985 func[47] <_ZN3std2io5Write18write_all_vectored17h5590aa0c7f699481E>:
 001986: 06 7f                      | local[4..9] type=i32
 001988: 01 7e                      | local[10] type=i64
 00198a: 01 7f                      | local[11] type=i32
 00198c: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 001992: 41 20                      | i32.const 32
 001994: 6b                         | i32.sub
 001995: 22 04                      | local.tee 4
 001997: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00199d: 02 40                      | block
 00199f: 02 40                      |   block
 0019a1: 02 40                      |     block
 0019a3: 02 40                      |       block
 0019a5: 02 40                      |         block
 0019a7: 20 03                      |           local.get 3
 0019a9: 45                         |           i32.eqz
 0019aa: 0d 00                      |           br_if 0
 0019ac: 20 02                      |           local.get 2
 0019ae: 41 04                      |           i32.const 4
 0019b0: 6a                         |           i32.add
 0019b1: 21 05                      |           local.set 5
 0019b3: 20 03                      |           local.get 3
 0019b5: 41 03                      |           i32.const 3
 0019b7: 74                         |           i32.shl
 0019b8: 21 06                      |           local.set 6
 0019ba: 20 03                      |           local.get 3
 0019bc: 41 7f                      |           i32.const 4294967295
 0019be: 6a                         |           i32.add
 0019bf: 41 ff ff ff ff 01          |           i32.const 536870911
 0019c5: 71                         |           i32.and
 0019c6: 41 01                      |           i32.const 1
 0019c8: 6a                         |           i32.add
 0019c9: 21 07                      |           local.set 7
 0019cb: 41 00                      |           i32.const 0
 0019cd: 21 08                      |           local.set 8
 0019cf: 02 40                      |           block
 0019d1: 03 40                      |             loop
 0019d3: 20 05                      |               local.get 5
 0019d5: 28 02 00                   |               i32.load 2 0
 0019d8: 0d 01                      |               br_if 1
 0019da: 20 05                      |               local.get 5
 0019dc: 41 08                      |               i32.const 8
 0019de: 6a                         |               i32.add
 0019df: 21 05                      |               local.set 5
 0019e1: 20 08                      |               local.get 8
 0019e3: 41 01                      |               i32.const 1
 0019e5: 6a                         |               i32.add
 0019e6: 21 08                      |               local.set 8
 0019e8: 20 06                      |               local.get 6
 0019ea: 41 78                      |               i32.const 4294967288
 0019ec: 6a                         |               i32.add
 0019ed: 22 06                      |               local.tee 6
 0019ef: 0d 00                      |               br_if 0
 0019f1: 0b                         |             end
 0019f2: 20 07                      |             local.get 7
 0019f4: 21 08                      |             local.set 8
 0019f6: 0b                         |           end
 0019f7: 20 03                      |           local.get 3
 0019f9: 20 08                      |           local.get 8
 0019fb: 49                         |           i32.lt_u
 0019fc: 0d 04                      |           br_if 4
 0019fe: 20 03                      |           local.get 3
 001a00: 20 08                      |           local.get 8
 001a02: 6b                         |           i32.sub
 001a03: 22 07                      |           local.tee 7
 001a05: 45                         |           i32.eqz
 001a06: 0d 00                      |           br_if 0
 001a08: 20 02                      |           local.get 2
 001a0a: 20 08                      |           local.get 8
 001a0c: 41 03                      |           i32.const 3
 001a0e: 74                         |           i32.shl
 001a0f: 6a                         |           i32.add
 001a10: 21 09                      |           local.set 9
 001a12: 03 40                      |           loop
 001a14: 20 04                      |             local.get 4
 001a16: 41 08                      |             i32.const 8
 001a18: 6a                         |             i32.add
 001a19: 41 02                      |             i32.const 2
 001a1b: 20 09                      |             local.get 9
 001a1d: 20 07                      |             local.get 7
 001a1f: 10 d7 80 80 80 00          |             call 87 <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>
 001a25: 02 40                      |             block
 001a27: 02 40                      |               block
 001a29: 20 04                      |                 local.get 4
 001a2b: 2f 01 08                   |                 i32.load16_u 1 8
 001a2e: 45                         |                 i32.eqz
 001a2f: 0d 00                      |                 br_if 0
 001a31: 20 04                      |                 local.get 4
 001a33: 33 01 0a                   |                 i64.load16_u 1 10
 001a36: 22 0a                      |                 local.tee 10
 001a38: 42 1b                      |                 i64.const 27
 001a3a: 51                         |                 i64.eq
 001a3b: 0d 01                      |                 br_if 1
 001a3d: 20 00                      |                 local.get 0
 001a3f: 20 0a                      |                 local.get 10
 001a41: 42 20                      |                 i64.const 32
 001a43: 86                         |                 i64.shl
 001a44: 37 02 00                   |                 i64.store 2 0
 001a47: 0c 04                      |                 br 4
 001a49: 0b                         |               end
 001a4a: 02 40                      |               block
 001a4c: 20 04                      |                 local.get 4
 001a4e: 28 02 0c                   |                 i32.load 2 12
 001a51: 22 05                      |                 local.tee 5
 001a53: 0d 00                      |                 br_if 0
 001a55: 20 00                      |                 local.get 0
 001a57: 41 00                      |                 i32.const 0
 001a59: 29 03 a0 86 c0 80 00       |                 i64.load 3 1049376
 001a60: 37 02 00                   |                 i64.store 2 0
 001a63: 0c 04                      |                 br 4
 001a65: 0b                         |               end
 001a66: 20 09                      |               local.get 9
 001a68: 41 04                      |               i32.const 4
 001a6a: 6a                         |               i32.add
 001a6b: 21 08                      |               local.set 8
 001a6d: 20 07                      |               local.get 7
 001a6f: 41 03                      |               i32.const 3
 001a71: 74                         |               i32.shl
 001a72: 21 03                      |               local.set 3
 001a74: 20 07                      |               local.get 7
 001a76: 41 7f                      |               i32.const 4294967295
 001a78: 6a                         |               i32.add
 001a79: 41 ff ff ff ff 01          |               i32.const 536870911
 001a7f: 71                         |               i32.and
 001a80: 41 01                      |               i32.const 1
 001a82: 6a                         |               i32.add
 001a83: 21 0b                      |               local.set 11
 001a85: 41 00                      |               i32.const 0
 001a87: 21 06                      |               local.set 6
 001a89: 02 40                      |               block
 001a8b: 03 40                      |                 loop
 001a8d: 20 05                      |                   local.get 5
 001a8f: 20 08                      |                   local.get 8
 001a91: 28 02 00                   |                   i32.load 2 0
 001a94: 22 02                      |                   local.tee 2
 001a96: 49                         |                   i32.lt_u
 001a97: 0d 01                      |                   br_if 1
 001a99: 20 08                      |                   local.get 8
 001a9b: 41 08                      |                   i32.const 8
 001a9d: 6a                         |                   i32.add
 001a9e: 21 08                      |                   local.set 8
 001aa0: 20 06                      |                   local.get 6
 001aa2: 41 01                      |                   i32.const 1
 001aa4: 6a                         |                   i32.add
 001aa5: 21 06                      |                   local.set 6
 001aa7: 20 05                      |                   local.get 5
 001aa9: 20 02                      |                   local.get 2
 001aab: 6b                         |                   i32.sub
 001aac: 21 05                      |                   local.set 5
 001aae: 20 03                      |                   local.get 3
 001ab0: 41 78                      |                   i32.const 4294967288
 001ab2: 6a                         |                   i32.add
 001ab3: 22 03                      |                   local.tee 3
 001ab5: 0d 00                      |                   br_if 0
 001ab7: 0b                         |                 end
 001ab8: 20 0b                      |                 local.get 11
 001aba: 21 06                      |                 local.set 6
 001abc: 0b                         |               end
 001abd: 20 07                      |               local.get 7
 001abf: 20 06                      |               local.get 6
 001ac1: 49                         |               i32.lt_u
 001ac2: 0d 04                      |               br_if 4
 001ac4: 20 07                      |               local.get 7
 001ac6: 20 06                      |               local.get 6
 001ac8: 6b                         |               i32.sub
 001ac9: 21 08                      |               local.set 8
 001acb: 20 09                      |               local.get 9
 001acd: 20 06                      |               local.get 6
 001acf: 41 03                      |               i32.const 3
 001ad1: 74                         |               i32.shl
 001ad2: 6a                         |               i32.add
 001ad3: 21 09                      |               local.set 9
 001ad5: 02 40                      |               block
 001ad7: 20 07                      |                 local.get 7
 001ad9: 20 06                      |                 local.get 6
 001adb: 47                         |                 i32.ne
 001adc: 0d 00                      |                 br_if 0
 001ade: 20 08                      |                 local.get 8
 001ae0: 21 07                      |                 local.set 7
 001ae2: 20 05                      |                 local.get 5
 001ae4: 45                         |                 i32.eqz
 001ae5: 0d 01                      |                 br_if 1
 001ae7: 20 04                      |                 local.get 4
 001ae9: 41 00                      |                 i32.const 0
 001aeb: 36 02 18                   |                 i32.store 2 24
 001aee: 20 04                      |                 local.get 4
 001af0: 41 01                      |                 i32.const 1
 001af2: 36 02 0c                   |                 i32.store 2 12
 001af5: 20 04                      |                 local.get 4
 001af7: 41 f8 84 c0 80 00          |                 i32.const 1049208
 001afd: 36 02 08                   |                 i32.store 2 8
 001b00: 20 04                      |                 local.get 4
 001b02: 42 04                      |                 i64.const 4
 001b04: 37 02 10                   |                 i64.store 2 16
 001b07: 20 04                      |                 local.get 4
 001b09: 41 08                      |                 i32.const 8
 001b0b: 6a                         |                 i32.add
 001b0c: 41 80 85 c0 80 00          |                 i32.const 1049216
 001b12: 10 81 81 80 80 00          |                 call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 001b18: 00                         |                 unreachable
 001b19: 0b                         |               end
 001b1a: 20 09                      |               local.get 9
 001b1c: 28 02 04                   |               i32.load 2 4
 001b1f: 22 06                      |               local.tee 6
 001b21: 20 05                      |               local.get 5
 001b23: 49                         |               i32.lt_u
 001b24: 0d 05                      |               br_if 5
 001b26: 20 09                      |               local.get 9
 001b28: 20 06                      |               local.get 6
 001b2a: 20 05                      |               local.get 5
 001b2c: 6b                         |               i32.sub
 001b2d: 36 02 04                   |               i32.store 2 4
 001b30: 20 09                      |               local.get 9
 001b32: 20 09                      |               local.get 9
 001b34: 28 02 00                   |               i32.load 2 0
 001b37: 20 05                      |               local.get 5
 001b39: 6a                         |               i32.add
 001b3a: 36 02 00                   |               i32.store 2 0
 001b3d: 20 08                      |               local.get 8
 001b3f: 21 07                      |               local.set 7
 001b41: 0b                         |             end
 001b42: 20 07                      |             local.get 7
 001b44: 0d 00                      |             br_if 0
 001b46: 0b                         |           end
 001b47: 0b                         |         end
 001b48: 20 00                      |         local.get 0
 001b4a: 41 04                      |         i32.const 4
 001b4c: 3a 00 00                   |         i32.store8 0 0
 001b4f: 0b                         |       end
 001b50: 20 04                      |       local.get 4
 001b52: 41 20                      |       i32.const 32
 001b54: 6a                         |       i32.add
 001b55: 24 80 80 80 80 00          |       global.set 0 <__stack_pointer>
 001b5b: 0f                         |       return
 001b5c: 0b                         |     end
 001b5d: 20 06                      |     local.get 6
 001b5f: 20 07                      |     local.get 7
 001b61: 41 c0 84 c0 80 00          |     i32.const 1049152
 001b67: 10 fd 80 80 80 00          |     call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 001b6d: 00                         |     unreachable
 001b6e: 0b                         |   end
 001b6f: 20 04                      |   local.get 4
 001b71: 41 00                      |   i32.const 0
 001b73: 36 02 18                   |   i32.store 2 24
 001b76: 20 04                      |   local.get 4
 001b78: 41 01                      |   i32.const 1
 001b7a: 36 02 0c                   |   i32.store 2 12
 001b7d: 20 04                      |   local.get 4
 001b7f: 41 b4 85 c0 80 00          |   i32.const 1049268
 001b85: 36 02 08                   |   i32.store 2 8
 001b88: 20 04                      |   local.get 4
 001b8a: 42 04                      |   i64.const 4
 001b8c: 37 02 10                   |   i64.store 2 16
 001b8f: 20 04                      |   local.get 4
 001b91: 41 08                      |   i32.const 8
 001b93: 6a                         |   i32.add
 001b94: 41 e4 85 c0 80 00          |   i32.const 1049316
 001b9a: 10 81 81 80 80 00          |   call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 001ba0: 00                         |   unreachable
 001ba1: 0b                         | end
 001ba2: 20 08                      | local.get 8
 001ba4: 20 03                      | local.get 3
 001ba6: 41 c0 84 c0 80 00          | i32.const 1049152
 001bac: 10 fd 80 80 80 00          | call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 001bb2: 00                         | unreachable
 001bb3: 0b                         | end
001bb6 func[48] <_ZN3std3sys12thread_local6statik20LazyStorage$LT$T$GT$10initialize17h8af20b448475d754E>:
 001bb7: 03 7f                      | local[1..3] type=i32
 001bb9: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 001bbf: 41 10                      | i32.const 16
 001bc1: 6b                         | i32.sub
 001bc2: 22 01                      | local.tee 1
 001bc4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001bca: 41 00                      | i32.const 0
 001bcc: 21 02                      | local.set 2
 001bce: 02 40                      | block
 001bd0: 20 00                      |   local.get 0
 001bd2: 45                         |   i32.eqz
 001bd3: 0d 00                      |   br_if 0
 001bd5: 20 00                      |   local.get 0
 001bd7: 28 02 00                   |   i32.load 2 0
 001bda: 21 03                      |   local.set 3
 001bdc: 20 00                      |   local.get 0
 001bde: 41 00                      |   i32.const 0
 001be0: 36 02 00                   |   i32.store 2 0
 001be3: 20 00                      |   local.get 0
 001be5: 28 02 04                   |   i32.load 2 4
 001be8: 41 00                      |   i32.const 0
 001bea: 20 03                      |   local.get 3
 001bec: 1b                         |   select
 001bed: 21 02                      |   local.set 2
 001bef: 0b                         | end
 001bf0: 41 00                      | i32.const 0
 001bf2: 2d 00 e8 95 c0 80 00       | i32.load8_u 0 1051368
 001bf9: 21 03                      | local.set 3
 001bfb: 41 00                      | i32.const 0
 001bfd: 41 01                      | i32.const 1
 001bff: 3a 00 e8 95 c0 80 00       | i32.store8 0 1051368
 001c06: 41 00                      | i32.const 0
 001c08: 28 02 ec 95 c0 80 00       | i32.load 2 1051372
 001c0f: 21 00                      | local.set 0
 001c11: 41 00                      | i32.const 0
 001c13: 20 02                      | local.get 2
 001c15: 36 02 ec 95 c0 80 00       | i32.store 2 1051372
 001c1c: 20 01                      | local.get 1
 001c1e: 20 00                      | local.get 0
 001c20: 36 02 0c                   | i32.store 2 12
 001c23: 20 01                      | local.get 1
 001c25: 20 03                      | local.get 3
 001c27: 36 02 08                   | i32.store 2 8
 001c2a: 02 40                      | block
 001c2c: 20 03                      |   local.get 3
 001c2e: 45                         |   i32.eqz
 001c2f: 0d 00                      |   br_if 0
 001c31: 20 00                      |   local.get 0
 001c33: 45                         |   i32.eqz
 001c34: 0d 00                      |   br_if 0
 001c36: 20 00                      |   local.get 0
 001c38: 20 00                      |   local.get 0
 001c3a: 28 02 00                   |   i32.load 2 0
 001c3d: 22 03                      |   local.tee 3
 001c3f: 41 7f                      |   i32.const 4294967295
 001c41: 6a                         |   i32.add
 001c42: 36 02 00                   |   i32.store 2 0
 001c45: 20 03                      |   local.get 3
 001c47: 41 01                      |   i32.const 1
 001c49: 47                         |   i32.ne
 001c4a: 0d 00                      |   br_if 0
 001c4c: 20 01                      |   local.get 1
 001c4e: 41 0c                      |   i32.const 12
 001c50: 6a                         |   i32.add
 001c51: 10 a3 80 80 80 00          |   call 35 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17hb34b9f365f2589d9E>
 001c57: 0b                         | end
 001c58: 20 01                      | local.get 1
 001c5a: 41 10                      | i32.const 16
 001c5c: 6a                         | i32.add
 001c5d: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001c63: 0b                         | end
001c65 func[49] <_ZN3std2io5stdio22try_set_output_capture17hfc9c4b818ccd04deE>:
 001c66: 01 7f                      | local[2] type=i32
 001c68: 02 40                      | block
 001c6a: 02 40                      |   block
 001c6c: 20 01                      |     local.get 1
 001c6e: 0d 00                      |     br_if 0
 001c70: 41 00                      |     i32.const 0
 001c72: 21 02                      |     local.set 2
 001c74: 41 00                      |     i32.const 0
 001c76: 2d 00 b2 95 c0 80 00       |     i32.load8_u 0 1051314
 001c7d: 45                         |     i32.eqz
 001c7e: 0d 01                      |     br_if 1
 001c80: 0b                         |   end
 001c81: 41 00                      |   i32.const 0
 001c83: 41 01                      |   i32.const 1
 001c85: 3a 00 b2 95 c0 80 00       |   i32.store8 0 1051314
 001c8c: 02 40                      |   block
 001c8e: 41 00                      |     i32.const 0
 001c90: 2d 00 e8 95 c0 80 00       |     i32.load8_u 0 1051368
 001c97: 0d 00                      |     br_if 0
 001c99: 41 00                      |     i32.const 0
 001c9b: 10 b0 80 80 80 00          |     call 48 <_ZN3std3sys12thread_local6statik20LazyStorage$LT$T$GT$10initialize17h8af20b448475d754E>
 001ca1: 0b                         |   end
 001ca2: 41 00                      |   i32.const 0
 001ca4: 28 02 ec 95 c0 80 00       |   i32.load 2 1051372
 001cab: 21 02                      |   local.set 2
 001cad: 41 00                      |   i32.const 0
 001caf: 20 01                      |   local.get 1
 001cb1: 36 02 ec 95 c0 80 00       |   i32.store 2 1051372
 001cb8: 0b                         | end
 001cb9: 20 00                      | local.get 0
 001cbb: 20 02                      | local.get 2
 001cbd: 36 02 04                   | i32.store 2 4
 001cc0: 20 00                      | local.get 0
 001cc2: 41 00                      | i32.const 0
 001cc4: 36 02 00                   | i32.store 2 0
 001cc7: 0b                         | end
001cca func[50] <_ZN3std2io5Write9write_fmt17hf94c60c5073a46acE>:
 001ccb: 02 7f                      | local[3..4] type=i32
 001ccd: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 001cd3: 41 30                      | i32.const 48
 001cd5: 6b                         | i32.sub
 001cd6: 22 03                      | local.tee 3
 001cd8: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001cde: 20 03                      | local.get 3
 001ce0: 41 04                      | i32.const 4
 001ce2: 3a 00 08                   | i32.store8 0 8
 001ce5: 20 03                      | local.get 3
 001ce7: 20 01                      | local.get 1
 001ce9: 36 02 10                   | i32.store 2 16
 001cec: 02 40                      | block
 001cee: 02 40                      |   block
 001cf0: 20 03                      |     local.get 3
 001cf2: 41 08                      |     i32.const 8
 001cf4: 6a                         |     i32.add
 001cf5: 41 fc 82 c0 80 00          |     i32.const 1048956
 001cfb: 20 02                      |     local.get 2
 001cfd: 10 82 81 80 80 00          |     call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 001d03: 0d 00                      |     br_if 0
 001d05: 20 00                      |     local.get 0
 001d07: 41 04                      |     i32.const 4
 001d09: 3a 00 00                   |     i32.store8 0 0
 001d0c: 20 03                      |     local.get 3
 001d0e: 28 02 0c                   |     i32.load 2 12
 001d11: 21 02                      |     local.set 2
 001d13: 02 40                      |     block
 001d15: 20 03                      |       local.get 3
 001d17: 2d 00 08                   |       i32.load8_u 0 8
 001d1a: 22 01                      |       local.tee 1
 001d1c: 41 04                      |       i32.const 4
 001d1e: 4b                         |       i32.gt_u
 001d1f: 0d 00                      |       br_if 0
 001d21: 20 01                      |       local.get 1
 001d23: 41 03                      |       i32.const 3
 001d25: 47                         |       i32.ne
 001d26: 0d 02                      |       br_if 2
 001d28: 0b                         |     end
 001d29: 20 02                      |     local.get 2
 001d2b: 28 02 00                   |     i32.load 2 0
 001d2e: 21 00                      |     local.set 0
 001d30: 02 40                      |     block
 001d32: 20 02                      |       local.get 2
 001d34: 41 04                      |       i32.const 4
 001d36: 6a                         |       i32.add
 001d37: 28 02 00                   |       i32.load 2 0
 001d3a: 22 01                      |       local.tee 1
 001d3c: 28 02 00                   |       i32.load 2 0
 001d3f: 22 04                      |       local.tee 4
 001d41: 45                         |       i32.eqz
 001d42: 0d 00                      |       br_if 0
 001d44: 20 00                      |       local.get 0
 001d46: 20 04                      |       local.get 4
 001d48: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 001d51: 80 00                      | 
 001d53: 0b                         |     end
 001d54: 02 40                      |     block
 001d56: 20 01                      |       local.get 1
 001d58: 28 02 04                   |       i32.load 2 4
 001d5b: 22 04                      |       local.tee 4
 001d5d: 45                         |       i32.eqz
 001d5e: 0d 00                      |       br_if 0
 001d60: 20 00                      |       local.get 0
 001d62: 20 04                      |       local.get 4
 001d64: 20 01                      |       local.get 1
 001d66: 28 02 08                   |       i32.load 2 8
 001d69: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 001d6f: 0b                         |     end
 001d70: 20 02                      |     local.get 2
 001d72: 41 0c                      |     i32.const 12
 001d74: 41 04                      |     i32.const 4
 001d76: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 001d7c: 0c 01                      |     br 1
 001d7e: 0b                         |   end
 001d7f: 02 40                      |   block
 001d81: 20 03                      |     local.get 3
 001d83: 2d 00 08                   |     i32.load8_u 0 8
 001d86: 41 04                      |     i32.const 4
 001d88: 46                         |     i32.eq
 001d89: 0d 00                      |     br_if 0
 001d8b: 20 00                      |     local.get 0
 001d8d: 20 03                      |     local.get 3
 001d8f: 29 03 08                   |     i64.load 3 8
 001d92: 37 02 00                   |     i64.store 2 0
 001d95: 0c 01                      |     br 1
 001d97: 0b                         |   end
 001d98: 20 03                      |   local.get 3
 001d9a: 41 00                      |   i32.const 0
 001d9c: 36 02 28                   |   i32.store 2 40
 001d9f: 20 03                      |   local.get 3
 001da1: 41 01                      |   i32.const 1
 001da3: 36 02 1c                   |   i32.store 2 28
 001da6: 20 03                      |   local.get 3
 001da8: 41 90 87 c0 80 00          |   i32.const 1049488
 001dae: 36 02 18                   |   i32.store 2 24
 001db1: 20 03                      |   local.get 3
 001db3: 42 04                      |   i64.const 4
 001db5: 37 02 20                   |   i64.store 2 32
 001db8: 20 03                      |   local.get 3
 001dba: 41 18                      |   i32.const 24
 001dbc: 6a                         |   i32.add
 001dbd: 41 98 87 c0 80 00          |   i32.const 1049496
 001dc3: 10 81 81 80 80 00          |   call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 001dc9: 00                         |   unreachable
 001dca: 0b                         | end
 001dcb: 20 03                      | local.get 3
 001dcd: 41 30                      | i32.const 48
 001dcf: 6a                         | i32.add
 001dd0: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001dd6: 0b                         | end
001dd9 func[51] <_ZN3std2io5Write9write_all17ha8663f902f7a98e6E>:
 001dda: 02 7f                      | local[4..5] type=i32
 001ddc: 01 7e                      | local[6] type=i64
 001dde: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 001de4: 41 10                      | i32.const 16
 001de6: 6b                         | i32.sub
 001de7: 22 04                      | local.tee 4
 001de9: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001def: 02 40                      | block
 001df1: 02 40                      |   block
 001df3: 20 03                      |     local.get 3
 001df5: 45                         |     i32.eqz
 001df6: 0d 00                      |     br_if 0
 001df8: 03 40                      |     loop
 001dfa: 20 04                      |       local.get 4
 001dfc: 20 03                      |       local.get 3
 001dfe: 36 02 04                   |       i32.store 2 4
 001e01: 20 04                      |       local.get 4
 001e03: 20 02                      |       local.get 2
 001e05: 36 02 00                   |       i32.store 2 0
 001e08: 20 04                      |       local.get 4
 001e0a: 41 08                      |       i32.const 8
 001e0c: 6a                         |       i32.add
 001e0d: 41 02                      |       i32.const 2
 001e0f: 20 04                      |       local.get 4
 001e11: 41 01                      |       i32.const 1
 001e13: 10 d7 80 80 80 00          |       call 87 <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>
 001e19: 02 40                      |       block
 001e1b: 02 40                      |         block
 001e1d: 02 40                      |           block
 001e1f: 20 04                      |             local.get 4
 001e21: 2f 01 08                   |             i32.load16_u 1 8
 001e24: 0d 00                      |             br_if 0
 001e26: 02 40                      |             block
 001e28: 20 04                      |               local.get 4
 001e2a: 28 02 0c                   |               i32.load 2 12
 001e2d: 22 05                      |               local.tee 5
 001e2f: 0d 00                      |               br_if 0
 001e31: 20 00                      |               local.get 0
 001e33: 41 00                      |               i32.const 0
 001e35: 29 03 a0 86 c0 80 00       |               i64.load 3 1049376
 001e3c: 37 02 00                   |               i64.store 2 0
 001e3f: 0c 06                      |               br 6
 001e41: 0b                         |             end
 001e42: 20 03                      |             local.get 3
 001e44: 20 05                      |             local.get 5
 001e46: 4f                         |             i32.ge_u
 001e47: 0d 01                      |             br_if 1
 001e49: 20 05                      |             local.get 5
 001e4b: 20 03                      |             local.get 3
 001e4d: 41 a8 86 c0 80 00          |             i32.const 1049384
 001e53: 10 fd 80 80 80 00          |             call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 001e59: 00                         |             unreachable
 001e5a: 0b                         |           end
 001e5b: 20 04                      |           local.get 4
 001e5d: 33 01 0a                   |           i64.load16_u 1 10
 001e60: 22 06                      |           local.tee 6
 001e62: 42 1b                      |           i64.const 27
 001e64: 51                         |           i64.eq
 001e65: 0d 01                      |           br_if 1
 001e67: 20 00                      |           local.get 0
 001e69: 20 06                      |           local.get 6
 001e6b: 42 20                      |           i64.const 32
 001e6d: 86                         |           i64.shl
 001e6e: 37 02 00                   |           i64.store 2 0
 001e71: 0c 04                      |           br 4
 001e73: 0b                         |         end
 001e74: 20 02                      |         local.get 2
 001e76: 20 05                      |         local.get 5
 001e78: 6a                         |         i32.add
 001e79: 21 02                      |         local.set 2
 001e7b: 20 03                      |         local.get 3
 001e7d: 20 05                      |         local.get 5
 001e7f: 6b                         |         i32.sub
 001e80: 21 03                      |         local.set 3
 001e82: 0b                         |       end
 001e83: 20 03                      |       local.get 3
 001e85: 0d 00                      |       br_if 0
 001e87: 0b                         |     end
 001e88: 0b                         |   end
 001e89: 20 00                      |   local.get 0
 001e8b: 41 04                      |   i32.const 4
 001e8d: 3a 00 00                   |   i32.store8 0 0
 001e90: 0b                         | end
 001e91: 20 04                      | local.get 4
 001e93: 41 10                      | i32.const 16
 001e95: 6a                         | i32.add
 001e96: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001e9c: 0b                         | end
001e9f func[52] <_ZN3std2io5Write18write_all_vectored17h431b6abbfce94c98E>:
 001ea0: 08 7f                      | local[4..11] type=i32
 001ea2: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 001ea8: 41 20                      | i32.const 32
 001eaa: 6b                         | i32.sub
 001eab: 22 04                      | local.tee 4
 001ead: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 001eb3: 02 40                      | block
 001eb5: 02 40                      |   block
 001eb7: 02 40                      |     block
 001eb9: 02 40                      |       block
 001ebb: 02 40                      |         block
 001ebd: 20 03                      |           local.get 3
 001ebf: 45                         |           i32.eqz
 001ec0: 0d 00                      |           br_if 0
 001ec2: 20 02                      |           local.get 2
 001ec4: 41 04                      |           i32.const 4
 001ec6: 6a                         |           i32.add
 001ec7: 21 05                      |           local.set 5
 001ec9: 20 03                      |           local.get 3
 001ecb: 41 03                      |           i32.const 3
 001ecd: 74                         |           i32.shl
 001ece: 21 06                      |           local.set 6
 001ed0: 20 03                      |           local.get 3
 001ed2: 41 7f                      |           i32.const 4294967295
 001ed4: 6a                         |           i32.add
 001ed5: 41 ff ff ff ff 01          |           i32.const 536870911
 001edb: 71                         |           i32.and
 001edc: 41 01                      |           i32.const 1
 001ede: 6a                         |           i32.add
 001edf: 21 07                      |           local.set 7
 001ee1: 41 00                      |           i32.const 0
 001ee3: 21 08                      |           local.set 8
 001ee5: 02 40                      |           block
 001ee7: 03 40                      |             loop
 001ee9: 20 05                      |               local.get 5
 001eeb: 28 02 00                   |               i32.load 2 0
 001eee: 0d 01                      |               br_if 1
 001ef0: 20 05                      |               local.get 5
 001ef2: 41 08                      |               i32.const 8
 001ef4: 6a                         |               i32.add
 001ef5: 21 05                      |               local.set 5
 001ef7: 20 08                      |               local.get 8
 001ef9: 41 01                      |               i32.const 1
 001efb: 6a                         |               i32.add
 001efc: 21 08                      |               local.set 8
 001efe: 20 06                      |               local.get 6
 001f00: 41 78                      |               i32.const 4294967288
 001f02: 6a                         |               i32.add
 001f03: 22 06                      |               local.tee 6
 001f05: 0d 00                      |               br_if 0
 001f07: 0b                         |             end
 001f08: 20 07                      |             local.get 7
 001f0a: 21 08                      |             local.set 8
 001f0c: 0b                         |           end
 001f0d: 20 03                      |           local.get 3
 001f0f: 20 08                      |           local.get 8
 001f11: 49                         |           i32.lt_u
 001f12: 0d 04                      |           br_if 4
 001f14: 20 03                      |           local.get 3
 001f16: 20 08                      |           local.get 8
 001f18: 6b                         |           i32.sub
 001f19: 22 09                      |           local.tee 9
 001f1b: 45                         |           i32.eqz
 001f1c: 0d 00                      |           br_if 0
 001f1e: 20 02                      |           local.get 2
 001f20: 20 08                      |           local.get 8
 001f22: 41 03                      |           i32.const 3
 001f24: 74                         |           i32.shl
 001f25: 6a                         |           i32.add
 001f26: 21 0a                      |           local.set 10
 001f28: 03 40                      |           loop
 001f2a: 41 00                      |             i32.const 0
 001f2c: 21 06                      |             local.set 6
 001f2e: 41 00                      |             i32.const 0
 001f30: 21 03                      |             local.set 3
 001f32: 02 40                      |             block
 001f34: 20 09                      |               local.get 9
 001f36: 41 04                      |               i32.const 4
 001f38: 49                         |               i32.lt_u
 001f39: 0d 00                      |               br_if 0
 001f3b: 20 0a                      |               local.get 10
 001f3d: 41 1c                      |               i32.const 28
 001f3f: 6a                         |               i32.add
 001f40: 21 05                      |               local.set 5
 001f42: 20 09                      |               local.get 9
 001f44: 41 7c                      |               i32.const 4294967292
 001f46: 71                         |               i32.and
 001f47: 21 08                      |               local.set 8
 001f49: 41 00                      |               i32.const 0
 001f4b: 21 06                      |               local.set 6
 001f4d: 41 00                      |               i32.const 0
 001f4f: 21 03                      |               local.set 3
 001f51: 03 40                      |               loop
 001f53: 20 05                      |                 local.get 5
 001f55: 28 02 00                   |                 i32.load 2 0
 001f58: 20 05                      |                 local.get 5
 001f5a: 41 78                      |                 i32.const 4294967288
 001f5c: 6a                         |                 i32.add
 001f5d: 28 02 00                   |                 i32.load 2 0
 001f60: 20 05                      |                 local.get 5
 001f62: 41 70                      |                 i32.const 4294967280
 001f64: 6a                         |                 i32.add
 001f65: 28 02 00                   |                 i32.load 2 0
 001f68: 20 05                      |                 local.get 5
 001f6a: 41 68                      |                 i32.const 4294967272
 001f6c: 6a                         |                 i32.add
 001f6d: 28 02 00                   |                 i32.load 2 0
 001f70: 20 06                      |                 local.get 6
 001f72: 6a                         |                 i32.add
 001f73: 6a                         |                 i32.add
 001f74: 6a                         |                 i32.add
 001f75: 6a                         |                 i32.add
 001f76: 21 06                      |                 local.set 6
 001f78: 20 05                      |                 local.get 5
 001f7a: 41 20                      |                 i32.const 32
 001f7c: 6a                         |                 i32.add
 001f7d: 21 05                      |                 local.set 5
 001f7f: 20 08                      |                 local.get 8
 001f81: 20 03                      |                 local.get 3
 001f83: 41 04                      |                 i32.const 4
 001f85: 6a                         |                 i32.add
 001f86: 22 03                      |                 local.tee 3
 001f88: 47                         |                 i32.ne
 001f89: 0d 00                      |                 br_if 0
 001f8b: 0b                         |               end
 001f8c: 0b                         |             end
 001f8d: 02 40                      |             block
 001f8f: 20 09                      |               local.get 9
 001f91: 41 03                      |               i32.const 3
 001f93: 71                         |               i32.and
 001f94: 22 08                      |               local.tee 8
 001f96: 45                         |               i32.eqz
 001f97: 0d 00                      |               br_if 0
 001f99: 20 0a                      |               local.get 10
 001f9b: 20 03                      |               local.get 3
 001f9d: 41 03                      |               i32.const 3
 001f9f: 74                         |               i32.shl
 001fa0: 6a                         |               i32.add
 001fa1: 41 04                      |               i32.const 4
 001fa3: 6a                         |               i32.add
 001fa4: 21 05                      |               local.set 5
 001fa6: 03 40                      |               loop
 001fa8: 20 05                      |                 local.get 5
 001faa: 28 02 00                   |                 i32.load 2 0
 001fad: 20 06                      |                 local.get 6
 001faf: 6a                         |                 i32.add
 001fb0: 21 06                      |                 local.set 6
 001fb2: 20 05                      |                 local.get 5
 001fb4: 41 08                      |                 i32.const 8
 001fb6: 6a                         |                 i32.add
 001fb7: 21 05                      |                 local.set 5
 001fb9: 20 08                      |                 local.get 8
 001fbb: 41 7f                      |                 i32.const 4294967295
 001fbd: 6a                         |                 i32.add
 001fbe: 22 08                      |                 local.tee 8
 001fc0: 0d 00                      |                 br_if 0
 001fc2: 0b                         |               end
 001fc3: 0b                         |             end
 001fc4: 02 40                      |             block
 001fc6: 20 01                      |               local.get 1
 001fc8: 28 02 00                   |               i32.load 2 0
 001fcb: 20 01                      |               local.get 1
 001fcd: 28 02 08                   |               i32.load 2 8
 001fd0: 22 05                      |               local.tee 5
 001fd2: 6b                         |               i32.sub
 001fd3: 20 06                      |               local.get 6
 001fd5: 4f                         |               i32.ge_u
 001fd6: 0d 00                      |               br_if 0
 001fd8: 20 01                      |               local.get 1
 001fda: 20 05                      |               local.get 5
 001fdc: 20 06                      |               local.get 6
 001fde: 41 01                      |               i32.const 1
 001fe0: 41 01                      |               i32.const 1
 001fe2: 10 91 80 80 80 00          |               call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 001fe8: 20 01                      |               local.get 1
 001fea: 28 02 08                   |               i32.load 2 8
 001fed: 21 05                      |               local.set 5
 001fef: 0b                         |             end
 001ff0: 20 0a                      |             local.get 10
 001ff2: 20 09                      |             local.get 9
 001ff4: 41 03                      |             i32.const 3
 001ff6: 74                         |             i32.shl
 001ff7: 22 0b                      |             local.tee 11
 001ff9: 6a                         |             i32.add
 001ffa: 21 07                      |             local.set 7
 001ffc: 20 0a                      |             local.get 10
 001ffe: 21 08                      |             local.set 8
 002000: 03 40                      |             loop
 002002: 20 08                      |               local.get 8
 002004: 28 02 00                   |               i32.load 2 0
 002007: 21 02                      |               local.set 2
 002009: 02 40                      |               block
 00200b: 20 01                      |                 local.get 1
 00200d: 28 02 00                   |                 i32.load 2 0
 002010: 20 05                      |                 local.get 5
 002012: 6b                         |                 i32.sub
 002013: 20 08                      |                 local.get 8
 002015: 28 02 04                   |                 i32.load 2 4
 002018: 22 03                      |                 local.tee 3
 00201a: 4f                         |                 i32.ge_u
 00201b: 0d 00                      |                 br_if 0
 00201d: 20 01                      |                 local.get 1
 00201f: 20 05                      |                 local.get 5
 002021: 20 03                      |                 local.get 3
 002023: 41 01                      |                 i32.const 1
 002025: 41 01                      |                 i32.const 1
 002027: 10 91 80 80 80 00          |                 call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 00202d: 20 01                      |                 local.get 1
 00202f: 28 02 08                   |                 i32.load 2 8
 002032: 21 05                      |                 local.set 5
 002034: 0b                         |               end
 002035: 20 01                      |               local.get 1
 002037: 28 02 04                   |               i32.load 2 4
 00203a: 20 05                      |               local.get 5
 00203c: 6a                         |               i32.add
 00203d: 20 02                      |               local.get 2
 00203f: 20 03                      |               local.get 3
 002041: 10 ee 80 80 80 00          |               call 110 <memcpy>
 002047: 1a                         |               drop
 002048: 20 01                      |               local.get 1
 00204a: 20 05                      |               local.get 5
 00204c: 20 03                      |               local.get 3
 00204e: 6a                         |               i32.add
 00204f: 22 05                      |               local.tee 5
 002051: 36 02 08                   |               i32.store 2 8
 002054: 20 08                      |               local.get 8
 002056: 41 08                      |               i32.const 8
 002058: 6a                         |               i32.add
 002059: 22 08                      |               local.tee 8
 00205b: 20 07                      |               local.get 7
 00205d: 47                         |               i32.ne
 00205e: 0d 00                      |               br_if 0
 002060: 0b                         |             end
 002061: 02 40                      |             block
 002063: 02 40                      |               block
 002065: 20 06                      |                 local.get 6
 002067: 45                         |                 i32.eqz
 002068: 0d 00                      |                 br_if 0
 00206a: 20 0a                      |                 local.get 10
 00206c: 41 04                      |                 i32.const 4
 00206e: 6a                         |                 i32.add
 00206f: 21 05                      |                 local.set 5
 002071: 20 09                      |                 local.get 9
 002073: 41 7f                      |                 i32.const 4294967295
 002075: 6a                         |                 i32.add
 002076: 41 ff ff ff ff 01          |                 i32.const 536870911
 00207c: 71                         |                 i32.and
 00207d: 41 01                      |                 i32.const 1
 00207f: 6a                         |                 i32.add
 002080: 21 02                      |                 local.set 2
 002082: 41 00                      |                 i32.const 0
 002084: 21 08                      |                 local.set 8
 002086: 03 40                      |                 loop
 002088: 20 06                      |                   local.get 6
 00208a: 20 05                      |                   local.get 5
 00208c: 28 02 00                   |                   i32.load 2 0
 00208f: 22 03                      |                   local.tee 3
 002091: 49                         |                   i32.lt_u
 002092: 0d 02                      |                   br_if 2
 002094: 20 05                      |                   local.get 5
 002096: 41 08                      |                   i32.const 8
 002098: 6a                         |                   i32.add
 002099: 21 05                      |                   local.set 5
 00209b: 20 08                      |                   local.get 8
 00209d: 41 01                      |                   i32.const 1
 00209f: 6a                         |                   i32.add
 0020a0: 21 08                      |                   local.set 8
 0020a2: 20 06                      |                   local.get 6
 0020a4: 20 03                      |                   local.get 3
 0020a6: 6b                         |                   i32.sub
 0020a7: 21 06                      |                   local.set 6
 0020a9: 20 0b                      |                   local.get 11
 0020ab: 41 78                      |                   i32.const 4294967288
 0020ad: 6a                         |                   i32.add
 0020ae: 22 0b                      |                   local.tee 11
 0020b0: 0d 00                      |                   br_if 0
 0020b2: 0b                         |                 end
 0020b3: 20 02                      |                 local.get 2
 0020b5: 21 08                      |                 local.set 8
 0020b7: 0c 01                      |                 br 1
 0020b9: 0b                         |               end
 0020ba: 20 00                      |               local.get 0
 0020bc: 41 00                      |               i32.const 0
 0020be: 29 03 a0 86 c0 80 00       |               i64.load 3 1049376
 0020c5: 37 02 00                   |               i64.store 2 0
 0020c8: 0c 04                      |               br 4
 0020ca: 0b                         |             end
 0020cb: 20 09                      |             local.get 9
 0020cd: 20 08                      |             local.get 8
 0020cf: 49                         |             i32.lt_u
 0020d0: 0d 04                      |             br_if 4
 0020d2: 20 0a                      |             local.get 10
 0020d4: 20 08                      |             local.get 8
 0020d6: 41 03                      |             i32.const 3
 0020d8: 74                         |             i32.shl
 0020d9: 6a                         |             i32.add
 0020da: 21 0a                      |             local.set 10
 0020dc: 02 40                      |             block
 0020de: 02 40                      |               block
 0020e0: 20 09                      |                 local.get 9
 0020e2: 20 08                      |                 local.get 8
 0020e4: 47                         |                 i32.ne
 0020e5: 0d 00                      |                 br_if 0
 0020e7: 20 06                      |                 local.get 6
 0020e9: 45                         |                 i32.eqz
 0020ea: 0d 01                      |                 br_if 1
 0020ec: 20 04                      |                 local.get 4
 0020ee: 41 00                      |                 i32.const 0
 0020f0: 36 02 18                   |                 i32.store 2 24
 0020f3: 20 04                      |                 local.get 4
 0020f5: 41 01                      |                 i32.const 1
 0020f7: 36 02 0c                   |                 i32.store 2 12
 0020fa: 20 04                      |                 local.get 4
 0020fc: 41 f8 84 c0 80 00          |                 i32.const 1049208
 002102: 36 02 08                   |                 i32.store 2 8
 002105: 20 04                      |                 local.get 4
 002107: 42 04                      |                 i64.const 4
 002109: 37 02 10                   |                 i64.store 2 16
 00210c: 20 04                      |                 local.get 4
 00210e: 41 08                      |                 i32.const 8
 002110: 6a                         |                 i32.add
 002111: 41 80 85 c0 80 00          |                 i32.const 1049216
 002117: 10 81 81 80 80 00          |                 call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 00211d: 00                         |                 unreachable
 00211e: 0b                         |               end
 00211f: 20 0a                      |               local.get 10
 002121: 28 02 04                   |               i32.load 2 4
 002124: 22 05                      |               local.tee 5
 002126: 20 06                      |               local.get 6
 002128: 49                         |               i32.lt_u
 002129: 0d 03                      |               br_if 3
 00212b: 20 0a                      |               local.get 10
 00212d: 20 05                      |               local.get 5
 00212f: 20 06                      |               local.get 6
 002131: 6b                         |               i32.sub
 002132: 36 02 04                   |               i32.store 2 4
 002135: 20 0a                      |               local.get 10
 002137: 20 0a                      |               local.get 10
 002139: 28 02 00                   |               i32.load 2 0
 00213c: 20 06                      |               local.get 6
 00213e: 6a                         |               i32.add
 00213f: 36 02 00                   |               i32.store 2 0
 002142: 0b                         |             end
 002143: 20 09                      |             local.get 9
 002145: 20 08                      |             local.get 8
 002147: 6b                         |             i32.sub
 002148: 22 09                      |             local.tee 9
 00214a: 0d 00                      |             br_if 0
 00214c: 0b                         |           end
 00214d: 0b                         |         end
 00214e: 20 00                      |         local.get 0
 002150: 41 04                      |         i32.const 4
 002152: 3a 00 00                   |         i32.store8 0 0
 002155: 0c 01                      |         br 1
 002157: 0b                         |       end
 002158: 20 04                      |       local.get 4
 00215a: 41 00                      |       i32.const 0
 00215c: 36 02 18                   |       i32.store 2 24
 00215f: 20 04                      |       local.get 4
 002161: 41 01                      |       i32.const 1
 002163: 36 02 0c                   |       i32.store 2 12
 002166: 20 04                      |       local.get 4
 002168: 41 b4 85 c0 80 00          |       i32.const 1049268
 00216e: 36 02 08                   |       i32.store 2 8
 002171: 20 04                      |       local.get 4
 002173: 42 04                      |       i64.const 4
 002175: 37 02 10                   |       i64.store 2 16
 002178: 20 04                      |       local.get 4
 00217a: 41 08                      |       i32.const 8
 00217c: 6a                         |       i32.add
 00217d: 41 e4 85 c0 80 00          |       i32.const 1049316
 002183: 10 81 81 80 80 00          |       call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 002189: 00                         |       unreachable
 00218a: 0b                         |     end
 00218b: 20 04                      |     local.get 4
 00218d: 41 20                      |     i32.const 32
 00218f: 6a                         |     i32.add
 002190: 24 80 80 80 80 00          |     global.set 0 <__stack_pointer>
 002196: 0f                         |     return
 002197: 0b                         |   end
 002198: 20 08                      |   local.get 8
 00219a: 20 09                      |   local.get 9
 00219c: 41 c0 84 c0 80 00          |   i32.const 1049152
 0021a2: 10 fd 80 80 80 00          |   call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 0021a8: 00                         |   unreachable
 0021a9: 0b                         | end
 0021aa: 20 08                      | local.get 8
 0021ac: 20 03                      | local.get 3
 0021ae: 41 c0 84 c0 80 00          | i32.const 1049152
 0021b4: 10 fd 80 80 80 00          | call 125 <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>
 0021ba: 00                         | unreachable
 0021bb: 0b                         | end
0021be func[53] <_ZN3std2io5Write9write_fmt17he4d6612a7e90ae22E>:
 0021bf: 02 7f                      | local[3..4] type=i32
 0021c1: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0021c7: 41 30                      | i32.const 48
 0021c9: 6b                         | i32.sub
 0021ca: 22 03                      | local.tee 3
 0021cc: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0021d2: 20 03                      | local.get 3
 0021d4: 41 04                      | i32.const 4
 0021d6: 3a 00 08                   | i32.store8 0 8
 0021d9: 20 03                      | local.get 3
 0021db: 20 01                      | local.get 1
 0021dd: 36 02 10                   | i32.store 2 16
 0021e0: 02 40                      | block
 0021e2: 02 40                      |   block
 0021e4: 20 03                      |     local.get 3
 0021e6: 41 08                      |     i32.const 8
 0021e8: 6a                         |     i32.add
 0021e9: 41 c4 83 c0 80 00          |     i32.const 1049028
 0021ef: 20 02                      |     local.get 2
 0021f1: 10 82 81 80 80 00          |     call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 0021f7: 0d 00                      |     br_if 0
 0021f9: 20 00                      |     local.get 0
 0021fb: 41 04                      |     i32.const 4
 0021fd: 3a 00 00                   |     i32.store8 0 0
 002200: 20 03                      |     local.get 3
 002202: 28 02 0c                   |     i32.load 2 12
 002205: 21 02                      |     local.set 2
 002207: 02 40                      |     block
 002209: 20 03                      |       local.get 3
 00220b: 2d 00 08                   |       i32.load8_u 0 8
 00220e: 22 01                      |       local.tee 1
 002210: 41 04                      |       i32.const 4
 002212: 4b                         |       i32.gt_u
 002213: 0d 00                      |       br_if 0
 002215: 20 01                      |       local.get 1
 002217: 41 03                      |       i32.const 3
 002219: 47                         |       i32.ne
 00221a: 0d 02                      |       br_if 2
 00221c: 0b                         |     end
 00221d: 20 02                      |     local.get 2
 00221f: 28 02 00                   |     i32.load 2 0
 002222: 21 00                      |     local.set 0
 002224: 02 40                      |     block
 002226: 20 02                      |       local.get 2
 002228: 41 04                      |       i32.const 4
 00222a: 6a                         |       i32.add
 00222b: 28 02 00                   |       i32.load 2 0
 00222e: 22 01                      |       local.tee 1
 002230: 28 02 00                   |       i32.load 2 0
 002233: 22 04                      |       local.tee 4
 002235: 45                         |       i32.eqz
 002236: 0d 00                      |       br_if 0
 002238: 20 00                      |       local.get 0
 00223a: 20 04                      |       local.get 4
 00223c: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 002245: 80 00                      | 
 002247: 0b                         |     end
 002248: 02 40                      |     block
 00224a: 20 01                      |       local.get 1
 00224c: 28 02 04                   |       i32.load 2 4
 00224f: 22 04                      |       local.tee 4
 002251: 45                         |       i32.eqz
 002252: 0d 00                      |       br_if 0
 002254: 20 00                      |       local.get 0
 002256: 20 04                      |       local.get 4
 002258: 20 01                      |       local.get 1
 00225a: 28 02 08                   |       i32.load 2 8
 00225d: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 002263: 0b                         |     end
 002264: 20 02                      |     local.get 2
 002266: 41 0c                      |     i32.const 12
 002268: 41 04                      |     i32.const 4
 00226a: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 002270: 0c 01                      |     br 1
 002272: 0b                         |   end
 002273: 02 40                      |   block
 002275: 20 03                      |     local.get 3
 002277: 2d 00 08                   |     i32.load8_u 0 8
 00227a: 41 04                      |     i32.const 4
 00227c: 46                         |     i32.eq
 00227d: 0d 00                      |     br_if 0
 00227f: 20 00                      |     local.get 0
 002281: 20 03                      |     local.get 3
 002283: 29 03 08                   |     i64.load 3 8
 002286: 37 02 00                   |     i64.store 2 0
 002289: 0c 01                      |     br 1
 00228b: 0b                         |   end
 00228c: 20 03                      |   local.get 3
 00228e: 41 00                      |   i32.const 0
 002290: 36 02 28                   |   i32.store 2 40
 002293: 20 03                      |   local.get 3
 002295: 41 01                      |   i32.const 1
 002297: 36 02 1c                   |   i32.store 2 28
 00229a: 20 03                      |   local.get 3
 00229c: 41 90 87 c0 80 00          |   i32.const 1049488
 0022a2: 36 02 18                   |   i32.store 2 24
 0022a5: 20 03                      |   local.get 3
 0022a7: 42 04                      |   i64.const 4
 0022a9: 37 02 20                   |   i64.store 2 32
 0022ac: 20 03                      |   local.get 3
 0022ae: 41 18                      |   i32.const 24
 0022b0: 6a                         |   i32.add
 0022b1: 41 98 87 c0 80 00          |   i32.const 1049496
 0022b7: 10 81 81 80 80 00          |   call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 0022bd: 00                         |   unreachable
 0022be: 0b                         | end
 0022bf: 20 03                      | local.get 3
 0022c1: 41 30                      | i32.const 48
 0022c3: 6a                         | i32.add
 0022c4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0022ca: 0b                         | end
0022cc func[54] <_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h72ced538ee1ccd30E>:
 0022cd: 01 7f                      | local[3] type=i32
 0022cf: 02 40                      | block
 0022d1: 20 00                      |   local.get 0
 0022d3: 28 02 08                   |   i32.load 2 8
 0022d6: 22 00                      |   local.tee 0
 0022d8: 28 02 00                   |   i32.load 2 0
 0022db: 20 00                      |   local.get 0
 0022dd: 28 02 08                   |   i32.load 2 8
 0022e0: 22 03                      |   local.tee 3
 0022e2: 6b                         |   i32.sub
 0022e3: 20 02                      |   local.get 2
 0022e5: 4f                         |   i32.ge_u
 0022e6: 0d 00                      |   br_if 0
 0022e8: 20 00                      |   local.get 0
 0022ea: 20 03                      |   local.get 3
 0022ec: 20 02                      |   local.get 2
 0022ee: 41 01                      |   i32.const 1
 0022f0: 41 01                      |   i32.const 1
 0022f2: 10 91 80 80 80 00          |   call 17 <_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h53280d5092558c0cE>
 0022f8: 20 00                      |   local.get 0
 0022fa: 28 02 08                   |   i32.load 2 8
 0022fd: 21 03                      |   local.set 3
 0022ff: 0b                         | end
 002300: 20 00                      | local.get 0
 002302: 28 02 04                   | i32.load 2 4
 002305: 20 03                      | local.get 3
 002307: 6a                         | i32.add
 002308: 20 01                      | local.get 1
 00230a: 20 02                      | local.get 2
 00230c: 10 ee 80 80 80 00          | call 110 <memcpy>
 002312: 1a                         | drop
 002313: 20 00                      | local.get 0
 002315: 20 03                      | local.get 3
 002317: 20 02                      | local.get 2
 002319: 6a                         | i32.add
 00231a: 36 02 08                   | i32.store 2 8
 00231d: 41 00                      | i32.const 0
 00231f: 0b                         | end
002322 func[55] <_ZN3std5panic19get_backtrace_style17h6332bb26ad628d28E>:
 002323: 04 7f                      | local[0..3] type=i32
 002325: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00232b: 41 10                      | i32.const 16
 00232d: 6b                         | i32.sub
 00232e: 22 00                      | local.tee 0
 002330: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002336: 02 40                      | block
 002338: 41 00                      |   i32.const 0
 00233a: 2d 00 b3 95 c0 80 00       |   i32.load8_u 0 1051315
 002341: 41 7f                      |   i32.const 4294967295
 002343: 6a                         |   i32.add
 002344: 22 01                      |   local.tee 1
 002346: 41 ff 01                   |   i32.const 255
 002349: 71                         |   i32.and
 00234a: 41 03                      |   i32.const 3
 00234c: 49                         |   i32.lt_u
 00234d: 0d 00                      |   br_if 0
 00234f: 20 00                      |   local.get 0
 002351: 41 04                      |   i32.const 4
 002353: 6a                         |   i32.add
 002354: 41 e0 83 c0 80 00          |   i32.const 1049056
 00235a: 41 0e                      |   i32.const 14
 00235c: 10 a8 80 80 80 00          |   call 40 <_ZN3std3env7_var_os17h819d6264ed566a61E>
 002362: 02 40                      |   block
 002364: 02 40                      |     block
 002366: 20 00                      |       local.get 0
 002368: 28 02 04                   |       i32.load 2 4
 00236b: 22 01                      |       local.tee 1
 00236d: 41 80 80 80 80 78          |       i32.const 2147483648
 002373: 46                         |       i32.eq
 002374: 0d 00                      |       br_if 0
 002376: 20 00                      |       local.get 0
 002378: 28 02 08                   |       i32.load 2 8
 00237b: 21 02                      |       local.set 2
 00237d: 02 40                      |       block
 00237f: 02 40                      |         block
 002381: 02 40                      |           block
 002383: 02 40                      |             block
 002385: 20 00                      |               local.get 0
 002387: 28 02 0c                   |               i32.load 2 12
 00238a: 41 7f                      |               i32.const 4294967295
 00238c: 6a                         |               i32.add
 00238d: 0e 04 01 02 02 00 02       |               br_table 1 2 2 0 2
 002394: 0b                         |             end
 002395: 20 02                      |             local.get 2
 002397: 28 00 00                   |             i32.load 0 0
 00239a: 41 e6 ea b1 e3 06          |             i32.const 1819047270
 0023a0: 47                         |             i32.ne
 0023a1: 0d 01                      |             br_if 1
 0023a3: 02 40                      |             block
 0023a5: 20 01                      |               local.get 1
 0023a7: 45                         |               i32.eqz
 0023a8: 0d 00                      |               br_if 0
 0023aa: 20 02                      |               local.get 2
 0023ac: 20 01                      |               local.get 1
 0023ae: 41 01                      |               i32.const 1
 0023b0: 10 86 80 80 80 00          |               call 6 <__rust_dealloc>
 0023b6: 0b                         |             end
 0023b7: 41 01                      |             i32.const 1
 0023b9: 21 01                      |             local.set 1
 0023bb: 41 02                      |             i32.const 2
 0023bd: 21 03                      |             local.set 3
 0023bf: 0c 04                      |             br 4
 0023c1: 0b                         |           end
 0023c2: 20 02                      |           local.get 2
 0023c4: 2d 00 00                   |           i32.load8_u 0 0
 0023c7: 41 30                      |           i32.const 48
 0023c9: 46                         |           i32.eq
 0023ca: 0d 01                      |           br_if 1
 0023cc: 0b                         |         end
 0023cd: 02 40                      |         block
 0023cf: 20 01                      |           local.get 1
 0023d1: 45                         |           i32.eqz
 0023d2: 0d 00                      |           br_if 0
 0023d4: 20 02                      |           local.get 2
 0023d6: 20 01                      |           local.get 1
 0023d8: 41 01                      |           i32.const 1
 0023da: 10 86 80 80 80 00          |           call 6 <__rust_dealloc>
 0023e0: 0b                         |         end
 0023e1: 41 00                      |         i32.const 0
 0023e3: 21 01                      |         local.set 1
 0023e5: 41 01                      |         i32.const 1
 0023e7: 21 03                      |         local.set 3
 0023e9: 0c 02                      |         br 2
 0023eb: 0b                         |       end
 0023ec: 20 01                      |       local.get 1
 0023ee: 45                         |       i32.eqz
 0023ef: 0d 00                      |       br_if 0
 0023f1: 20 02                      |       local.get 2
 0023f3: 20 01                      |       local.get 1
 0023f5: 41 01                      |       i32.const 1
 0023f7: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 0023fd: 0b                         |     end
 0023fe: 41 02                      |     i32.const 2
 002400: 21 01                      |     local.set 1
 002402: 41 03                      |     i32.const 3
 002404: 21 03                      |     local.set 3
 002406: 0b                         |   end
 002407: 41 00                      |   i32.const 0
 002409: 41 00                      |   i32.const 0
 00240b: 2d 00 b3 95 c0 80 00       |   i32.load8_u 0 1051315
 002412: 22 02                      |   local.tee 2
 002414: 20 03                      |   local.get 3
 002416: 20 02                      |   local.get 2
 002418: 1b                         |   select
 002419: 3a 00 b3 95 c0 80 00       |   i32.store8 0 1051315
 002420: 20 02                      |   local.get 2
 002422: 45                         |   i32.eqz
 002423: 0d 00                      |   br_if 0
 002425: 41 03                      |   i32.const 3
 002427: 21 01                      |   local.set 1
 002429: 20 02                      |   local.get 2
 00242b: 41 04                      |   i32.const 4
 00242d: 4f                         |   i32.ge_u
 00242e: 0d 00                      |   br_if 0
 002430: 41 83 80 84 10             |   i32.const 33619971
 002435: 20 02                      |   local.get 2
 002437: 41 03                      |   i32.const 3
 002439: 74                         |   i32.shl
 00243a: 41 f8 01                   |   i32.const 248
 00243d: 71                         |   i32.and
 00243e: 76                         |   i32.shr_u
 00243f: 21 01                      |   local.set 1
 002441: 0b                         | end
 002442: 20 00                      | local.get 0
 002444: 41 10                      | i32.const 16
 002446: 6a                         | i32.add
 002447: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00244d: 20 01                      | local.get 1
 00244f: 0b                         | end
002451 func[56] <_ZN3std7process5abort17heddc1007b1aee596E>:
 002452: 10 a6 80 80 80 00          | call 38 <_ZN3std3sys3pal4wasi7helpers14abort_internal17h22e0957f477c4b9fE>
 002458: 00                         | unreachable
 002459: 0b                         | end
00245c func[57] <_ZN3std3sys9backtrace4lock17h4601eb74b01695daE>:
 00245d: 02 7f                      | local[0..1] type=i32
 00245f: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 002465: 41 20                      | i32.const 32
 002467: 6b                         | i32.sub
 002468: 22 00                      | local.tee 0
 00246a: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002470: 41 00                      | i32.const 0
 002472: 2d 00 b4 95 c0 80 00       | i32.load8_u 0 1051316
 002479: 21 01                      | local.set 1
 00247b: 41 00                      | i32.const 0
 00247d: 41 01                      | i32.const 1
 00247f: 3a 00 b4 95 c0 80 00       | i32.store8 0 1051316
 002486: 20 00                      | local.get 0
 002488: 20 01                      | local.get 1
 00248a: 3a 00 07                   | i32.store8 0 7
 00248d: 02 40                      | block
 00248f: 20 01                      |   local.get 1
 002491: 41 01                      |   i32.const 1
 002493: 47                         |   i32.ne
 002494: 0d 00                      |   br_if 0
 002496: 20 00                      |   local.get 0
 002498: 42 00                      |   i64.const 0
 00249a: 37 02 14                   |   i64.store 2 20
 00249d: 20 00                      |   local.get 0
 00249f: 42 81 80 80 80 c0 00       |   i64.const 17179869185
 0024a6: 37 02 0c                   |   i64.store 2 12
 0024a9: 20 00                      |   local.get 0
 0024ab: 41 d8 87 c0 80 00          |   i32.const 1049560
 0024b1: 36 02 08                   |   i32.store 2 8
 0024b4: 41 00                      |   i32.const 0
 0024b6: 20 00                      |   local.get 0
 0024b8: 41 07                      |   i32.const 7
 0024ba: 6a                         |   i32.add
 0024bb: 41 b8 80 c0 80 00          |   i32.const 1048632
 0024c1: 20 00                      |   local.get 0
 0024c3: 41 08                      |   i32.const 8
 0024c5: 6a                         |   i32.add
 0024c6: 41 8c 88 c0 80 00          |   i32.const 1049612
 0024cc: 10 9f 80 80 80 00          |   call 31 <_ZN4core9panicking13assert_failed17heba9922af64b9ecaE>
 0024d2: 00                         |   unreachable
 0024d3: 0b                         | end
 0024d4: 20 00                      | local.get 0
 0024d6: 41 20                      | i32.const 32
 0024d8: 6a                         | i32.add
 0024d9: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0024df: 41 b4 95 c0 80 00          | i32.const 1051316
 0024e5: 0b                         | end
0024e7 func[58] <_ZN3std3sys9backtrace13BacktraceLock5print17hce08e60bbba84f67E>:
 0024e8: 01 7f                      | local[4] type=i32
 0024ea: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0024f0: 41 30                      | i32.const 48
 0024f2: 6b                         | i32.sub
 0024f3: 22 04                      | local.tee 4
 0024f5: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0024fb: 20 04                      | local.get 4
 0024fd: 41 01                      | i32.const 1
 0024ff: 36 02 0c                   | i32.store 2 12
 002502: 20 04                      | local.get 4
 002504: 41 f0 83 c0 80 00          | i32.const 1049072
 00250a: 36 02 08                   | i32.store 2 8
 00250d: 20 04                      | local.get 4
 00250f: 42 01                      | i64.const 1
 002511: 37 02 14                   | i64.store 2 20
 002514: 20 04                      | local.get 4
 002516: 20 03                      | local.get 3
 002518: 3a 00 2f                   | i32.store8 0 47
 00251b: 20 04                      | local.get 4
 00251d: 41 83 80 80 80 00          | i32.const 3
 002523: ad                         | i64.extend_i32_u
 002524: 42 20                      | i64.const 32
 002526: 86                         | i64.shl
 002527: 20 04                      | local.get 4
 002529: 41 2f                      | i32.const 47
 00252b: 6a                         | i32.add
 00252c: ad                         | i64.extend_i32_u
 00252d: 84                         | i64.or
 00252e: 37 03 20                   | i64.store 3 32
 002531: 20 04                      | local.get 4
 002533: 20 04                      | local.get 4
 002535: 41 20                      | i32.const 32
 002537: 6a                         | i32.add
 002538: 36 02 10                   | i32.store 2 16
 00253b: 20 00                      | local.get 0
 00253d: 20 01                      | local.get 1
 00253f: 20 04                      | local.get 4
 002541: 41 08                      | i32.const 8
 002543: 6a                         | i32.add
 002544: 20 02                      | local.get 2
 002546: 11 82 80 80 80 00 80 80 80 | call_indirect 0 (type 2)
 00254f: 80 00                      | 
 002551: 20 04                      | local.get 4
 002553: 41 30                      | i32.const 48
 002555: 6a                         | i32.add
 002556: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00255c: 0b                         | end
00255f func[59] <_ZN98_$LT$std..sys..backtrace..BacktraceLock..print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$3fmt17h6b6dfe714e9b6405E>:
 002560: 03 7f                      | local[2..4] type=i32
 002562: 01 7e                      | local[5] type=i64
 002564: 04 7f                      | local[6..9] type=i32
 002566: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00256c: 41 10                      | i32.const 16
 00256e: 6b                         | i32.sub
 00256f: 22 02                      | local.tee 2
 002571: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002577: 20 01                      | local.get 1
 002579: 28 02 20                   | i32.load 2 32
 00257c: 21 03                      | local.set 3
 00257e: 20 01                      | local.get 1
 002580: 28 02 1c                   | i32.load 2 28
 002583: 21 04                      | local.set 4
 002585: 20 00                      | local.get 0
 002587: 2d 00 00                   | i32.load8_u 0 0
 00258a: 21 00                      | local.set 0
 00258c: 20 02                      | local.get 2
 00258e: 41 04                      | i32.const 4
 002590: 6a                         | i32.add
 002591: 10 a7 80 80 80 00          | call 39 <_ZN3std3env11current_dir17h5764d887fbb6b47dE>
 002597: 20 02                      | local.get 2
 002599: 29 02 08                   | i64.load 2 8
 00259c: 21 05                      | local.set 5
 00259e: 02 40                      | block
 0025a0: 20 02                      |   local.get 2
 0025a2: 28 02 04                   |   i32.load 2 4
 0025a5: 22 01                      |   local.tee 1
 0025a7: 41 80 80 80 80 78          |   i32.const 2147483648
 0025ad: 47                         |   i32.ne
 0025ae: 0d 00                      |   br_if 0
 0025b0: 20 05                      |   local.get 5
 0025b2: 42 ff 01                   |   i64.const 255
 0025b5: 83                         |   i64.and
 0025b6: 42 03                      |   i64.const 3
 0025b8: 52                         |   i64.ne
 0025b9: 0d 00                      |   br_if 0
 0025bb: 20 05                      |   local.get 5
 0025bd: 42 20                      |   i64.const 32
 0025bf: 88                         |   i64.shr_u
 0025c0: a7                         |   i32.wrap_i64
 0025c1: 22 06                      |   local.tee 6
 0025c3: 28 02 00                   |   i32.load 2 0
 0025c6: 21 07                      |   local.set 7
 0025c8: 02 40                      |   block
 0025ca: 20 06                      |     local.get 6
 0025cc: 41 04                      |     i32.const 4
 0025ce: 6a                         |     i32.add
 0025cf: 28 02 00                   |     i32.load 2 0
 0025d2: 22 08                      |     local.tee 8
 0025d4: 28 02 00                   |     i32.load 2 0
 0025d7: 22 09                      |     local.tee 9
 0025d9: 45                         |     i32.eqz
 0025da: 0d 00                      |     br_if 0
 0025dc: 20 07                      |     local.get 7
 0025de: 20 09                      |     local.get 9
 0025e0: 11 80 80 80 80 00 80 80 80 |     call_indirect 0 (type 0)
 0025e9: 80 00                      | 
 0025eb: 0b                         |   end
 0025ec: 02 40                      |   block
 0025ee: 20 08                      |     local.get 8
 0025f0: 28 02 04                   |     i32.load 2 4
 0025f3: 22 09                      |     local.tee 9
 0025f5: 45                         |     i32.eqz
 0025f6: 0d 00                      |     br_if 0
 0025f8: 20 07                      |     local.get 7
 0025fa: 20 09                      |     local.get 9
 0025fc: 20 08                      |     local.get 8
 0025fe: 28 02 08                   |     i32.load 2 8
 002601: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 002607: 0b                         |   end
 002608: 20 06                      |   local.get 6
 00260a: 41 0c                      |   i32.const 12
 00260c: 41 04                      |   i32.const 4
 00260e: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 002614: 0b                         | end
 002615: 02 40                      | block
 002617: 02 40                      |   block
 002619: 02 40                      |     block
 00261b: 20 04                      |       local.get 4
 00261d: 41 e0 88 c0 80 00          |       i32.const 1049696
 002623: 41 11                      |       i32.const 17
 002625: 20 03                      |       local.get 3
 002627: 28 02 0c                   |       i32.load 2 12
 00262a: 22 03                      |       local.tee 3
 00262c: 11 83 80 80 80 00 80 80 80 |       call_indirect 0 (type 3)
 002635: 80 00                      | 
 002637: 0d 00                      |       br_if 0
 002639: 02 40                      |       block
 00263b: 20 00                      |         local.get 0
 00263d: 41 01                      |         i32.const 1
 00263f: 71                         |         i32.and
 002640: 0d 00                      |         br_if 0
 002642: 20 04                      |         local.get 4
 002644: 41 f1 88 c0 80 00          |         i32.const 1049713
 00264a: 41 d8 00                   |         i32.const 88
 00264d: 20 03                      |         local.get 3
 00264f: 11 83 80 80 80 00 80 80 80 |         call_indirect 0 (type 3)
 002658: 80 00                      | 
 00265a: 0d 01                      |         br_if 1
 00265c: 0b                         |       end
 00265d: 41 00                      |       i32.const 0
 00265f: 21 04                      |       local.set 4
 002661: 20 01                      |       local.get 1
 002663: 41 80 80 80 80 78          |       i32.const 2147483648
 002669: 72                         |       i32.or
 00266a: 41 80 80 80 80 78          |       i32.const 2147483648
 002670: 46                         |       i32.eq
 002671: 0d 02                      |       br_if 2
 002673: 0c 01                      |       br 1
 002675: 0b                         |     end
 002676: 41 01                      |     i32.const 1
 002678: 21 04                      |     local.set 4
 00267a: 20 01                      |     local.get 1
 00267c: 41 80 80 80 80 78          |     i32.const 2147483648
 002682: 72                         |     i32.or
 002683: 41 80 80 80 80 78          |     i32.const 2147483648
 002689: 46                         |     i32.eq
 00268a: 0d 01                      |     br_if 1
 00268c: 0b                         |   end
 00268d: 20 05                      |   local.get 5
 00268f: a7                         |   i32.wrap_i64
 002690: 20 01                      |   local.get 1
 002692: 41 01                      |   i32.const 1
 002694: 10 86 80 80 80 00          |   call 6 <__rust_dealloc>
 00269a: 0b                         | end
 00269b: 20 02                      | local.get 2
 00269d: 41 10                      | i32.const 16
 00269f: 6a                         | i32.add
 0026a0: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0026a6: 20 04                      | local.get 4
 0026a8: 0b                         | end
0026aa func[60] <_ZN3std3sys9backtrace26__rust_end_short_backtrace17h514500abf2a2d0caE>:
 0026ab: 20 00                      | local.get 0
 0026ad: 10 bd 80 80 80 00          | call 61 <_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h410c57f452410813E>
 0026b3: 00                         | unreachable
 0026b4: 0b                         | end
0026b7 func[61] <_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h410c57f452410813E>:
 0026b8: 03 7f                      | local[1..3] type=i32
 0026ba: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0026c0: 41 10                      | i32.const 16
 0026c2: 6b                         | i32.sub
 0026c3: 22 01                      | local.tee 1
 0026c5: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0026cb: 20 00                      | local.get 0
 0026cd: 28 02 00                   | i32.load 2 0
 0026d0: 22 02                      | local.tee 2
 0026d2: 28 02 0c                   | i32.load 2 12
 0026d5: 21 03                      | local.set 3
 0026d7: 02 40                      | block
 0026d9: 02 40                      |   block
 0026db: 02 40                      |     block
 0026dd: 02 40                      |       block
 0026df: 20 02                      |         local.get 2
 0026e1: 28 02 04                   |         i32.load 2 4
 0026e4: 0e 02 00 01 02             |         br_table 0 1 2
 0026e9: 0b                         |       end
 0026ea: 20 03                      |       local.get 3
 0026ec: 0d 01                      |       br_if 1
 0026ee: 41 01                      |       i32.const 1
 0026f0: 21 02                      |       local.set 2
 0026f2: 41 00                      |       i32.const 0
 0026f4: 21 03                      |       local.set 3
 0026f6: 0c 02                      |       br 2
 0026f8: 0b                         |     end
 0026f9: 20 03                      |     local.get 3
 0026fb: 0d 00                      |     br_if 0
 0026fd: 20 02                      |     local.get 2
 0026ff: 28 02 00                   |     i32.load 2 0
 002702: 22 02                      |     local.tee 2
 002704: 28 02 04                   |     i32.load 2 4
 002707: 21 03                      |     local.set 3
 002709: 20 02                      |     local.get 2
 00270b: 28 02 00                   |     i32.load 2 0
 00270e: 21 02                      |     local.set 2
 002710: 0c 01                      |     br 1
 002712: 0b                         |   end
 002713: 20 01                      |   local.get 1
 002715: 41 80 80 80 80 78          |   i32.const 2147483648
 00271b: 36 02 00                   |   i32.store 2 0
 00271e: 20 01                      |   local.get 1
 002720: 20 00                      |   local.get 0
 002722: 36 02 0c                   |   i32.store 2 12
 002725: 20 01                      |   local.get 1
 002727: 41 fc 8c c0 80 00          |   i32.const 1050236
 00272d: 20 00                      |   local.get 0
 00272f: 28 02 04                   |   i32.load 2 4
 002732: 20 00                      |   local.get 0
 002734: 28 02 08                   |   i32.load 2 8
 002737: 22 00                      |   local.tee 0
 002739: 2d 00 08                   |   i32.load8_u 0 8
 00273c: 20 00                      |   local.get 0
 00273e: 2d 00 09                   |   i32.load8_u 0 9
 002741: 10 ce 80 80 80 00          |   call 78 <_ZN3std9panicking20rust_panic_with_hook17h79071f5fb265d1d9E>
 002747: 00                         |   unreachable
 002748: 0b                         | end
 002749: 20 01                      | local.get 1
 00274b: 20 03                      | local.get 3
 00274d: 36 02 04                   | i32.store 2 4
 002750: 20 01                      | local.get 1
 002752: 20 02                      | local.get 2
 002754: 36 02 00                   | i32.store 2 0
 002757: 20 01                      | local.get 1
 002759: 41 e0 8c c0 80 00          | i32.const 1050208
 00275f: 20 00                      | local.get 0
 002761: 28 02 04                   | i32.load 2 4
 002764: 20 00                      | local.get 0
 002766: 28 02 08                   | i32.load 2 8
 002769: 22 00                      | local.tee 0
 00276b: 2d 00 08                   | i32.load8_u 0 8
 00276e: 20 00                      | local.get 0
 002770: 2d 00 09                   | i32.load8_u 0 9
 002773: 10 ce 80 80 80 00          | call 78 <_ZN3std9panicking20rust_panic_with_hook17h79071f5fb265d1d9E>
 002779: 00                         | unreachable
 00277a: 0b                         | end
00277d func[62] <_ZN3std5alloc24default_alloc_error_hook17h3412aa1ae450c7a0E>:
 00277e: 04 7f                      | local[2..5] type=i32
 002780: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 002786: 41 30                      | i32.const 48
 002788: 6b                         | i32.sub
 002789: 22 02                      | local.tee 2
 00278b: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002791: 02 40                      | block
 002793: 41 00                      |   i32.const 0
 002795: 2d 00 b0 95 c0 80 00       |   i32.load8_u 0 1051312
 00279c: 0d 00                      |   br_if 0
 00279e: 20 02                      |   local.get 2
 0027a0: 41 02                      |   i32.const 2
 0027a2: 36 02 0c                   |   i32.store 2 12
 0027a5: 20 02                      |   local.get 2
 0027a7: 41 ec 89 c0 80 00          |   i32.const 1049836
 0027ad: 36 02 08                   |   i32.store 2 8
 0027b0: 20 02                      |   local.get 2
 0027b2: 42 01                      |   i64.const 1
 0027b4: 37 02 14                   |   i64.store 2 20
 0027b7: 20 02                      |   local.get 2
 0027b9: 41 82 80 80 80 00          |   i32.const 2
 0027bf: ad                         |   i64.extend_i32_u
 0027c0: 42 20                      |   i64.const 32
 0027c2: 86                         |   i64.shl
 0027c3: 20 02                      |   local.get 2
 0027c5: 41 28                      |   i32.const 40
 0027c7: 6a                         |   i32.add
 0027c8: ad                         |   i64.extend_i32_u
 0027c9: 84                         |   i64.or
 0027ca: 37 03 20                   |   i64.store 3 32
 0027cd: 20 02                      |   local.get 2
 0027cf: 20 01                      |   local.get 1
 0027d1: 36 02 28                   |   i32.store 2 40
 0027d4: 20 02                      |   local.get 2
 0027d6: 20 02                      |   local.get 2
 0027d8: 41 20                      |   i32.const 32
 0027da: 6a                         |   i32.add
 0027db: 36 02 10                   |   i32.store 2 16
 0027de: 20 02                      |   local.get 2
 0027e0: 20 02                      |   local.get 2
 0027e2: 41 2f                      |   i32.const 47
 0027e4: 6a                         |   i32.add
 0027e5: 20 02                      |   local.get 2
 0027e7: 41 08                      |   i32.const 8
 0027e9: 6a                         |   i32.add
 0027ea: 10 a5 80 80 80 00          |   call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 0027f0: 20 02                      |   local.get 2
 0027f2: 28 02 04                   |   i32.load 2 4
 0027f5: 21 03                      |   local.set 3
 0027f7: 02 40                      |   block
 0027f9: 02 40                      |     block
 0027fb: 20 02                      |       local.get 2
 0027fd: 2d 00 00                   |       i32.load8_u 0 0
 002800: 22 01                      |       local.tee 1
 002802: 41 04                      |       i32.const 4
 002804: 4b                         |       i32.gt_u
 002805: 0d 00                      |       br_if 0
 002807: 20 01                      |       local.get 1
 002809: 41 03                      |       i32.const 3
 00280b: 47                         |       i32.ne
 00280c: 0d 01                      |       br_if 1
 00280e: 0b                         |     end
 00280f: 20 03                      |     local.get 3
 002811: 28 02 00                   |     i32.load 2 0
 002814: 21 04                      |     local.set 4
 002816: 02 40                      |     block
 002818: 20 03                      |       local.get 3
 00281a: 41 04                      |       i32.const 4
 00281c: 6a                         |       i32.add
 00281d: 28 02 00                   |       i32.load 2 0
 002820: 22 01                      |       local.tee 1
 002822: 28 02 00                   |       i32.load 2 0
 002825: 22 05                      |       local.tee 5
 002827: 45                         |       i32.eqz
 002828: 0d 00                      |       br_if 0
 00282a: 20 04                      |       local.get 4
 00282c: 20 05                      |       local.get 5
 00282e: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 002837: 80 00                      | 
 002839: 0b                         |     end
 00283a: 02 40                      |     block
 00283c: 20 01                      |       local.get 1
 00283e: 28 02 04                   |       i32.load 2 4
 002841: 22 05                      |       local.tee 5
 002843: 45                         |       i32.eqz
 002844: 0d 00                      |       br_if 0
 002846: 20 04                      |       local.get 4
 002848: 20 05                      |       local.get 5
 00284a: 20 01                      |       local.get 1
 00284c: 28 02 08                   |       i32.load 2 8
 00284f: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 002855: 0b                         |     end
 002856: 20 03                      |     local.get 3
 002858: 41 0c                      |     i32.const 12
 00285a: 41 04                      |     i32.const 4
 00285c: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 002862: 0b                         |   end
 002863: 20 02                      |   local.get 2
 002865: 41 30                      |   i32.const 48
 002867: 6a                         |   i32.add
 002868: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 00286e: 0f                         |   return
 00286f: 0b                         | end
 002870: 20 02                      | local.get 2
 002872: 41 02                      | i32.const 2
 002874: 36 02 0c                   | i32.store 2 12
 002877: 20 02                      | local.get 2
 002879: 41 8c 8a c0 80 00          | i32.const 1049868
 00287f: 36 02 08                   | i32.store 2 8
 002882: 20 02                      | local.get 2
 002884: 42 01                      | i64.const 1
 002886: 37 02 14                   | i64.store 2 20
 002889: 20 02                      | local.get 2
 00288b: 20 01                      | local.get 1
 00288d: 36 02 00                   | i32.store 2 0
 002890: 20 02                      | local.get 2
 002892: 41 82 80 80 80 00          | i32.const 2
 002898: ad                         | i64.extend_i32_u
 002899: 42 20                      | i64.const 32
 00289b: 86                         | i64.shl
 00289c: 20 02                      | local.get 2
 00289e: ad                         | i64.extend_i32_u
 00289f: 84                         | i64.or
 0028a0: 37 03 20                   | i64.store 3 32
 0028a3: 20 02                      | local.get 2
 0028a5: 20 02                      | local.get 2
 0028a7: 41 20                      | i32.const 32
 0028a9: 6a                         | i32.add
 0028aa: 36 02 10                   | i32.store 2 16
 0028ad: 20 02                      | local.get 2
 0028af: 41 08                      | i32.const 8
 0028b1: 6a                         | i32.add
 0028b2: 41 b4 8a c0 80 00          | i32.const 1049908
 0028b8: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 0028be: 00                         | unreachable
 0028bf: 0b                         | end
0028c1 func[63] <__rdl_alloc>:
 0028c2: 01 7f                      | local[2] type=i32
 0028c4: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0028ca: 41 10                      | i32.const 16
 0028cc: 6b                         | i32.sub
 0028cd: 22 02                      | local.tee 2
 0028cf: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0028d5: 02 40                      | block
 0028d7: 02 40                      |   block
 0028d9: 02 40                      |     block
 0028db: 20 01                      |       local.get 1
 0028dd: 41 08                      |       i32.const 8
 0028df: 4b                         |       i32.gt_u
 0028e0: 0d 00                      |       br_if 0
 0028e2: 20 01                      |       local.get 1
 0028e4: 20 00                      |       local.get 0
 0028e6: 4d                         |       i32.le_u
 0028e7: 0d 01                      |       br_if 1
 0028e9: 0b                         |     end
 0028ea: 20 02                      |     local.get 2
 0028ec: 41 00                      |     i32.const 0
 0028ee: 36 02 0c                   |     i32.store 2 12
 0028f1: 20 02                      |     local.get 2
 0028f3: 41 0c                      |     i32.const 12
 0028f5: 6a                         |     i32.add
 0028f6: 20 01                      |     local.get 1
 0028f8: 41 04                      |     i32.const 4
 0028fa: 20 01                      |     local.get 1
 0028fc: 41 04                      |     i32.const 4
 0028fe: 4b                         |     i32.gt_u
 0028ff: 1b                         |     select
 002900: 20 00                      |     local.get 0
 002902: 10 e0 80 80 80 00          |     call 96 <posix_memalign>
 002908: 21 01                      |     local.set 1
 00290a: 41 00                      |     i32.const 0
 00290c: 20 02                      |     local.get 2
 00290e: 28 02 0c                   |     i32.load 2 12
 002911: 20 01                      |     local.get 1
 002913: 1b                         |     select
 002914: 21 01                      |     local.set 1
 002916: 0c 01                      |     br 1
 002918: 0b                         |   end
 002919: 20 00                      |   local.get 0
 00291b: 10 d8 80 80 80 00          |   call 88 <malloc>
 002921: 21 01                      |   local.set 1
 002923: 0b                         | end
 002924: 20 02                      | local.get 2
 002926: 41 10                      | i32.const 16
 002928: 6a                         | i32.add
 002929: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00292f: 20 01                      | local.get 1
 002931: 0b                         | end
002933 func[64] <__rdl_dealloc>:
 002934: 20 00                      | local.get 0
 002936: 10 db 80 80 80 00          | call 91 <free>
 00293c: 0b                         | end
00293f func[65] <__rdl_realloc>:
 002940: 02 7f                      | local[4..5] type=i32
 002942: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 002948: 41 10                      | i32.const 16
 00294a: 6b                         | i32.sub
 00294b: 22 04                      | local.tee 4
 00294d: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002953: 02 40                      | block
 002955: 02 40                      |   block
 002957: 02 40                      |     block
 002959: 20 02                      |       local.get 2
 00295b: 41 08                      |       i32.const 8
 00295d: 4b                         |       i32.gt_u
 00295e: 0d 00                      |       br_if 0
 002960: 20 02                      |       local.get 2
 002962: 20 03                      |       local.get 3
 002964: 4d                         |       i32.le_u
 002965: 0d 01                      |       br_if 1
 002967: 0b                         |     end
 002968: 41 00                      |     i32.const 0
 00296a: 21 05                      |     local.set 5
 00296c: 20 04                      |     local.get 4
 00296e: 41 00                      |     i32.const 0
 002970: 36 02 0c                   |     i32.store 2 12
 002973: 20 04                      |     local.get 4
 002975: 41 0c                      |     i32.const 12
 002977: 6a                         |     i32.add
 002978: 20 02                      |     local.get 2
 00297a: 41 04                      |     i32.const 4
 00297c: 20 02                      |     local.get 2
 00297e: 41 04                      |     i32.const 4
 002980: 4b                         |     i32.gt_u
 002981: 1b                         |     select
 002982: 20 03                      |     local.get 3
 002984: 10 e0 80 80 80 00          |     call 96 <posix_memalign>
 00298a: 0d 01                      |     br_if 1
 00298c: 20 04                      |     local.get 4
 00298e: 28 02 0c                   |     i32.load 2 12
 002991: 22 02                      |     local.tee 2
 002993: 45                         |     i32.eqz
 002994: 0d 01                      |     br_if 1
 002996: 20 02                      |     local.get 2
 002998: 20 00                      |     local.get 0
 00299a: 20 03                      |     local.get 3
 00299c: 20 01                      |     local.get 1
 00299e: 20 03                      |     local.get 3
 0029a0: 20 01                      |     local.get 1
 0029a2: 49                         |     i32.lt_u
 0029a3: 1b                         |     select
 0029a4: 10 ee 80 80 80 00          |     call 110 <memcpy>
 0029aa: 21 02                      |     local.set 2
 0029ac: 20 00                      |     local.get 0
 0029ae: 10 db 80 80 80 00          |     call 91 <free>
 0029b4: 20 02                      |     local.get 2
 0029b6: 21 05                      |     local.set 5
 0029b8: 0c 01                      |     br 1
 0029ba: 0b                         |   end
 0029bb: 20 00                      |   local.get 0
 0029bd: 20 03                      |   local.get 3
 0029bf: 10 de 80 80 80 00          |   call 94 <realloc>
 0029c5: 21 05                      |   local.set 5
 0029c7: 0b                         | end
 0029c8: 20 04                      | local.get 4
 0029ca: 41 10                      | i32.const 16
 0029cc: 6a                         | i32.add
 0029cd: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0029d3: 20 05                      | local.get 5
 0029d5: 0b                         | end
0029d8 func[66] <_ZN3std9panicking14payload_as_str17hbd23a0452b22d5e1E>:
 0029d9: 03 7f                      | local[3..5] type=i32
 0029db: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0029e1: 41 10                      | i32.const 16
 0029e3: 6b                         | i32.sub
 0029e4: 22 03                      | local.tee 3
 0029e6: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0029ec: 20 03                      | local.get 3
 0029ee: 20 01                      | local.get 1
 0029f0: 20 02                      | local.get 2
 0029f2: 28 02 0c                   | i32.load 2 12
 0029f5: 22 04                      | local.tee 4
 0029f7: 11 84 80 80 80 00 80 80 80 | call_indirect 0 (type 4)
 002a00: 80 00                      | 
 002a02: 02 40                      | block
 002a04: 02 40                      |   block
 002a06: 02 40                      |     block
 002a08: 20 03                      |       local.get 3
 002a0a: 29 03 00                   |       i64.load 3 0
 002a0d: 42 f8 82 99 bd 95 ee c6 c5 |       i64.const 13369810092395217272
 002a16: b9 7f                      | 
 002a18: 52                         |       i64.ne
 002a19: 0d 00                      |       br_if 0
 002a1b: 41 04                      |       i32.const 4
 002a1d: 21 02                      |       local.set 2
 002a1f: 20 01                      |       local.get 1
 002a21: 21 05                      |       local.set 5
 002a23: 20 03                      |       local.get 3
 002a25: 29 03 08                   |       i64.load 3 8
 002a28: 42 ed ba ad b6 cd 85 d4 f5 |       i64.const 7199936582794304877
 002a31: e3 00                      | 
 002a33: 51                         |       i64.eq
 002a34: 0d 01                      |       br_if 1
 002a36: 0b                         |     end
 002a37: 20 03                      |     local.get 3
 002a39: 20 01                      |     local.get 1
 002a3b: 20 04                      |     local.get 4
 002a3d: 11 84 80 80 80 00 80 80 80 |     call_indirect 0 (type 4)
 002a46: 80 00                      | 
 002a48: 41 98 8d c0 80 00          |     i32.const 1050264
 002a4e: 21 02                      |     local.set 2
 002a50: 41 0c                      |     i32.const 12
 002a52: 21 04                      |     local.set 4
 002a54: 20 03                      |     local.get 3
 002a56: 29 03 00                   |     i64.load 3 0
 002a59: 42 f2 ae be aa e2 fb a4 c8 |     i64.const 2058307612026312562
 002a62: 1c                         | 
 002a63: 52                         |     i64.ne
 002a64: 0d 01                      |     br_if 1
 002a66: 20 03                      |     local.get 3
 002a68: 29 03 08                   |     i64.load 3 8
 002a6b: 42 8d a8 ef c8 8e e6 e6 e9 |     i64.const 7265321258250392589
 002a74: e4 00                      | 
 002a76: 52                         |     i64.ne
 002a77: 0d 01                      |     br_if 1
 002a79: 20 01                      |     local.get 1
 002a7b: 41 04                      |     i32.const 4
 002a7d: 6a                         |     i32.add
 002a7e: 21 05                      |     local.set 5
 002a80: 41 08                      |     i32.const 8
 002a82: 21 02                      |     local.set 2
 002a84: 0b                         |   end
 002a85: 20 01                      |   local.get 1
 002a87: 20 02                      |   local.get 2
 002a89: 6a                         |   i32.add
 002a8a: 28 02 00                   |   i32.load 2 0
 002a8d: 21 04                      |   local.set 4
 002a8f: 20 05                      |   local.get 5
 002a91: 28 02 00                   |   i32.load 2 0
 002a94: 21 02                      |   local.set 2
 002a96: 0b                         | end
 002a97: 20 00                      | local.get 0
 002a99: 20 04                      | local.get 4
 002a9b: 36 02 04                   | i32.store 2 4
 002a9e: 20 00                      | local.get 0
 002aa0: 20 02                      | local.get 2
 002aa2: 36 02 00                   | i32.store 2 0
 002aa5: 20 03                      | local.get 3
 002aa7: 41 10                      | i32.const 16
 002aa9: 6a                         | i32.add
 002aaa: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002ab0: 0b                         | end
002ab3 func[67] <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$17h87631b483d7e558cE>:
 002ab4: 02 7f                      | local[3..4] type=i32
 002ab6: 01 7e                      | local[5] type=i64
 002ab8: 02 7f                      | local[6..7] type=i32
 002aba: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 002ac0: 41 20                      | i32.const 32
 002ac2: 6b                         | i32.sub
 002ac3: 22 03                      | local.tee 3
 002ac5: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002acb: 10 b9 80 80 80 00          | call 57 <_ZN3std3sys9backtrace4lock17h4601eb74b01695daE>
 002ad1: 21 04                      | local.set 4
 002ad3: 20 00                      | local.get 0
 002ad5: 29 02 00                   | i64.load 2 0
 002ad8: 21 05                      | local.set 5
 002ada: 20 03                      | local.get 3
 002adc: 20 02                      | local.get 2
 002ade: 36 02 14                   | i32.store 2 20
 002ae1: 20 03                      | local.get 3
 002ae3: 20 01                      | local.get 1
 002ae5: 36 02 10                   | i32.store 2 16
 002ae8: 20 03                      | local.get 3
 002aea: 20 05                      | local.get 5
 002aec: 37 02 08                   | i64.store 2 8
 002aef: 02 40                      | block
 002af1: 02 40                      |   block
 002af3: 41 00                      |     i32.const 0
 002af5: 28 02 f0 95 c0 80 00       |     i32.load 2 1051376
 002afc: 22 06                      |     local.tee 6
 002afe: 41 02                      |     i32.const 2
 002b00: 4b                         |     i32.gt_u
 002b01: 0d 00                      |     br_if 0
 002b03: 02 40                      |     block
 002b05: 02 40                      |       block
 002b07: 41 00                      |         i32.const 0
 002b09: 29 03 d8 95 c0 80 00       |         i64.load 3 1051352
 002b10: 22 05                      |         local.tee 5
 002b12: 50                         |         i64.eqz
 002b13: 0d 00                      |         br_if 0
 002b15: 41 00                      |         i32.const 0
 002b17: 29 03 d0 95 c0 80 00       |         i64.load 3 1051344
 002b1e: 20 05                      |         local.get 5
 002b20: 51                         |         i64.eq
 002b21: 0d 01                      |         br_if 1
 002b23: 0b                         |       end
 002b24: 20 03                      |       local.get 3
 002b26: 41 08                      |       i32.const 8
 002b28: 6a                         |       i32.add
 002b29: 41 00                      |       i32.const 0
 002b2b: 20 03                      |       local.get 3
 002b2d: 10 c4 80 80 80 00          |       call 68 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>
 002b33: 0c 02                      |       br 2
 002b35: 0b                         |     end
 002b36: 20 03                      |     local.get 3
 002b38: 41 08                      |     i32.const 8
 002b3a: 6a                         |     i32.add
 002b3b: 41 dc 83 c0 80 00          |     i32.const 1049052
 002b41: 41 04                      |     i32.const 4
 002b43: 10 c4 80 80 80 00          |     call 68 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>
 002b49: 0c 01                      |     br 1
 002b4b: 0b                         |   end
 002b4c: 02 40                      |   block
 002b4e: 20 06                      |     local.get 6
 002b50: 28 02 08                   |     i32.load 2 8
 002b53: 22 07                      |     local.tee 7
 002b55: 45                         |     i32.eqz
 002b56: 0d 00                      |     br_if 0
 002b58: 20 03                      |     local.get 3
 002b5a: 41 08                      |     i32.const 8
 002b5c: 6a                         |     i32.add
 002b5d: 20 07                      |     local.get 7
 002b5f: 20 06                      |     local.get 6
 002b61: 41 0c                      |     i32.const 12
 002b63: 6a                         |     i32.add
 002b64: 28 02 00                   |     i32.load 2 0
 002b67: 41 7f                      |     i32.const 4294967295
 002b69: 6a                         |     i32.add
 002b6a: 10 c4 80 80 80 00          |     call 68 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>
 002b70: 0c 01                      |     br 1
 002b72: 0b                         |   end
 002b73: 02 40                      |   block
 002b75: 20 06                      |     local.get 6
 002b77: 29 03 00                   |     i64.load 3 0
 002b7a: 41 00                      |     i32.const 0
 002b7c: 29 03 d8 95 c0 80 00       |     i64.load 3 1051352
 002b83: 52                         |     i64.ne
 002b84: 0d 00                      |     br_if 0
 002b86: 20 03                      |     local.get 3
 002b88: 41 08                      |     i32.const 8
 002b8a: 6a                         |     i32.add
 002b8b: 41 dc 83 c0 80 00          |     i32.const 1049052
 002b91: 41 04                      |     i32.const 4
 002b93: 10 c4 80 80 80 00          |     call 68 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>
 002b99: 0c 01                      |     br 1
 002b9b: 0b                         |   end
 002b9c: 20 03                      |   local.get 3
 002b9e: 41 08                      |   i32.const 8
 002ba0: 6a                         |   i32.add
 002ba1: 41 00                      |   i32.const 0
 002ba3: 20 03                      |   local.get 3
 002ba5: 10 c4 80 80 80 00          |   call 68 <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>
 002bab: 0b                         | end
 002bac: 02 40                      | block
 002bae: 02 40                      |   block
 002bb0: 02 40                      |     block
 002bb2: 02 40                      |       block
 002bb4: 20 00                      |         local.get 0
 002bb6: 28 02 08                   |         i32.load 2 8
 002bb9: 2d 00 00                   |         i32.load8_u 0 0
 002bbc: 0e 04 00 01 02 03 00       |         br_table 0 1 2 3 0
 002bc3: 0b                         |       end
 002bc4: 20 03                      |       local.get 3
 002bc6: 41 08                      |       i32.const 8
 002bc8: 6a                         |       i32.add
 002bc9: 20 01                      |       local.get 1
 002bcb: 20 02                      |       local.get 2
 002bcd: 28 02 24                   |       i32.load 2 36
 002bd0: 41 00                      |       i32.const 0
 002bd2: 10 ba 80 80 80 00          |       call 58 <_ZN3std3sys9backtrace13BacktraceLock5print17hce08e60bbba84f67E>
 002bd8: 20 03                      |       local.get 3
 002bda: 2d 00 08                   |       i32.load8_u 0 8
 002bdd: 20 03                      |       local.get 3
 002bdf: 28 02 0c                   |       i32.load 2 12
 002be2: 10 9d 80 80 80 00          |       call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 002be8: 0c 02                      |       br 2
 002bea: 0b                         |     end
 002beb: 20 03                      |     local.get 3
 002bed: 41 08                      |     i32.const 8
 002bef: 6a                         |     i32.add
 002bf0: 20 01                      |     local.get 1
 002bf2: 20 02                      |     local.get 2
 002bf4: 28 02 24                   |     i32.load 2 36
 002bf7: 41 01                      |     i32.const 1
 002bf9: 10 ba 80 80 80 00          |     call 58 <_ZN3std3sys9backtrace13BacktraceLock5print17hce08e60bbba84f67E>
 002bff: 20 03                      |     local.get 3
 002c01: 2d 00 08                   |     i32.load8_u 0 8
 002c04: 20 03                      |     local.get 3
 002c06: 28 02 0c                   |     i32.load 2 12
 002c09: 10 9d 80 80 80 00          |     call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 002c0f: 0c 01                      |     br 1
 002c11: 0b                         |   end
 002c12: 41 00                      |   i32.const 0
 002c14: 2d 00 a4 95 c0 80 00       |   i32.load8_u 0 1051300
 002c1b: 21 00                      |   local.set 0
 002c1d: 41 00                      |   i32.const 0
 002c1f: 41 00                      |   i32.const 0
 002c21: 3a 00 a4 95 c0 80 00       |   i32.store8 0 1051300
 002c28: 20 00                      |   local.get 0
 002c2a: 45                         |   i32.eqz
 002c2b: 0d 00                      |   br_if 0
 002c2d: 20 03                      |   local.get 3
 002c2f: 41 00                      |   i32.const 0
 002c31: 36 02 18                   |   i32.store 2 24
 002c34: 20 03                      |   local.get 3
 002c36: 41 01                      |   i32.const 1
 002c38: 36 02 0c                   |   i32.store 2 12
 002c3b: 20 03                      |   local.get 3
 002c3d: 41 e4 8b c0 80 00          |   i32.const 1050084
 002c43: 36 02 08                   |   i32.store 2 8
 002c46: 20 03                      |   local.get 3
 002c48: 42 04                      |   i64.const 4
 002c4a: 37 02 10                   |   i64.store 2 16
 002c4d: 20 03                      |   local.get 3
 002c4f: 20 01                      |   local.get 1
 002c51: 20 03                      |   local.get 3
 002c53: 41 08                      |   i32.const 8
 002c55: 6a                         |   i32.add
 002c56: 20 02                      |   local.get 2
 002c58: 28 02 24                   |   i32.load 2 36
 002c5b: 11 82 80 80 80 00 80 80 80 |   call_indirect 0 (type 2)
 002c64: 80 00                      | 
 002c66: 20 03                      |   local.get 3
 002c68: 2d 00 00                   |   i32.load8_u 0 0
 002c6b: 20 03                      |   local.get 3
 002c6d: 28 02 04                   |   i32.load 2 4
 002c70: 10 9d 80 80 80 00          |   call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 002c76: 0b                         | end
 002c77: 20 04                      | local.get 4
 002c79: 41 00                      | i32.const 0
 002c7b: 3a 00 00                   | i32.store8 0 0
 002c7e: 20 03                      | local.get 3
 002c80: 41 20                      | i32.const 32
 002c82: 6a                         | i32.add
 002c83: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002c89: 0b                         | end
002c8c func[68] <_ZN3std9panicking12default_hook28_$u7b$$u7b$closure$u7d$$u7d$28_$u7b$$u7b$closure$u7d$$u7d$17h7bef6269e006c395E>:
 002c8d: 01 7f                      | local[3] type=i32
 002c8f: 03 7e                      | local[4..6] type=i64
 002c91: 02 7f                      | local[7..8] type=i32
 002c93: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 002c99: 41 d0 04                   | i32.const 592
 002c9c: 6b                         | i32.sub
 002c9d: 22 03                      | local.tee 3
 002c9f: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 002ca5: 20 03                      | local.get 3
 002ca7: 20 02                      | local.get 2
 002ca9: 41 09                      | i32.const 9
 002cab: 20 01                      | local.get 1
 002cad: 1b                         | select
 002cae: 36 02 04                   | i32.store 2 4
 002cb1: 20 03                      | local.get 3
 002cb3: 20 01                      | local.get 1
 002cb5: 41 ec 8b c0 80 00          | i32.const 1050092
 002cbb: 20 01                      | local.get 1
 002cbd: 1b                         | select
 002cbe: 36 02 00                   | i32.store 2 0
 002cc1: 20 03                      | local.get 3
 002cc3: 41 08                      | i32.const 8
 002cc5: 6a                         | i32.add
 002cc6: 41 00                      | i32.const 0
 002cc8: 41 80 04                   | i32.const 512
 002ccb: 10 ef 80 80 80 00          | call 111 <memset>
 002cd1: 1a                         | drop
 002cd2: 20 03                      | local.get 3
 002cd4: 42 00                      | i64.const 0
 002cd6: 37 03 90 04                | i64.store 3 528
 002cda: 20 03                      | local.get 3
 002cdc: 41 80 04                   | i32.const 512
 002cdf: 36 02 8c 04                | i32.store 2 524
 002ce3: 20 03                      | local.get 3
 002ce5: 20 03                      | local.get 3
 002ce7: 41 08                      | i32.const 8
 002ce9: 6a                         | i32.add
 002cea: 36 02 88 04                | i32.store 2 520
 002cee: 20 00                      | local.get 0
 002cf0: 35 02 00                   | i64.load32_u 2 0
 002cf3: 21 04                      | local.set 4
 002cf5: 20 00                      | local.get 0
 002cf7: 35 02 04                   | i64.load32_u 2 4
 002cfa: 21 05                      | local.set 5
 002cfc: 20 03                      | local.get 3
 002cfe: 41 a0 8c c0 80 00          | i32.const 1050144
 002d04: 36 02 a0 04                | i32.store 2 544
 002d08: 20 03                      | local.get 3
 002d0a: 42 03                      | i64.const 3
 002d0c: 37 02 ac 04                | i64.store 2 556
 002d10: 20 03                      | local.get 3
 002d12: 20 05                      | local.get 5
 002d14: 41 81 80 80 80 00          | i32.const 1
 002d1a: ad                         | i64.extend_i32_u
 002d1b: 42 20                      | i64.const 32
 002d1d: 86                         | i64.shl
 002d1e: 22 06                      | local.tee 6
 002d20: 84                         | i64.or
 002d21: 22 05                      | local.tee 5
 002d23: 37 03 c8 04                | i64.store 3 584
 002d27: 20 03                      | local.get 3
 002d29: 20 04                      | local.get 4
 002d2b: 41 84 80 80 80 00          | i32.const 4
 002d31: ad                         | i64.extend_i32_u
 002d32: 42 20                      | i64.const 32
 002d34: 86                         | i64.shl
 002d35: 84                         | i64.or
 002d36: 22 04                      | local.tee 4
 002d38: 37 03 c0 04                | i64.store 3 576
 002d3c: 20 03                      | local.get 3
 002d3e: 20 06                      | local.get 6
 002d40: 20 03                      | local.get 3
 002d42: ad                         | i64.extend_i32_u
 002d43: 84                         | i64.or
 002d44: 22 06                      | local.tee 6
 002d46: 37 03 b8 04                | i64.store 3 568
 002d4a: 20 03                      | local.get 3
 002d4c: 20 03                      | local.get 3
 002d4e: 41 b8 04                   | i32.const 568
 002d51: 6a                         | i32.add
 002d52: 36 02 a8 04                | i32.store 2 552
 002d56: 20 03                      | local.get 3
 002d58: 41 04                      | i32.const 4
 002d5a: 36 02 a4 04                | i32.store 2 548
 002d5e: 20 03                      | local.get 3
 002d60: 41 98 04                   | i32.const 536
 002d63: 6a                         | i32.add
 002d64: 20 03                      | local.get 3
 002d66: 41 88 04                   | i32.const 520
 002d69: 6a                         | i32.add
 002d6a: 20 03                      | local.get 3
 002d6c: 41 a0 04                   | i32.const 544
 002d6f: 6a                         | i32.add
 002d70: 10 b5 80 80 80 00          | call 53 <_ZN3std2io5Write9write_fmt17he4d6612a7e90ae22E>
 002d76: 02 40                      | block
 002d78: 02 40                      |   block
 002d7a: 02 40                      |     block
 002d7c: 20 03                      |       local.get 3
 002d7e: 2d 00 98 04                |       i32.load8_u 0 536
 002d82: 22 01                      |       local.tee 1
 002d84: 41 04                      |       i32.const 4
 002d86: 47                         |       i32.ne
 002d87: 0d 00                      |       br_if 0
 002d89: 20 03                      |       local.get 3
 002d8b: 28 02 90 04                |       i32.load 2 528
 002d8f: 22 01                      |       local.tee 1
 002d91: 41 81 04                   |       i32.const 513
 002d94: 4f                         |       i32.ge_u
 002d95: 0d 02                      |       br_if 2
 002d97: 20 03                      |       local.get 3
 002d99: 41 b8 04                   |       i32.const 568
 002d9c: 6a                         |       i32.add
 002d9d: 20 00                      |       local.get 0
 002d9f: 28 02 08                   |       i32.load 2 8
 002da2: 20 03                      |       local.get 3
 002da4: 41 08                      |       i32.const 8
 002da6: 6a                         |       i32.add
 002da7: 20 01                      |       local.get 1
 002da9: 20 00                      |       local.get 0
 002dab: 28 02 0c                   |       i32.load 2 12
 002dae: 28 02 1c                   |       i32.load 2 28
 002db1: 11 85 80 80 80 00 80 80 80 |       call_indirect 0 (type 5)
 002dba: 80 00                      | 
 002dbc: 20 03                      |       local.get 3
 002dbe: 28 02 bc 04                |       i32.load 2 572
 002dc2: 21 01                      |       local.set 1
 002dc4: 02 40                      |       block
 002dc6: 20 03                      |         local.get 3
 002dc8: 2d 00 b8 04                |         i32.load8_u 0 568
 002dcc: 22 00                      |         local.tee 0
 002dce: 41 04                      |         i32.const 4
 002dd0: 4b                         |         i32.gt_u
 002dd1: 0d 00                      |         br_if 0
 002dd3: 20 00                      |         local.get 0
 002dd5: 41 03                      |         i32.const 3
 002dd7: 47                         |         i32.ne
 002dd8: 0d 02                      |         br_if 2
 002dda: 0b                         |       end
 002ddb: 20 01                      |       local.get 1
 002ddd: 28 02 00                   |       i32.load 2 0
 002de0: 21 02                      |       local.set 2
 002de2: 02 40                      |       block
 002de4: 20 01                      |         local.get 1
 002de6: 41 04                      |         i32.const 4
 002de8: 6a                         |         i32.add
 002de9: 28 02 00                   |         i32.load 2 0
 002dec: 22 00                      |         local.tee 0
 002dee: 28 02 00                   |         i32.load 2 0
 002df1: 22 07                      |         local.tee 7
 002df3: 45                         |         i32.eqz
 002df4: 0d 00                      |         br_if 0
 002df6: 20 02                      |         local.get 2
 002df8: 20 07                      |         local.get 7
 002dfa: 11 80 80 80 80 00 80 80 80 |         call_indirect 0 (type 0)
 002e03: 80 00                      | 
 002e05: 0b                         |       end
 002e06: 02 40                      |       block
 002e08: 20 00                      |         local.get 0
 002e0a: 28 02 04                   |         i32.load 2 4
 002e0d: 22 07                      |         local.tee 7
 002e0f: 45                         |         i32.eqz
 002e10: 0d 00                      |         br_if 0
 002e12: 20 02                      |         local.get 2
 002e14: 20 07                      |         local.get 7
 002e16: 20 00                      |         local.get 0
 002e18: 28 02 08                   |         i32.load 2 8
 002e1b: 10 86 80 80 80 00          |         call 6 <__rust_dealloc>
 002e21: 0b                         |       end
 002e22: 20 01                      |       local.get 1
 002e24: 41 0c                      |       i32.const 12
 002e26: 41 04                      |       i32.const 4
 002e28: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 002e2e: 0c 01                      |       br 1
 002e30: 0b                         |     end
 002e31: 02 40                      |     block
 002e33: 20 01                      |       local.get 1
 002e35: 41 03                      |       i32.const 3
 002e37: 49                         |       i32.lt_u
 002e38: 0d 00                      |       br_if 0
 002e3a: 20 03                      |       local.get 3
 002e3c: 28 02 9c 04                |       i32.load 2 540
 002e40: 22 01                      |       local.tee 1
 002e42: 28 02 00                   |       i32.load 2 0
 002e45: 21 07                      |       local.set 7
 002e47: 02 40                      |       block
 002e49: 20 01                      |         local.get 1
 002e4b: 41 04                      |         i32.const 4
 002e4d: 6a                         |         i32.add
 002e4e: 28 02 00                   |         i32.load 2 0
 002e51: 22 02                      |         local.tee 2
 002e53: 28 02 00                   |         i32.load 2 0
 002e56: 22 08                      |         local.tee 8
 002e58: 45                         |         i32.eqz
 002e59: 0d 00                      |         br_if 0
 002e5b: 20 07                      |         local.get 7
 002e5d: 20 08                      |         local.get 8
 002e5f: 11 80 80 80 80 00 80 80 80 |         call_indirect 0 (type 0)
 002e68: 80 00                      | 
 002e6a: 0b                         |       end
 002e6b: 02 40                      |       block
 002e6d: 20 02                      |         local.get 2
 002e6f: 28 02 04                   |         i32.load 2 4
 002e72: 22 08                      |         local.tee 8
 002e74: 45                         |         i32.eqz
 002e75: 0d 00                      |         br_if 0
 002e77: 20 07                      |         local.get 7
 002e79: 20 08                      |         local.get 8
 002e7b: 20 02                      |         local.get 2
 002e7d: 28 02 08                   |         i32.load 2 8
 002e80: 10 86 80 80 80 00          |         call 6 <__rust_dealloc>
 002e86: 0b                         |       end
 002e87: 20 01                      |       local.get 1
 002e89: 41 0c                      |       i32.const 12
 002e8b: 41 04                      |       i32.const 4
 002e8d: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 002e93: 0b                         |     end
 002e94: 20 00                      |     local.get 0
 002e96: 28 02 0c                   |     i32.load 2 12
 002e99: 41 24                      |     i32.const 36
 002e9b: 6a                         |     i32.add
 002e9c: 28 02 00                   |     i32.load 2 0
 002e9f: 21 01                      |     local.set 1
 002ea1: 20 00                      |     local.get 0
 002ea3: 28 02 08                   |     i32.load 2 8
 002ea6: 21 00                      |     local.set 0
 002ea8: 20 03                      |     local.get 3
 002eaa: 41 a0 8c c0 80 00          |     i32.const 1050144
 002eb0: 36 02 a0 04                |     i32.store 2 544
 002eb4: 20 03                      |     local.get 3
 002eb6: 42 03                      |     i64.const 3
 002eb8: 37 02 ac 04                |     i64.store 2 556
 002ebc: 20 03                      |     local.get 3
 002ebe: 20 05                      |     local.get 5
 002ec0: 37 03 c8 04                |     i64.store 3 584
 002ec4: 20 03                      |     local.get 3
 002ec6: 20 04                      |     local.get 4
 002ec8: 37 03 c0 04                |     i64.store 3 576
 002ecc: 20 03                      |     local.get 3
 002ece: 20 06                      |     local.get 6
 002ed0: 37 03 b8 04                |     i64.store 3 568
 002ed4: 20 03                      |     local.get 3
 002ed6: 20 03                      |     local.get 3
 002ed8: 41 b8 04                   |     i32.const 568
 002edb: 6a                         |     i32.add
 002edc: 36 02 a8 04                |     i32.store 2 552
 002ee0: 20 03                      |     local.get 3
 002ee2: 41 04                      |     i32.const 4
 002ee4: 36 02 a4 04                |     i32.store 2 548
 002ee8: 20 03                      |     local.get 3
 002eea: 41 98 04                   |     i32.const 536
 002eed: 6a                         |     i32.add
 002eee: 20 00                      |     local.get 0
 002ef0: 20 03                      |     local.get 3
 002ef2: 41 a0 04                   |     i32.const 544
 002ef5: 6a                         |     i32.add
 002ef6: 20 01                      |     local.get 1
 002ef8: 11 82 80 80 80 00 80 80 80 |     call_indirect 0 (type 2)
 002f01: 80 00                      | 
 002f03: 20 03                      |     local.get 3
 002f05: 28 02 9c 04                |     i32.load 2 540
 002f09: 21 01                      |     local.set 1
 002f0b: 02 40                      |     block
 002f0d: 20 03                      |       local.get 3
 002f0f: 2d 00 98 04                |       i32.load8_u 0 536
 002f13: 22 00                      |       local.tee 0
 002f15: 41 04                      |       i32.const 4
 002f17: 4b                         |       i32.gt_u
 002f18: 0d 00                      |       br_if 0
 002f1a: 20 00                      |       local.get 0
 002f1c: 41 03                      |       i32.const 3
 002f1e: 47                         |       i32.ne
 002f1f: 0d 01                      |       br_if 1
 002f21: 0b                         |     end
 002f22: 20 01                      |     local.get 1
 002f24: 28 02 00                   |     i32.load 2 0
 002f27: 21 02                      |     local.set 2
 002f29: 02 40                      |     block
 002f2b: 20 01                      |       local.get 1
 002f2d: 41 04                      |       i32.const 4
 002f2f: 6a                         |       i32.add
 002f30: 28 02 00                   |       i32.load 2 0
 002f33: 22 00                      |       local.tee 0
 002f35: 28 02 00                   |       i32.load 2 0
 002f38: 22 07                      |       local.tee 7
 002f3a: 45                         |       i32.eqz
 002f3b: 0d 00                      |       br_if 0
 002f3d: 20 02                      |       local.get 2
 002f3f: 20 07                      |       local.get 7
 002f41: 11 80 80 80 80 00 80 80 80 |       call_indirect 0 (type 0)
 002f4a: 80 00                      | 
 002f4c: 0b                         |     end
 002f4d: 02 40                      |     block
 002f4f: 20 00                      |       local.get 0
 002f51: 28 02 04                   |       i32.load 2 4
 002f54: 22 07                      |       local.tee 7
 002f56: 45                         |       i32.eqz
 002f57: 0d 00                      |       br_if 0
 002f59: 20 02                      |       local.get 2
 002f5b: 20 07                      |       local.get 7
 002f5d: 20 00                      |       local.get 0
 002f5f: 28 02 08                   |       i32.load 2 8
 002f62: 10 86 80 80 80 00          |       call 6 <__rust_dealloc>
 002f68: 0b                         |     end
 002f69: 20 01                      |     local.get 1
 002f6b: 41 0c                      |     i32.const 12
 002f6d: 41 04                      |     i32.const 4
 002f6f: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 002f75: 0b                         |   end
 002f76: 20 03                      |   local.get 3
 002f78: 41 d0 04                   |   i32.const 592
 002f7b: 6a                         |   i32.add
 002f7c: 24 80 80 80 80 00          |   global.set 0 <__stack_pointer>
 002f82: 0f                         |   return
 002f83: 0b                         | end
 002f84: 20 01                      | local.get 1
 002f86: 41 80 04                   | i32.const 512
 002f89: 41 f8 8b c0 80 00          | i32.const 1050104
 002f8f: 10 fe 80 80 80 00          | call 126 <_ZN4core5slice5index24slice_end_index_len_fail17hac06667177b4ebacE>
 002f95: 00                         | unreachable
 002f96: 0b                         | end
002f98 func[69] <_ZN3std9panicking11panic_count8increase17hbed16cea2168a27bE>:
 002f99: 02 7f                      | local[1..2] type=i32
 002f9b: 41 00                      | i32.const 0
 002f9d: 21 01                      | local.set 1
 002f9f: 41 00                      | i32.const 0
 002fa1: 41 00                      | i32.const 0
 002fa3: 28 02 c8 95 c0 80 00       | i32.load 2 1051336
 002faa: 22 02                      | local.tee 2
 002fac: 41 01                      | i32.const 1
 002fae: 6a                         | i32.add
 002faf: 36 02 c8 95 c0 80 00       | i32.store 2 1051336
 002fb6: 02 40                      | block
 002fb8: 20 02                      |   local.get 2
 002fba: 41 00                      |   i32.const 0
 002fbc: 48                         |   i32.lt_s
 002fbd: 0d 00                      |   br_if 0
 002fbf: 41 01                      |   i32.const 1
 002fc1: 21 01                      |   local.set 1
 002fc3: 41 00                      |   i32.const 0
 002fc5: 2d 00 e4 95 c0 80 00       |   i32.load8_u 0 1051364
 002fcc: 0d 00                      |   br_if 0
 002fce: 41 00                      |   i32.const 0
 002fd0: 20 00                      |   local.get 0
 002fd2: 3a 00 e4 95 c0 80 00       |   i32.store8 0 1051364
 002fd9: 41 00                      |   i32.const 0
 002fdb: 41 00                      |   i32.const 0
 002fdd: 28 02 e0 95 c0 80 00       |   i32.load 2 1051360
 002fe4: 41 01                      |   i32.const 1
 002fe6: 6a                         |   i32.add
 002fe7: 36 02 e0 95 c0 80 00       |   i32.store 2 1051360
 002fee: 41 02                      |   i32.const 2
 002ff0: 21 01                      |   local.set 1
 002ff2: 0b                         | end
 002ff3: 20 01                      | local.get 1
 002ff5: 0b                         | end
002ff7 func[70] <rust_begin_unwind>:
 002ff8: 01 7f                      | local[1] type=i32
 002ffa: 01 7e                      | local[2] type=i64
 002ffc: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 003002: 41 10                      | i32.const 16
 003004: 6b                         | i32.sub
 003005: 22 01                      | local.tee 1
 003007: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00300d: 20 00                      | local.get 0
 00300f: 29 02 00                   | i64.load 2 0
 003012: 21 02                      | local.set 2
 003014: 20 01                      | local.get 1
 003016: 20 00                      | local.get 0
 003018: 36 02 0c                   | i32.store 2 12
 00301b: 20 01                      | local.get 1
 00301d: 20 02                      | local.get 2
 00301f: 37 02 04                   | i64.store 2 4
 003022: 20 01                      | local.get 1
 003024: 41 04                      | i32.const 4
 003026: 6a                         | i32.add
 003027: 10 bc 80 80 80 00          | call 60 <_ZN3std3sys9backtrace26__rust_end_short_backtrace17h514500abf2a2d0caE>
 00302d: 00                         | unreachable
 00302e: 0b                         | end
003031 func[71] <_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17hbaf28723d5e72f1eE>:
 003032: 03 7f                      | local[2..4] type=i32
 003034: 01 7e                      | local[5] type=i64
 003036: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00303c: 41 c0 00                   | i32.const 64
 00303f: 6b                         | i32.sub
 003040: 22 02                      | local.tee 2
 003042: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 003048: 02 40                      | block
 00304a: 20 01                      |   local.get 1
 00304c: 28 02 00                   |   i32.load 2 0
 00304f: 41 80 80 80 80 78          |   i32.const 2147483648
 003055: 47                         |   i32.ne
 003056: 0d 00                      |   br_if 0
 003058: 20 01                      |   local.get 1
 00305a: 28 02 0c                   |   i32.load 2 12
 00305d: 21 03                      |   local.set 3
 00305f: 20 02                      |   local.get 2
 003061: 41 1c                      |   i32.const 28
 003063: 6a                         |   i32.add
 003064: 41 08                      |   i32.const 8
 003066: 6a                         |   i32.add
 003067: 22 04                      |   local.tee 4
 003069: 41 00                      |   i32.const 0
 00306b: 36 02 00                   |   i32.store 2 0
 00306e: 20 02                      |   local.get 2
 003070: 42 80 80 80 80 10          |   i64.const 4294967296
 003076: 37 02 1c                   |   i64.store 2 28
 003079: 20 02                      |   local.get 2
 00307b: 41 28                      |   i32.const 40
 00307d: 6a                         |   i32.add
 00307e: 41 08                      |   i32.const 8
 003080: 6a                         |   i32.add
 003081: 20 03                      |   local.get 3
 003083: 28 02 00                   |   i32.load 2 0
 003086: 22 03                      |   local.tee 3
 003088: 41 08                      |   i32.const 8
 00308a: 6a                         |   i32.add
 00308b: 29 02 00                   |   i64.load 2 0
 00308e: 37 03 00                   |   i64.store 3 0
 003091: 20 02                      |   local.get 2
 003093: 41 28                      |   i32.const 40
 003095: 6a                         |   i32.add
 003096: 41 10                      |   i32.const 16
 003098: 6a                         |   i32.add
 003099: 20 03                      |   local.get 3
 00309b: 41 10                      |   i32.const 16
 00309d: 6a                         |   i32.add
 00309e: 29 02 00                   |   i64.load 2 0
 0030a1: 37 03 00                   |   i64.store 3 0
 0030a4: 20 02                      |   local.get 2
 0030a6: 20 03                      |   local.get 3
 0030a8: 29 02 00                   |   i64.load 2 0
 0030ab: 37 03 28                   |   i64.store 3 40
 0030ae: 20 02                      |   local.get 2
 0030b0: 41 1c                      |   i32.const 28
 0030b2: 6a                         |   i32.add
 0030b3: 41 ac 83 c0 80 00          |   i32.const 1049004
 0030b9: 20 02                      |   local.get 2
 0030bb: 41 28                      |   i32.const 40
 0030bd: 6a                         |   i32.add
 0030be: 10 82 81 80 80 00          |   call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 0030c4: 1a                         |   drop
 0030c5: 20 02                      |   local.get 2
 0030c7: 41 10                      |   i32.const 16
 0030c9: 6a                         |   i32.add
 0030ca: 41 08                      |   i32.const 8
 0030cc: 6a                         |   i32.add
 0030cd: 20 04                      |   local.get 4
 0030cf: 28 02 00                   |   i32.load 2 0
 0030d2: 22 03                      |   local.tee 3
 0030d4: 36 02 00                   |   i32.store 2 0
 0030d7: 20 02                      |   local.get 2
 0030d9: 20 02                      |   local.get 2
 0030db: 29 02 1c                   |   i64.load 2 28
 0030de: 22 05                      |   local.tee 5
 0030e0: 37 03 10                   |   i64.store 3 16
 0030e3: 20 01                      |   local.get 1
 0030e5: 41 08                      |   i32.const 8
 0030e7: 6a                         |   i32.add
 0030e8: 20 03                      |   local.get 3
 0030ea: 36 02 00                   |   i32.store 2 0
 0030ed: 20 01                      |   local.get 1
 0030ef: 20 05                      |   local.get 5
 0030f1: 37 02 00                   |   i64.store 2 0
 0030f4: 0b                         | end
 0030f5: 20 01                      | local.get 1
 0030f7: 29 02 00                   | i64.load 2 0
 0030fa: 21 05                      | local.set 5
 0030fc: 20 01                      | local.get 1
 0030fe: 42 80 80 80 80 10          | i64.const 4294967296
 003104: 37 02 00                   | i64.store 2 0
 003107: 20 02                      | local.get 2
 003109: 41 08                      | i32.const 8
 00310b: 6a                         | i32.add
 00310c: 22 03                      | local.tee 3
 00310e: 20 01                      | local.get 1
 003110: 41 08                      | i32.const 8
 003112: 6a                         | i32.add
 003113: 22 01                      | local.tee 1
 003115: 28 02 00                   | i32.load 2 0
 003118: 36 02 00                   | i32.store 2 0
 00311b: 20 01                      | local.get 1
 00311d: 41 00                      | i32.const 0
 00311f: 36 02 00                   | i32.store 2 0
 003122: 41 00                      | i32.const 0
 003124: 2d 00 b1 95 c0 80 00       | i32.load8_u 0 1051313
 00312b: 1a                         | drop
 00312c: 20 02                      | local.get 2
 00312e: 20 05                      | local.get 5
 003130: 37 03 00                   | i64.store 3 0
 003133: 02 40                      | block
 003135: 41 0c                      |   i32.const 12
 003137: 41 04                      |   i32.const 4
 003139: 10 85 80 80 80 00          |   call 5 <__rust_alloc>
 00313f: 22 01                      |   local.tee 1
 003141: 0d 00                      |   br_if 0
 003143: 41 04                      |   i32.const 4
 003145: 41 0c                      |   i32.const 12
 003147: 10 fa 80 80 80 00          |   call 122 <_ZN5alloc5alloc18handle_alloc_error17h26e54cf75ece9ad8E>
 00314d: 00                         |   unreachable
 00314e: 0b                         | end
 00314f: 20 01                      | local.get 1
 003151: 20 02                      | local.get 2
 003153: 29 03 00                   | i64.load 3 0
 003156: 37 02 00                   | i64.store 2 0
 003159: 20 01                      | local.get 1
 00315b: 41 08                      | i32.const 8
 00315d: 6a                         | i32.add
 00315e: 20 03                      | local.get 3
 003160: 28 02 00                   | i32.load 2 0
 003163: 36 02 00                   | i32.store 2 0
 003166: 20 00                      | local.get 0
 003168: 41 c0 8c c0 80 00          | i32.const 1050176
 00316e: 36 02 04                   | i32.store 2 4
 003171: 20 00                      | local.get 0
 003173: 20 01                      | local.get 1
 003175: 36 02 00                   | i32.store 2 0
 003178: 20 02                      | local.get 2
 00317a: 41 c0 00                   | i32.const 64
 00317d: 6a                         | i32.add
 00317e: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 003184: 0b                         | end
003187 func[72] <_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h0f89f1a9c72d4e1fE>:
 003188: 03 7f                      | local[2..4] type=i32
 00318a: 01 7e                      | local[5] type=i64
 00318c: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 003192: 41 30                      | i32.const 48
 003194: 6b                         | i32.sub
 003195: 22 02                      | local.tee 2
 003197: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00319d: 02 40                      | block
 00319f: 20 01                      |   local.get 1
 0031a1: 28 02 00                   |   i32.load 2 0
 0031a4: 41 80 80 80 80 78          |   i32.const 2147483648
 0031aa: 47                         |   i32.ne
 0031ab: 0d 00                      |   br_if 0
 0031ad: 20 01                      |   local.get 1
 0031af: 28 02 0c                   |   i32.load 2 12
 0031b2: 21 03                      |   local.set 3
 0031b4: 20 02                      |   local.get 2
 0031b6: 41 0c                      |   i32.const 12
 0031b8: 6a                         |   i32.add
 0031b9: 41 08                      |   i32.const 8
 0031bb: 6a                         |   i32.add
 0031bc: 22 04                      |   local.tee 4
 0031be: 41 00                      |   i32.const 0
 0031c0: 36 02 00                   |   i32.store 2 0
 0031c3: 20 02                      |   local.get 2
 0031c5: 42 80 80 80 80 10          |   i64.const 4294967296
 0031cb: 37 02 0c                   |   i64.store 2 12
 0031ce: 20 02                      |   local.get 2
 0031d0: 41 18                      |   i32.const 24
 0031d2: 6a                         |   i32.add
 0031d3: 41 08                      |   i32.const 8
 0031d5: 6a                         |   i32.add
 0031d6: 20 03                      |   local.get 3
 0031d8: 28 02 00                   |   i32.load 2 0
 0031db: 22 03                      |   local.tee 3
 0031dd: 41 08                      |   i32.const 8
 0031df: 6a                         |   i32.add
 0031e0: 29 02 00                   |   i64.load 2 0
 0031e3: 37 03 00                   |   i64.store 3 0
 0031e6: 20 02                      |   local.get 2
 0031e8: 41 18                      |   i32.const 24
 0031ea: 6a                         |   i32.add
 0031eb: 41 10                      |   i32.const 16
 0031ed: 6a                         |   i32.add
 0031ee: 20 03                      |   local.get 3
 0031f0: 41 10                      |   i32.const 16
 0031f2: 6a                         |   i32.add
 0031f3: 29 02 00                   |   i64.load 2 0
 0031f6: 37 03 00                   |   i64.store 3 0
 0031f9: 20 02                      |   local.get 2
 0031fb: 20 03                      |   local.get 3
 0031fd: 29 02 00                   |   i64.load 2 0
 003200: 37 03 18                   |   i64.store 3 24
 003203: 20 02                      |   local.get 2
 003205: 41 0c                      |   i32.const 12
 003207: 6a                         |   i32.add
 003208: 41 ac 83 c0 80 00          |   i32.const 1049004
 00320e: 20 02                      |   local.get 2
 003210: 41 18                      |   i32.const 24
 003212: 6a                         |   i32.add
 003213: 10 82 81 80 80 00          |   call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 003219: 1a                         |   drop
 00321a: 20 02                      |   local.get 2
 00321c: 41 08                      |   i32.const 8
 00321e: 6a                         |   i32.add
 00321f: 20 04                      |   local.get 4
 003221: 28 02 00                   |   i32.load 2 0
 003224: 22 03                      |   local.tee 3
 003226: 36 02 00                   |   i32.store 2 0
 003229: 20 02                      |   local.get 2
 00322b: 20 02                      |   local.get 2
 00322d: 29 02 0c                   |   i64.load 2 12
 003230: 22 05                      |   local.tee 5
 003232: 37 03 00                   |   i64.store 3 0
 003235: 20 01                      |   local.get 1
 003237: 41 08                      |   i32.const 8
 003239: 6a                         |   i32.add
 00323a: 20 03                      |   local.get 3
 00323c: 36 02 00                   |   i32.store 2 0
 00323f: 20 01                      |   local.get 1
 003241: 20 05                      |   local.get 5
 003243: 37 02 00                   |   i64.store 2 0
 003246: 0b                         | end
 003247: 20 00                      | local.get 0
 003249: 41 c0 8c c0 80 00          | i32.const 1050176
 00324f: 36 02 04                   | i32.store 2 4
 003252: 20 00                      | local.get 0
 003254: 20 01                      | local.get 1
 003256: 36 02 00                   | i32.store 2 0
 003259: 20 02                      | local.get 2
 00325b: 41 30                      | i32.const 48
 00325d: 6a                         | i32.add
 00325e: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 003264: 0b                         | end
003267 func[73] <_ZN95_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..fmt..Display$GT$3fmt17hb6e30a961571929aE>:
 003268: 01 7f                      | local[2] type=i32
 00326a: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 003270: 41 20                      | i32.const 32
 003272: 6b                         | i32.sub
 003273: 22 02                      | local.tee 2
 003275: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00327b: 02 40                      | block
 00327d: 02 40                      |   block
 00327f: 20 00                      |     local.get 0
 003281: 28 02 00                   |     i32.load 2 0
 003284: 41 80 80 80 80 78          |     i32.const 2147483648
 00328a: 46                         |     i32.eq
 00328b: 0d 00                      |     br_if 0
 00328d: 20 01                      |     local.get 1
 00328f: 20 00                      |     local.get 0
 003291: 28 02 04                   |     i32.load 2 4
 003294: 20 00                      |     local.get 0
 003296: 28 02 08                   |     i32.load 2 8
 003299: 10 8e 81 80 80 00          |     call 142 <_ZN4core3fmt9Formatter9write_str17h68e107edfb8ed693E>
 00329f: 21 00                      |     local.set 0
 0032a1: 0c 01                      |     br 1
 0032a3: 0b                         |   end
 0032a4: 20 02                      |   local.get 2
 0032a6: 41 08                      |   i32.const 8
 0032a8: 6a                         |   i32.add
 0032a9: 41 08                      |   i32.const 8
 0032ab: 6a                         |   i32.add
 0032ac: 20 00                      |   local.get 0
 0032ae: 28 02 0c                   |   i32.load 2 12
 0032b1: 28 02 00                   |   i32.load 2 0
 0032b4: 22 00                      |   local.tee 0
 0032b6: 41 08                      |   i32.const 8
 0032b8: 6a                         |   i32.add
 0032b9: 29 02 00                   |   i64.load 2 0
 0032bc: 37 03 00                   |   i64.store 3 0
 0032bf: 20 02                      |   local.get 2
 0032c1: 41 08                      |   i32.const 8
 0032c3: 6a                         |   i32.add
 0032c4: 41 10                      |   i32.const 16
 0032c6: 6a                         |   i32.add
 0032c7: 20 00                      |   local.get 0
 0032c9: 41 10                      |   i32.const 16
 0032cb: 6a                         |   i32.add
 0032cc: 29 02 00                   |   i64.load 2 0
 0032cf: 37 03 00                   |   i64.store 3 0
 0032d2: 20 02                      |   local.get 2
 0032d4: 20 00                      |   local.get 0
 0032d6: 29 02 00                   |   i64.load 2 0
 0032d9: 37 03 08                   |   i64.store 3 8
 0032dc: 20 01                      |   local.get 1
 0032de: 28 02 1c                   |   i32.load 2 28
 0032e1: 20 01                      |   local.get 1
 0032e3: 28 02 20                   |   i32.load 2 32
 0032e6: 20 02                      |   local.get 2
 0032e8: 41 08                      |   i32.const 8
 0032ea: 6a                         |   i32.add
 0032eb: 10 82 81 80 80 00          |   call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 0032f1: 21 00                      |   local.set 0
 0032f3: 0b                         | end
 0032f4: 20 02                      | local.get 2
 0032f6: 41 20                      | i32.const 32
 0032f8: 6a                         | i32.add
 0032f9: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0032ff: 20 00                      | local.get 0
 003301: 0b                         | end
003303 func[74] <_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h14fa54bcc26c0aeeE>:
 003304: 02 7f                      | local[2..3] type=i32
 003306: 41 00                      | i32.const 0
 003308: 2d 00 b1 95 c0 80 00       | i32.load8_u 0 1051313
 00330f: 1a                         | drop
 003310: 20 01                      | local.get 1
 003312: 28 02 04                   | i32.load 2 4
 003315: 21 02                      | local.set 2
 003317: 20 01                      | local.get 1
 003319: 28 02 00                   | i32.load 2 0
 00331c: 21 03                      | local.set 3
 00331e: 02 40                      | block
 003320: 41 08                      |   i32.const 8
 003322: 41 04                      |   i32.const 4
 003324: 10 85 80 80 80 00          |   call 5 <__rust_alloc>
 00332a: 22 01                      |   local.tee 1
 00332c: 0d 00                      |   br_if 0
 00332e: 41 04                      |   i32.const 4
 003330: 41 08                      |   i32.const 8
 003332: 10 fa 80 80 80 00          |   call 122 <_ZN5alloc5alloc18handle_alloc_error17h26e54cf75ece9ad8E>
 003338: 00                         |   unreachable
 003339: 0b                         | end
 00333a: 20 01                      | local.get 1
 00333c: 20 02                      | local.get 2
 00333e: 36 02 04                   | i32.store 2 4
 003341: 20 01                      | local.get 1
 003343: 20 03                      | local.get 3
 003345: 36 02 00                   | i32.store 2 0
 003348: 20 00                      | local.get 0
 00334a: 41 d0 8c c0 80 00          | i32.const 1050192
 003350: 36 02 04                   | i32.store 2 4
 003353: 20 00                      | local.get 0
 003355: 20 01                      | local.get 1
 003357: 36 02 00                   | i32.store 2 0
 00335a: 0b                         | end
00335c func[75] <_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17he886f1ee2d21355fE>:
 00335d: 20 00                      | local.get 0
 00335f: 41 d0 8c c0 80 00          | i32.const 1050192
 003365: 36 02 04                   | i32.store 2 4
 003368: 20 00                      | local.get 0
 00336a: 20 01                      | local.get 1
 00336c: 36 02 00                   | i32.store 2 0
 00336f: 0b                         | end
003371 func[76] <_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17hadf6ada0fe86d742E>:
 003372: 20 00                      | local.get 0
 003374: 20 01                      | local.get 1
 003376: 29 02 00                   | i64.load 2 0
 003379: 37 03 00                   | i64.store 3 0
 00337c: 0b                         | end
00337e func[77] <_ZN92_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h7db87e701e774c25E>:
 00337f: 20 01                      | local.get 1
 003381: 20 00                      | local.get 0
 003383: 28 02 00                   | i32.load 2 0
 003386: 20 00                      | local.get 0
 003388: 28 02 04                   | i32.load 2 4
 00338b: 10 8e 81 80 80 00          | call 142 <_ZN4core3fmt9Formatter9write_str17h68e107edfb8ed693E>
 003391: 0b                         | end
003394 func[78] <_ZN3std9panicking20rust_panic_with_hook17h79071f5fb265d1d9E>:
 003395: 02 7f                      | local[5..6] type=i32
 003397: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 00339d: 41 e0 00                   | i32.const 96
 0033a0: 6b                         | i32.sub
 0033a1: 22 05                      | local.tee 5
 0033a3: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0033a9: 20 05                      | local.get 5
 0033ab: 20 01                      | local.get 1
 0033ad: 36 02 20                   | i32.store 2 32
 0033b0: 20 05                      | local.get 5
 0033b2: 20 00                      | local.get 0
 0033b4: 36 02 1c                   | i32.store 2 28
 0033b7: 20 05                      | local.get 5
 0033b9: 20 02                      | local.get 2
 0033bb: 36 02 24                   | i32.store 2 36
 0033be: 02 40                      | block
 0033c0: 02 40                      |   block
 0033c2: 02 40                      |     block
 0033c4: 02 40                      |       block
 0033c6: 41 01                      |         i32.const 1
 0033c8: 10 c5 80 80 80 00          |         call 69 <_ZN3std9panicking11panic_count8increase17hbed16cea2168a27bE>
 0033ce: 41 ff 01                   |         i32.const 255
 0033d1: 71                         |         i32.and
 0033d2: 22 06                      |         local.tee 6
 0033d4: 41 02                      |         i32.const 2
 0033d6: 46                         |         i32.eq
 0033d7: 0d 00                      |         br_if 0
 0033d9: 20 06                      |         local.get 6
 0033db: 41 01                      |         i32.const 1
 0033dd: 71                         |         i32.and
 0033de: 0d 01                      |         br_if 1
 0033e0: 20 05                      |         local.get 5
 0033e2: 41 03                      |         i32.const 3
 0033e4: 36 02 4c                   |         i32.store 2 76
 0033e7: 20 05                      |         local.get 5
 0033e9: 41 c0 8d c0 80 00          |         i32.const 1050304
 0033ef: 36 02 48                   |         i32.store 2 72
 0033f2: 20 05                      |         local.get 5
 0033f4: 42 02                      |         i64.const 2
 0033f6: 37 02 54                   |         i64.store 2 84
 0033f9: 20 05                      |         local.get 5
 0033fb: 41 85 80 80 80 00          |         i32.const 5
 003401: ad                         |         i64.extend_i32_u
 003402: 42 20                      |         i64.const 32
 003404: 86                         |         i64.shl
 003405: 20 05                      |         local.get 5
 003407: 41 1c                      |         i32.const 28
 003409: 6a                         |         i32.add
 00340a: ad                         |         i64.extend_i32_u
 00340b: 84                         |         i64.or
 00340c: 37 03 40                   |         i64.store 3 64
 00340f: 20 05                      |         local.get 5
 003411: 41 84 80 80 80 00          |         i32.const 4
 003417: ad                         |         i64.extend_i32_u
 003418: 42 20                      |         i64.const 32
 00341a: 86                         |         i64.shl
 00341b: 20 05                      |         local.get 5
 00341d: 41 24                      |         i32.const 36
 00341f: 6a                         |         i32.add
 003420: ad                         |         i64.extend_i32_u
 003421: 84                         |         i64.or
 003422: 37 03 38                   |         i64.store 3 56
 003425: 20 05                      |         local.get 5
 003427: 20 05                      |         local.get 5
 003429: 41 38                      |         i32.const 56
 00342b: 6a                         |         i32.add
 00342c: 36 02 50                   |         i32.store 2 80
 00342f: 20 05                      |         local.get 5
 003431: 41 30                      |         i32.const 48
 003433: 6a                         |         i32.add
 003434: 20 05                      |         local.get 5
 003436: 41 30                      |         i32.const 48
 003438: 6a                         |         i32.add
 003439: 20 05                      |         local.get 5
 00343b: 41 c8 00                   |         i32.const 72
 00343e: 6a                         |         i32.add
 00343f: 10 a5 80 80 80 00          |         call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 003445: 20 05                      |         local.get 5
 003447: 2d 00 30                   |         i32.load8_u 0 48
 00344a: 20 05                      |         local.get 5
 00344c: 28 02 34                   |         i32.load 2 52
 00344f: 10 9d 80 80 80 00          |         call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 003455: 0c 03                      |         br 3
 003457: 0b                         |       end
 003458: 41 00                      |       i32.const 0
 00345a: 28 02 bc 95 c0 80 00       |       i32.load 2 1051324
 003461: 22 06                      |       local.tee 6
 003463: 41 7f                      |       i32.const 4294967295
 003465: 4a                         |       i32.gt_s
 003466: 0d 01                      |       br_if 1
 003468: 20 05                      |       local.get 5
 00346a: 41 01                      |       i32.const 1
 00346c: 36 02 4c                   |       i32.store 2 76
 00346f: 20 05                      |       local.get 5
 003471: 41 98 90 c0 80 00          |       i32.const 1050648
 003477: 36 02 48                   |       i32.store 2 72
 00347a: 20 05                      |       local.get 5
 00347c: 42 00                      |       i64.const 0
 00347e: 37 02 54                   |       i64.store 2 84
 003481: 20 05                      |       local.get 5
 003483: 20 05                      |       local.get 5
 003485: 41 30                      |       i32.const 48
 003487: 6a                         |       i32.add
 003488: 36 02 50                   |       i32.store 2 80
 00348b: 20 05                      |       local.get 5
 00348d: 41 38                      |       i32.const 56
 00348f: 6a                         |       i32.add
 003490: 20 05                      |       local.get 5
 003492: 41 30                      |       i32.const 48
 003494: 6a                         |       i32.add
 003495: 20 05                      |       local.get 5
 003497: 41 c8 00                   |       i32.const 72
 00349a: 6a                         |       i32.add
 00349b: 10 a5 80 80 80 00          |       call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 0034a1: 20 05                      |       local.get 5
 0034a3: 2d 00 38                   |       i32.load8_u 0 56
 0034a6: 20 05                      |       local.get 5
 0034a8: 28 02 3c                   |       i32.load 2 60
 0034ab: 10 9d 80 80 80 00          |       call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 0034b1: 0c 02                      |       br 2
 0034b3: 0b                         |     end
 0034b4: 20 05                      |     local.get 5
 0034b6: 41 10                      |     i32.const 16
 0034b8: 6a                         |     i32.add
 0034b9: 20 00                      |     local.get 0
 0034bb: 20 01                      |     local.get 1
 0034bd: 28 02 18                   |     i32.load 2 24
 0034c0: 11 84 80 80 80 00 80 80 80 |     call_indirect 0 (type 4)
 0034c9: 80 00                      | 
 0034cb: 20 05                      |     local.get 5
 0034cd: 20 05                      |     local.get 5
 0034cf: 28 02 14                   |     i32.load 2 20
 0034d2: 41 00                      |     i32.const 0
 0034d4: 20 05                      |     local.get 5
 0034d6: 28 02 10                   |     i32.load 2 16
 0034d9: 22 01                      |     local.tee 1
 0034db: 1b                         |     select
 0034dc: 36 02 2c                   |     i32.store 2 44
 0034df: 20 05                      |     local.get 5
 0034e1: 20 01                      |     local.get 1
 0034e3: 41 01                      |     i32.const 1
 0034e5: 20 01                      |     local.get 1
 0034e7: 1b                         |     select
 0034e8: 36 02 28                   |     i32.store 2 40
 0034eb: 20 05                      |     local.get 5
 0034ed: 41 03                      |     i32.const 3
 0034ef: 36 02 4c                   |     i32.store 2 76
 0034f2: 20 05                      |     local.get 5
 0034f4: 41 8c 8e c0 80 00          |     i32.const 1050380
 0034fa: 36 02 48                   |     i32.store 2 72
 0034fd: 20 05                      |     local.get 5
 0034ff: 42 02                      |     i64.const 2
 003501: 37 02 54                   |     i64.store 2 84
 003504: 20 05                      |     local.get 5
 003506: 41 81 80 80 80 00          |     i32.const 1
 00350c: ad                         |     i64.extend_i32_u
 00350d: 42 20                      |     i64.const 32
 00350f: 86                         |     i64.shl
 003510: 20 05                      |     local.get 5
 003512: 41 28                      |     i32.const 40
 003514: 6a                         |     i32.add
 003515: ad                         |     i64.extend_i32_u
 003516: 84                         |     i64.or
 003517: 37 03 40                   |     i64.store 3 64
 00351a: 20 05                      |     local.get 5
 00351c: 41 84 80 80 80 00          |     i32.const 4
 003522: ad                         |     i64.extend_i32_u
 003523: 42 20                      |     i64.const 32
 003525: 86                         |     i64.shl
 003526: 20 05                      |     local.get 5
 003528: 41 24                      |     i32.const 36
 00352a: 6a                         |     i32.add
 00352b: ad                         |     i64.extend_i32_u
 00352c: 84                         |     i64.or
 00352d: 37 03 38                   |     i64.store 3 56
 003530: 20 05                      |     local.get 5
 003532: 20 05                      |     local.get 5
 003534: 41 38                      |     i32.const 56
 003536: 6a                         |     i32.add
 003537: 36 02 50                   |     i32.store 2 80
 00353a: 20 05                      |     local.get 5
 00353c: 41 30                      |     i32.const 48
 00353e: 6a                         |     i32.add
 00353f: 20 05                      |     local.get 5
 003541: 41 30                      |     i32.const 48
 003543: 6a                         |     i32.add
 003544: 20 05                      |     local.get 5
 003546: 41 c8 00                   |     i32.const 72
 003549: 6a                         |     i32.add
 00354a: 10 a5 80 80 80 00          |     call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 003550: 20 05                      |     local.get 5
 003552: 2d 00 30                   |     i32.load8_u 0 48
 003555: 20 05                      |     local.get 5
 003557: 28 02 34                   |     i32.load 2 52
 00355a: 10 9d 80 80 80 00          |     call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 003560: 0c 01                      |     br 1
 003562: 0b                         |   end
 003563: 41 00                      |   i32.const 0
 003565: 20 06                      |   local.get 6
 003567: 41 01                      |   i32.const 1
 003569: 6a                         |   i32.add
 00356a: 36 02 bc 95 c0 80 00       |   i32.store 2 1051324
 003571: 02 40                      |   block
 003573: 02 40                      |     block
 003575: 41 00                      |       i32.const 0
 003577: 28 02 c0 95 c0 80 00       |       i32.load 2 1051328
 00357e: 45                         |       i32.eqz
 00357f: 0d 00                      |       br_if 0
 003581: 20 05                      |       local.get 5
 003583: 41 08                      |       i32.const 8
 003585: 6a                         |       i32.add
 003586: 20 00                      |       local.get 0
 003588: 20 01                      |       local.get 1
 00358a: 28 02 14                   |       i32.load 2 20
 00358d: 11 84 80 80 80 00 80 80 80 |       call_indirect 0 (type 4)
 003596: 80 00                      | 
 003598: 20 05                      |       local.get 5
 00359a: 20 04                      |       local.get 4
 00359c: 3a 00 55                   |       i32.store8 0 85
 00359f: 20 05                      |       local.get 5
 0035a1: 20 03                      |       local.get 3
 0035a3: 3a 00 54                   |       i32.store8 0 84
 0035a6: 20 05                      |       local.get 5
 0035a8: 20 02                      |       local.get 2
 0035aa: 36 02 50                   |       i32.store 2 80
 0035ad: 20 05                      |       local.get 5
 0035af: 20 05                      |       local.get 5
 0035b1: 29 03 08                   |       i64.load 3 8
 0035b4: 37 02 48                   |       i64.store 2 72
 0035b7: 41 00                      |       i32.const 0
 0035b9: 28 02 c0 95 c0 80 00       |       i32.load 2 1051328
 0035c0: 20 05                      |       local.get 5
 0035c2: 41 c8 00                   |       i32.const 72
 0035c5: 6a                         |       i32.add
 0035c6: 41 00                      |       i32.const 0
 0035c8: 28 02 c4 95 c0 80 00       |       i32.load 2 1051332
 0035cf: 28 02 14                   |       i32.load 2 20
 0035d2: 11 84 80 80 80 00 80 80 80 |       call_indirect 0 (type 4)
 0035db: 80 00                      | 
 0035dd: 0c 01                      |       br 1
 0035df: 0b                         |     end
 0035e0: 20 05                      |     local.get 5
 0035e2: 20 00                      |     local.get 0
 0035e4: 20 01                      |     local.get 1
 0035e6: 28 02 14                   |     i32.load 2 20
 0035e9: 11 84 80 80 80 00 80 80 80 |     call_indirect 0 (type 4)
 0035f2: 80 00                      | 
 0035f4: 20 05                      |     local.get 5
 0035f6: 20 04                      |     local.get 4
 0035f8: 3a 00 55                   |     i32.store8 0 85
 0035fb: 20 05                      |     local.get 5
 0035fd: 20 03                      |     local.get 3
 0035ff: 3a 00 54                   |     i32.store8 0 84
 003602: 20 05                      |     local.get 5
 003604: 20 02                      |     local.get 2
 003606: 36 02 50                   |     i32.store 2 80
 003609: 20 05                      |     local.get 5
 00360b: 20 05                      |     local.get 5
 00360d: 29 03 00                   |     i64.load 3 0
 003610: 37 02 48                   |     i64.store 2 72
 003613: 20 05                      |     local.get 5
 003615: 41 c8 00                   |     i32.const 72
 003618: 6a                         |     i32.add
 003619: 10 98 80 80 80 00          |     call 24 <_ZN3std9panicking12default_hook17h4324e29e9e5e8541E>
 00361f: 0b                         |   end
 003620: 41 00                      |   i32.const 0
 003622: 41 00                      |   i32.const 0
 003624: 28 02 bc 95 c0 80 00       |   i32.load 2 1051324
 00362b: 41 7f                      |   i32.const 4294967295
 00362d: 6a                         |   i32.add
 00362e: 36 02 bc 95 c0 80 00       |   i32.store 2 1051324
 003635: 41 00                      |   i32.const 0
 003637: 41 00                      |   i32.const 0
 003639: 3a 00 e4 95 c0 80 00       |   i32.store8 0 1051364
 003640: 02 40                      |   block
 003642: 20 03                      |     local.get 3
 003644: 0d 00                      |     br_if 0
 003646: 20 05                      |     local.get 5
 003648: 41 00                      |     i32.const 0
 00364a: 36 02 58                   |     i32.store 2 88
 00364d: 20 05                      |     local.get 5
 00364f: 41 01                      |     i32.const 1
 003651: 36 02 4c                   |     i32.store 2 76
 003654: 20 05                      |     local.get 5
 003656: 41 d4 8e c0 80 00          |     i32.const 1050452
 00365c: 36 02 48                   |     i32.store 2 72
 00365f: 20 05                      |     local.get 5
 003661: 42 04                      |     i64.const 4
 003663: 37 02 50                   |     i64.store 2 80
 003666: 20 05                      |     local.get 5
 003668: 41 38                      |     i32.const 56
 00366a: 6a                         |     i32.add
 00366b: 20 05                      |     local.get 5
 00366d: 41 30                      |     i32.const 48
 00366f: 6a                         |     i32.add
 003670: 20 05                      |     local.get 5
 003672: 41 c8 00                   |     i32.const 72
 003675: 6a                         |     i32.add
 003676: 10 a5 80 80 80 00          |     call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 00367c: 20 05                      |     local.get 5
 00367e: 2d 00 38                   |     i32.load8_u 0 56
 003681: 20 05                      |     local.get 5
 003683: 28 02 3c                   |     i32.load 2 60
 003686: 10 9d 80 80 80 00          |     call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 00368c: 0c 01                      |     br 1
 00368e: 0b                         |   end
 00368f: 20 00                      |   local.get 0
 003691: 20 01                      |   local.get 1
 003693: 10 cf 80 80 80 00          |   call 79 <rust_panic>
 003699: 00                         |   unreachable
 00369a: 0b                         | end
 00369b: 10 a6 80 80 80 00          | call 38 <_ZN3std3sys3pal4wasi7helpers14abort_internal17h22e0957f477c4b9fE>
 0036a1: 00                         | unreachable
 0036a2: 0b                         | end
0036a5 func[79] <rust_panic>:
 0036a6: 01 7f                      | local[2] type=i32
 0036a8: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0036ae: 41 c0 00                   | i32.const 64
 0036b1: 6b                         | i32.sub
 0036b2: 22 02                      | local.tee 2
 0036b4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0036ba: 20 02                      | local.get 2
 0036bc: 20 00                      | local.get 0
 0036be: 20 01                      | local.get 1
 0036c0: 10 d6 80 80 80 00          | call 86 <__rust_start_panic>
 0036c6: 36 02 0c                   | i32.store 2 12
 0036c9: 20 02                      | local.get 2
 0036cb: 41 02                      | i32.const 2
 0036cd: 36 02 1c                   | i32.store 2 28
 0036d0: 20 02                      | local.get 2
 0036d2: 41 94 8f c0 80 00          | i32.const 1050516
 0036d8: 36 02 18                   | i32.store 2 24
 0036db: 20 02                      | local.get 2
 0036dd: 42 01                      | i64.const 1
 0036df: 37 02 24                   | i64.store 2 36
 0036e2: 20 02                      | local.get 2
 0036e4: 41 82 80 80 80 00          | i32.const 2
 0036ea: ad                         | i64.extend_i32_u
 0036eb: 42 20                      | i64.const 32
 0036ed: 86                         | i64.shl
 0036ee: 20 02                      | local.get 2
 0036f0: 41 0c                      | i32.const 12
 0036f2: 6a                         | i32.add
 0036f3: ad                         | i64.extend_i32_u
 0036f4: 84                         | i64.or
 0036f5: 37 03 30                   | i64.store 3 48
 0036f8: 20 02                      | local.get 2
 0036fa: 20 02                      | local.get 2
 0036fc: 41 30                      | i32.const 48
 0036fe: 6a                         | i32.add
 0036ff: 36 02 20                   | i32.store 2 32
 003702: 20 02                      | local.get 2
 003704: 41 10                      | i32.const 16
 003706: 6a                         | i32.add
 003707: 20 02                      | local.get 2
 003709: 41 3f                      | i32.const 63
 00370b: 6a                         | i32.add
 00370c: 20 02                      | local.get 2
 00370e: 41 18                      | i32.const 24
 003710: 6a                         | i32.add
 003711: 10 a5 80 80 80 00          | call 37 <_ZN3std2io5Write9write_fmt17h6955e6d943bce933E>
 003717: 20 02                      | local.get 2
 003719: 2d 00 10                   | i32.load8_u 0 16
 00371c: 20 02                      | local.get 2
 00371e: 28 02 14                   | i32.load 2 20
 003721: 10 9d 80 80 80 00          | call 29 <_ZN4core3ptr81drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$17hb2ee836dc677102fE>
 003727: 10 a6 80 80 80 00          | call 38 <_ZN3std3sys3pal4wasi7helpers14abort_internal17h22e0957f477c4b9fE>
 00372d: 00                         | unreachable
 00372e: 0b                         | end
003730 func[80] <_ZN69_$LT$std..sys..pal..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5write17h6d8c25b79290a389E>:
 003731: 01 7f                      | local[4] type=i32
 003733: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 003739: 41 10                      | i32.const 16
 00373b: 6b                         | i32.sub
 00373c: 22 04                      | local.tee 4
 00373e: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 003744: 20 04                      | local.get 4
 003746: 20 03                      | local.get 3
 003748: 36 02 04                   | i32.store 2 4
 00374b: 20 04                      | local.get 4
 00374d: 20 02                      | local.get 2
 00374f: 36 02 00                   | i32.store 2 0
 003752: 20 04                      | local.get 4
 003754: 41 08                      | i32.const 8
 003756: 6a                         | i32.add
 003757: 41 02                      | i32.const 2
 003759: 20 04                      | local.get 4
 00375b: 41 01                      | i32.const 1
 00375d: 10 d7 80 80 80 00          | call 87 <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>
 003763: 02 40                      | block
 003765: 02 40                      |   block
 003767: 20 04                      |     local.get 4
 003769: 2f 01 08                   |     i32.load16_u 1 8
 00376c: 0d 00                      |     br_if 0
 00376e: 20 00                      |     local.get 0
 003770: 20 04                      |     local.get 4
 003772: 28 02 0c                   |     i32.load 2 12
 003775: 36 02 04                   |     i32.store 2 4
 003778: 20 00                      |     local.get 0
 00377a: 41 04                      |     i32.const 4
 00377c: 3a 00 00                   |     i32.store8 0 0
 00377f: 0c 01                      |     br 1
 003781: 0b                         |   end
 003782: 20 00                      |   local.get 0
 003784: 20 04                      |   local.get 4
 003786: 33 01 0a                   |   i64.load16_u 1 10
 003789: 42 20                      |   i64.const 32
 00378b: 86                         |   i64.shl
 00378c: 37 02 00                   |   i64.store 2 0
 00378f: 0b                         | end
 003790: 20 04                      | local.get 4
 003792: 41 10                      | i32.const 16
 003794: 6a                         | i32.add
 003795: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00379b: 0b                         | end
00379d func[81] <_ZN69_$LT$std..sys..pal..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$14write_vectored17h833f21603126627cE>:
 00379e: 01 7f                      | local[4] type=i32
 0037a0: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0037a6: 41 10                      | i32.const 16
 0037a8: 6b                         | i32.sub
 0037a9: 22 04                      | local.tee 4
 0037ab: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0037b1: 20 04                      | local.get 4
 0037b3: 41 08                      | i32.const 8
 0037b5: 6a                         | i32.add
 0037b6: 41 02                      | i32.const 2
 0037b8: 20 02                      | local.get 2
 0037ba: 20 03                      | local.get 3
 0037bc: 10 d7 80 80 80 00          | call 87 <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>
 0037c2: 02 40                      | block
 0037c4: 02 40                      |   block
 0037c6: 20 04                      |     local.get 4
 0037c8: 2f 01 08                   |     i32.load16_u 1 8
 0037cb: 0d 00                      |     br_if 0
 0037cd: 20 00                      |     local.get 0
 0037cf: 20 04                      |     local.get 4
 0037d1: 28 02 0c                   |     i32.load 2 12
 0037d4: 36 02 04                   |     i32.store 2 4
 0037d7: 20 00                      |     local.get 0
 0037d9: 41 04                      |     i32.const 4
 0037db: 3a 00 00                   |     i32.store8 0 0
 0037de: 0c 01                      |     br 1
 0037e0: 0b                         |   end
 0037e1: 20 00                      |   local.get 0
 0037e3: 20 04                      |   local.get 4
 0037e5: 33 01 0a                   |   i64.load16_u 1 10
 0037e8: 42 20                      |   i64.const 32
 0037ea: 86                         |   i64.shl
 0037eb: 37 02 00                   |   i64.store 2 0
 0037ee: 0b                         | end
 0037ef: 20 04                      | local.get 4
 0037f1: 41 10                      | i32.const 16
 0037f3: 6a                         | i32.add
 0037f4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0037fa: 0b                         | end
0037fc func[82] <_ZN69_$LT$std..sys..pal..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$17is_write_vectored17h594a4aba2cf44a27E>:
 0037fd: 41 01                      | i32.const 1
 0037ff: 0b                         | end
003801 func[83] <_ZN69_$LT$std..sys..pal..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$5flush17h0334f920a9866570E>:
 003802: 20 00                      | local.get 0
 003804: 41 04                      | i32.const 4
 003806: 3a 00 00                   | i32.store8 0 0
 003809: 0b                         | end
00380b func[84] <_ZN3std5alloc8rust_oom17h1225a29c9787d105E>:
 00380c: 01 7f                      | local[2] type=i32
 00380e: 20 00                      | local.get 0
 003810: 20 01                      | local.get 1
 003812: 41 00                      | i32.const 0
 003814: 28 02 b8 95 c0 80 00       | i32.load 2 1051320
 00381b: 22 02                      | local.tee 2
 00381d: 41 86 80 80 80 00          | i32.const 6
 003823: 20 02                      | local.get 2
 003825: 1b                         | select
 003826: 11 84 80 80 80 00 80 80 80 | call_indirect 0 (type 4)
 00382f: 80 00                      | 
 003831: 10 b8 80 80 80 00          | call 56 <_ZN3std7process5abort17heddc1007b1aee596E>
 003837: 00                         | unreachable
 003838: 0b                         | end
00383a func[85] <__rg_oom>:
 00383b: 20 01                      | local.get 1
 00383d: 20 00                      | local.get 0
 00383f: 10 d4 80 80 80 00          | call 84 <_ZN3std5alloc8rust_oom17h1225a29c9787d105E>
 003845: 00                         | unreachable
 003846: 0b                         | end
003848 func[86] <__rust_start_panic>:
 003849: 00                         | unreachable
 00384a: 0b                         | end
00384c func[87] <_ZN4wasi13lib_generated8fd_write17h5b85c731498f6ebdE>:
 00384d: 01 7f                      | local[4] type=i32
 00384f: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 003855: 41 10                      | i32.const 16
 003857: 6b                         | i32.sub
 003858: 22 04                      | local.tee 4
 00385a: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 003860: 02 40                      | block
 003862: 02 40                      |   block
 003864: 20 01                      |     local.get 1
 003866: 20 02                      |     local.get 2
 003868: 20 03                      |     local.get 3
 00386a: 20 04                      |     local.get 4
 00386c: 41 0c                      |     i32.const 12
 00386e: 6a                         |     i32.add
 00386f: 10 80 80 80 80 00          |     call 0 <_ZN4wasi13lib_generated22wasi_snapshot_preview18fd_write17h69b036148e048aa7E>
 003875: 22 03                      |     local.tee 3
 003877: 0d 00                      |     br_if 0
 003879: 20 00                      |     local.get 0
 00387b: 20 04                      |     local.get 4
 00387d: 28 02 0c                   |     i32.load 2 12
 003880: 36 02 04                   |     i32.store 2 4
 003883: 41 00                      |     i32.const 0
 003885: 21 03                      |     local.set 3
 003887: 0c 01                      |     br 1
 003889: 0b                         |   end
 00388a: 20 00                      |   local.get 0
 00388c: 20 03                      |   local.get 3
 00388e: 3b 01 02                   |   i32.store16 1 2
 003891: 41 01                      |   i32.const 1
 003893: 21 03                      |   local.set 3
 003895: 0b                         | end
 003896: 20 00                      | local.get 0
 003898: 20 03                      | local.get 3
 00389a: 3b 01 00                   | i32.store16 1 0
 00389d: 20 04                      | local.get 4
 00389f: 41 10                      | i32.const 16
 0038a1: 6a                         | i32.add
 0038a2: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0038a8: 0b                         | end
0038aa func[88] <malloc>:
 0038ab: 20 00                      | local.get 0
 0038ad: 10 d9 80 80 80 00          | call 89 <dlmalloc>
 0038b3: 0b                         | end
0038b6 func[89] <dlmalloc>:
 0038b7: 0b 7f                      | local[1..11] type=i32
 0038b9: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0038bf: 41 10                      | i32.const 16
 0038c1: 6b                         | i32.sub
 0038c2: 22 01                      | local.tee 1
 0038c4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0038ca: 02 40                      | block
 0038cc: 02 40                      |   block
 0038ce: 02 40                      |     block
 0038d0: 02 40                      |       block
 0038d2: 02 40                      |         block
 0038d4: 02 40                      |           block
 0038d6: 02 40                      |             block
 0038d8: 02 40                      |               block
 0038da: 02 40                      |                 block
 0038dc: 02 40                      |                   block
 0038de: 02 40                      |                     block
 0038e0: 02 40                      |                       block
 0038e2: 02 40                      |                         block
 0038e4: 41 00                      |                           i32.const 0
 0038e6: 28 02 8c 96 c0 80 00       |                           i32.load 2 1051404
 0038ed: 22 02                      |                           local.tee 2
 0038ef: 0d 00                      |                           br_if 0
 0038f1: 02 40                      |                           block
 0038f3: 41 00                      |                             i32.const 0
 0038f5: 28 02 cc 99 c0 80 00       |                             i32.load 2 1051852
 0038fc: 22 03                      |                             local.tee 3
 0038fe: 0d 00                      |                             br_if 0
 003900: 41 00                      |                             i32.const 0
 003902: 42 7f                      |                             i64.const 18446744073709551615
 003904: 37 02 d8 99 c0 80 00       |                             i64.store 2 1051864
 00390b: 41 00                      |                             i32.const 0
 00390d: 42 80 80 84 80 80 80 c0 00 |                             i64.const 281474976776192
 003916: 37 02 d0 99 c0 80 00       |                             i64.store 2 1051856
 00391d: 41 00                      |                             i32.const 0
 00391f: 20 01                      |                             local.get 1
 003921: 41 08                      |                             i32.const 8
 003923: 6a                         |                             i32.add
 003924: 41 70                      |                             i32.const 4294967280
 003926: 71                         |                             i32.and
 003927: 41 d8 aa d5 aa 05          |                             i32.const 1431655768
 00392d: 73                         |                             i32.xor
 00392e: 22 03                      |                             local.tee 3
 003930: 36 02 cc 99 c0 80 00       |                             i32.store 2 1051852
 003937: 41 00                      |                             i32.const 0
 003939: 41 00                      |                             i32.const 0
 00393b: 36 02 e0 99 c0 80 00       |                             i32.store 2 1051872
 003942: 41 00                      |                             i32.const 0
 003944: 41 00                      |                             i32.const 0
 003946: 36 02 b0 99 c0 80 00       |                             i32.store 2 1051824
 00394d: 0b                         |                           end
 00394e: 41 80 80 c4 80 00          |                           i32.const 1114112
 003954: 41 f0 99 c0 80 00          |                           i32.const 1051888
 00395a: 49                         |                           i32.lt_u
 00395b: 0d 01                      |                           br_if 1
 00395d: 41 00                      |                           i32.const 0
 00395f: 21 02                      |                           local.set 2
 003961: 41 80 80 c4 80 00          |                           i32.const 1114112
 003967: 41 f0 99 c0 80 00          |                           i32.const 1051888
 00396d: 6b                         |                           i32.sub
 00396e: 41 d9 00                   |                           i32.const 89
 003971: 49                         |                           i32.lt_u
 003972: 0d 00                      |                           br_if 0
 003974: 41 00                      |                           i32.const 0
 003976: 21 04                      |                           local.set 4
 003978: 41 00                      |                           i32.const 0
 00397a: 41 f0 99 c0 80 00          |                           i32.const 1051888
 003980: 36 02 b4 99 c0 80 00       |                           i32.store 2 1051828
 003987: 41 00                      |                           i32.const 0
 003989: 41 f0 99 c0 80 00          |                           i32.const 1051888
 00398f: 36 02 84 96 c0 80 00       |                           i32.store 2 1051396
 003996: 41 00                      |                           i32.const 0
 003998: 20 03                      |                           local.get 3
 00399a: 36 02 98 96 c0 80 00       |                           i32.store 2 1051416
 0039a1: 41 00                      |                           i32.const 0
 0039a3: 41 7f                      |                           i32.const 4294967295
 0039a5: 36 02 94 96 c0 80 00       |                           i32.store 2 1051412
 0039ac: 41 00                      |                           i32.const 0
 0039ae: 41 80 80 c4 80 00          |                           i32.const 1114112
 0039b4: 41 f0 99 c0 80 00          |                           i32.const 1051888
 0039ba: 6b                         |                           i32.sub
 0039bb: 22 03                      |                           local.tee 3
 0039bd: 36 02 b8 99 c0 80 00       |                           i32.store 2 1051832
 0039c4: 41 00                      |                           i32.const 0
 0039c6: 20 03                      |                           local.get 3
 0039c8: 36 02 a8 99 c0 80 00       |                           i32.store 2 1051816
 0039cf: 41 00                      |                           i32.const 0
 0039d1: 20 03                      |                           local.get 3
 0039d3: 36 02 a4 99 c0 80 00       |                           i32.store 2 1051812
 0039da: 03 40                      |                           loop
 0039dc: 20 04                      |                             local.get 4
 0039de: 41 b0 96 c0 80 00          |                             i32.const 1051440
 0039e4: 6a                         |                             i32.add
 0039e5: 20 04                      |                             local.get 4
 0039e7: 41 a4 96 c0 80 00          |                             i32.const 1051428
 0039ed: 6a                         |                             i32.add
 0039ee: 22 03                      |                             local.tee 3
 0039f0: 36 02 00                   |                             i32.store 2 0
 0039f3: 20 03                      |                             local.get 3
 0039f5: 20 04                      |                             local.get 4
 0039f7: 41 9c 96 c0 80 00          |                             i32.const 1051420
 0039fd: 6a                         |                             i32.add
 0039fe: 22 05                      |                             local.tee 5
 003a00: 36 02 00                   |                             i32.store 2 0
 003a03: 20 04                      |                             local.get 4
 003a05: 41 a8 96 c0 80 00          |                             i32.const 1051432
 003a0b: 6a                         |                             i32.add
 003a0c: 20 05                      |                             local.get 5
 003a0e: 36 02 00                   |                             i32.store 2 0
 003a11: 20 04                      |                             local.get 4
 003a13: 41 b8 96 c0 80 00          |                             i32.const 1051448
 003a19: 6a                         |                             i32.add
 003a1a: 20 04                      |                             local.get 4
 003a1c: 41 ac 96 c0 80 00          |                             i32.const 1051436
 003a22: 6a                         |                             i32.add
 003a23: 22 05                      |                             local.tee 5
 003a25: 36 02 00                   |                             i32.store 2 0
 003a28: 20 05                      |                             local.get 5
 003a2a: 20 03                      |                             local.get 3
 003a2c: 36 02 00                   |                             i32.store 2 0
 003a2f: 20 04                      |                             local.get 4
 003a31: 41 c0 96 c0 80 00          |                             i32.const 1051456
 003a37: 6a                         |                             i32.add
 003a38: 20 04                      |                             local.get 4
 003a3a: 41 b4 96 c0 80 00          |                             i32.const 1051444
 003a40: 6a                         |                             i32.add
 003a41: 22 03                      |                             local.tee 3
 003a43: 36 02 00                   |                             i32.store 2 0
 003a46: 20 03                      |                             local.get 3
 003a48: 20 05                      |                             local.get 5
 003a4a: 36 02 00                   |                             i32.store 2 0
 003a4d: 20 04                      |                             local.get 4
 003a4f: 41 bc 96 c0 80 00          |                             i32.const 1051452
 003a55: 6a                         |                             i32.add
 003a56: 20 03                      |                             local.get 3
 003a58: 36 02 00                   |                             i32.store 2 0
 003a5b: 20 04                      |                             local.get 4
 003a5d: 41 20                      |                             i32.const 32
 003a5f: 6a                         |                             i32.add
 003a60: 22 04                      |                             local.tee 4
 003a62: 41 80 02                   |                             i32.const 256
 003a65: 47                         |                             i32.ne
 003a66: 0d 00                      |                             br_if 0
 003a68: 0b                         |                           end
 003a69: 41 80 80 c4 80 00          |                           i32.const 1114112
 003a6f: 41 4c                      |                           i32.const 4294967244
 003a71: 6a                         |                           i32.add
 003a72: 41 38                      |                           i32.const 56
 003a74: 36 02 00                   |                           i32.store 2 0
 003a77: 41 00                      |                           i32.const 0
 003a79: 41 00                      |                           i32.const 0
 003a7b: 28 02 dc 99 c0 80 00       |                           i32.load 2 1051868
 003a82: 36 02 90 96 c0 80 00       |                           i32.store 2 1051408
 003a89: 41 00                      |                           i32.const 0
 003a8b: 41 f0 99 c0 80 00          |                           i32.const 1051888
 003a91: 41 78                      |                           i32.const 4294967288
 003a93: 41 f0 99 c0 80 00          |                           i32.const 1051888
 003a99: 6b                         |                           i32.sub
 003a9a: 41 0f                      |                           i32.const 15
 003a9c: 71                         |                           i32.and
 003a9d: 22 04                      |                           local.tee 4
 003a9f: 6a                         |                           i32.add
 003aa0: 22 02                      |                           local.tee 2
 003aa2: 36 02 8c 96 c0 80 00       |                           i32.store 2 1051404
 003aa9: 41 00                      |                           i32.const 0
 003aab: 41 80 80 c4 80 00          |                           i32.const 1114112
 003ab1: 41 f0 99 c0 80 00          |                           i32.const 1051888
 003ab7: 6b                         |                           i32.sub
 003ab8: 20 04                      |                           local.get 4
 003aba: 6b                         |                           i32.sub
 003abb: 41 48                      |                           i32.const 4294967240
 003abd: 6a                         |                           i32.add
 003abe: 22 04                      |                           local.tee 4
 003ac0: 36 02 80 96 c0 80 00       |                           i32.store 2 1051392
 003ac7: 20 02                      |                           local.get 2
 003ac9: 20 04                      |                           local.get 4
 003acb: 41 01                      |                           i32.const 1
 003acd: 72                         |                           i32.or
 003ace: 36 02 04                   |                           i32.store 2 4
 003ad1: 0b                         |                         end
 003ad2: 02 40                      |                         block
 003ad4: 02 40                      |                           block
 003ad6: 20 00                      |                             local.get 0
 003ad8: 41 ec 01                   |                             i32.const 236
 003adb: 4b                         |                             i32.gt_u
 003adc: 0d 00                      |                             br_if 0
 003ade: 02 40                      |                             block
 003ae0: 41 00                      |                               i32.const 0
 003ae2: 28 02 f4 95 c0 80 00       |                               i32.load 2 1051380
 003ae9: 22 06                      |                               local.tee 6
 003aeb: 41 10                      |                               i32.const 16
 003aed: 20 00                      |                               local.get 0
 003aef: 41 13                      |                               i32.const 19
 003af1: 6a                         |                               i32.add
 003af2: 41 f0 03                   |                               i32.const 496
 003af5: 71                         |                               i32.and
 003af6: 20 00                      |                               local.get 0
 003af8: 41 0b                      |                               i32.const 11
 003afa: 49                         |                               i32.lt_u
 003afb: 1b                         |                               select
 003afc: 22 05                      |                               local.tee 5
 003afe: 41 03                      |                               i32.const 3
 003b00: 76                         |                               i32.shr_u
 003b01: 22 03                      |                               local.tee 3
 003b03: 76                         |                               i32.shr_u
 003b04: 22 04                      |                               local.tee 4
 003b06: 41 03                      |                               i32.const 3
 003b08: 71                         |                               i32.and
 003b09: 45                         |                               i32.eqz
 003b0a: 0d 00                      |                               br_if 0
 003b0c: 02 40                      |                               block
 003b0e: 02 40                      |                                 block
 003b10: 20 04                      |                                   local.get 4
 003b12: 41 01                      |                                   i32.const 1
 003b14: 71                         |                                   i32.and
 003b15: 20 03                      |                                   local.get 3
 003b17: 72                         |                                   i32.or
 003b18: 41 01                      |                                   i32.const 1
 003b1a: 73                         |                                   i32.xor
 003b1b: 22 05                      |                                   local.tee 5
 003b1d: 41 03                      |                                   i32.const 3
 003b1f: 74                         |                                   i32.shl
 003b20: 22 03                      |                                   local.tee 3
 003b22: 41 9c 96 c0 80 00          |                                   i32.const 1051420
 003b28: 6a                         |                                   i32.add
 003b29: 22 04                      |                                   local.tee 4
 003b2b: 20 03                      |                                   local.get 3
 003b2d: 41 a4 96 c0 80 00          |                                   i32.const 1051428
 003b33: 6a                         |                                   i32.add
 003b34: 28 02 00                   |                                   i32.load 2 0
 003b37: 22 03                      |                                   local.tee 3
 003b39: 28 02 08                   |                                   i32.load 2 8
 003b3c: 22 00                      |                                   local.tee 0
 003b3e: 47                         |                                   i32.ne
 003b3f: 0d 00                      |                                   br_if 0
 003b41: 41 00                      |                                   i32.const 0
 003b43: 20 06                      |                                   local.get 6
 003b45: 41 7e                      |                                   i32.const 4294967294
 003b47: 20 05                      |                                   local.get 5
 003b49: 77                         |                                   i32.rotl
 003b4a: 71                         |                                   i32.and
 003b4b: 36 02 f4 95 c0 80 00       |                                   i32.store 2 1051380
 003b52: 0c 01                      |                                   br 1
 003b54: 0b                         |                                 end
 003b55: 20 04                      |                                 local.get 4
 003b57: 20 00                      |                                 local.get 0
 003b59: 36 02 08                   |                                 i32.store 2 8
 003b5c: 20 00                      |                                 local.get 0
 003b5e: 20 04                      |                                 local.get 4
 003b60: 36 02 0c                   |                                 i32.store 2 12
 003b63: 0b                         |                               end
 003b64: 20 03                      |                               local.get 3
 003b66: 41 08                      |                               i32.const 8
 003b68: 6a                         |                               i32.add
 003b69: 21 04                      |                               local.set 4
 003b6b: 20 03                      |                               local.get 3
 003b6d: 20 05                      |                               local.get 5
 003b6f: 41 03                      |                               i32.const 3
 003b71: 74                         |                               i32.shl
 003b72: 22 05                      |                               local.tee 5
 003b74: 41 03                      |                               i32.const 3
 003b76: 72                         |                               i32.or
 003b77: 36 02 04                   |                               i32.store 2 4
 003b7a: 20 03                      |                               local.get 3
 003b7c: 20 05                      |                               local.get 5
 003b7e: 6a                         |                               i32.add
 003b7f: 22 03                      |                               local.tee 3
 003b81: 20 03                      |                               local.get 3
 003b83: 28 02 04                   |                               i32.load 2 4
 003b86: 41 01                      |                               i32.const 1
 003b88: 72                         |                               i32.or
 003b89: 36 02 04                   |                               i32.store 2 4
 003b8c: 0c 0e                      |                               br 14
 003b8e: 0b                         |                             end
 003b8f: 20 05                      |                             local.get 5
 003b91: 41 00                      |                             i32.const 0
 003b93: 28 02 fc 95 c0 80 00       |                             i32.load 2 1051388
 003b9a: 22 07                      |                             local.tee 7
 003b9c: 4d                         |                             i32.le_u
 003b9d: 0d 01                      |                             br_if 1
 003b9f: 02 40                      |                             block
 003ba1: 20 04                      |                               local.get 4
 003ba3: 45                         |                               i32.eqz
 003ba4: 0d 00                      |                               br_if 0
 003ba6: 02 40                      |                               block
 003ba8: 02 40                      |                                 block
 003baa: 20 04                      |                                   local.get 4
 003bac: 20 03                      |                                   local.get 3
 003bae: 74                         |                                   i32.shl
 003baf: 41 02                      |                                   i32.const 2
 003bb1: 20 03                      |                                   local.get 3
 003bb3: 74                         |                                   i32.shl
 003bb4: 22 04                      |                                   local.tee 4
 003bb6: 41 00                      |                                   i32.const 0
 003bb8: 20 04                      |                                   local.get 4
 003bba: 6b                         |                                   i32.sub
 003bbb: 72                         |                                   i32.or
 003bbc: 71                         |                                   i32.and
 003bbd: 68                         |                                   i32.ctz
 003bbe: 22 03                      |                                   local.tee 3
 003bc0: 41 03                      |                                   i32.const 3
 003bc2: 74                         |                                   i32.shl
 003bc3: 22 04                      |                                   local.tee 4
 003bc5: 41 9c 96 c0 80 00          |                                   i32.const 1051420
 003bcb: 6a                         |                                   i32.add
 003bcc: 22 00                      |                                   local.tee 0
 003bce: 20 04                      |                                   local.get 4
 003bd0: 41 a4 96 c0 80 00          |                                   i32.const 1051428
 003bd6: 6a                         |                                   i32.add
 003bd7: 28 02 00                   |                                   i32.load 2 0
 003bda: 22 04                      |                                   local.tee 4
 003bdc: 28 02 08                   |                                   i32.load 2 8
 003bdf: 22 08                      |                                   local.tee 8
 003be1: 47                         |                                   i32.ne
 003be2: 0d 00                      |                                   br_if 0
 003be4: 41 00                      |                                   i32.const 0
 003be6: 20 06                      |                                   local.get 6
 003be8: 41 7e                      |                                   i32.const 4294967294
 003bea: 20 03                      |                                   local.get 3
 003bec: 77                         |                                   i32.rotl
 003bed: 71                         |                                   i32.and
 003bee: 22 06                      |                                   local.tee 6
 003bf0: 36 02 f4 95 c0 80 00       |                                   i32.store 2 1051380
 003bf7: 0c 01                      |                                   br 1
 003bf9: 0b                         |                                 end
 003bfa: 20 00                      |                                 local.get 0
 003bfc: 20 08                      |                                 local.get 8
 003bfe: 36 02 08                   |                                 i32.store 2 8
 003c01: 20 08                      |                                 local.get 8
 003c03: 20 00                      |                                 local.get 0
 003c05: 36 02 0c                   |                                 i32.store 2 12
 003c08: 0b                         |                               end
 003c09: 20 04                      |                               local.get 4
 003c0b: 20 05                      |                               local.get 5
 003c0d: 41 03                      |                               i32.const 3
 003c0f: 72                         |                               i32.or
 003c10: 36 02 04                   |                               i32.store 2 4
 003c13: 20 04                      |                               local.get 4
 003c15: 20 03                      |                               local.get 3
 003c17: 41 03                      |                               i32.const 3
 003c19: 74                         |                               i32.shl
 003c1a: 22 03                      |                               local.tee 3
 003c1c: 6a                         |                               i32.add
 003c1d: 20 03                      |                               local.get 3
 003c1f: 20 05                      |                               local.get 5
 003c21: 6b                         |                               i32.sub
 003c22: 22 00                      |                               local.tee 0
 003c24: 36 02 00                   |                               i32.store 2 0
 003c27: 20 04                      |                               local.get 4
 003c29: 20 05                      |                               local.get 5
 003c2b: 6a                         |                               i32.add
 003c2c: 22 08                      |                               local.tee 8
 003c2e: 20 00                      |                               local.get 0
 003c30: 41 01                      |                               i32.const 1
 003c32: 72                         |                               i32.or
 003c33: 36 02 04                   |                               i32.store 2 4
 003c36: 02 40                      |                               block
 003c38: 20 07                      |                                 local.get 7
 003c3a: 45                         |                                 i32.eqz
 003c3b: 0d 00                      |                                 br_if 0
 003c3d: 20 07                      |                                 local.get 7
 003c3f: 41 78                      |                                 i32.const 4294967288
 003c41: 71                         |                                 i32.and
 003c42: 41 9c 96 c0 80 00          |                                 i32.const 1051420
 003c48: 6a                         |                                 i32.add
 003c49: 21 05                      |                                 local.set 5
 003c4b: 41 00                      |                                 i32.const 0
 003c4d: 28 02 88 96 c0 80 00       |                                 i32.load 2 1051400
 003c54: 21 03                      |                                 local.set 3
 003c56: 02 40                      |                                 block
 003c58: 02 40                      |                                   block
 003c5a: 20 06                      |                                     local.get 6
 003c5c: 41 01                      |                                     i32.const 1
 003c5e: 20 07                      |                                     local.get 7
 003c60: 41 03                      |                                     i32.const 3
 003c62: 76                         |                                     i32.shr_u
 003c63: 74                         |                                     i32.shl
 003c64: 22 09                      |                                     local.tee 9
 003c66: 71                         |                                     i32.and
 003c67: 0d 00                      |                                     br_if 0
 003c69: 41 00                      |                                     i32.const 0
 003c6b: 20 06                      |                                     local.get 6
 003c6d: 20 09                      |                                     local.get 9
 003c6f: 72                         |                                     i32.or
 003c70: 36 02 f4 95 c0 80 00       |                                     i32.store 2 1051380
 003c77: 20 05                      |                                     local.get 5
 003c79: 21 09                      |                                     local.set 9
 003c7b: 0c 01                      |                                     br 1
 003c7d: 0b                         |                                   end
 003c7e: 20 05                      |                                   local.get 5
 003c80: 28 02 08                   |                                   i32.load 2 8
 003c83: 21 09                      |                                   local.set 9
 003c85: 0b                         |                                 end
 003c86: 20 09                      |                                 local.get 9
 003c88: 20 03                      |                                 local.get 3
 003c8a: 36 02 0c                   |                                 i32.store 2 12
 003c8d: 20 05                      |                                 local.get 5
 003c8f: 20 03                      |                                 local.get 3
 003c91: 36 02 08                   |                                 i32.store 2 8
 003c94: 20 03                      |                                 local.get 3
 003c96: 20 05                      |                                 local.get 5
 003c98: 36 02 0c                   |                                 i32.store 2 12
 003c9b: 20 03                      |                                 local.get 3
 003c9d: 20 09                      |                                 local.get 9
 003c9f: 36 02 08                   |                                 i32.store 2 8
 003ca2: 0b                         |                               end
 003ca3: 20 04                      |                               local.get 4
 003ca5: 41 08                      |                               i32.const 8
 003ca7: 6a                         |                               i32.add
 003ca8: 21 04                      |                               local.set 4
 003caa: 41 00                      |                               i32.const 0
 003cac: 20 08                      |                               local.get 8
 003cae: 36 02 88 96 c0 80 00       |                               i32.store 2 1051400
 003cb5: 41 00                      |                               i32.const 0
 003cb7: 20 00                      |                               local.get 0
 003cb9: 36 02 fc 95 c0 80 00       |                               i32.store 2 1051388
 003cc0: 0c 0e                      |                               br 14
 003cc2: 0b                         |                             end
 003cc3: 41 00                      |                             i32.const 0
 003cc5: 28 02 f8 95 c0 80 00       |                             i32.load 2 1051384
 003ccc: 22 0a                      |                             local.tee 10
 003cce: 45                         |                             i32.eqz
 003ccf: 0d 01                      |                             br_if 1
 003cd1: 20 0a                      |                             local.get 10
 003cd3: 68                         |                             i32.ctz
 003cd4: 41 02                      |                             i32.const 2
 003cd6: 74                         |                             i32.shl
 003cd7: 41 a4 98 c0 80 00          |                             i32.const 1051684
 003cdd: 6a                         |                             i32.add
 003cde: 28 02 00                   |                             i32.load 2 0
 003ce1: 22 08                      |                             local.tee 8
 003ce3: 28 02 04                   |                             i32.load 2 4
 003ce6: 41 78                      |                             i32.const 4294967288
 003ce8: 71                         |                             i32.and
 003ce9: 20 05                      |                             local.get 5
 003ceb: 6b                         |                             i32.sub
 003cec: 21 03                      |                             local.set 3
 003cee: 20 08                      |                             local.get 8
 003cf0: 21 00                      |                             local.set 0
 003cf2: 02 40                      |                             block
 003cf4: 03 40                      |                               loop
 003cf6: 02 40                      |                                 block
 003cf8: 20 00                      |                                   local.get 0
 003cfa: 28 02 10                   |                                   i32.load 2 16
 003cfd: 22 04                      |                                   local.tee 4
 003cff: 0d 00                      |                                   br_if 0
 003d01: 20 00                      |                                   local.get 0
 003d03: 28 02 14                   |                                   i32.load 2 20
 003d06: 22 04                      |                                   local.tee 4
 003d08: 45                         |                                   i32.eqz
 003d09: 0d 02                      |                                   br_if 2
 003d0b: 0b                         |                                 end
 003d0c: 20 04                      |                                 local.get 4
 003d0e: 28 02 04                   |                                 i32.load 2 4
 003d11: 41 78                      |                                 i32.const 4294967288
 003d13: 71                         |                                 i32.and
 003d14: 20 05                      |                                 local.get 5
 003d16: 6b                         |                                 i32.sub
 003d17: 22 00                      |                                 local.tee 0
 003d19: 20 03                      |                                 local.get 3
 003d1b: 20 00                      |                                 local.get 0
 003d1d: 20 03                      |                                 local.get 3
 003d1f: 49                         |                                 i32.lt_u
 003d20: 22 00                      |                                 local.tee 0
 003d22: 1b                         |                                 select
 003d23: 21 03                      |                                 local.set 3
 003d25: 20 04                      |                                 local.get 4
 003d27: 20 08                      |                                 local.get 8
 003d29: 20 00                      |                                 local.get 0
 003d2b: 1b                         |                                 select
 003d2c: 21 08                      |                                 local.set 8
 003d2e: 20 04                      |                                 local.get 4
 003d30: 21 00                      |                                 local.set 0
 003d32: 0c 00                      |                                 br 0
 003d34: 0b                         |                               end
 003d35: 0b                         |                             end
 003d36: 20 08                      |                             local.get 8
 003d38: 28 02 18                   |                             i32.load 2 24
 003d3b: 21 02                      |                             local.set 2
 003d3d: 02 40                      |                             block
 003d3f: 20 08                      |                               local.get 8
 003d41: 28 02 0c                   |                               i32.load 2 12
 003d44: 22 04                      |                               local.tee 4
 003d46: 20 08                      |                               local.get 8
 003d48: 46                         |                               i32.eq
 003d49: 0d 00                      |                               br_if 0
 003d4b: 20 08                      |                               local.get 8
 003d4d: 28 02 08                   |                               i32.load 2 8
 003d50: 22 00                      |                               local.tee 0
 003d52: 20 04                      |                               local.get 4
 003d54: 36 02 0c                   |                               i32.store 2 12
 003d57: 20 04                      |                               local.get 4
 003d59: 20 00                      |                               local.get 0
 003d5b: 36 02 08                   |                               i32.store 2 8
 003d5e: 0c 0d                      |                               br 13
 003d60: 0b                         |                             end
 003d61: 02 40                      |                             block
 003d63: 02 40                      |                               block
 003d65: 20 08                      |                                 local.get 8
 003d67: 28 02 14                   |                                 i32.load 2 20
 003d6a: 22 00                      |                                 local.tee 0
 003d6c: 45                         |                                 i32.eqz
 003d6d: 0d 00                      |                                 br_if 0
 003d6f: 20 08                      |                                 local.get 8
 003d71: 41 14                      |                                 i32.const 20
 003d73: 6a                         |                                 i32.add
 003d74: 21 09                      |                                 local.set 9
 003d76: 0c 01                      |                                 br 1
 003d78: 0b                         |                               end
 003d79: 20 08                      |                               local.get 8
 003d7b: 28 02 10                   |                               i32.load 2 16
 003d7e: 22 00                      |                               local.tee 0
 003d80: 45                         |                               i32.eqz
 003d81: 0d 04                      |                               br_if 4
 003d83: 20 08                      |                               local.get 8
 003d85: 41 10                      |                               i32.const 16
 003d87: 6a                         |                               i32.add
 003d88: 21 09                      |                               local.set 9
 003d8a: 0b                         |                             end
 003d8b: 03 40                      |                             loop
 003d8d: 20 09                      |                               local.get 9
 003d8f: 21 0b                      |                               local.set 11
 003d91: 20 00                      |                               local.get 0
 003d93: 22 04                      |                               local.tee 4
 003d95: 41 14                      |                               i32.const 20
 003d97: 6a                         |                               i32.add
 003d98: 21 09                      |                               local.set 9
 003d9a: 20 04                      |                               local.get 4
 003d9c: 28 02 14                   |                               i32.load 2 20
 003d9f: 22 00                      |                               local.tee 0
 003da1: 0d 00                      |                               br_if 0
 003da3: 20 04                      |                               local.get 4
 003da5: 41 10                      |                               i32.const 16
 003da7: 6a                         |                               i32.add
 003da8: 21 09                      |                               local.set 9
 003daa: 20 04                      |                               local.get 4
 003dac: 28 02 10                   |                               i32.load 2 16
 003daf: 22 00                      |                               local.tee 0
 003db1: 0d 00                      |                               br_if 0
 003db3: 0b                         |                             end
 003db4: 20 0b                      |                             local.get 11
 003db6: 41 00                      |                             i32.const 0
 003db8: 36 02 00                   |                             i32.store 2 0
 003dbb: 0c 0c                      |                             br 12
 003dbd: 0b                         |                           end
 003dbe: 41 7f                      |                           i32.const 4294967295
 003dc0: 21 05                      |                           local.set 5
 003dc2: 20 00                      |                           local.get 0
 003dc4: 41 bf 7f                   |                           i32.const 4294967231
 003dc7: 4b                         |                           i32.gt_u
 003dc8: 0d 00                      |                           br_if 0
 003dca: 20 00                      |                           local.get 0
 003dcc: 41 13                      |                           i32.const 19
 003dce: 6a                         |                           i32.add
 003dcf: 22 04                      |                           local.tee 4
 003dd1: 41 70                      |                           i32.const 4294967280
 003dd3: 71                         |                           i32.and
 003dd4: 21 05                      |                           local.set 5
 003dd6: 41 00                      |                           i32.const 0
 003dd8: 28 02 f8 95 c0 80 00       |                           i32.load 2 1051384
 003ddf: 22 0a                      |                           local.tee 10
 003de1: 45                         |                           i32.eqz
 003de2: 0d 00                      |                           br_if 0
 003de4: 41 1f                      |                           i32.const 31
 003de6: 21 07                      |                           local.set 7
 003de8: 02 40                      |                           block
 003dea: 20 00                      |                             local.get 0
 003dec: 41 ec ff ff 07             |                             i32.const 16777196
 003df1: 4b                         |                             i32.gt_u
 003df2: 0d 00                      |                             br_if 0
 003df4: 20 05                      |                             local.get 5
 003df6: 41 26                      |                             i32.const 38
 003df8: 20 04                      |                             local.get 4
 003dfa: 41 08                      |                             i32.const 8
 003dfc: 76                         |                             i32.shr_u
 003dfd: 67                         |                             i32.clz
 003dfe: 22 04                      |                             local.tee 4
 003e00: 6b                         |                             i32.sub
 003e01: 76                         |                             i32.shr_u
 003e02: 41 01                      |                             i32.const 1
 003e04: 71                         |                             i32.and
 003e05: 20 04                      |                             local.get 4
 003e07: 41 01                      |                             i32.const 1
 003e09: 74                         |                             i32.shl
 003e0a: 6b                         |                             i32.sub
 003e0b: 41 3e                      |                             i32.const 62
 003e0d: 6a                         |                             i32.add
 003e0e: 21 07                      |                             local.set 7
 003e10: 0b                         |                           end
 003e11: 41 00                      |                           i32.const 0
 003e13: 20 05                      |                           local.get 5
 003e15: 6b                         |                           i32.sub
 003e16: 21 03                      |                           local.set 3
 003e18: 02 40                      |                           block
 003e1a: 02 40                      |                             block
 003e1c: 02 40                      |                               block
 003e1e: 02 40                      |                                 block
 003e20: 20 07                      |                                   local.get 7
 003e22: 41 02                      |                                   i32.const 2
 003e24: 74                         |                                   i32.shl
 003e25: 41 a4 98 c0 80 00          |                                   i32.const 1051684
 003e2b: 6a                         |                                   i32.add
 003e2c: 28 02 00                   |                                   i32.load 2 0
 003e2f: 22 00                      |                                   local.tee 0
 003e31: 0d 00                      |                                   br_if 0
 003e33: 41 00                      |                                   i32.const 0
 003e35: 21 04                      |                                   local.set 4
 003e37: 41 00                      |                                   i32.const 0
 003e39: 21 09                      |                                   local.set 9
 003e3b: 0c 01                      |                                   br 1
 003e3d: 0b                         |                                 end
 003e3e: 41 00                      |                                 i32.const 0
 003e40: 21 04                      |                                 local.set 4
 003e42: 20 05                      |                                 local.get 5
 003e44: 41 00                      |                                 i32.const 0
 003e46: 41 19                      |                                 i32.const 25
 003e48: 20 07                      |                                 local.get 7
 003e4a: 41 01                      |                                 i32.const 1
 003e4c: 76                         |                                 i32.shr_u
 003e4d: 6b                         |                                 i32.sub
 003e4e: 20 07                      |                                 local.get 7
 003e50: 41 1f                      |                                 i32.const 31
 003e52: 46                         |                                 i32.eq
 003e53: 1b                         |                                 select
 003e54: 74                         |                                 i32.shl
 003e55: 21 08                      |                                 local.set 8
 003e57: 41 00                      |                                 i32.const 0
 003e59: 21 09                      |                                 local.set 9
 003e5b: 03 40                      |                                 loop
 003e5d: 02 40                      |                                   block
 003e5f: 20 00                      |                                     local.get 0
 003e61: 28 02 04                   |                                     i32.load 2 4
 003e64: 41 78                      |                                     i32.const 4294967288
 003e66: 71                         |                                     i32.and
 003e67: 20 05                      |                                     local.get 5
 003e69: 6b                         |                                     i32.sub
 003e6a: 22 06                      |                                     local.tee 6
 003e6c: 20 03                      |                                     local.get 3
 003e6e: 4f                         |                                     i32.ge_u
 003e6f: 0d 00                      |                                     br_if 0
 003e71: 20 06                      |                                     local.get 6
 003e73: 21 03                      |                                     local.set 3
 003e75: 20 00                      |                                     local.get 0
 003e77: 21 09                      |                                     local.set 9
 003e79: 20 06                      |                                     local.get 6
 003e7b: 0d 00                      |                                     br_if 0
 003e7d: 41 00                      |                                     i32.const 0
 003e7f: 21 03                      |                                     local.set 3
 003e81: 20 00                      |                                     local.get 0
 003e83: 21 09                      |                                     local.set 9
 003e85: 20 00                      |                                     local.get 0
 003e87: 21 04                      |                                     local.set 4
 003e89: 0c 03                      |                                     br 3
 003e8b: 0b                         |                                   end
 003e8c: 20 04                      |                                   local.get 4
 003e8e: 20 00                      |                                   local.get 0
 003e90: 28 02 14                   |                                   i32.load 2 20
 003e93: 22 06                      |                                   local.tee 6
 003e95: 20 06                      |                                   local.get 6
 003e97: 20 00                      |                                   local.get 0
 003e99: 20 08                      |                                   local.get 8
 003e9b: 41 1d                      |                                   i32.const 29
 003e9d: 76                         |                                   i32.shr_u
 003e9e: 41 04                      |                                   i32.const 4
 003ea0: 71                         |                                   i32.and
 003ea1: 6a                         |                                   i32.add
 003ea2: 41 10                      |                                   i32.const 16
 003ea4: 6a                         |                                   i32.add
 003ea5: 28 02 00                   |                                   i32.load 2 0
 003ea8: 22 0b                      |                                   local.tee 11
 003eaa: 46                         |                                   i32.eq
 003eab: 1b                         |                                   select
 003eac: 20 04                      |                                   local.get 4
 003eae: 20 06                      |                                   local.get 6
 003eb0: 1b                         |                                   select
 003eb1: 21 04                      |                                   local.set 4
 003eb3: 20 08                      |                                   local.get 8
 003eb5: 41 01                      |                                   i32.const 1
 003eb7: 74                         |                                   i32.shl
 003eb8: 21 08                      |                                   local.set 8
 003eba: 20 0b                      |                                   local.get 11
 003ebc: 21 00                      |                                   local.set 0
 003ebe: 20 0b                      |                                   local.get 11
 003ec0: 0d 00                      |                                   br_if 0
 003ec2: 0b                         |                                 end
 003ec3: 0b                         |                               end
 003ec4: 02 40                      |                               block
 003ec6: 20 04                      |                                 local.get 4
 003ec8: 20 09                      |                                 local.get 9
 003eca: 72                         |                                 i32.or
 003ecb: 0d 00                      |                                 br_if 0
 003ecd: 41 00                      |                                 i32.const 0
 003ecf: 21 09                      |                                 local.set 9
 003ed1: 41 02                      |                                 i32.const 2
 003ed3: 20 07                      |                                 local.get 7
 003ed5: 74                         |                                 i32.shl
 003ed6: 22 04                      |                                 local.tee 4
 003ed8: 41 00                      |                                 i32.const 0
 003eda: 20 04                      |                                 local.get 4
 003edc: 6b                         |                                 i32.sub
 003edd: 72                         |                                 i32.or
 003ede: 20 0a                      |                                 local.get 10
 003ee0: 71                         |                                 i32.and
 003ee1: 22 04                      |                                 local.tee 4
 003ee3: 45                         |                                 i32.eqz
 003ee4: 0d 03                      |                                 br_if 3
 003ee6: 20 04                      |                                 local.get 4
 003ee8: 68                         |                                 i32.ctz
 003ee9: 41 02                      |                                 i32.const 2
 003eeb: 74                         |                                 i32.shl
 003eec: 41 a4 98 c0 80 00          |                                 i32.const 1051684
 003ef2: 6a                         |                                 i32.add
 003ef3: 28 02 00                   |                                 i32.load 2 0
 003ef6: 21 04                      |                                 local.set 4
 003ef8: 0b                         |                               end
 003ef9: 20 04                      |                               local.get 4
 003efb: 45                         |                               i32.eqz
 003efc: 0d 01                      |                               br_if 1
 003efe: 0b                         |                             end
 003eff: 03 40                      |                             loop
 003f01: 20 04                      |                               local.get 4
 003f03: 28 02 04                   |                               i32.load 2 4
 003f06: 41 78                      |                               i32.const 4294967288
 003f08: 71                         |                               i32.and
 003f09: 20 05                      |                               local.get 5
 003f0b: 6b                         |                               i32.sub
 003f0c: 22 06                      |                               local.tee 6
 003f0e: 20 03                      |                               local.get 3
 003f10: 49                         |                               i32.lt_u
 003f11: 21 08                      |                               local.set 8
 003f13: 02 40                      |                               block
 003f15: 20 04                      |                                 local.get 4
 003f17: 28 02 10                   |                                 i32.load 2 16
 003f1a: 22 00                      |                                 local.tee 0
 003f1c: 0d 00                      |                                 br_if 0
 003f1e: 20 04                      |                                 local.get 4
 003f20: 28 02 14                   |                                 i32.load 2 20
 003f23: 21 00                      |                                 local.set 0
 003f25: 0b                         |                               end
 003f26: 20 06                      |                               local.get 6
 003f28: 20 03                      |                               local.get 3
 003f2a: 20 08                      |                               local.get 8
 003f2c: 1b                         |                               select
 003f2d: 21 03                      |                               local.set 3
 003f2f: 20 04                      |                               local.get 4
 003f31: 20 09                      |                               local.get 9
 003f33: 20 08                      |                               local.get 8
 003f35: 1b                         |                               select
 003f36: 21 09                      |                               local.set 9
 003f38: 20 00                      |                               local.get 0
 003f3a: 21 04                      |                               local.set 4
 003f3c: 20 00                      |                               local.get 0
 003f3e: 0d 00                      |                               br_if 0
 003f40: 0b                         |                             end
 003f41: 0b                         |                           end
 003f42: 20 09                      |                           local.get 9
 003f44: 45                         |                           i32.eqz
 003f45: 0d 00                      |                           br_if 0
 003f47: 20 03                      |                           local.get 3
 003f49: 41 00                      |                           i32.const 0
 003f4b: 28 02 fc 95 c0 80 00       |                           i32.load 2 1051388
 003f52: 20 05                      |                           local.get 5
 003f54: 6b                         |                           i32.sub
 003f55: 4f                         |                           i32.ge_u
 003f56: 0d 00                      |                           br_if 0
 003f58: 20 09                      |                           local.get 9
 003f5a: 28 02 18                   |                           i32.load 2 24
 003f5d: 21 0b                      |                           local.set 11
 003f5f: 02 40                      |                           block
 003f61: 20 09                      |                             local.get 9
 003f63: 28 02 0c                   |                             i32.load 2 12
 003f66: 22 04                      |                             local.tee 4
 003f68: 20 09                      |                             local.get 9
 003f6a: 46                         |                             i32.eq
 003f6b: 0d 00                      |                             br_if 0
 003f6d: 20 09                      |                             local.get 9
 003f6f: 28 02 08                   |                             i32.load 2 8
 003f72: 22 00                      |                             local.tee 0
 003f74: 20 04                      |                             local.get 4
 003f76: 36 02 0c                   |                             i32.store 2 12
 003f79: 20 04                      |                             local.get 4
 003f7b: 20 00                      |                             local.get 0
 003f7d: 36 02 08                   |                             i32.store 2 8
 003f80: 0c 0b                      |                             br 11
 003f82: 0b                         |                           end
 003f83: 02 40                      |                           block
 003f85: 02 40                      |                             block
 003f87: 20 09                      |                               local.get 9
 003f89: 28 02 14                   |                               i32.load 2 20
 003f8c: 22 00                      |                               local.tee 0
 003f8e: 45                         |                               i32.eqz
 003f8f: 0d 00                      |                               br_if 0
 003f91: 20 09                      |                               local.get 9
 003f93: 41 14                      |                               i32.const 20
 003f95: 6a                         |                               i32.add
 003f96: 21 08                      |                               local.set 8
 003f98: 0c 01                      |                               br 1
 003f9a: 0b                         |                             end
 003f9b: 20 09                      |                             local.get 9
 003f9d: 28 02 10                   |                             i32.load 2 16
 003fa0: 22 00                      |                             local.tee 0
 003fa2: 45                         |                             i32.eqz
 003fa3: 0d 04                      |                             br_if 4
 003fa5: 20 09                      |                             local.get 9
 003fa7: 41 10                      |                             i32.const 16
 003fa9: 6a                         |                             i32.add
 003faa: 21 08                      |                             local.set 8
 003fac: 0b                         |                           end
 003fad: 03 40                      |                           loop
 003faf: 20 08                      |                             local.get 8
 003fb1: 21 06                      |                             local.set 6
 003fb3: 20 00                      |                             local.get 0
 003fb5: 22 04                      |                             local.tee 4
 003fb7: 41 14                      |                             i32.const 20
 003fb9: 6a                         |                             i32.add
 003fba: 21 08                      |                             local.set 8
 003fbc: 20 04                      |                             local.get 4
 003fbe: 28 02 14                   |                             i32.load 2 20
 003fc1: 22 00                      |                             local.tee 0
 003fc3: 0d 00                      |                             br_if 0
 003fc5: 20 04                      |                             local.get 4
 003fc7: 41 10                      |                             i32.const 16
 003fc9: 6a                         |                             i32.add
 003fca: 21 08                      |                             local.set 8
 003fcc: 20 04                      |                             local.get 4
 003fce: 28 02 10                   |                             i32.load 2 16
 003fd1: 22 00                      |                             local.tee 0
 003fd3: 0d 00                      |                             br_if 0
 003fd5: 0b                         |                           end
 003fd6: 20 06                      |                           local.get 6
 003fd8: 41 00                      |                           i32.const 0
 003fda: 36 02 00                   |                           i32.store 2 0
 003fdd: 0c 0a                      |                           br 10
 003fdf: 0b                         |                         end
 003fe0: 02 40                      |                         block
 003fe2: 41 00                      |                           i32.const 0
 003fe4: 28 02 fc 95 c0 80 00       |                           i32.load 2 1051388
 003feb: 22 04                      |                           local.tee 4
 003fed: 20 05                      |                           local.get 5
 003fef: 49                         |                           i32.lt_u
 003ff0: 0d 00                      |                           br_if 0
 003ff2: 41 00                      |                           i32.const 0
 003ff4: 28 02 88 96 c0 80 00       |                           i32.load 2 1051400
 003ffb: 21 03                      |                           local.set 3
 003ffd: 02 40                      |                           block
 003fff: 02 40                      |                             block
 004001: 20 04                      |                               local.get 4
 004003: 20 05                      |                               local.get 5
 004005: 6b                         |                               i32.sub
 004006: 22 00                      |                               local.tee 0
 004008: 41 10                      |                               i32.const 16
 00400a: 49                         |                               i32.lt_u
 00400b: 0d 00                      |                               br_if 0
 00400d: 20 03                      |                               local.get 3
 00400f: 20 05                      |                               local.get 5
 004011: 6a                         |                               i32.add
 004012: 22 08                      |                               local.tee 8
 004014: 20 00                      |                               local.get 0
 004016: 41 01                      |                               i32.const 1
 004018: 72                         |                               i32.or
 004019: 36 02 04                   |                               i32.store 2 4
 00401c: 20 03                      |                               local.get 3
 00401e: 20 04                      |                               local.get 4
 004020: 6a                         |                               i32.add
 004021: 20 00                      |                               local.get 0
 004023: 36 02 00                   |                               i32.store 2 0
 004026: 20 03                      |                               local.get 3
 004028: 20 05                      |                               local.get 5
 00402a: 41 03                      |                               i32.const 3
 00402c: 72                         |                               i32.or
 00402d: 36 02 04                   |                               i32.store 2 4
 004030: 0c 01                      |                               br 1
 004032: 0b                         |                             end
 004033: 20 03                      |                             local.get 3
 004035: 20 04                      |                             local.get 4
 004037: 41 03                      |                             i32.const 3
 004039: 72                         |                             i32.or
 00403a: 36 02 04                   |                             i32.store 2 4
 00403d: 20 03                      |                             local.get 3
 00403f: 20 04                      |                             local.get 4
 004041: 6a                         |                             i32.add
 004042: 22 04                      |                             local.tee 4
 004044: 20 04                      |                             local.get 4
 004046: 28 02 04                   |                             i32.load 2 4
 004049: 41 01                      |                             i32.const 1
 00404b: 72                         |                             i32.or
 00404c: 36 02 04                   |                             i32.store 2 4
 00404f: 41 00                      |                             i32.const 0
 004051: 21 08                      |                             local.set 8
 004053: 41 00                      |                             i32.const 0
 004055: 21 00                      |                             local.set 0
 004057: 0b                         |                           end
 004058: 41 00                      |                           i32.const 0
 00405a: 20 00                      |                           local.get 0
 00405c: 36 02 fc 95 c0 80 00       |                           i32.store 2 1051388
 004063: 41 00                      |                           i32.const 0
 004065: 20 08                      |                           local.get 8
 004067: 36 02 88 96 c0 80 00       |                           i32.store 2 1051400
 00406e: 20 03                      |                           local.get 3
 004070: 41 08                      |                           i32.const 8
 004072: 6a                         |                           i32.add
 004073: 21 04                      |                           local.set 4
 004075: 0c 0c                      |                           br 12
 004077: 0b                         |                         end
 004078: 02 40                      |                         block
 00407a: 41 00                      |                           i32.const 0
 00407c: 28 02 80 96 c0 80 00       |                           i32.load 2 1051392
 004083: 22 00                      |                           local.tee 0
 004085: 20 05                      |                           local.get 5
 004087: 4d                         |                           i32.le_u
 004088: 0d 00                      |                           br_if 0
 00408a: 20 02                      |                           local.get 2
 00408c: 20 05                      |                           local.get 5
 00408e: 6a                         |                           i32.add
 00408f: 22 04                      |                           local.tee 4
 004091: 20 00                      |                           local.get 0
 004093: 20 05                      |                           local.get 5
 004095: 6b                         |                           i32.sub
 004096: 22 03                      |                           local.tee 3
 004098: 41 01                      |                           i32.const 1
 00409a: 72                         |                           i32.or
 00409b: 36 02 04                   |                           i32.store 2 4
 00409e: 41 00                      |                           i32.const 0
 0040a0: 20 04                      |                           local.get 4
 0040a2: 36 02 8c 96 c0 80 00       |                           i32.store 2 1051404
 0040a9: 41 00                      |                           i32.const 0
 0040ab: 20 03                      |                           local.get 3
 0040ad: 36 02 80 96 c0 80 00       |                           i32.store 2 1051392
 0040b4: 20 02                      |                           local.get 2
 0040b6: 20 05                      |                           local.get 5
 0040b8: 41 03                      |                           i32.const 3
 0040ba: 72                         |                           i32.or
 0040bb: 36 02 04                   |                           i32.store 2 4
 0040be: 20 02                      |                           local.get 2
 0040c0: 41 08                      |                           i32.const 8
 0040c2: 6a                         |                           i32.add
 0040c3: 21 04                      |                           local.set 4
 0040c5: 0c 0c                      |                           br 12
 0040c7: 0b                         |                         end
 0040c8: 02 40                      |                         block
 0040ca: 02 40                      |                           block
 0040cc: 41 00                      |                             i32.const 0
 0040ce: 28 02 cc 99 c0 80 00       |                             i32.load 2 1051852
 0040d5: 45                         |                             i32.eqz
 0040d6: 0d 00                      |                             br_if 0
 0040d8: 41 00                      |                             i32.const 0
 0040da: 28 02 d4 99 c0 80 00       |                             i32.load 2 1051860
 0040e1: 21 03                      |                             local.set 3
 0040e3: 0c 01                      |                             br 1
 0040e5: 0b                         |                           end
 0040e6: 41 00                      |                           i32.const 0
 0040e8: 42 7f                      |                           i64.const 18446744073709551615
 0040ea: 37 02 d8 99 c0 80 00       |                           i64.store 2 1051864
 0040f1: 41 00                      |                           i32.const 0
 0040f3: 42 80 80 84 80 80 80 c0 00 |                           i64.const 281474976776192
 0040fc: 37 02 d0 99 c0 80 00       |                           i64.store 2 1051856
 004103: 41 00                      |                           i32.const 0
 004105: 20 01                      |                           local.get 1
 004107: 41 0c                      |                           i32.const 12
 004109: 6a                         |                           i32.add
 00410a: 41 70                      |                           i32.const 4294967280
 00410c: 71                         |                           i32.and
 00410d: 41 d8 aa d5 aa 05          |                           i32.const 1431655768
 004113: 73                         |                           i32.xor
 004114: 36 02 cc 99 c0 80 00       |                           i32.store 2 1051852
 00411b: 41 00                      |                           i32.const 0
 00411d: 41 00                      |                           i32.const 0
 00411f: 36 02 e0 99 c0 80 00       |                           i32.store 2 1051872
 004126: 41 00                      |                           i32.const 0
 004128: 41 00                      |                           i32.const 0
 00412a: 36 02 b0 99 c0 80 00       |                           i32.store 2 1051824
 004131: 41 80 80 04                |                           i32.const 65536
 004135: 21 03                      |                           local.set 3
 004137: 0b                         |                         end
 004138: 41 00                      |                         i32.const 0
 00413a: 21 04                      |                         local.set 4
 00413c: 02 40                      |                         block
 00413e: 20 03                      |                           local.get 3
 004140: 20 05                      |                           local.get 5
 004142: 41 c7 00                   |                           i32.const 71
 004145: 6a                         |                           i32.add
 004146: 22 0b                      |                           local.tee 11
 004148: 6a                         |                           i32.add
 004149: 22 08                      |                           local.tee 8
 00414b: 41 00                      |                           i32.const 0
 00414d: 20 03                      |                           local.get 3
 00414f: 6b                         |                           i32.sub
 004150: 22 06                      |                           local.tee 6
 004152: 71                         |                           i32.and
 004153: 22 09                      |                           local.tee 9
 004155: 20 05                      |                           local.get 5
 004157: 4b                         |                           i32.gt_u
 004158: 0d 00                      |                           br_if 0
 00415a: 41 00                      |                           i32.const 0
 00415c: 41 30                      |                           i32.const 48
 00415e: 36 02 e4 99 c0 80 00       |                           i32.store 2 1051876
 004165: 0c 0c                      |                           br 12
 004167: 0b                         |                         end
 004168: 02 40                      |                         block
 00416a: 41 00                      |                           i32.const 0
 00416c: 28 02 ac 99 c0 80 00       |                           i32.load 2 1051820
 004173: 22 04                      |                           local.tee 4
 004175: 45                         |                           i32.eqz
 004176: 0d 00                      |                           br_if 0
 004178: 02 40                      |                           block
 00417a: 41 00                      |                             i32.const 0
 00417c: 28 02 a4 99 c0 80 00       |                             i32.load 2 1051812
 004183: 22 03                      |                             local.tee 3
 004185: 20 09                      |                             local.get 9
 004187: 6a                         |                             i32.add
 004188: 22 07                      |                             local.tee 7
 00418a: 20 03                      |                             local.get 3
 00418c: 4d                         |                             i32.le_u
 00418d: 0d 00                      |                             br_if 0
 00418f: 20 07                      |                             local.get 7
 004191: 20 04                      |                             local.get 4
 004193: 4d                         |                             i32.le_u
 004194: 0d 01                      |                             br_if 1
 004196: 0b                         |                           end
 004197: 41 00                      |                           i32.const 0
 004199: 21 04                      |                           local.set 4
 00419b: 41 00                      |                           i32.const 0
 00419d: 41 30                      |                           i32.const 48
 00419f: 36 02 e4 99 c0 80 00       |                           i32.store 2 1051876
 0041a6: 0c 0c                      |                           br 12
 0041a8: 0b                         |                         end
 0041a9: 41 00                      |                         i32.const 0
 0041ab: 2d 00 b0 99 c0 80 00       |                         i32.load8_u 0 1051824
 0041b2: 41 04                      |                         i32.const 4
 0041b4: 71                         |                         i32.and
 0041b5: 0d 05                      |                         br_if 5
 0041b7: 02 40                      |                         block
 0041b9: 02 40                      |                           block
 0041bb: 02 40                      |                             block
 0041bd: 20 02                      |                               local.get 2
 0041bf: 45                         |                               i32.eqz
 0041c0: 0d 00                      |                               br_if 0
 0041c2: 41 b4 99 c0 80 00          |                               i32.const 1051828
 0041c8: 21 04                      |                               local.set 4
 0041ca: 03 40                      |                               loop
 0041cc: 02 40                      |                                 block
 0041ce: 20 04                      |                                   local.get 4
 0041d0: 28 02 00                   |                                   i32.load 2 0
 0041d3: 22 03                      |                                   local.tee 3
 0041d5: 20 02                      |                                   local.get 2
 0041d7: 4b                         |                                   i32.gt_u
 0041d8: 0d 00                      |                                   br_if 0
 0041da: 20 03                      |                                   local.get 3
 0041dc: 20 04                      |                                   local.get 4
 0041de: 28 02 04                   |                                   i32.load 2 4
 0041e1: 6a                         |                                   i32.add
 0041e2: 20 02                      |                                   local.get 2
 0041e4: 4b                         |                                   i32.gt_u
 0041e5: 0d 03                      |                                   br_if 3
 0041e7: 0b                         |                                 end
 0041e8: 20 04                      |                                 local.get 4
 0041ea: 28 02 08                   |                                 i32.load 2 8
 0041ed: 22 04                      |                                 local.tee 4
 0041ef: 0d 00                      |                                 br_if 0
 0041f1: 0b                         |                               end
 0041f2: 0b                         |                             end
 0041f3: 41 00                      |                             i32.const 0
 0041f5: 10 ea 80 80 80 00          |                             call 106 <sbrk>
 0041fb: 22 08                      |                             local.tee 8
 0041fd: 41 7f                      |                             i32.const 4294967295
 0041ff: 46                         |                             i32.eq
 004200: 0d 06                      |                             br_if 6
 004202: 20 09                      |                             local.get 9
 004204: 21 06                      |                             local.set 6
 004206: 02 40                      |                             block
 004208: 41 00                      |                               i32.const 0
 00420a: 28 02 d0 99 c0 80 00       |                               i32.load 2 1051856
 004211: 22 04                      |                               local.tee 4
 004213: 41 7f                      |                               i32.const 4294967295
 004215: 6a                         |                               i32.add
 004216: 22 03                      |                               local.tee 3
 004218: 20 08                      |                               local.get 8
 00421a: 71                         |                               i32.and
 00421b: 45                         |                               i32.eqz
 00421c: 0d 00                      |                               br_if 0
 00421e: 20 09                      |                               local.get 9
 004220: 20 08                      |                               local.get 8
 004222: 6b                         |                               i32.sub
 004223: 20 03                      |                               local.get 3
 004225: 20 08                      |                               local.get 8
 004227: 6a                         |                               i32.add
 004228: 41 00                      |                               i32.const 0
 00422a: 20 04                      |                               local.get 4
 00422c: 6b                         |                               i32.sub
 00422d: 71                         |                               i32.and
 00422e: 6a                         |                               i32.add
 00422f: 21 06                      |                               local.set 6
 004231: 0b                         |                             end
 004232: 20 06                      |                             local.get 6
 004234: 20 05                      |                             local.get 5
 004236: 4d                         |                             i32.le_u
 004237: 0d 06                      |                             br_if 6
 004239: 20 06                      |                             local.get 6
 00423b: 41 fe ff ff ff 07          |                             i32.const 2147483646
 004241: 4b                         |                             i32.gt_u
 004242: 0d 06                      |                             br_if 6
 004244: 02 40                      |                             block
 004246: 41 00                      |                               i32.const 0
 004248: 28 02 ac 99 c0 80 00       |                               i32.load 2 1051820
 00424f: 22 04                      |                               local.tee 4
 004251: 45                         |                               i32.eqz
 004252: 0d 00                      |                               br_if 0
 004254: 41 00                      |                               i32.const 0
 004256: 28 02 a4 99 c0 80 00       |                               i32.load 2 1051812
 00425d: 22 03                      |                               local.tee 3
 00425f: 20 06                      |                               local.get 6
 004261: 6a                         |                               i32.add
 004262: 22 00                      |                               local.tee 0
 004264: 20 03                      |                               local.get 3
 004266: 4d                         |                               i32.le_u
 004267: 0d 07                      |                               br_if 7
 004269: 20 00                      |                               local.get 0
 00426b: 20 04                      |                               local.get 4
 00426d: 4b                         |                               i32.gt_u
 00426e: 0d 07                      |                               br_if 7
 004270: 0b                         |                             end
 004271: 20 06                      |                             local.get 6
 004273: 10 ea 80 80 80 00          |                             call 106 <sbrk>
 004279: 22 04                      |                             local.tee 4
 00427b: 20 08                      |                             local.get 8
 00427d: 47                         |                             i32.ne
 00427e: 0d 01                      |                             br_if 1
 004280: 0c 08                      |                             br 8
 004282: 0b                         |                           end
 004283: 20 08                      |                           local.get 8
 004285: 20 00                      |                           local.get 0
 004287: 6b                         |                           i32.sub
 004288: 20 06                      |                           local.get 6
 00428a: 71                         |                           i32.and
 00428b: 22 06                      |                           local.tee 6
 00428d: 41 fe ff ff ff 07          |                           i32.const 2147483646
 004293: 4b                         |                           i32.gt_u
 004294: 0d 05                      |                           br_if 5
 004296: 20 06                      |                           local.get 6
 004298: 10 ea 80 80 80 00          |                           call 106 <sbrk>
 00429e: 22 08                      |                           local.tee 8
 0042a0: 20 04                      |                           local.get 4
 0042a2: 28 02 00                   |                           i32.load 2 0
 0042a5: 20 04                      |                           local.get 4
 0042a7: 28 02 04                   |                           i32.load 2 4
 0042aa: 6a                         |                           i32.add
 0042ab: 46                         |                           i32.eq
 0042ac: 0d 04                      |                           br_if 4
 0042ae: 20 08                      |                           local.get 8
 0042b0: 21 04                      |                           local.set 4
 0042b2: 0b                         |                         end
 0042b3: 02 40                      |                         block
 0042b5: 20 06                      |                           local.get 6
 0042b7: 20 05                      |                           local.get 5
 0042b9: 41 c8 00                   |                           i32.const 72
 0042bc: 6a                         |                           i32.add
 0042bd: 4f                         |                           i32.ge_u
 0042be: 0d 00                      |                           br_if 0
 0042c0: 20 04                      |                           local.get 4
 0042c2: 41 7f                      |                           i32.const 4294967295
 0042c4: 46                         |                           i32.eq
 0042c5: 0d 00                      |                           br_if 0
 0042c7: 02 40                      |                           block
 0042c9: 20 0b                      |                             local.get 11
 0042cb: 20 06                      |                             local.get 6
 0042cd: 6b                         |                             i32.sub
 0042ce: 41 00                      |                             i32.const 0
 0042d0: 28 02 d4 99 c0 80 00       |                             i32.load 2 1051860
 0042d7: 22 03                      |                             local.tee 3
 0042d9: 6a                         |                             i32.add
 0042da: 41 00                      |                             i32.const 0
 0042dc: 20 03                      |                             local.get 3
 0042de: 6b                         |                             i32.sub
 0042df: 71                         |                             i32.and
 0042e0: 22 03                      |                             local.tee 3
 0042e2: 41 fe ff ff ff 07          |                             i32.const 2147483646
 0042e8: 4d                         |                             i32.le_u
 0042e9: 0d 00                      |                             br_if 0
 0042eb: 20 04                      |                             local.get 4
 0042ed: 21 08                      |                             local.set 8
 0042ef: 0c 08                      |                             br 8
 0042f1: 0b                         |                           end
 0042f2: 02 40                      |                           block
 0042f4: 20 03                      |                             local.get 3
 0042f6: 10 ea 80 80 80 00          |                             call 106 <sbrk>
 0042fc: 41 7f                      |                             i32.const 4294967295
 0042fe: 46                         |                             i32.eq
 0042ff: 0d 00                      |                             br_if 0
 004301: 20 03                      |                             local.get 3
 004303: 20 06                      |                             local.get 6
 004305: 6a                         |                             i32.add
 004306: 21 06                      |                             local.set 6
 004308: 20 04                      |                             local.get 4
 00430a: 21 08                      |                             local.set 8
 00430c: 0c 08                      |                             br 8
 00430e: 0b                         |                           end
 00430f: 41 00                      |                           i32.const 0
 004311: 20 06                      |                           local.get 6
 004313: 6b                         |                           i32.sub
 004314: 10 ea 80 80 80 00          |                           call 106 <sbrk>
 00431a: 1a                         |                           drop
 00431b: 0c 05                      |                           br 5
 00431d: 0b                         |                         end
 00431e: 20 04                      |                         local.get 4
 004320: 21 08                      |                         local.set 8
 004322: 20 04                      |                         local.get 4
 004324: 41 7f                      |                         i32.const 4294967295
 004326: 47                         |                         i32.ne
 004327: 0d 06                      |                         br_if 6
 004329: 0c 04                      |                         br 4
 00432b: 0b                         |                       end
 00432c: 00                         |                       unreachable
 00432d: 0b                         |                     end
 00432e: 41 00                      |                     i32.const 0
 004330: 21 04                      |                     local.set 4
 004332: 0c 08                      |                     br 8
 004334: 0b                         |                   end
 004335: 41 00                      |                   i32.const 0
 004337: 21 04                      |                   local.set 4
 004339: 0c 06                      |                   br 6
 00433b: 0b                         |                 end
 00433c: 20 08                      |                 local.get 8
 00433e: 41 7f                      |                 i32.const 4294967295
 004340: 47                         |                 i32.ne
 004341: 0d 02                      |                 br_if 2
 004343: 0b                         |               end
 004344: 41 00                      |               i32.const 0
 004346: 41 00                      |               i32.const 0
 004348: 28 02 b0 99 c0 80 00       |               i32.load 2 1051824
 00434f: 41 04                      |               i32.const 4
 004351: 72                         |               i32.or
 004352: 36 02 b0 99 c0 80 00       |               i32.store 2 1051824
 004359: 0b                         |             end
 00435a: 20 09                      |             local.get 9
 00435c: 41 fe ff ff ff 07          |             i32.const 2147483646
 004362: 4b                         |             i32.gt_u
 004363: 0d 01                      |             br_if 1
 004365: 20 09                      |             local.get 9
 004367: 10 ea 80 80 80 00          |             call 106 <sbrk>
 00436d: 21 08                      |             local.set 8
 00436f: 41 00                      |             i32.const 0
 004371: 10 ea 80 80 80 00          |             call 106 <sbrk>
 004377: 21 04                      |             local.set 4
 004379: 20 08                      |             local.get 8
 00437b: 41 7f                      |             i32.const 4294967295
 00437d: 46                         |             i32.eq
 00437e: 0d 01                      |             br_if 1
 004380: 20 04                      |             local.get 4
 004382: 41 7f                      |             i32.const 4294967295
 004384: 46                         |             i32.eq
 004385: 0d 01                      |             br_if 1
 004387: 20 08                      |             local.get 8
 004389: 20 04                      |             local.get 4
 00438b: 4f                         |             i32.ge_u
 00438c: 0d 01                      |             br_if 1
 00438e: 20 04                      |             local.get 4
 004390: 20 08                      |             local.get 8
 004392: 6b                         |             i32.sub
 004393: 22 06                      |             local.tee 6
 004395: 20 05                      |             local.get 5
 004397: 41 38                      |             i32.const 56
 004399: 6a                         |             i32.add
 00439a: 4d                         |             i32.le_u
 00439b: 0d 01                      |             br_if 1
 00439d: 0b                         |           end
 00439e: 41 00                      |           i32.const 0
 0043a0: 41 00                      |           i32.const 0
 0043a2: 28 02 a4 99 c0 80 00       |           i32.load 2 1051812
 0043a9: 20 06                      |           local.get 6
 0043ab: 6a                         |           i32.add
 0043ac: 22 04                      |           local.tee 4
 0043ae: 36 02 a4 99 c0 80 00       |           i32.store 2 1051812
 0043b5: 02 40                      |           block
 0043b7: 20 04                      |             local.get 4
 0043b9: 41 00                      |             i32.const 0
 0043bb: 28 02 a8 99 c0 80 00       |             i32.load 2 1051816
 0043c2: 4d                         |             i32.le_u
 0043c3: 0d 00                      |             br_if 0
 0043c5: 41 00                      |             i32.const 0
 0043c7: 20 04                      |             local.get 4
 0043c9: 36 02 a8 99 c0 80 00       |             i32.store 2 1051816
 0043d0: 0b                         |           end
 0043d1: 02 40                      |           block
 0043d3: 02 40                      |             block
 0043d5: 02 40                      |               block
 0043d7: 02 40                      |                 block
 0043d9: 41 00                      |                   i32.const 0
 0043db: 28 02 8c 96 c0 80 00       |                   i32.load 2 1051404
 0043e2: 22 03                      |                   local.tee 3
 0043e4: 45                         |                   i32.eqz
 0043e5: 0d 00                      |                   br_if 0
 0043e7: 41 b4 99 c0 80 00          |                   i32.const 1051828
 0043ed: 21 04                      |                   local.set 4
 0043ef: 03 40                      |                   loop
 0043f1: 20 08                      |                     local.get 8
 0043f3: 20 04                      |                     local.get 4
 0043f5: 28 02 00                   |                     i32.load 2 0
 0043f8: 22 00                      |                     local.tee 0
 0043fa: 20 04                      |                     local.get 4
 0043fc: 28 02 04                   |                     i32.load 2 4
 0043ff: 22 09                      |                     local.tee 9
 004401: 6a                         |                     i32.add
 004402: 46                         |                     i32.eq
 004403: 0d 02                      |                     br_if 2
 004405: 20 04                      |                     local.get 4
 004407: 28 02 08                   |                     i32.load 2 8
 00440a: 22 04                      |                     local.tee 4
 00440c: 0d 00                      |                     br_if 0
 00440e: 0c 03                      |                     br 3
 004410: 0b                         |                   end
 004411: 0b                         |                 end
 004412: 02 40                      |                 block
 004414: 02 40                      |                   block
 004416: 41 00                      |                     i32.const 0
 004418: 28 02 84 96 c0 80 00       |                     i32.load 2 1051396
 00441f: 22 04                      |                     local.tee 4
 004421: 45                         |                     i32.eqz
 004422: 0d 00                      |                     br_if 0
 004424: 20 08                      |                     local.get 8
 004426: 20 04                      |                     local.get 4
 004428: 4f                         |                     i32.ge_u
 004429: 0d 01                      |                     br_if 1
 00442b: 0b                         |                   end
 00442c: 41 00                      |                   i32.const 0
 00442e: 20 08                      |                   local.get 8
 004430: 36 02 84 96 c0 80 00       |                   i32.store 2 1051396
 004437: 0b                         |                 end
 004438: 41 00                      |                 i32.const 0
 00443a: 21 04                      |                 local.set 4
 00443c: 41 00                      |                 i32.const 0
 00443e: 20 06                      |                 local.get 6
 004440: 36 02 b8 99 c0 80 00       |                 i32.store 2 1051832
 004447: 41 00                      |                 i32.const 0
 004449: 20 08                      |                 local.get 8
 00444b: 36 02 b4 99 c0 80 00       |                 i32.store 2 1051828
 004452: 41 00                      |                 i32.const 0
 004454: 41 7f                      |                 i32.const 4294967295
 004456: 36 02 94 96 c0 80 00       |                 i32.store 2 1051412
 00445d: 41 00                      |                 i32.const 0
 00445f: 41 00                      |                 i32.const 0
 004461: 28 02 cc 99 c0 80 00       |                 i32.load 2 1051852
 004468: 36 02 98 96 c0 80 00       |                 i32.store 2 1051416
 00446f: 41 00                      |                 i32.const 0
 004471: 41 00                      |                 i32.const 0
 004473: 36 02 c0 99 c0 80 00       |                 i32.store 2 1051840
 00447a: 03 40                      |                 loop
 00447c: 20 04                      |                   local.get 4
 00447e: 41 b0 96 c0 80 00          |                   i32.const 1051440
 004484: 6a                         |                   i32.add
 004485: 20 04                      |                   local.get 4
 004487: 41 a4 96 c0 80 00          |                   i32.const 1051428
 00448d: 6a                         |                   i32.add
 00448e: 22 03                      |                   local.tee 3
 004490: 36 02 00                   |                   i32.store 2 0
 004493: 20 03                      |                   local.get 3
 004495: 20 04                      |                   local.get 4
 004497: 41 9c 96 c0 80 00          |                   i32.const 1051420
 00449d: 6a                         |                   i32.add
 00449e: 22 00                      |                   local.tee 0
 0044a0: 36 02 00                   |                   i32.store 2 0
 0044a3: 20 04                      |                   local.get 4
 0044a5: 41 a8 96 c0 80 00          |                   i32.const 1051432
 0044ab: 6a                         |                   i32.add
 0044ac: 20 00                      |                   local.get 0
 0044ae: 36 02 00                   |                   i32.store 2 0
 0044b1: 20 04                      |                   local.get 4
 0044b3: 41 b8 96 c0 80 00          |                   i32.const 1051448
 0044b9: 6a                         |                   i32.add
 0044ba: 20 04                      |                   local.get 4
 0044bc: 41 ac 96 c0 80 00          |                   i32.const 1051436
 0044c2: 6a                         |                   i32.add
 0044c3: 22 00                      |                   local.tee 0
 0044c5: 36 02 00                   |                   i32.store 2 0
 0044c8: 20 00                      |                   local.get 0
 0044ca: 20 03                      |                   local.get 3
 0044cc: 36 02 00                   |                   i32.store 2 0
 0044cf: 20 04                      |                   local.get 4
 0044d1: 41 c0 96 c0 80 00          |                   i32.const 1051456
 0044d7: 6a                         |                   i32.add
 0044d8: 20 04                      |                   local.get 4
 0044da: 41 b4 96 c0 80 00          |                   i32.const 1051444
 0044e0: 6a                         |                   i32.add
 0044e1: 22 03                      |                   local.tee 3
 0044e3: 36 02 00                   |                   i32.store 2 0
 0044e6: 20 03                      |                   local.get 3
 0044e8: 20 00                      |                   local.get 0
 0044ea: 36 02 00                   |                   i32.store 2 0
 0044ed: 20 04                      |                   local.get 4
 0044ef: 41 bc 96 c0 80 00          |                   i32.const 1051452
 0044f5: 6a                         |                   i32.add
 0044f6: 20 03                      |                   local.get 3
 0044f8: 36 02 00                   |                   i32.store 2 0
 0044fb: 20 04                      |                   local.get 4
 0044fd: 41 20                      |                   i32.const 32
 0044ff: 6a                         |                   i32.add
 004500: 22 04                      |                   local.tee 4
 004502: 41 80 02                   |                   i32.const 256
 004505: 47                         |                   i32.ne
 004506: 0d 00                      |                   br_if 0
 004508: 0b                         |                 end
 004509: 20 08                      |                 local.get 8
 00450b: 41 78                      |                 i32.const 4294967288
 00450d: 20 08                      |                 local.get 8
 00450f: 6b                         |                 i32.sub
 004510: 41 0f                      |                 i32.const 15
 004512: 71                         |                 i32.and
 004513: 22 04                      |                 local.tee 4
 004515: 6a                         |                 i32.add
 004516: 22 03                      |                 local.tee 3
 004518: 20 06                      |                 local.get 6
 00451a: 41 48                      |                 i32.const 4294967240
 00451c: 6a                         |                 i32.add
 00451d: 22 00                      |                 local.tee 0
 00451f: 20 04                      |                 local.get 4
 004521: 6b                         |                 i32.sub
 004522: 22 04                      |                 local.tee 4
 004524: 41 01                      |                 i32.const 1
 004526: 72                         |                 i32.or
 004527: 36 02 04                   |                 i32.store 2 4
 00452a: 41 00                      |                 i32.const 0
 00452c: 41 00                      |                 i32.const 0
 00452e: 28 02 dc 99 c0 80 00       |                 i32.load 2 1051868
 004535: 36 02 90 96 c0 80 00       |                 i32.store 2 1051408
 00453c: 41 00                      |                 i32.const 0
 00453e: 20 04                      |                 local.get 4
 004540: 36 02 80 96 c0 80 00       |                 i32.store 2 1051392
 004547: 41 00                      |                 i32.const 0
 004549: 20 03                      |                 local.get 3
 00454b: 36 02 8c 96 c0 80 00       |                 i32.store 2 1051404
 004552: 20 08                      |                 local.get 8
 004554: 20 00                      |                 local.get 0
 004556: 6a                         |                 i32.add
 004557: 41 38                      |                 i32.const 56
 004559: 36 02 04                   |                 i32.store 2 4
 00455c: 0c 02                      |                 br 2
 00455e: 0b                         |               end
 00455f: 20 03                      |               local.get 3
 004561: 20 08                      |               local.get 8
 004563: 4f                         |               i32.ge_u
 004564: 0d 00                      |               br_if 0
 004566: 20 03                      |               local.get 3
 004568: 20 00                      |               local.get 0
 00456a: 49                         |               i32.lt_u
 00456b: 0d 00                      |               br_if 0
 00456d: 20 04                      |               local.get 4
 00456f: 28 02 0c                   |               i32.load 2 12
 004572: 41 08                      |               i32.const 8
 004574: 71                         |               i32.and
 004575: 0d 00                      |               br_if 0
 004577: 20 03                      |               local.get 3
 004579: 41 78                      |               i32.const 4294967288
 00457b: 20 03                      |               local.get 3
 00457d: 6b                         |               i32.sub
 00457e: 41 0f                      |               i32.const 15
 004580: 71                         |               i32.and
 004581: 22 00                      |               local.tee 0
 004583: 6a                         |               i32.add
 004584: 22 08                      |               local.tee 8
 004586: 41 00                      |               i32.const 0
 004588: 28 02 80 96 c0 80 00       |               i32.load 2 1051392
 00458f: 20 06                      |               local.get 6
 004591: 6a                         |               i32.add
 004592: 22 0b                      |               local.tee 11
 004594: 20 00                      |               local.get 0
 004596: 6b                         |               i32.sub
 004597: 22 00                      |               local.tee 0
 004599: 41 01                      |               i32.const 1
 00459b: 72                         |               i32.or
 00459c: 36 02 04                   |               i32.store 2 4
 00459f: 20 04                      |               local.get 4
 0045a1: 20 09                      |               local.get 9
 0045a3: 20 06                      |               local.get 6
 0045a5: 6a                         |               i32.add
 0045a6: 36 02 04                   |               i32.store 2 4
 0045a9: 41 00                      |               i32.const 0
 0045ab: 41 00                      |               i32.const 0
 0045ad: 28 02 dc 99 c0 80 00       |               i32.load 2 1051868
 0045b4: 36 02 90 96 c0 80 00       |               i32.store 2 1051408
 0045bb: 41 00                      |               i32.const 0
 0045bd: 20 00                      |               local.get 0
 0045bf: 36 02 80 96 c0 80 00       |               i32.store 2 1051392
 0045c6: 41 00                      |               i32.const 0
 0045c8: 20 08                      |               local.get 8
 0045ca: 36 02 8c 96 c0 80 00       |               i32.store 2 1051404
 0045d1: 20 03                      |               local.get 3
 0045d3: 20 0b                      |               local.get 11
 0045d5: 6a                         |               i32.add
 0045d6: 41 38                      |               i32.const 56
 0045d8: 36 02 04                   |               i32.store 2 4
 0045db: 0c 01                      |               br 1
 0045dd: 0b                         |             end
 0045de: 02 40                      |             block
 0045e0: 20 08                      |               local.get 8
 0045e2: 41 00                      |               i32.const 0
 0045e4: 28 02 84 96 c0 80 00       |               i32.load 2 1051396
 0045eb: 4f                         |               i32.ge_u
 0045ec: 0d 00                      |               br_if 0
 0045ee: 41 00                      |               i32.const 0
 0045f0: 20 08                      |               local.get 8
 0045f2: 36 02 84 96 c0 80 00       |               i32.store 2 1051396
 0045f9: 0b                         |             end
 0045fa: 20 08                      |             local.get 8
 0045fc: 20 06                      |             local.get 6
 0045fe: 6a                         |             i32.add
 0045ff: 21 00                      |             local.set 0
 004601: 41 b4 99 c0 80 00          |             i32.const 1051828
 004607: 21 04                      |             local.set 4
 004609: 02 40                      |             block
 00460b: 02 40                      |               block
 00460d: 03 40                      |                 loop
 00460f: 20 04                      |                   local.get 4
 004611: 28 02 00                   |                   i32.load 2 0
 004614: 22 09                      |                   local.tee 9
 004616: 20 00                      |                   local.get 0
 004618: 46                         |                   i32.eq
 004619: 0d 01                      |                   br_if 1
 00461b: 20 04                      |                   local.get 4
 00461d: 28 02 08                   |                   i32.load 2 8
 004620: 22 04                      |                   local.tee 4
 004622: 0d 00                      |                   br_if 0
 004624: 0c 02                      |                   br 2
 004626: 0b                         |                 end
 004627: 0b                         |               end
 004628: 20 04                      |               local.get 4
 00462a: 2d 00 0c                   |               i32.load8_u 0 12
 00462d: 41 08                      |               i32.const 8
 00462f: 71                         |               i32.and
 004630: 45                         |               i32.eqz
 004631: 0d 03                      |               br_if 3
 004633: 0b                         |             end
 004634: 41 b4 99 c0 80 00          |             i32.const 1051828
 00463a: 21 04                      |             local.set 4
 00463c: 02 40                      |             block
 00463e: 03 40                      |               loop
 004640: 02 40                      |                 block
 004642: 20 04                      |                   local.get 4
 004644: 28 02 00                   |                   i32.load 2 0
 004647: 22 00                      |                   local.tee 0
 004649: 20 03                      |                   local.get 3
 00464b: 4b                         |                   i32.gt_u
 00464c: 0d 00                      |                   br_if 0
 00464e: 20 00                      |                   local.get 0
 004650: 20 04                      |                   local.get 4
 004652: 28 02 04                   |                   i32.load 2 4
 004655: 6a                         |                   i32.add
 004656: 22 00                      |                   local.tee 0
 004658: 20 03                      |                   local.get 3
 00465a: 4b                         |                   i32.gt_u
 00465b: 0d 02                      |                   br_if 2
 00465d: 0b                         |                 end
 00465e: 20 04                      |                 local.get 4
 004660: 28 02 08                   |                 i32.load 2 8
 004663: 21 04                      |                 local.set 4
 004665: 0c 00                      |                 br 0
 004667: 0b                         |               end
 004668: 0b                         |             end
 004669: 20 08                      |             local.get 8
 00466b: 41 78                      |             i32.const 4294967288
 00466d: 20 08                      |             local.get 8
 00466f: 6b                         |             i32.sub
 004670: 41 0f                      |             i32.const 15
 004672: 71                         |             i32.and
 004673: 22 04                      |             local.tee 4
 004675: 6a                         |             i32.add
 004676: 22 0b                      |             local.tee 11
 004678: 20 06                      |             local.get 6
 00467a: 41 48                      |             i32.const 4294967240
 00467c: 6a                         |             i32.add
 00467d: 22 09                      |             local.tee 9
 00467f: 20 04                      |             local.get 4
 004681: 6b                         |             i32.sub
 004682: 22 04                      |             local.tee 4
 004684: 41 01                      |             i32.const 1
 004686: 72                         |             i32.or
 004687: 36 02 04                   |             i32.store 2 4
 00468a: 20 08                      |             local.get 8
 00468c: 20 09                      |             local.get 9
 00468e: 6a                         |             i32.add
 00468f: 41 38                      |             i32.const 56
 004691: 36 02 04                   |             i32.store 2 4
 004694: 20 03                      |             local.get 3
 004696: 20 00                      |             local.get 0
 004698: 41 37                      |             i32.const 55
 00469a: 20 00                      |             local.get 0
 00469c: 6b                         |             i32.sub
 00469d: 41 0f                      |             i32.const 15
 00469f: 71                         |             i32.and
 0046a0: 6a                         |             i32.add
 0046a1: 41 41                      |             i32.const 4294967233
 0046a3: 6a                         |             i32.add
 0046a4: 22 09                      |             local.tee 9
 0046a6: 20 09                      |             local.get 9
 0046a8: 20 03                      |             local.get 3
 0046aa: 41 10                      |             i32.const 16
 0046ac: 6a                         |             i32.add
 0046ad: 49                         |             i32.lt_u
 0046ae: 1b                         |             select
 0046af: 22 09                      |             local.tee 9
 0046b1: 41 23                      |             i32.const 35
 0046b3: 36 02 04                   |             i32.store 2 4
 0046b6: 41 00                      |             i32.const 0
 0046b8: 41 00                      |             i32.const 0
 0046ba: 28 02 dc 99 c0 80 00       |             i32.load 2 1051868
 0046c1: 36 02 90 96 c0 80 00       |             i32.store 2 1051408
 0046c8: 41 00                      |             i32.const 0
 0046ca: 20 04                      |             local.get 4
 0046cc: 36 02 80 96 c0 80 00       |             i32.store 2 1051392
 0046d3: 41 00                      |             i32.const 0
 0046d5: 20 0b                      |             local.get 11
 0046d7: 36 02 8c 96 c0 80 00       |             i32.store 2 1051404
 0046de: 20 09                      |             local.get 9
 0046e0: 41 10                      |             i32.const 16
 0046e2: 6a                         |             i32.add
 0046e3: 41 00                      |             i32.const 0
 0046e5: 29 02 bc 99 c0 80 00       |             i64.load 2 1051836
 0046ec: 37 02 00                   |             i64.store 2 0
 0046ef: 20 09                      |             local.get 9
 0046f1: 41 00                      |             i32.const 0
 0046f3: 29 02 b4 99 c0 80 00       |             i64.load 2 1051828
 0046fa: 37 02 08                   |             i64.store 2 8
 0046fd: 41 00                      |             i32.const 0
 0046ff: 20 09                      |             local.get 9
 004701: 41 08                      |             i32.const 8
 004703: 6a                         |             i32.add
 004704: 36 02 bc 99 c0 80 00       |             i32.store 2 1051836
 00470b: 41 00                      |             i32.const 0
 00470d: 20 06                      |             local.get 6
 00470f: 36 02 b8 99 c0 80 00       |             i32.store 2 1051832
 004716: 41 00                      |             i32.const 0
 004718: 20 08                      |             local.get 8
 00471a: 36 02 b4 99 c0 80 00       |             i32.store 2 1051828
 004721: 41 00                      |             i32.const 0
 004723: 41 00                      |             i32.const 0
 004725: 36 02 c0 99 c0 80 00       |             i32.store 2 1051840
 00472c: 20 09                      |             local.get 9
 00472e: 41 24                      |             i32.const 36
 004730: 6a                         |             i32.add
 004731: 21 04                      |             local.set 4
 004733: 03 40                      |             loop
 004735: 20 04                      |               local.get 4
 004737: 41 07                      |               i32.const 7
 004739: 36 02 00                   |               i32.store 2 0
 00473c: 20 04                      |               local.get 4
 00473e: 41 04                      |               i32.const 4
 004740: 6a                         |               i32.add
 004741: 22 04                      |               local.tee 4
 004743: 20 00                      |               local.get 0
 004745: 49                         |               i32.lt_u
 004746: 0d 00                      |               br_if 0
 004748: 0b                         |             end
 004749: 20 09                      |             local.get 9
 00474b: 20 03                      |             local.get 3
 00474d: 46                         |             i32.eq
 00474e: 0d 00                      |             br_if 0
 004750: 20 09                      |             local.get 9
 004752: 20 09                      |             local.get 9
 004754: 28 02 04                   |             i32.load 2 4
 004757: 41 7e                      |             i32.const 4294967294
 004759: 71                         |             i32.and
 00475a: 36 02 04                   |             i32.store 2 4
 00475d: 20 09                      |             local.get 9
 00475f: 20 09                      |             local.get 9
 004761: 20 03                      |             local.get 3
 004763: 6b                         |             i32.sub
 004764: 22 08                      |             local.tee 8
 004766: 36 02 00                   |             i32.store 2 0
 004769: 20 03                      |             local.get 3
 00476b: 20 08                      |             local.get 8
 00476d: 41 01                      |             i32.const 1
 00476f: 72                         |             i32.or
 004770: 36 02 04                   |             i32.store 2 4
 004773: 02 40                      |             block
 004775: 02 40                      |               block
 004777: 20 08                      |                 local.get 8
 004779: 41 ff 01                   |                 i32.const 255
 00477c: 4b                         |                 i32.gt_u
 00477d: 0d 00                      |                 br_if 0
 00477f: 20 08                      |                 local.get 8
 004781: 41 78                      |                 i32.const 4294967288
 004783: 71                         |                 i32.and
 004784: 41 9c 96 c0 80 00          |                 i32.const 1051420
 00478a: 6a                         |                 i32.add
 00478b: 21 04                      |                 local.set 4
 00478d: 02 40                      |                 block
 00478f: 02 40                      |                   block
 004791: 41 00                      |                     i32.const 0
 004793: 28 02 f4 95 c0 80 00       |                     i32.load 2 1051380
 00479a: 22 00                      |                     local.tee 0
 00479c: 41 01                      |                     i32.const 1
 00479e: 20 08                      |                     local.get 8
 0047a0: 41 03                      |                     i32.const 3
 0047a2: 76                         |                     i32.shr_u
 0047a3: 74                         |                     i32.shl
 0047a4: 22 08                      |                     local.tee 8
 0047a6: 71                         |                     i32.and
 0047a7: 0d 00                      |                     br_if 0
 0047a9: 41 00                      |                     i32.const 0
 0047ab: 20 00                      |                     local.get 0
 0047ad: 20 08                      |                     local.get 8
 0047af: 72                         |                     i32.or
 0047b0: 36 02 f4 95 c0 80 00       |                     i32.store 2 1051380
 0047b7: 20 04                      |                     local.get 4
 0047b9: 21 00                      |                     local.set 0
 0047bb: 0c 01                      |                     br 1
 0047bd: 0b                         |                   end
 0047be: 20 04                      |                   local.get 4
 0047c0: 28 02 08                   |                   i32.load 2 8
 0047c3: 21 00                      |                   local.set 0
 0047c5: 0b                         |                 end
 0047c6: 20 00                      |                 local.get 0
 0047c8: 20 03                      |                 local.get 3
 0047ca: 36 02 0c                   |                 i32.store 2 12
 0047cd: 20 04                      |                 local.get 4
 0047cf: 20 03                      |                 local.get 3
 0047d1: 36 02 08                   |                 i32.store 2 8
 0047d4: 41 0c                      |                 i32.const 12
 0047d6: 21 08                      |                 local.set 8
 0047d8: 41 08                      |                 i32.const 8
 0047da: 21 09                      |                 local.set 9
 0047dc: 0c 01                      |                 br 1
 0047de: 0b                         |               end
 0047df: 41 1f                      |               i32.const 31
 0047e1: 21 04                      |               local.set 4
 0047e3: 02 40                      |               block
 0047e5: 20 08                      |                 local.get 8
 0047e7: 41 ff ff ff 07             |                 i32.const 16777215
 0047ec: 4b                         |                 i32.gt_u
 0047ed: 0d 00                      |                 br_if 0
 0047ef: 20 08                      |                 local.get 8
 0047f1: 41 26                      |                 i32.const 38
 0047f3: 20 08                      |                 local.get 8
 0047f5: 41 08                      |                 i32.const 8
 0047f7: 76                         |                 i32.shr_u
 0047f8: 67                         |                 i32.clz
 0047f9: 22 04                      |                 local.tee 4
 0047fb: 6b                         |                 i32.sub
 0047fc: 76                         |                 i32.shr_u
 0047fd: 41 01                      |                 i32.const 1
 0047ff: 71                         |                 i32.and
 004800: 20 04                      |                 local.get 4
 004802: 41 01                      |                 i32.const 1
 004804: 74                         |                 i32.shl
 004805: 6b                         |                 i32.sub
 004806: 41 3e                      |                 i32.const 62
 004808: 6a                         |                 i32.add
 004809: 21 04                      |                 local.set 4
 00480b: 0b                         |               end
 00480c: 20 03                      |               local.get 3
 00480e: 20 04                      |               local.get 4
 004810: 36 02 1c                   |               i32.store 2 28
 004813: 20 03                      |               local.get 3
 004815: 42 00                      |               i64.const 0
 004817: 37 02 10                   |               i64.store 2 16
 00481a: 20 04                      |               local.get 4
 00481c: 41 02                      |               i32.const 2
 00481e: 74                         |               i32.shl
 00481f: 41 a4 98 c0 80 00          |               i32.const 1051684
 004825: 6a                         |               i32.add
 004826: 21 00                      |               local.set 0
 004828: 02 40                      |               block
 00482a: 02 40                      |                 block
 00482c: 02 40                      |                   block
 00482e: 41 00                      |                     i32.const 0
 004830: 28 02 f8 95 c0 80 00       |                     i32.load 2 1051384
 004837: 22 09                      |                     local.tee 9
 004839: 41 01                      |                     i32.const 1
 00483b: 20 04                      |                     local.get 4
 00483d: 74                         |                     i32.shl
 00483e: 22 06                      |                     local.tee 6
 004840: 71                         |                     i32.and
 004841: 0d 00                      |                     br_if 0
 004843: 20 00                      |                     local.get 0
 004845: 20 03                      |                     local.get 3
 004847: 36 02 00                   |                     i32.store 2 0
 00484a: 41 00                      |                     i32.const 0
 00484c: 20 09                      |                     local.get 9
 00484e: 20 06                      |                     local.get 6
 004850: 72                         |                     i32.or
 004851: 36 02 f8 95 c0 80 00       |                     i32.store 2 1051384
 004858: 20 03                      |                     local.get 3
 00485a: 20 00                      |                     local.get 0
 00485c: 36 02 18                   |                     i32.store 2 24
 00485f: 0c 01                      |                     br 1
 004861: 0b                         |                   end
 004862: 20 08                      |                   local.get 8
 004864: 41 00                      |                   i32.const 0
 004866: 41 19                      |                   i32.const 25
 004868: 20 04                      |                   local.get 4
 00486a: 41 01                      |                   i32.const 1
 00486c: 76                         |                   i32.shr_u
 00486d: 6b                         |                   i32.sub
 00486e: 20 04                      |                   local.get 4
 004870: 41 1f                      |                   i32.const 31
 004872: 46                         |                   i32.eq
 004873: 1b                         |                   select
 004874: 74                         |                   i32.shl
 004875: 21 04                      |                   local.set 4
 004877: 20 00                      |                   local.get 0
 004879: 28 02 00                   |                   i32.load 2 0
 00487c: 21 09                      |                   local.set 9
 00487e: 03 40                      |                   loop
 004880: 20 09                      |                     local.get 9
 004882: 22 00                      |                     local.tee 0
 004884: 28 02 04                   |                     i32.load 2 4
 004887: 41 78                      |                     i32.const 4294967288
 004889: 71                         |                     i32.and
 00488a: 20 08                      |                     local.get 8
 00488c: 46                         |                     i32.eq
 00488d: 0d 02                      |                     br_if 2
 00488f: 20 04                      |                     local.get 4
 004891: 41 1d                      |                     i32.const 29
 004893: 76                         |                     i32.shr_u
 004894: 21 09                      |                     local.set 9
 004896: 20 04                      |                     local.get 4
 004898: 41 01                      |                     i32.const 1
 00489a: 74                         |                     i32.shl
 00489b: 21 04                      |                     local.set 4
 00489d: 20 00                      |                     local.get 0
 00489f: 20 09                      |                     local.get 9
 0048a1: 41 04                      |                     i32.const 4
 0048a3: 71                         |                     i32.and
 0048a4: 6a                         |                     i32.add
 0048a5: 41 10                      |                     i32.const 16
 0048a7: 6a                         |                     i32.add
 0048a8: 22 06                      |                     local.tee 6
 0048aa: 28 02 00                   |                     i32.load 2 0
 0048ad: 22 09                      |                     local.tee 9
 0048af: 0d 00                      |                     br_if 0
 0048b1: 0b                         |                   end
 0048b2: 20 06                      |                   local.get 6
 0048b4: 20 03                      |                   local.get 3
 0048b6: 36 02 00                   |                   i32.store 2 0
 0048b9: 20 03                      |                   local.get 3
 0048bb: 20 00                      |                   local.get 0
 0048bd: 36 02 18                   |                   i32.store 2 24
 0048c0: 0b                         |                 end
 0048c1: 41 08                      |                 i32.const 8
 0048c3: 21 08                      |                 local.set 8
 0048c5: 41 0c                      |                 i32.const 12
 0048c7: 21 09                      |                 local.set 9
 0048c9: 20 03                      |                 local.get 3
 0048cb: 21 00                      |                 local.set 0
 0048cd: 20 03                      |                 local.get 3
 0048cf: 21 04                      |                 local.set 4
 0048d1: 0c 01                      |                 br 1
 0048d3: 0b                         |               end
 0048d4: 20 00                      |               local.get 0
 0048d6: 28 02 08                   |               i32.load 2 8
 0048d9: 21 04                      |               local.set 4
 0048db: 20 00                      |               local.get 0
 0048dd: 20 03                      |               local.get 3
 0048df: 36 02 08                   |               i32.store 2 8
 0048e2: 20 04                      |               local.get 4
 0048e4: 20 03                      |               local.get 3
 0048e6: 36 02 0c                   |               i32.store 2 12
 0048e9: 20 03                      |               local.get 3
 0048eb: 20 04                      |               local.get 4
 0048ed: 36 02 08                   |               i32.store 2 8
 0048f0: 41 00                      |               i32.const 0
 0048f2: 21 04                      |               local.set 4
 0048f4: 41 18                      |               i32.const 24
 0048f6: 21 08                      |               local.set 8
 0048f8: 41 0c                      |               i32.const 12
 0048fa: 21 09                      |               local.set 9
 0048fc: 0b                         |             end
 0048fd: 20 03                      |             local.get 3
 0048ff: 20 09                      |             local.get 9
 004901: 6a                         |             i32.add
 004902: 20 00                      |             local.get 0
 004904: 36 02 00                   |             i32.store 2 0
 004907: 20 03                      |             local.get 3
 004909: 20 08                      |             local.get 8
 00490b: 6a                         |             i32.add
 00490c: 20 04                      |             local.get 4
 00490e: 36 02 00                   |             i32.store 2 0
 004911: 0b                         |           end
 004912: 41 00                      |           i32.const 0
 004914: 28 02 80 96 c0 80 00       |           i32.load 2 1051392
 00491b: 22 04                      |           local.tee 4
 00491d: 20 05                      |           local.get 5
 00491f: 4d                         |           i32.le_u
 004920: 0d 00                      |           br_if 0
 004922: 41 00                      |           i32.const 0
 004924: 28 02 8c 96 c0 80 00       |           i32.load 2 1051404
 00492b: 22 03                      |           local.tee 3
 00492d: 20 05                      |           local.get 5
 00492f: 6a                         |           i32.add
 004930: 22 00                      |           local.tee 0
 004932: 20 04                      |           local.get 4
 004934: 20 05                      |           local.get 5
 004936: 6b                         |           i32.sub
 004937: 22 04                      |           local.tee 4
 004939: 41 01                      |           i32.const 1
 00493b: 72                         |           i32.or
 00493c: 36 02 04                   |           i32.store 2 4
 00493f: 41 00                      |           i32.const 0
 004941: 20 04                      |           local.get 4
 004943: 36 02 80 96 c0 80 00       |           i32.store 2 1051392
 00494a: 41 00                      |           i32.const 0
 00494c: 20 00                      |           local.get 0
 00494e: 36 02 8c 96 c0 80 00       |           i32.store 2 1051404
 004955: 20 03                      |           local.get 3
 004957: 20 05                      |           local.get 5
 004959: 41 03                      |           i32.const 3
 00495b: 72                         |           i32.or
 00495c: 36 02 04                   |           i32.store 2 4
 00495f: 20 03                      |           local.get 3
 004961: 41 08                      |           i32.const 8
 004963: 6a                         |           i32.add
 004964: 21 04                      |           local.set 4
 004966: 0c 04                      |           br 4
 004968: 0b                         |         end
 004969: 41 00                      |         i32.const 0
 00496b: 21 04                      |         local.set 4
 00496d: 41 00                      |         i32.const 0
 00496f: 41 30                      |         i32.const 48
 004971: 36 02 e4 99 c0 80 00       |         i32.store 2 1051876
 004978: 0c 03                      |         br 3
 00497a: 0b                         |       end
 00497b: 20 04                      |       local.get 4
 00497d: 20 08                      |       local.get 8
 00497f: 36 02 00                   |       i32.store 2 0
 004982: 20 04                      |       local.get 4
 004984: 20 04                      |       local.get 4
 004986: 28 02 04                   |       i32.load 2 4
 004989: 20 06                      |       local.get 6
 00498b: 6a                         |       i32.add
 00498c: 36 02 04                   |       i32.store 2 4
 00498f: 20 08                      |       local.get 8
 004991: 20 09                      |       local.get 9
 004993: 20 05                      |       local.get 5
 004995: 10 da 80 80 80 00          |       call 90 <prepend_alloc>
 00499b: 21 04                      |       local.set 4
 00499d: 0c 02                      |       br 2
 00499f: 0b                         |     end
 0049a0: 02 40                      |     block
 0049a2: 20 0b                      |       local.get 11
 0049a4: 45                         |       i32.eqz
 0049a5: 0d 00                      |       br_if 0
 0049a7: 02 40                      |       block
 0049a9: 02 40                      |         block
 0049ab: 20 09                      |           local.get 9
 0049ad: 20 09                      |           local.get 9
 0049af: 28 02 1c                   |           i32.load 2 28
 0049b2: 22 08                      |           local.tee 8
 0049b4: 41 02                      |           i32.const 2
 0049b6: 74                         |           i32.shl
 0049b7: 41 a4 98 c0 80 00          |           i32.const 1051684
 0049bd: 6a                         |           i32.add
 0049be: 22 00                      |           local.tee 0
 0049c0: 28 02 00                   |           i32.load 2 0
 0049c3: 47                         |           i32.ne
 0049c4: 0d 00                      |           br_if 0
 0049c6: 20 00                      |           local.get 0
 0049c8: 20 04                      |           local.get 4
 0049ca: 36 02 00                   |           i32.store 2 0
 0049cd: 20 04                      |           local.get 4
 0049cf: 0d 01                      |           br_if 1
 0049d1: 41 00                      |           i32.const 0
 0049d3: 20 0a                      |           local.get 10
 0049d5: 41 7e                      |           i32.const 4294967294
 0049d7: 20 08                      |           local.get 8
 0049d9: 77                         |           i32.rotl
 0049da: 71                         |           i32.and
 0049db: 22 0a                      |           local.tee 10
 0049dd: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 0049e4: 0c 02                      |           br 2
 0049e6: 0b                         |         end
 0049e7: 20 0b                      |         local.get 11
 0049e9: 41 10                      |         i32.const 16
 0049eb: 41 14                      |         i32.const 20
 0049ed: 20 0b                      |         local.get 11
 0049ef: 28 02 10                   |         i32.load 2 16
 0049f2: 20 09                      |         local.get 9
 0049f4: 46                         |         i32.eq
 0049f5: 1b                         |         select
 0049f6: 6a                         |         i32.add
 0049f7: 20 04                      |         local.get 4
 0049f9: 36 02 00                   |         i32.store 2 0
 0049fc: 20 04                      |         local.get 4
 0049fe: 45                         |         i32.eqz
 0049ff: 0d 01                      |         br_if 1
 004a01: 0b                         |       end
 004a02: 20 04                      |       local.get 4
 004a04: 20 0b                      |       local.get 11
 004a06: 36 02 18                   |       i32.store 2 24
 004a09: 02 40                      |       block
 004a0b: 20 09                      |         local.get 9
 004a0d: 28 02 10                   |         i32.load 2 16
 004a10: 22 00                      |         local.tee 0
 004a12: 45                         |         i32.eqz
 004a13: 0d 00                      |         br_if 0
 004a15: 20 04                      |         local.get 4
 004a17: 20 00                      |         local.get 0
 004a19: 36 02 10                   |         i32.store 2 16
 004a1c: 20 00                      |         local.get 0
 004a1e: 20 04                      |         local.get 4
 004a20: 36 02 18                   |         i32.store 2 24
 004a23: 0b                         |       end
 004a24: 20 09                      |       local.get 9
 004a26: 28 02 14                   |       i32.load 2 20
 004a29: 22 00                      |       local.tee 0
 004a2b: 45                         |       i32.eqz
 004a2c: 0d 00                      |       br_if 0
 004a2e: 20 04                      |       local.get 4
 004a30: 20 00                      |       local.get 0
 004a32: 36 02 14                   |       i32.store 2 20
 004a35: 20 00                      |       local.get 0
 004a37: 20 04                      |       local.get 4
 004a39: 36 02 18                   |       i32.store 2 24
 004a3c: 0b                         |     end
 004a3d: 02 40                      |     block
 004a3f: 02 40                      |       block
 004a41: 20 03                      |         local.get 3
 004a43: 41 0f                      |         i32.const 15
 004a45: 4b                         |         i32.gt_u
 004a46: 0d 00                      |         br_if 0
 004a48: 20 09                      |         local.get 9
 004a4a: 20 03                      |         local.get 3
 004a4c: 20 05                      |         local.get 5
 004a4e: 72                         |         i32.or
 004a4f: 22 04                      |         local.tee 4
 004a51: 41 03                      |         i32.const 3
 004a53: 72                         |         i32.or
 004a54: 36 02 04                   |         i32.store 2 4
 004a57: 20 09                      |         local.get 9
 004a59: 20 04                      |         local.get 4
 004a5b: 6a                         |         i32.add
 004a5c: 22 04                      |         local.tee 4
 004a5e: 20 04                      |         local.get 4
 004a60: 28 02 04                   |         i32.load 2 4
 004a63: 41 01                      |         i32.const 1
 004a65: 72                         |         i32.or
 004a66: 36 02 04                   |         i32.store 2 4
 004a69: 0c 01                      |         br 1
 004a6b: 0b                         |       end
 004a6c: 20 09                      |       local.get 9
 004a6e: 20 05                      |       local.get 5
 004a70: 6a                         |       i32.add
 004a71: 22 08                      |       local.tee 8
 004a73: 20 03                      |       local.get 3
 004a75: 41 01                      |       i32.const 1
 004a77: 72                         |       i32.or
 004a78: 36 02 04                   |       i32.store 2 4
 004a7b: 20 09                      |       local.get 9
 004a7d: 20 05                      |       local.get 5
 004a7f: 41 03                      |       i32.const 3
 004a81: 72                         |       i32.or
 004a82: 36 02 04                   |       i32.store 2 4
 004a85: 20 08                      |       local.get 8
 004a87: 20 03                      |       local.get 3
 004a89: 6a                         |       i32.add
 004a8a: 20 03                      |       local.get 3
 004a8c: 36 02 00                   |       i32.store 2 0
 004a8f: 02 40                      |       block
 004a91: 20 03                      |         local.get 3
 004a93: 41 ff 01                   |         i32.const 255
 004a96: 4b                         |         i32.gt_u
 004a97: 0d 00                      |         br_if 0
 004a99: 20 03                      |         local.get 3
 004a9b: 41 78                      |         i32.const 4294967288
 004a9d: 71                         |         i32.and
 004a9e: 41 9c 96 c0 80 00          |         i32.const 1051420
 004aa4: 6a                         |         i32.add
 004aa5: 21 04                      |         local.set 4
 004aa7: 02 40                      |         block
 004aa9: 02 40                      |           block
 004aab: 41 00                      |             i32.const 0
 004aad: 28 02 f4 95 c0 80 00       |             i32.load 2 1051380
 004ab4: 22 05                      |             local.tee 5
 004ab6: 41 01                      |             i32.const 1
 004ab8: 20 03                      |             local.get 3
 004aba: 41 03                      |             i32.const 3
 004abc: 76                         |             i32.shr_u
 004abd: 74                         |             i32.shl
 004abe: 22 03                      |             local.tee 3
 004ac0: 71                         |             i32.and
 004ac1: 0d 00                      |             br_if 0
 004ac3: 41 00                      |             i32.const 0
 004ac5: 20 05                      |             local.get 5
 004ac7: 20 03                      |             local.get 3
 004ac9: 72                         |             i32.or
 004aca: 36 02 f4 95 c0 80 00       |             i32.store 2 1051380
 004ad1: 20 04                      |             local.get 4
 004ad3: 21 03                      |             local.set 3
 004ad5: 0c 01                      |             br 1
 004ad7: 0b                         |           end
 004ad8: 20 04                      |           local.get 4
 004ada: 28 02 08                   |           i32.load 2 8
 004add: 21 03                      |           local.set 3
 004adf: 0b                         |         end
 004ae0: 20 03                      |         local.get 3
 004ae2: 20 08                      |         local.get 8
 004ae4: 36 02 0c                   |         i32.store 2 12
 004ae7: 20 04                      |         local.get 4
 004ae9: 20 08                      |         local.get 8
 004aeb: 36 02 08                   |         i32.store 2 8
 004aee: 20 08                      |         local.get 8
 004af0: 20 04                      |         local.get 4
 004af2: 36 02 0c                   |         i32.store 2 12
 004af5: 20 08                      |         local.get 8
 004af7: 20 03                      |         local.get 3
 004af9: 36 02 08                   |         i32.store 2 8
 004afc: 0c 01                      |         br 1
 004afe: 0b                         |       end
 004aff: 41 1f                      |       i32.const 31
 004b01: 21 04                      |       local.set 4
 004b03: 02 40                      |       block
 004b05: 20 03                      |         local.get 3
 004b07: 41 ff ff ff 07             |         i32.const 16777215
 004b0c: 4b                         |         i32.gt_u
 004b0d: 0d 00                      |         br_if 0
 004b0f: 20 03                      |         local.get 3
 004b11: 41 26                      |         i32.const 38
 004b13: 20 03                      |         local.get 3
 004b15: 41 08                      |         i32.const 8
 004b17: 76                         |         i32.shr_u
 004b18: 67                         |         i32.clz
 004b19: 22 04                      |         local.tee 4
 004b1b: 6b                         |         i32.sub
 004b1c: 76                         |         i32.shr_u
 004b1d: 41 01                      |         i32.const 1
 004b1f: 71                         |         i32.and
 004b20: 20 04                      |         local.get 4
 004b22: 41 01                      |         i32.const 1
 004b24: 74                         |         i32.shl
 004b25: 6b                         |         i32.sub
 004b26: 41 3e                      |         i32.const 62
 004b28: 6a                         |         i32.add
 004b29: 21 04                      |         local.set 4
 004b2b: 0b                         |       end
 004b2c: 20 08                      |       local.get 8
 004b2e: 20 04                      |       local.get 4
 004b30: 36 02 1c                   |       i32.store 2 28
 004b33: 20 08                      |       local.get 8
 004b35: 42 00                      |       i64.const 0
 004b37: 37 02 10                   |       i64.store 2 16
 004b3a: 20 04                      |       local.get 4
 004b3c: 41 02                      |       i32.const 2
 004b3e: 74                         |       i32.shl
 004b3f: 41 a4 98 c0 80 00          |       i32.const 1051684
 004b45: 6a                         |       i32.add
 004b46: 21 05                      |       local.set 5
 004b48: 02 40                      |       block
 004b4a: 20 0a                      |         local.get 10
 004b4c: 41 01                      |         i32.const 1
 004b4e: 20 04                      |         local.get 4
 004b50: 74                         |         i32.shl
 004b51: 22 00                      |         local.tee 0
 004b53: 71                         |         i32.and
 004b54: 0d 00                      |         br_if 0
 004b56: 20 05                      |         local.get 5
 004b58: 20 08                      |         local.get 8
 004b5a: 36 02 00                   |         i32.store 2 0
 004b5d: 41 00                      |         i32.const 0
 004b5f: 20 0a                      |         local.get 10
 004b61: 20 00                      |         local.get 0
 004b63: 72                         |         i32.or
 004b64: 36 02 f8 95 c0 80 00       |         i32.store 2 1051384
 004b6b: 20 08                      |         local.get 8
 004b6d: 20 05                      |         local.get 5
 004b6f: 36 02 18                   |         i32.store 2 24
 004b72: 20 08                      |         local.get 8
 004b74: 20 08                      |         local.get 8
 004b76: 36 02 08                   |         i32.store 2 8
 004b79: 20 08                      |         local.get 8
 004b7b: 20 08                      |         local.get 8
 004b7d: 36 02 0c                   |         i32.store 2 12
 004b80: 0c 01                      |         br 1
 004b82: 0b                         |       end
 004b83: 20 03                      |       local.get 3
 004b85: 41 00                      |       i32.const 0
 004b87: 41 19                      |       i32.const 25
 004b89: 20 04                      |       local.get 4
 004b8b: 41 01                      |       i32.const 1
 004b8d: 76                         |       i32.shr_u
 004b8e: 6b                         |       i32.sub
 004b8f: 20 04                      |       local.get 4
 004b91: 41 1f                      |       i32.const 31
 004b93: 46                         |       i32.eq
 004b94: 1b                         |       select
 004b95: 74                         |       i32.shl
 004b96: 21 04                      |       local.set 4
 004b98: 20 05                      |       local.get 5
 004b9a: 28 02 00                   |       i32.load 2 0
 004b9d: 21 00                      |       local.set 0
 004b9f: 02 40                      |       block
 004ba1: 03 40                      |         loop
 004ba3: 20 00                      |           local.get 0
 004ba5: 22 05                      |           local.tee 5
 004ba7: 28 02 04                   |           i32.load 2 4
 004baa: 41 78                      |           i32.const 4294967288
 004bac: 71                         |           i32.and
 004bad: 20 03                      |           local.get 3
 004baf: 46                         |           i32.eq
 004bb0: 0d 01                      |           br_if 1
 004bb2: 20 04                      |           local.get 4
 004bb4: 41 1d                      |           i32.const 29
 004bb6: 76                         |           i32.shr_u
 004bb7: 21 00                      |           local.set 0
 004bb9: 20 04                      |           local.get 4
 004bbb: 41 01                      |           i32.const 1
 004bbd: 74                         |           i32.shl
 004bbe: 21 04                      |           local.set 4
 004bc0: 20 05                      |           local.get 5
 004bc2: 20 00                      |           local.get 0
 004bc4: 41 04                      |           i32.const 4
 004bc6: 71                         |           i32.and
 004bc7: 6a                         |           i32.add
 004bc8: 41 10                      |           i32.const 16
 004bca: 6a                         |           i32.add
 004bcb: 22 06                      |           local.tee 6
 004bcd: 28 02 00                   |           i32.load 2 0
 004bd0: 22 00                      |           local.tee 0
 004bd2: 0d 00                      |           br_if 0
 004bd4: 0b                         |         end
 004bd5: 20 06                      |         local.get 6
 004bd7: 20 08                      |         local.get 8
 004bd9: 36 02 00                   |         i32.store 2 0
 004bdc: 20 08                      |         local.get 8
 004bde: 20 05                      |         local.get 5
 004be0: 36 02 18                   |         i32.store 2 24
 004be3: 20 08                      |         local.get 8
 004be5: 20 08                      |         local.get 8
 004be7: 36 02 0c                   |         i32.store 2 12
 004bea: 20 08                      |         local.get 8
 004bec: 20 08                      |         local.get 8
 004bee: 36 02 08                   |         i32.store 2 8
 004bf1: 0c 01                      |         br 1
 004bf3: 0b                         |       end
 004bf4: 20 05                      |       local.get 5
 004bf6: 28 02 08                   |       i32.load 2 8
 004bf9: 22 04                      |       local.tee 4
 004bfb: 20 08                      |       local.get 8
 004bfd: 36 02 0c                   |       i32.store 2 12
 004c00: 20 05                      |       local.get 5
 004c02: 20 08                      |       local.get 8
 004c04: 36 02 08                   |       i32.store 2 8
 004c07: 20 08                      |       local.get 8
 004c09: 41 00                      |       i32.const 0
 004c0b: 36 02 18                   |       i32.store 2 24
 004c0e: 20 08                      |       local.get 8
 004c10: 20 05                      |       local.get 5
 004c12: 36 02 0c                   |       i32.store 2 12
 004c15: 20 08                      |       local.get 8
 004c17: 20 04                      |       local.get 4
 004c19: 36 02 08                   |       i32.store 2 8
 004c1c: 0b                         |     end
 004c1d: 20 09                      |     local.get 9
 004c1f: 41 08                      |     i32.const 8
 004c21: 6a                         |     i32.add
 004c22: 21 04                      |     local.set 4
 004c24: 0c 01                      |     br 1
 004c26: 0b                         |   end
 004c27: 02 40                      |   block
 004c29: 20 02                      |     local.get 2
 004c2b: 45                         |     i32.eqz
 004c2c: 0d 00                      |     br_if 0
 004c2e: 02 40                      |     block
 004c30: 02 40                      |       block
 004c32: 20 08                      |         local.get 8
 004c34: 20 08                      |         local.get 8
 004c36: 28 02 1c                   |         i32.load 2 28
 004c39: 22 09                      |         local.tee 9
 004c3b: 41 02                      |         i32.const 2
 004c3d: 74                         |         i32.shl
 004c3e: 41 a4 98 c0 80 00          |         i32.const 1051684
 004c44: 6a                         |         i32.add
 004c45: 22 00                      |         local.tee 0
 004c47: 28 02 00                   |         i32.load 2 0
 004c4a: 47                         |         i32.ne
 004c4b: 0d 00                      |         br_if 0
 004c4d: 20 00                      |         local.get 0
 004c4f: 20 04                      |         local.get 4
 004c51: 36 02 00                   |         i32.store 2 0
 004c54: 20 04                      |         local.get 4
 004c56: 0d 01                      |         br_if 1
 004c58: 41 00                      |         i32.const 0
 004c5a: 20 0a                      |         local.get 10
 004c5c: 41 7e                      |         i32.const 4294967294
 004c5e: 20 09                      |         local.get 9
 004c60: 77                         |         i32.rotl
 004c61: 71                         |         i32.and
 004c62: 36 02 f8 95 c0 80 00       |         i32.store 2 1051384
 004c69: 0c 02                      |         br 2
 004c6b: 0b                         |       end
 004c6c: 20 02                      |       local.get 2
 004c6e: 41 10                      |       i32.const 16
 004c70: 41 14                      |       i32.const 20
 004c72: 20 02                      |       local.get 2
 004c74: 28 02 10                   |       i32.load 2 16
 004c77: 20 08                      |       local.get 8
 004c79: 46                         |       i32.eq
 004c7a: 1b                         |       select
 004c7b: 6a                         |       i32.add
 004c7c: 20 04                      |       local.get 4
 004c7e: 36 02 00                   |       i32.store 2 0
 004c81: 20 04                      |       local.get 4
 004c83: 45                         |       i32.eqz
 004c84: 0d 01                      |       br_if 1
 004c86: 0b                         |     end
 004c87: 20 04                      |     local.get 4
 004c89: 20 02                      |     local.get 2
 004c8b: 36 02 18                   |     i32.store 2 24
 004c8e: 02 40                      |     block
 004c90: 20 08                      |       local.get 8
 004c92: 28 02 10                   |       i32.load 2 16
 004c95: 22 00                      |       local.tee 0
 004c97: 45                         |       i32.eqz
 004c98: 0d 00                      |       br_if 0
 004c9a: 20 04                      |       local.get 4
 004c9c: 20 00                      |       local.get 0
 004c9e: 36 02 10                   |       i32.store 2 16
 004ca1: 20 00                      |       local.get 0
 004ca3: 20 04                      |       local.get 4
 004ca5: 36 02 18                   |       i32.store 2 24
 004ca8: 0b                         |     end
 004ca9: 20 08                      |     local.get 8
 004cab: 28 02 14                   |     i32.load 2 20
 004cae: 22 00                      |     local.tee 0
 004cb0: 45                         |     i32.eqz
 004cb1: 0d 00                      |     br_if 0
 004cb3: 20 04                      |     local.get 4
 004cb5: 20 00                      |     local.get 0
 004cb7: 36 02 14                   |     i32.store 2 20
 004cba: 20 00                      |     local.get 0
 004cbc: 20 04                      |     local.get 4
 004cbe: 36 02 18                   |     i32.store 2 24
 004cc1: 0b                         |   end
 004cc2: 02 40                      |   block
 004cc4: 02 40                      |     block
 004cc6: 20 03                      |       local.get 3
 004cc8: 41 0f                      |       i32.const 15
 004cca: 4b                         |       i32.gt_u
 004ccb: 0d 00                      |       br_if 0
 004ccd: 20 08                      |       local.get 8
 004ccf: 20 03                      |       local.get 3
 004cd1: 20 05                      |       local.get 5
 004cd3: 72                         |       i32.or
 004cd4: 22 04                      |       local.tee 4
 004cd6: 41 03                      |       i32.const 3
 004cd8: 72                         |       i32.or
 004cd9: 36 02 04                   |       i32.store 2 4
 004cdc: 20 08                      |       local.get 8
 004cde: 20 04                      |       local.get 4
 004ce0: 6a                         |       i32.add
 004ce1: 22 04                      |       local.tee 4
 004ce3: 20 04                      |       local.get 4
 004ce5: 28 02 04                   |       i32.load 2 4
 004ce8: 41 01                      |       i32.const 1
 004cea: 72                         |       i32.or
 004ceb: 36 02 04                   |       i32.store 2 4
 004cee: 0c 01                      |       br 1
 004cf0: 0b                         |     end
 004cf1: 20 08                      |     local.get 8
 004cf3: 20 05                      |     local.get 5
 004cf5: 6a                         |     i32.add
 004cf6: 22 00                      |     local.tee 0
 004cf8: 20 03                      |     local.get 3
 004cfa: 41 01                      |     i32.const 1
 004cfc: 72                         |     i32.or
 004cfd: 36 02 04                   |     i32.store 2 4
 004d00: 20 08                      |     local.get 8
 004d02: 20 05                      |     local.get 5
 004d04: 41 03                      |     i32.const 3
 004d06: 72                         |     i32.or
 004d07: 36 02 04                   |     i32.store 2 4
 004d0a: 20 00                      |     local.get 0
 004d0c: 20 03                      |     local.get 3
 004d0e: 6a                         |     i32.add
 004d0f: 20 03                      |     local.get 3
 004d11: 36 02 00                   |     i32.store 2 0
 004d14: 02 40                      |     block
 004d16: 20 07                      |       local.get 7
 004d18: 45                         |       i32.eqz
 004d19: 0d 00                      |       br_if 0
 004d1b: 20 07                      |       local.get 7
 004d1d: 41 78                      |       i32.const 4294967288
 004d1f: 71                         |       i32.and
 004d20: 41 9c 96 c0 80 00          |       i32.const 1051420
 004d26: 6a                         |       i32.add
 004d27: 21 05                      |       local.set 5
 004d29: 41 00                      |       i32.const 0
 004d2b: 28 02 88 96 c0 80 00       |       i32.load 2 1051400
 004d32: 21 04                      |       local.set 4
 004d34: 02 40                      |       block
 004d36: 02 40                      |         block
 004d38: 41 01                      |           i32.const 1
 004d3a: 20 07                      |           local.get 7
 004d3c: 41 03                      |           i32.const 3
 004d3e: 76                         |           i32.shr_u
 004d3f: 74                         |           i32.shl
 004d40: 22 09                      |           local.tee 9
 004d42: 20 06                      |           local.get 6
 004d44: 71                         |           i32.and
 004d45: 0d 00                      |           br_if 0
 004d47: 41 00                      |           i32.const 0
 004d49: 20 09                      |           local.get 9
 004d4b: 20 06                      |           local.get 6
 004d4d: 72                         |           i32.or
 004d4e: 36 02 f4 95 c0 80 00       |           i32.store 2 1051380
 004d55: 20 05                      |           local.get 5
 004d57: 21 09                      |           local.set 9
 004d59: 0c 01                      |           br 1
 004d5b: 0b                         |         end
 004d5c: 20 05                      |         local.get 5
 004d5e: 28 02 08                   |         i32.load 2 8
 004d61: 21 09                      |         local.set 9
 004d63: 0b                         |       end
 004d64: 20 09                      |       local.get 9
 004d66: 20 04                      |       local.get 4
 004d68: 36 02 0c                   |       i32.store 2 12
 004d6b: 20 05                      |       local.get 5
 004d6d: 20 04                      |       local.get 4
 004d6f: 36 02 08                   |       i32.store 2 8
 004d72: 20 04                      |       local.get 4
 004d74: 20 05                      |       local.get 5
 004d76: 36 02 0c                   |       i32.store 2 12
 004d79: 20 04                      |       local.get 4
 004d7b: 20 09                      |       local.get 9
 004d7d: 36 02 08                   |       i32.store 2 8
 004d80: 0b                         |     end
 004d81: 41 00                      |     i32.const 0
 004d83: 20 00                      |     local.get 0
 004d85: 36 02 88 96 c0 80 00       |     i32.store 2 1051400
 004d8c: 41 00                      |     i32.const 0
 004d8e: 20 03                      |     local.get 3
 004d90: 36 02 fc 95 c0 80 00       |     i32.store 2 1051388
 004d97: 0b                         |   end
 004d98: 20 08                      |   local.get 8
 004d9a: 41 08                      |   i32.const 8
 004d9c: 6a                         |   i32.add
 004d9d: 21 04                      |   local.set 4
 004d9f: 0b                         | end
 004da0: 20 01                      | local.get 1
 004da2: 41 10                      | i32.const 16
 004da4: 6a                         | i32.add
 004da5: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 004dab: 20 04                      | local.get 4
 004dad: 0b                         | end
004db0 func[90] <prepend_alloc>:
 004db1: 07 7f                      | local[3..9] type=i32
 004db3: 20 00                      | local.get 0
 004db5: 41 78                      | i32.const 4294967288
 004db7: 20 00                      | local.get 0
 004db9: 6b                         | i32.sub
 004dba: 41 0f                      | i32.const 15
 004dbc: 71                         | i32.and
 004dbd: 6a                         | i32.add
 004dbe: 22 03                      | local.tee 3
 004dc0: 20 02                      | local.get 2
 004dc2: 41 03                      | i32.const 3
 004dc4: 72                         | i32.or
 004dc5: 36 02 04                   | i32.store 2 4
 004dc8: 20 01                      | local.get 1
 004dca: 41 78                      | i32.const 4294967288
 004dcc: 20 01                      | local.get 1
 004dce: 6b                         | i32.sub
 004dcf: 41 0f                      | i32.const 15
 004dd1: 71                         | i32.and
 004dd2: 6a                         | i32.add
 004dd3: 22 04                      | local.tee 4
 004dd5: 20 03                      | local.get 3
 004dd7: 20 02                      | local.get 2
 004dd9: 6a                         | i32.add
 004dda: 22 05                      | local.tee 5
 004ddc: 6b                         | i32.sub
 004ddd: 21 00                      | local.set 0
 004ddf: 02 40                      | block
 004de1: 02 40                      |   block
 004de3: 20 04                      |     local.get 4
 004de5: 41 00                      |     i32.const 0
 004de7: 28 02 8c 96 c0 80 00       |     i32.load 2 1051404
 004dee: 47                         |     i32.ne
 004def: 0d 00                      |     br_if 0
 004df1: 41 00                      |     i32.const 0
 004df3: 20 05                      |     local.get 5
 004df5: 36 02 8c 96 c0 80 00       |     i32.store 2 1051404
 004dfc: 41 00                      |     i32.const 0
 004dfe: 41 00                      |     i32.const 0
 004e00: 28 02 80 96 c0 80 00       |     i32.load 2 1051392
 004e07: 20 00                      |     local.get 0
 004e09: 6a                         |     i32.add
 004e0a: 22 02                      |     local.tee 2
 004e0c: 36 02 80 96 c0 80 00       |     i32.store 2 1051392
 004e13: 20 05                      |     local.get 5
 004e15: 20 02                      |     local.get 2
 004e17: 41 01                      |     i32.const 1
 004e19: 72                         |     i32.or
 004e1a: 36 02 04                   |     i32.store 2 4
 004e1d: 0c 01                      |     br 1
 004e1f: 0b                         |   end
 004e20: 02 40                      |   block
 004e22: 20 04                      |     local.get 4
 004e24: 41 00                      |     i32.const 0
 004e26: 28 02 88 96 c0 80 00       |     i32.load 2 1051400
 004e2d: 47                         |     i32.ne
 004e2e: 0d 00                      |     br_if 0
 004e30: 41 00                      |     i32.const 0
 004e32: 20 05                      |     local.get 5
 004e34: 36 02 88 96 c0 80 00       |     i32.store 2 1051400
 004e3b: 41 00                      |     i32.const 0
 004e3d: 41 00                      |     i32.const 0
 004e3f: 28 02 fc 95 c0 80 00       |     i32.load 2 1051388
 004e46: 20 00                      |     local.get 0
 004e48: 6a                         |     i32.add
 004e49: 22 02                      |     local.tee 2
 004e4b: 36 02 fc 95 c0 80 00       |     i32.store 2 1051388
 004e52: 20 05                      |     local.get 5
 004e54: 20 02                      |     local.get 2
 004e56: 41 01                      |     i32.const 1
 004e58: 72                         |     i32.or
 004e59: 36 02 04                   |     i32.store 2 4
 004e5c: 20 05                      |     local.get 5
 004e5e: 20 02                      |     local.get 2
 004e60: 6a                         |     i32.add
 004e61: 20 02                      |     local.get 2
 004e63: 36 02 00                   |     i32.store 2 0
 004e66: 0c 01                      |     br 1
 004e68: 0b                         |   end
 004e69: 02 40                      |   block
 004e6b: 20 04                      |     local.get 4
 004e6d: 28 02 04                   |     i32.load 2 4
 004e70: 22 01                      |     local.tee 1
 004e72: 41 03                      |     i32.const 3
 004e74: 71                         |     i32.and
 004e75: 41 01                      |     i32.const 1
 004e77: 47                         |     i32.ne
 004e78: 0d 00                      |     br_if 0
 004e7a: 20 01                      |     local.get 1
 004e7c: 41 78                      |     i32.const 4294967288
 004e7e: 71                         |     i32.and
 004e7f: 21 06                      |     local.set 6
 004e81: 20 04                      |     local.get 4
 004e83: 28 02 0c                   |     i32.load 2 12
 004e86: 21 02                      |     local.set 2
 004e88: 02 40                      |     block
 004e8a: 02 40                      |       block
 004e8c: 20 01                      |         local.get 1
 004e8e: 41 ff 01                   |         i32.const 255
 004e91: 4b                         |         i32.gt_u
 004e92: 0d 00                      |         br_if 0
 004e94: 02 40                      |         block
 004e96: 20 02                      |           local.get 2
 004e98: 20 04                      |           local.get 4
 004e9a: 28 02 08                   |           i32.load 2 8
 004e9d: 22 07                      |           local.tee 7
 004e9f: 47                         |           i32.ne
 004ea0: 0d 00                      |           br_if 0
 004ea2: 41 00                      |           i32.const 0
 004ea4: 41 00                      |           i32.const 0
 004ea6: 28 02 f4 95 c0 80 00       |           i32.load 2 1051380
 004ead: 41 7e                      |           i32.const 4294967294
 004eaf: 20 01                      |           local.get 1
 004eb1: 41 03                      |           i32.const 3
 004eb3: 76                         |           i32.shr_u
 004eb4: 77                         |           i32.rotl
 004eb5: 71                         |           i32.and
 004eb6: 36 02 f4 95 c0 80 00       |           i32.store 2 1051380
 004ebd: 0c 02                      |           br 2
 004ebf: 0b                         |         end
 004ec0: 20 02                      |         local.get 2
 004ec2: 20 07                      |         local.get 7
 004ec4: 36 02 08                   |         i32.store 2 8
 004ec7: 20 07                      |         local.get 7
 004ec9: 20 02                      |         local.get 2
 004ecb: 36 02 0c                   |         i32.store 2 12
 004ece: 0c 01                      |         br 1
 004ed0: 0b                         |       end
 004ed1: 20 04                      |       local.get 4
 004ed3: 28 02 18                   |       i32.load 2 24
 004ed6: 21 08                      |       local.set 8
 004ed8: 02 40                      |       block
 004eda: 02 40                      |         block
 004edc: 20 02                      |           local.get 2
 004ede: 20 04                      |           local.get 4
 004ee0: 46                         |           i32.eq
 004ee1: 0d 00                      |           br_if 0
 004ee3: 20 04                      |           local.get 4
 004ee5: 28 02 08                   |           i32.load 2 8
 004ee8: 22 01                      |           local.tee 1
 004eea: 20 02                      |           local.get 2
 004eec: 36 02 0c                   |           i32.store 2 12
 004eef: 20 02                      |           local.get 2
 004ef1: 20 01                      |           local.get 1
 004ef3: 36 02 08                   |           i32.store 2 8
 004ef6: 0c 01                      |           br 1
 004ef8: 0b                         |         end
 004ef9: 02 40                      |         block
 004efb: 02 40                      |           block
 004efd: 02 40                      |             block
 004eff: 20 04                      |               local.get 4
 004f01: 28 02 14                   |               i32.load 2 20
 004f04: 22 01                      |               local.tee 1
 004f06: 45                         |               i32.eqz
 004f07: 0d 00                      |               br_if 0
 004f09: 20 04                      |               local.get 4
 004f0b: 41 14                      |               i32.const 20
 004f0d: 6a                         |               i32.add
 004f0e: 21 07                      |               local.set 7
 004f10: 0c 01                      |               br 1
 004f12: 0b                         |             end
 004f13: 20 04                      |             local.get 4
 004f15: 28 02 10                   |             i32.load 2 16
 004f18: 22 01                      |             local.tee 1
 004f1a: 45                         |             i32.eqz
 004f1b: 0d 01                      |             br_if 1
 004f1d: 20 04                      |             local.get 4
 004f1f: 41 10                      |             i32.const 16
 004f21: 6a                         |             i32.add
 004f22: 21 07                      |             local.set 7
 004f24: 0b                         |           end
 004f25: 03 40                      |           loop
 004f27: 20 07                      |             local.get 7
 004f29: 21 09                      |             local.set 9
 004f2b: 20 01                      |             local.get 1
 004f2d: 22 02                      |             local.tee 2
 004f2f: 41 14                      |             i32.const 20
 004f31: 6a                         |             i32.add
 004f32: 21 07                      |             local.set 7
 004f34: 20 02                      |             local.get 2
 004f36: 28 02 14                   |             i32.load 2 20
 004f39: 22 01                      |             local.tee 1
 004f3b: 0d 00                      |             br_if 0
 004f3d: 20 02                      |             local.get 2
 004f3f: 41 10                      |             i32.const 16
 004f41: 6a                         |             i32.add
 004f42: 21 07                      |             local.set 7
 004f44: 20 02                      |             local.get 2
 004f46: 28 02 10                   |             i32.load 2 16
 004f49: 22 01                      |             local.tee 1
 004f4b: 0d 00                      |             br_if 0
 004f4d: 0b                         |           end
 004f4e: 20 09                      |           local.get 9
 004f50: 41 00                      |           i32.const 0
 004f52: 36 02 00                   |           i32.store 2 0
 004f55: 0c 01                      |           br 1
 004f57: 0b                         |         end
 004f58: 41 00                      |         i32.const 0
 004f5a: 21 02                      |         local.set 2
 004f5c: 0b                         |       end
 004f5d: 20 08                      |       local.get 8
 004f5f: 45                         |       i32.eqz
 004f60: 0d 00                      |       br_if 0
 004f62: 02 40                      |       block
 004f64: 02 40                      |         block
 004f66: 20 04                      |           local.get 4
 004f68: 20 04                      |           local.get 4
 004f6a: 28 02 1c                   |           i32.load 2 28
 004f6d: 22 07                      |           local.tee 7
 004f6f: 41 02                      |           i32.const 2
 004f71: 74                         |           i32.shl
 004f72: 41 a4 98 c0 80 00          |           i32.const 1051684
 004f78: 6a                         |           i32.add
 004f79: 22 01                      |           local.tee 1
 004f7b: 28 02 00                   |           i32.load 2 0
 004f7e: 47                         |           i32.ne
 004f7f: 0d 00                      |           br_if 0
 004f81: 20 01                      |           local.get 1
 004f83: 20 02                      |           local.get 2
 004f85: 36 02 00                   |           i32.store 2 0
 004f88: 20 02                      |           local.get 2
 004f8a: 0d 01                      |           br_if 1
 004f8c: 41 00                      |           i32.const 0
 004f8e: 41 00                      |           i32.const 0
 004f90: 28 02 f8 95 c0 80 00       |           i32.load 2 1051384
 004f97: 41 7e                      |           i32.const 4294967294
 004f99: 20 07                      |           local.get 7
 004f9b: 77                         |           i32.rotl
 004f9c: 71                         |           i32.and
 004f9d: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 004fa4: 0c 02                      |           br 2
 004fa6: 0b                         |         end
 004fa7: 20 08                      |         local.get 8
 004fa9: 41 10                      |         i32.const 16
 004fab: 41 14                      |         i32.const 20
 004fad: 20 08                      |         local.get 8
 004faf: 28 02 10                   |         i32.load 2 16
 004fb2: 20 04                      |         local.get 4
 004fb4: 46                         |         i32.eq
 004fb5: 1b                         |         select
 004fb6: 6a                         |         i32.add
 004fb7: 20 02                      |         local.get 2
 004fb9: 36 02 00                   |         i32.store 2 0
 004fbc: 20 02                      |         local.get 2
 004fbe: 45                         |         i32.eqz
 004fbf: 0d 01                      |         br_if 1
 004fc1: 0b                         |       end
 004fc2: 20 02                      |       local.get 2
 004fc4: 20 08                      |       local.get 8
 004fc6: 36 02 18                   |       i32.store 2 24
 004fc9: 02 40                      |       block
 004fcb: 20 04                      |         local.get 4
 004fcd: 28 02 10                   |         i32.load 2 16
 004fd0: 22 01                      |         local.tee 1
 004fd2: 45                         |         i32.eqz
 004fd3: 0d 00                      |         br_if 0
 004fd5: 20 02                      |         local.get 2
 004fd7: 20 01                      |         local.get 1
 004fd9: 36 02 10                   |         i32.store 2 16
 004fdc: 20 01                      |         local.get 1
 004fde: 20 02                      |         local.get 2
 004fe0: 36 02 18                   |         i32.store 2 24
 004fe3: 0b                         |       end
 004fe4: 20 04                      |       local.get 4
 004fe6: 28 02 14                   |       i32.load 2 20
 004fe9: 22 01                      |       local.tee 1
 004feb: 45                         |       i32.eqz
 004fec: 0d 00                      |       br_if 0
 004fee: 20 02                      |       local.get 2
 004ff0: 20 01                      |       local.get 1
 004ff2: 36 02 14                   |       i32.store 2 20
 004ff5: 20 01                      |       local.get 1
 004ff7: 20 02                      |       local.get 2
 004ff9: 36 02 18                   |       i32.store 2 24
 004ffc: 0b                         |     end
 004ffd: 20 06                      |     local.get 6
 004fff: 20 00                      |     local.get 0
 005001: 6a                         |     i32.add
 005002: 21 00                      |     local.set 0
 005004: 20 04                      |     local.get 4
 005006: 20 06                      |     local.get 6
 005008: 6a                         |     i32.add
 005009: 22 04                      |     local.tee 4
 00500b: 28 02 04                   |     i32.load 2 4
 00500e: 21 01                      |     local.set 1
 005010: 0b                         |   end
 005011: 20 04                      |   local.get 4
 005013: 20 01                      |   local.get 1
 005015: 41 7e                      |   i32.const 4294967294
 005017: 71                         |   i32.and
 005018: 36 02 04                   |   i32.store 2 4
 00501b: 20 05                      |   local.get 5
 00501d: 20 00                      |   local.get 0
 00501f: 6a                         |   i32.add
 005020: 20 00                      |   local.get 0
 005022: 36 02 00                   |   i32.store 2 0
 005025: 20 05                      |   local.get 5
 005027: 20 00                      |   local.get 0
 005029: 41 01                      |   i32.const 1
 00502b: 72                         |   i32.or
 00502c: 36 02 04                   |   i32.store 2 4
 00502f: 02 40                      |   block
 005031: 20 00                      |     local.get 0
 005033: 41 ff 01                   |     i32.const 255
 005036: 4b                         |     i32.gt_u
 005037: 0d 00                      |     br_if 0
 005039: 20 00                      |     local.get 0
 00503b: 41 78                      |     i32.const 4294967288
 00503d: 71                         |     i32.and
 00503e: 41 9c 96 c0 80 00          |     i32.const 1051420
 005044: 6a                         |     i32.add
 005045: 21 02                      |     local.set 2
 005047: 02 40                      |     block
 005049: 02 40                      |       block
 00504b: 41 00                      |         i32.const 0
 00504d: 28 02 f4 95 c0 80 00       |         i32.load 2 1051380
 005054: 22 01                      |         local.tee 1
 005056: 41 01                      |         i32.const 1
 005058: 20 00                      |         local.get 0
 00505a: 41 03                      |         i32.const 3
 00505c: 76                         |         i32.shr_u
 00505d: 74                         |         i32.shl
 00505e: 22 00                      |         local.tee 0
 005060: 71                         |         i32.and
 005061: 0d 00                      |         br_if 0
 005063: 41 00                      |         i32.const 0
 005065: 20 01                      |         local.get 1
 005067: 20 00                      |         local.get 0
 005069: 72                         |         i32.or
 00506a: 36 02 f4 95 c0 80 00       |         i32.store 2 1051380
 005071: 20 02                      |         local.get 2
 005073: 21 00                      |         local.set 0
 005075: 0c 01                      |         br 1
 005077: 0b                         |       end
 005078: 20 02                      |       local.get 2
 00507a: 28 02 08                   |       i32.load 2 8
 00507d: 21 00                      |       local.set 0
 00507f: 0b                         |     end
 005080: 20 00                      |     local.get 0
 005082: 20 05                      |     local.get 5
 005084: 36 02 0c                   |     i32.store 2 12
 005087: 20 02                      |     local.get 2
 005089: 20 05                      |     local.get 5
 00508b: 36 02 08                   |     i32.store 2 8
 00508e: 20 05                      |     local.get 5
 005090: 20 02                      |     local.get 2
 005092: 36 02 0c                   |     i32.store 2 12
 005095: 20 05                      |     local.get 5
 005097: 20 00                      |     local.get 0
 005099: 36 02 08                   |     i32.store 2 8
 00509c: 0c 01                      |     br 1
 00509e: 0b                         |   end
 00509f: 41 1f                      |   i32.const 31
 0050a1: 21 02                      |   local.set 2
 0050a3: 02 40                      |   block
 0050a5: 20 00                      |     local.get 0
 0050a7: 41 ff ff ff 07             |     i32.const 16777215
 0050ac: 4b                         |     i32.gt_u
 0050ad: 0d 00                      |     br_if 0
 0050af: 20 00                      |     local.get 0
 0050b1: 41 26                      |     i32.const 38
 0050b3: 20 00                      |     local.get 0
 0050b5: 41 08                      |     i32.const 8
 0050b7: 76                         |     i32.shr_u
 0050b8: 67                         |     i32.clz
 0050b9: 22 02                      |     local.tee 2
 0050bb: 6b                         |     i32.sub
 0050bc: 76                         |     i32.shr_u
 0050bd: 41 01                      |     i32.const 1
 0050bf: 71                         |     i32.and
 0050c0: 20 02                      |     local.get 2
 0050c2: 41 01                      |     i32.const 1
 0050c4: 74                         |     i32.shl
 0050c5: 6b                         |     i32.sub
 0050c6: 41 3e                      |     i32.const 62
 0050c8: 6a                         |     i32.add
 0050c9: 21 02                      |     local.set 2
 0050cb: 0b                         |   end
 0050cc: 20 05                      |   local.get 5
 0050ce: 20 02                      |   local.get 2
 0050d0: 36 02 1c                   |   i32.store 2 28
 0050d3: 20 05                      |   local.get 5
 0050d5: 42 00                      |   i64.const 0
 0050d7: 37 02 10                   |   i64.store 2 16
 0050da: 20 02                      |   local.get 2
 0050dc: 41 02                      |   i32.const 2
 0050de: 74                         |   i32.shl
 0050df: 41 a4 98 c0 80 00          |   i32.const 1051684
 0050e5: 6a                         |   i32.add
 0050e6: 21 01                      |   local.set 1
 0050e8: 02 40                      |   block
 0050ea: 41 00                      |     i32.const 0
 0050ec: 28 02 f8 95 c0 80 00       |     i32.load 2 1051384
 0050f3: 22 07                      |     local.tee 7
 0050f5: 41 01                      |     i32.const 1
 0050f7: 20 02                      |     local.get 2
 0050f9: 74                         |     i32.shl
 0050fa: 22 04                      |     local.tee 4
 0050fc: 71                         |     i32.and
 0050fd: 0d 00                      |     br_if 0
 0050ff: 20 01                      |     local.get 1
 005101: 20 05                      |     local.get 5
 005103: 36 02 00                   |     i32.store 2 0
 005106: 41 00                      |     i32.const 0
 005108: 20 07                      |     local.get 7
 00510a: 20 04                      |     local.get 4
 00510c: 72                         |     i32.or
 00510d: 36 02 f8 95 c0 80 00       |     i32.store 2 1051384
 005114: 20 05                      |     local.get 5
 005116: 20 01                      |     local.get 1
 005118: 36 02 18                   |     i32.store 2 24
 00511b: 20 05                      |     local.get 5
 00511d: 20 05                      |     local.get 5
 00511f: 36 02 08                   |     i32.store 2 8
 005122: 20 05                      |     local.get 5
 005124: 20 05                      |     local.get 5
 005126: 36 02 0c                   |     i32.store 2 12
 005129: 0c 01                      |     br 1
 00512b: 0b                         |   end
 00512c: 20 00                      |   local.get 0
 00512e: 41 00                      |   i32.const 0
 005130: 41 19                      |   i32.const 25
 005132: 20 02                      |   local.get 2
 005134: 41 01                      |   i32.const 1
 005136: 76                         |   i32.shr_u
 005137: 6b                         |   i32.sub
 005138: 20 02                      |   local.get 2
 00513a: 41 1f                      |   i32.const 31
 00513c: 46                         |   i32.eq
 00513d: 1b                         |   select
 00513e: 74                         |   i32.shl
 00513f: 21 02                      |   local.set 2
 005141: 20 01                      |   local.get 1
 005143: 28 02 00                   |   i32.load 2 0
 005146: 21 07                      |   local.set 7
 005148: 02 40                      |   block
 00514a: 03 40                      |     loop
 00514c: 20 07                      |       local.get 7
 00514e: 22 01                      |       local.tee 1
 005150: 28 02 04                   |       i32.load 2 4
 005153: 41 78                      |       i32.const 4294967288
 005155: 71                         |       i32.and
 005156: 20 00                      |       local.get 0
 005158: 46                         |       i32.eq
 005159: 0d 01                      |       br_if 1
 00515b: 20 02                      |       local.get 2
 00515d: 41 1d                      |       i32.const 29
 00515f: 76                         |       i32.shr_u
 005160: 21 07                      |       local.set 7
 005162: 20 02                      |       local.get 2
 005164: 41 01                      |       i32.const 1
 005166: 74                         |       i32.shl
 005167: 21 02                      |       local.set 2
 005169: 20 01                      |       local.get 1
 00516b: 20 07                      |       local.get 7
 00516d: 41 04                      |       i32.const 4
 00516f: 71                         |       i32.and
 005170: 6a                         |       i32.add
 005171: 41 10                      |       i32.const 16
 005173: 6a                         |       i32.add
 005174: 22 04                      |       local.tee 4
 005176: 28 02 00                   |       i32.load 2 0
 005179: 22 07                      |       local.tee 7
 00517b: 0d 00                      |       br_if 0
 00517d: 0b                         |     end
 00517e: 20 04                      |     local.get 4
 005180: 20 05                      |     local.get 5
 005182: 36 02 00                   |     i32.store 2 0
 005185: 20 05                      |     local.get 5
 005187: 20 01                      |     local.get 1
 005189: 36 02 18                   |     i32.store 2 24
 00518c: 20 05                      |     local.get 5
 00518e: 20 05                      |     local.get 5
 005190: 36 02 0c                   |     i32.store 2 12
 005193: 20 05                      |     local.get 5
 005195: 20 05                      |     local.get 5
 005197: 36 02 08                   |     i32.store 2 8
 00519a: 0c 01                      |     br 1
 00519c: 0b                         |   end
 00519d: 20 01                      |   local.get 1
 00519f: 28 02 08                   |   i32.load 2 8
 0051a2: 22 02                      |   local.tee 2
 0051a4: 20 05                      |   local.get 5
 0051a6: 36 02 0c                   |   i32.store 2 12
 0051a9: 20 01                      |   local.get 1
 0051ab: 20 05                      |   local.get 5
 0051ad: 36 02 08                   |   i32.store 2 8
 0051b0: 20 05                      |   local.get 5
 0051b2: 41 00                      |   i32.const 0
 0051b4: 36 02 18                   |   i32.store 2 24
 0051b7: 20 05                      |   local.get 5
 0051b9: 20 01                      |   local.get 1
 0051bb: 36 02 0c                   |   i32.store 2 12
 0051be: 20 05                      |   local.get 5
 0051c0: 20 02                      |   local.get 2
 0051c2: 36 02 08                   |   i32.store 2 8
 0051c5: 0b                         | end
 0051c6: 20 03                      | local.get 3
 0051c8: 41 08                      | i32.const 8
 0051ca: 6a                         | i32.add
 0051cb: 0b                         | end
0051cd func[91] <free>:
 0051ce: 20 00                      | local.get 0
 0051d0: 10 dc 80 80 80 00          | call 92 <dlfree>
 0051d6: 0b                         | end
0051d9 func[92] <dlfree>:
 0051da: 07 7f                      | local[1..7] type=i32
 0051dc: 02 40                      | block
 0051de: 20 00                      |   local.get 0
 0051e0: 45                         |   i32.eqz
 0051e1: 0d 00                      |   br_if 0
 0051e3: 20 00                      |   local.get 0
 0051e5: 41 78                      |   i32.const 4294967288
 0051e7: 6a                         |   i32.add
 0051e8: 22 01                      |   local.tee 1
 0051ea: 20 00                      |   local.get 0
 0051ec: 41 7c                      |   i32.const 4294967292
 0051ee: 6a                         |   i32.add
 0051ef: 28 02 00                   |   i32.load 2 0
 0051f2: 22 02                      |   local.tee 2
 0051f4: 41 78                      |   i32.const 4294967288
 0051f6: 71                         |   i32.and
 0051f7: 22 00                      |   local.tee 0
 0051f9: 6a                         |   i32.add
 0051fa: 21 03                      |   local.set 3
 0051fc: 02 40                      |   block
 0051fe: 20 02                      |     local.get 2
 005200: 41 01                      |     i32.const 1
 005202: 71                         |     i32.and
 005203: 0d 00                      |     br_if 0
 005205: 20 02                      |     local.get 2
 005207: 41 02                      |     i32.const 2
 005209: 71                         |     i32.and
 00520a: 45                         |     i32.eqz
 00520b: 0d 01                      |     br_if 1
 00520d: 20 01                      |     local.get 1
 00520f: 20 01                      |     local.get 1
 005211: 28 02 00                   |     i32.load 2 0
 005214: 22 04                      |     local.tee 4
 005216: 6b                         |     i32.sub
 005217: 22 01                      |     local.tee 1
 005219: 41 00                      |     i32.const 0
 00521b: 28 02 84 96 c0 80 00       |     i32.load 2 1051396
 005222: 49                         |     i32.lt_u
 005223: 0d 01                      |     br_if 1
 005225: 20 04                      |     local.get 4
 005227: 20 00                      |     local.get 0
 005229: 6a                         |     i32.add
 00522a: 21 00                      |     local.set 0
 00522c: 02 40                      |     block
 00522e: 02 40                      |       block
 005230: 02 40                      |         block
 005232: 02 40                      |           block
 005234: 20 01                      |             local.get 1
 005236: 41 00                      |             i32.const 0
 005238: 28 02 88 96 c0 80 00       |             i32.load 2 1051400
 00523f: 46                         |             i32.eq
 005240: 0d 00                      |             br_if 0
 005242: 20 01                      |             local.get 1
 005244: 28 02 0c                   |             i32.load 2 12
 005247: 21 02                      |             local.set 2
 005249: 02 40                      |             block
 00524b: 20 04                      |               local.get 4
 00524d: 41 ff 01                   |               i32.const 255
 005250: 4b                         |               i32.gt_u
 005251: 0d 00                      |               br_if 0
 005253: 20 02                      |               local.get 2
 005255: 20 01                      |               local.get 1
 005257: 28 02 08                   |               i32.load 2 8
 00525a: 22 05                      |               local.tee 5
 00525c: 47                         |               i32.ne
 00525d: 0d 02                      |               br_if 2
 00525f: 41 00                      |               i32.const 0
 005261: 41 00                      |               i32.const 0
 005263: 28 02 f4 95 c0 80 00       |               i32.load 2 1051380
 00526a: 41 7e                      |               i32.const 4294967294
 00526c: 20 04                      |               local.get 4
 00526e: 41 03                      |               i32.const 3
 005270: 76                         |               i32.shr_u
 005271: 77                         |               i32.rotl
 005272: 71                         |               i32.and
 005273: 36 02 f4 95 c0 80 00       |               i32.store 2 1051380
 00527a: 0c 05                      |               br 5
 00527c: 0b                         |             end
 00527d: 20 01                      |             local.get 1
 00527f: 28 02 18                   |             i32.load 2 24
 005282: 21 06                      |             local.set 6
 005284: 02 40                      |             block
 005286: 20 02                      |               local.get 2
 005288: 20 01                      |               local.get 1
 00528a: 46                         |               i32.eq
 00528b: 0d 00                      |               br_if 0
 00528d: 20 01                      |               local.get 1
 00528f: 28 02 08                   |               i32.load 2 8
 005292: 22 04                      |               local.tee 4
 005294: 20 02                      |               local.get 2
 005296: 36 02 0c                   |               i32.store 2 12
 005299: 20 02                      |               local.get 2
 00529b: 20 04                      |               local.get 4
 00529d: 36 02 08                   |               i32.store 2 8
 0052a0: 0c 04                      |               br 4
 0052a2: 0b                         |             end
 0052a3: 02 40                      |             block
 0052a5: 02 40                      |               block
 0052a7: 20 01                      |                 local.get 1
 0052a9: 28 02 14                   |                 i32.load 2 20
 0052ac: 22 04                      |                 local.tee 4
 0052ae: 45                         |                 i32.eqz
 0052af: 0d 00                      |                 br_if 0
 0052b1: 20 01                      |                 local.get 1
 0052b3: 41 14                      |                 i32.const 20
 0052b5: 6a                         |                 i32.add
 0052b6: 21 05                      |                 local.set 5
 0052b8: 0c 01                      |                 br 1
 0052ba: 0b                         |               end
 0052bb: 20 01                      |               local.get 1
 0052bd: 28 02 10                   |               i32.load 2 16
 0052c0: 22 04                      |               local.tee 4
 0052c2: 45                         |               i32.eqz
 0052c3: 0d 03                      |               br_if 3
 0052c5: 20 01                      |               local.get 1
 0052c7: 41 10                      |               i32.const 16
 0052c9: 6a                         |               i32.add
 0052ca: 21 05                      |               local.set 5
 0052cc: 0b                         |             end
 0052cd: 03 40                      |             loop
 0052cf: 20 05                      |               local.get 5
 0052d1: 21 07                      |               local.set 7
 0052d3: 20 04                      |               local.get 4
 0052d5: 22 02                      |               local.tee 2
 0052d7: 41 14                      |               i32.const 20
 0052d9: 6a                         |               i32.add
 0052da: 21 05                      |               local.set 5
 0052dc: 20 02                      |               local.get 2
 0052de: 28 02 14                   |               i32.load 2 20
 0052e1: 22 04                      |               local.tee 4
 0052e3: 0d 00                      |               br_if 0
 0052e5: 20 02                      |               local.get 2
 0052e7: 41 10                      |               i32.const 16
 0052e9: 6a                         |               i32.add
 0052ea: 21 05                      |               local.set 5
 0052ec: 20 02                      |               local.get 2
 0052ee: 28 02 10                   |               i32.load 2 16
 0052f1: 22 04                      |               local.tee 4
 0052f3: 0d 00                      |               br_if 0
 0052f5: 0b                         |             end
 0052f6: 20 07                      |             local.get 7
 0052f8: 41 00                      |             i32.const 0
 0052fa: 36 02 00                   |             i32.store 2 0
 0052fd: 0c 03                      |             br 3
 0052ff: 0b                         |           end
 005300: 20 03                      |           local.get 3
 005302: 28 02 04                   |           i32.load 2 4
 005305: 22 02                      |           local.tee 2
 005307: 41 03                      |           i32.const 3
 005309: 71                         |           i32.and
 00530a: 41 03                      |           i32.const 3
 00530c: 47                         |           i32.ne
 00530d: 0d 03                      |           br_if 3
 00530f: 20 03                      |           local.get 3
 005311: 20 02                      |           local.get 2
 005313: 41 7e                      |           i32.const 4294967294
 005315: 71                         |           i32.and
 005316: 36 02 04                   |           i32.store 2 4
 005319: 41 00                      |           i32.const 0
 00531b: 20 00                      |           local.get 0
 00531d: 36 02 fc 95 c0 80 00       |           i32.store 2 1051388
 005324: 20 03                      |           local.get 3
 005326: 20 00                      |           local.get 0
 005328: 36 02 00                   |           i32.store 2 0
 00532b: 20 01                      |           local.get 1
 00532d: 20 00                      |           local.get 0
 00532f: 41 01                      |           i32.const 1
 005331: 72                         |           i32.or
 005332: 36 02 04                   |           i32.store 2 4
 005335: 0f                         |           return
 005336: 0b                         |         end
 005337: 20 02                      |         local.get 2
 005339: 20 05                      |         local.get 5
 00533b: 36 02 08                   |         i32.store 2 8
 00533e: 20 05                      |         local.get 5
 005340: 20 02                      |         local.get 2
 005342: 36 02 0c                   |         i32.store 2 12
 005345: 0c 02                      |         br 2
 005347: 0b                         |       end
 005348: 41 00                      |       i32.const 0
 00534a: 21 02                      |       local.set 2
 00534c: 0b                         |     end
 00534d: 20 06                      |     local.get 6
 00534f: 45                         |     i32.eqz
 005350: 0d 00                      |     br_if 0
 005352: 02 40                      |     block
 005354: 02 40                      |       block
 005356: 20 01                      |         local.get 1
 005358: 20 01                      |         local.get 1
 00535a: 28 02 1c                   |         i32.load 2 28
 00535d: 22 05                      |         local.tee 5
 00535f: 41 02                      |         i32.const 2
 005361: 74                         |         i32.shl
 005362: 41 a4 98 c0 80 00          |         i32.const 1051684
 005368: 6a                         |         i32.add
 005369: 22 04                      |         local.tee 4
 00536b: 28 02 00                   |         i32.load 2 0
 00536e: 47                         |         i32.ne
 00536f: 0d 00                      |         br_if 0
 005371: 20 04                      |         local.get 4
 005373: 20 02                      |         local.get 2
 005375: 36 02 00                   |         i32.store 2 0
 005378: 20 02                      |         local.get 2
 00537a: 0d 01                      |         br_if 1
 00537c: 41 00                      |         i32.const 0
 00537e: 41 00                      |         i32.const 0
 005380: 28 02 f8 95 c0 80 00       |         i32.load 2 1051384
 005387: 41 7e                      |         i32.const 4294967294
 005389: 20 05                      |         local.get 5
 00538b: 77                         |         i32.rotl
 00538c: 71                         |         i32.and
 00538d: 36 02 f8 95 c0 80 00       |         i32.store 2 1051384
 005394: 0c 02                      |         br 2
 005396: 0b                         |       end
 005397: 20 06                      |       local.get 6
 005399: 41 10                      |       i32.const 16
 00539b: 41 14                      |       i32.const 20
 00539d: 20 06                      |       local.get 6
 00539f: 28 02 10                   |       i32.load 2 16
 0053a2: 20 01                      |       local.get 1
 0053a4: 46                         |       i32.eq
 0053a5: 1b                         |       select
 0053a6: 6a                         |       i32.add
 0053a7: 20 02                      |       local.get 2
 0053a9: 36 02 00                   |       i32.store 2 0
 0053ac: 20 02                      |       local.get 2
 0053ae: 45                         |       i32.eqz
 0053af: 0d 01                      |       br_if 1
 0053b1: 0b                         |     end
 0053b2: 20 02                      |     local.get 2
 0053b4: 20 06                      |     local.get 6
 0053b6: 36 02 18                   |     i32.store 2 24
 0053b9: 02 40                      |     block
 0053bb: 20 01                      |       local.get 1
 0053bd: 28 02 10                   |       i32.load 2 16
 0053c0: 22 04                      |       local.tee 4
 0053c2: 45                         |       i32.eqz
 0053c3: 0d 00                      |       br_if 0
 0053c5: 20 02                      |       local.get 2
 0053c7: 20 04                      |       local.get 4
 0053c9: 36 02 10                   |       i32.store 2 16
 0053cc: 20 04                      |       local.get 4
 0053ce: 20 02                      |       local.get 2
 0053d0: 36 02 18                   |       i32.store 2 24
 0053d3: 0b                         |     end
 0053d4: 20 01                      |     local.get 1
 0053d6: 28 02 14                   |     i32.load 2 20
 0053d9: 22 04                      |     local.tee 4
 0053db: 45                         |     i32.eqz
 0053dc: 0d 00                      |     br_if 0
 0053de: 20 02                      |     local.get 2
 0053e0: 20 04                      |     local.get 4
 0053e2: 36 02 14                   |     i32.store 2 20
 0053e5: 20 04                      |     local.get 4
 0053e7: 20 02                      |     local.get 2
 0053e9: 36 02 18                   |     i32.store 2 24
 0053ec: 0b                         |   end
 0053ed: 20 01                      |   local.get 1
 0053ef: 20 03                      |   local.get 3
 0053f1: 4f                         |   i32.ge_u
 0053f2: 0d 00                      |   br_if 0
 0053f4: 20 03                      |   local.get 3
 0053f6: 28 02 04                   |   i32.load 2 4
 0053f9: 22 04                      |   local.tee 4
 0053fb: 41 01                      |   i32.const 1
 0053fd: 71                         |   i32.and
 0053fe: 45                         |   i32.eqz
 0053ff: 0d 00                      |   br_if 0
 005401: 02 40                      |   block
 005403: 02 40                      |     block
 005405: 02 40                      |       block
 005407: 02 40                      |         block
 005409: 02 40                      |           block
 00540b: 20 04                      |             local.get 4
 00540d: 41 02                      |             i32.const 2
 00540f: 71                         |             i32.and
 005410: 0d 00                      |             br_if 0
 005412: 02 40                      |             block
 005414: 20 03                      |               local.get 3
 005416: 41 00                      |               i32.const 0
 005418: 28 02 8c 96 c0 80 00       |               i32.load 2 1051404
 00541f: 47                         |               i32.ne
 005420: 0d 00                      |               br_if 0
 005422: 41 00                      |               i32.const 0
 005424: 20 01                      |               local.get 1
 005426: 36 02 8c 96 c0 80 00       |               i32.store 2 1051404
 00542d: 41 00                      |               i32.const 0
 00542f: 41 00                      |               i32.const 0
 005431: 28 02 80 96 c0 80 00       |               i32.load 2 1051392
 005438: 20 00                      |               local.get 0
 00543a: 6a                         |               i32.add
 00543b: 22 00                      |               local.tee 0
 00543d: 36 02 80 96 c0 80 00       |               i32.store 2 1051392
 005444: 20 01                      |               local.get 1
 005446: 20 00                      |               local.get 0
 005448: 41 01                      |               i32.const 1
 00544a: 72                         |               i32.or
 00544b: 36 02 04                   |               i32.store 2 4
 00544e: 20 01                      |               local.get 1
 005450: 41 00                      |               i32.const 0
 005452: 28 02 88 96 c0 80 00       |               i32.load 2 1051400
 005459: 47                         |               i32.ne
 00545a: 0d 06                      |               br_if 6
 00545c: 41 00                      |               i32.const 0
 00545e: 41 00                      |               i32.const 0
 005460: 36 02 fc 95 c0 80 00       |               i32.store 2 1051388
 005467: 41 00                      |               i32.const 0
 005469: 41 00                      |               i32.const 0
 00546b: 36 02 88 96 c0 80 00       |               i32.store 2 1051400
 005472: 0f                         |               return
 005473: 0b                         |             end
 005474: 02 40                      |             block
 005476: 20 03                      |               local.get 3
 005478: 41 00                      |               i32.const 0
 00547a: 28 02 88 96 c0 80 00       |               i32.load 2 1051400
 005481: 47                         |               i32.ne
 005482: 0d 00                      |               br_if 0
 005484: 41 00                      |               i32.const 0
 005486: 20 01                      |               local.get 1
 005488: 36 02 88 96 c0 80 00       |               i32.store 2 1051400
 00548f: 41 00                      |               i32.const 0
 005491: 41 00                      |               i32.const 0
 005493: 28 02 fc 95 c0 80 00       |               i32.load 2 1051388
 00549a: 20 00                      |               local.get 0
 00549c: 6a                         |               i32.add
 00549d: 22 00                      |               local.tee 0
 00549f: 36 02 fc 95 c0 80 00       |               i32.store 2 1051388
 0054a6: 20 01                      |               local.get 1
 0054a8: 20 00                      |               local.get 0
 0054aa: 41 01                      |               i32.const 1
 0054ac: 72                         |               i32.or
 0054ad: 36 02 04                   |               i32.store 2 4
 0054b0: 20 01                      |               local.get 1
 0054b2: 20 00                      |               local.get 0
 0054b4: 6a                         |               i32.add
 0054b5: 20 00                      |               local.get 0
 0054b7: 36 02 00                   |               i32.store 2 0
 0054ba: 0f                         |               return
 0054bb: 0b                         |             end
 0054bc: 20 04                      |             local.get 4
 0054be: 41 78                      |             i32.const 4294967288
 0054c0: 71                         |             i32.and
 0054c1: 20 00                      |             local.get 0
 0054c3: 6a                         |             i32.add
 0054c4: 21 00                      |             local.set 0
 0054c6: 20 03                      |             local.get 3
 0054c8: 28 02 0c                   |             i32.load 2 12
 0054cb: 21 02                      |             local.set 2
 0054cd: 02 40                      |             block
 0054cf: 20 04                      |               local.get 4
 0054d1: 41 ff 01                   |               i32.const 255
 0054d4: 4b                         |               i32.gt_u
 0054d5: 0d 00                      |               br_if 0
 0054d7: 02 40                      |               block
 0054d9: 20 02                      |                 local.get 2
 0054db: 20 03                      |                 local.get 3
 0054dd: 28 02 08                   |                 i32.load 2 8
 0054e0: 22 05                      |                 local.tee 5
 0054e2: 47                         |                 i32.ne
 0054e3: 0d 00                      |                 br_if 0
 0054e5: 41 00                      |                 i32.const 0
 0054e7: 41 00                      |                 i32.const 0
 0054e9: 28 02 f4 95 c0 80 00       |                 i32.load 2 1051380
 0054f0: 41 7e                      |                 i32.const 4294967294
 0054f2: 20 04                      |                 local.get 4
 0054f4: 41 03                      |                 i32.const 3
 0054f6: 76                         |                 i32.shr_u
 0054f7: 77                         |                 i32.rotl
 0054f8: 71                         |                 i32.and
 0054f9: 36 02 f4 95 c0 80 00       |                 i32.store 2 1051380
 005500: 0c 05                      |                 br 5
 005502: 0b                         |               end
 005503: 20 02                      |               local.get 2
 005505: 20 05                      |               local.get 5
 005507: 36 02 08                   |               i32.store 2 8
 00550a: 20 05                      |               local.get 5
 00550c: 20 02                      |               local.get 2
 00550e: 36 02 0c                   |               i32.store 2 12
 005511: 0c 04                      |               br 4
 005513: 0b                         |             end
 005514: 20 03                      |             local.get 3
 005516: 28 02 18                   |             i32.load 2 24
 005519: 21 06                      |             local.set 6
 00551b: 02 40                      |             block
 00551d: 20 02                      |               local.get 2
 00551f: 20 03                      |               local.get 3
 005521: 46                         |               i32.eq
 005522: 0d 00                      |               br_if 0
 005524: 20 03                      |               local.get 3
 005526: 28 02 08                   |               i32.load 2 8
 005529: 22 04                      |               local.tee 4
 00552b: 20 02                      |               local.get 2
 00552d: 36 02 0c                   |               i32.store 2 12
 005530: 20 02                      |               local.get 2
 005532: 20 04                      |               local.get 4
 005534: 36 02 08                   |               i32.store 2 8
 005537: 0c 03                      |               br 3
 005539: 0b                         |             end
 00553a: 02 40                      |             block
 00553c: 02 40                      |               block
 00553e: 20 03                      |                 local.get 3
 005540: 28 02 14                   |                 i32.load 2 20
 005543: 22 04                      |                 local.tee 4
 005545: 45                         |                 i32.eqz
 005546: 0d 00                      |                 br_if 0
 005548: 20 03                      |                 local.get 3
 00554a: 41 14                      |                 i32.const 20
 00554c: 6a                         |                 i32.add
 00554d: 21 05                      |                 local.set 5
 00554f: 0c 01                      |                 br 1
 005551: 0b                         |               end
 005552: 20 03                      |               local.get 3
 005554: 28 02 10                   |               i32.load 2 16
 005557: 22 04                      |               local.tee 4
 005559: 45                         |               i32.eqz
 00555a: 0d 02                      |               br_if 2
 00555c: 20 03                      |               local.get 3
 00555e: 41 10                      |               i32.const 16
 005560: 6a                         |               i32.add
 005561: 21 05                      |               local.set 5
 005563: 0b                         |             end
 005564: 03 40                      |             loop
 005566: 20 05                      |               local.get 5
 005568: 21 07                      |               local.set 7
 00556a: 20 04                      |               local.get 4
 00556c: 22 02                      |               local.tee 2
 00556e: 41 14                      |               i32.const 20
 005570: 6a                         |               i32.add
 005571: 21 05                      |               local.set 5
 005573: 20 02                      |               local.get 2
 005575: 28 02 14                   |               i32.load 2 20
 005578: 22 04                      |               local.tee 4
 00557a: 0d 00                      |               br_if 0
 00557c: 20 02                      |               local.get 2
 00557e: 41 10                      |               i32.const 16
 005580: 6a                         |               i32.add
 005581: 21 05                      |               local.set 5
 005583: 20 02                      |               local.get 2
 005585: 28 02 10                   |               i32.load 2 16
 005588: 22 04                      |               local.tee 4
 00558a: 0d 00                      |               br_if 0
 00558c: 0b                         |             end
 00558d: 20 07                      |             local.get 7
 00558f: 41 00                      |             i32.const 0
 005591: 36 02 00                   |             i32.store 2 0
 005594: 0c 02                      |             br 2
 005596: 0b                         |           end
 005597: 20 03                      |           local.get 3
 005599: 20 04                      |           local.get 4
 00559b: 41 7e                      |           i32.const 4294967294
 00559d: 71                         |           i32.and
 00559e: 36 02 04                   |           i32.store 2 4
 0055a1: 20 01                      |           local.get 1
 0055a3: 20 00                      |           local.get 0
 0055a5: 6a                         |           i32.add
 0055a6: 20 00                      |           local.get 0
 0055a8: 36 02 00                   |           i32.store 2 0
 0055ab: 20 01                      |           local.get 1
 0055ad: 20 00                      |           local.get 0
 0055af: 41 01                      |           i32.const 1
 0055b1: 72                         |           i32.or
 0055b2: 36 02 04                   |           i32.store 2 4
 0055b5: 0c 03                      |           br 3
 0055b7: 0b                         |         end
 0055b8: 41 00                      |         i32.const 0
 0055ba: 21 02                      |         local.set 2
 0055bc: 0b                         |       end
 0055bd: 20 06                      |       local.get 6
 0055bf: 45                         |       i32.eqz
 0055c0: 0d 00                      |       br_if 0
 0055c2: 02 40                      |       block
 0055c4: 02 40                      |         block
 0055c6: 20 03                      |           local.get 3
 0055c8: 20 03                      |           local.get 3
 0055ca: 28 02 1c                   |           i32.load 2 28
 0055cd: 22 05                      |           local.tee 5
 0055cf: 41 02                      |           i32.const 2
 0055d1: 74                         |           i32.shl
 0055d2: 41 a4 98 c0 80 00          |           i32.const 1051684
 0055d8: 6a                         |           i32.add
 0055d9: 22 04                      |           local.tee 4
 0055db: 28 02 00                   |           i32.load 2 0
 0055de: 47                         |           i32.ne
 0055df: 0d 00                      |           br_if 0
 0055e1: 20 04                      |           local.get 4
 0055e3: 20 02                      |           local.get 2
 0055e5: 36 02 00                   |           i32.store 2 0
 0055e8: 20 02                      |           local.get 2
 0055ea: 0d 01                      |           br_if 1
 0055ec: 41 00                      |           i32.const 0
 0055ee: 41 00                      |           i32.const 0
 0055f0: 28 02 f8 95 c0 80 00       |           i32.load 2 1051384
 0055f7: 41 7e                      |           i32.const 4294967294
 0055f9: 20 05                      |           local.get 5
 0055fb: 77                         |           i32.rotl
 0055fc: 71                         |           i32.and
 0055fd: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 005604: 0c 02                      |           br 2
 005606: 0b                         |         end
 005607: 20 06                      |         local.get 6
 005609: 41 10                      |         i32.const 16
 00560b: 41 14                      |         i32.const 20
 00560d: 20 06                      |         local.get 6
 00560f: 28 02 10                   |         i32.load 2 16
 005612: 20 03                      |         local.get 3
 005614: 46                         |         i32.eq
 005615: 1b                         |         select
 005616: 6a                         |         i32.add
 005617: 20 02                      |         local.get 2
 005619: 36 02 00                   |         i32.store 2 0
 00561c: 20 02                      |         local.get 2
 00561e: 45                         |         i32.eqz
 00561f: 0d 01                      |         br_if 1
 005621: 0b                         |       end
 005622: 20 02                      |       local.get 2
 005624: 20 06                      |       local.get 6
 005626: 36 02 18                   |       i32.store 2 24
 005629: 02 40                      |       block
 00562b: 20 03                      |         local.get 3
 00562d: 28 02 10                   |         i32.load 2 16
 005630: 22 04                      |         local.tee 4
 005632: 45                         |         i32.eqz
 005633: 0d 00                      |         br_if 0
 005635: 20 02                      |         local.get 2
 005637: 20 04                      |         local.get 4
 005639: 36 02 10                   |         i32.store 2 16
 00563c: 20 04                      |         local.get 4
 00563e: 20 02                      |         local.get 2
 005640: 36 02 18                   |         i32.store 2 24
 005643: 0b                         |       end
 005644: 20 03                      |       local.get 3
 005646: 28 02 14                   |       i32.load 2 20
 005649: 22 04                      |       local.tee 4
 00564b: 45                         |       i32.eqz
 00564c: 0d 00                      |       br_if 0
 00564e: 20 02                      |       local.get 2
 005650: 20 04                      |       local.get 4
 005652: 36 02 14                   |       i32.store 2 20
 005655: 20 04                      |       local.get 4
 005657: 20 02                      |       local.get 2
 005659: 36 02 18                   |       i32.store 2 24
 00565c: 0b                         |     end
 00565d: 20 01                      |     local.get 1
 00565f: 20 00                      |     local.get 0
 005661: 6a                         |     i32.add
 005662: 20 00                      |     local.get 0
 005664: 36 02 00                   |     i32.store 2 0
 005667: 20 01                      |     local.get 1
 005669: 20 00                      |     local.get 0
 00566b: 41 01                      |     i32.const 1
 00566d: 72                         |     i32.or
 00566e: 36 02 04                   |     i32.store 2 4
 005671: 20 01                      |     local.get 1
 005673: 41 00                      |     i32.const 0
 005675: 28 02 88 96 c0 80 00       |     i32.load 2 1051400
 00567c: 47                         |     i32.ne
 00567d: 0d 00                      |     br_if 0
 00567f: 41 00                      |     i32.const 0
 005681: 20 00                      |     local.get 0
 005683: 36 02 fc 95 c0 80 00       |     i32.store 2 1051388
 00568a: 0f                         |     return
 00568b: 0b                         |   end
 00568c: 02 40                      |   block
 00568e: 20 00                      |     local.get 0
 005690: 41 ff 01                   |     i32.const 255
 005693: 4b                         |     i32.gt_u
 005694: 0d 00                      |     br_if 0
 005696: 20 00                      |     local.get 0
 005698: 41 78                      |     i32.const 4294967288
 00569a: 71                         |     i32.and
 00569b: 41 9c 96 c0 80 00          |     i32.const 1051420
 0056a1: 6a                         |     i32.add
 0056a2: 21 02                      |     local.set 2
 0056a4: 02 40                      |     block
 0056a6: 02 40                      |       block
 0056a8: 41 00                      |         i32.const 0
 0056aa: 28 02 f4 95 c0 80 00       |         i32.load 2 1051380
 0056b1: 22 04                      |         local.tee 4
 0056b3: 41 01                      |         i32.const 1
 0056b5: 20 00                      |         local.get 0
 0056b7: 41 03                      |         i32.const 3
 0056b9: 76                         |         i32.shr_u
 0056ba: 74                         |         i32.shl
 0056bb: 22 00                      |         local.tee 0
 0056bd: 71                         |         i32.and
 0056be: 0d 00                      |         br_if 0
 0056c0: 41 00                      |         i32.const 0
 0056c2: 20 04                      |         local.get 4
 0056c4: 20 00                      |         local.get 0
 0056c6: 72                         |         i32.or
 0056c7: 36 02 f4 95 c0 80 00       |         i32.store 2 1051380
 0056ce: 20 02                      |         local.get 2
 0056d0: 21 00                      |         local.set 0
 0056d2: 0c 01                      |         br 1
 0056d4: 0b                         |       end
 0056d5: 20 02                      |       local.get 2
 0056d7: 28 02 08                   |       i32.load 2 8
 0056da: 21 00                      |       local.set 0
 0056dc: 0b                         |     end
 0056dd: 20 00                      |     local.get 0
 0056df: 20 01                      |     local.get 1
 0056e1: 36 02 0c                   |     i32.store 2 12
 0056e4: 20 02                      |     local.get 2
 0056e6: 20 01                      |     local.get 1
 0056e8: 36 02 08                   |     i32.store 2 8
 0056eb: 20 01                      |     local.get 1
 0056ed: 20 02                      |     local.get 2
 0056ef: 36 02 0c                   |     i32.store 2 12
 0056f2: 20 01                      |     local.get 1
 0056f4: 20 00                      |     local.get 0
 0056f6: 36 02 08                   |     i32.store 2 8
 0056f9: 0f                         |     return
 0056fa: 0b                         |   end
 0056fb: 41 1f                      |   i32.const 31
 0056fd: 21 02                      |   local.set 2
 0056ff: 02 40                      |   block
 005701: 20 00                      |     local.get 0
 005703: 41 ff ff ff 07             |     i32.const 16777215
 005708: 4b                         |     i32.gt_u
 005709: 0d 00                      |     br_if 0
 00570b: 20 00                      |     local.get 0
 00570d: 41 26                      |     i32.const 38
 00570f: 20 00                      |     local.get 0
 005711: 41 08                      |     i32.const 8
 005713: 76                         |     i32.shr_u
 005714: 67                         |     i32.clz
 005715: 22 02                      |     local.tee 2
 005717: 6b                         |     i32.sub
 005718: 76                         |     i32.shr_u
 005719: 41 01                      |     i32.const 1
 00571b: 71                         |     i32.and
 00571c: 20 02                      |     local.get 2
 00571e: 41 01                      |     i32.const 1
 005720: 74                         |     i32.shl
 005721: 6b                         |     i32.sub
 005722: 41 3e                      |     i32.const 62
 005724: 6a                         |     i32.add
 005725: 21 02                      |     local.set 2
 005727: 0b                         |   end
 005728: 20 01                      |   local.get 1
 00572a: 20 02                      |   local.get 2
 00572c: 36 02 1c                   |   i32.store 2 28
 00572f: 20 01                      |   local.get 1
 005731: 42 00                      |   i64.const 0
 005733: 37 02 10                   |   i64.store 2 16
 005736: 20 02                      |   local.get 2
 005738: 41 02                      |   i32.const 2
 00573a: 74                         |   i32.shl
 00573b: 41 a4 98 c0 80 00          |   i32.const 1051684
 005741: 6a                         |   i32.add
 005742: 21 03                      |   local.set 3
 005744: 02 40                      |   block
 005746: 02 40                      |     block
 005748: 02 40                      |       block
 00574a: 02 40                      |         block
 00574c: 41 00                      |           i32.const 0
 00574e: 28 02 f8 95 c0 80 00       |           i32.load 2 1051384
 005755: 22 04                      |           local.tee 4
 005757: 41 01                      |           i32.const 1
 005759: 20 02                      |           local.get 2
 00575b: 74                         |           i32.shl
 00575c: 22 05                      |           local.tee 5
 00575e: 71                         |           i32.and
 00575f: 0d 00                      |           br_if 0
 005761: 41 00                      |           i32.const 0
 005763: 20 04                      |           local.get 4
 005765: 20 05                      |           local.get 5
 005767: 72                         |           i32.or
 005768: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 00576f: 41 08                      |           i32.const 8
 005771: 21 00                      |           local.set 0
 005773: 41 18                      |           i32.const 24
 005775: 21 02                      |           local.set 2
 005777: 20 03                      |           local.get 3
 005779: 21 05                      |           local.set 5
 00577b: 0c 01                      |           br 1
 00577d: 0b                         |         end
 00577e: 20 00                      |         local.get 0
 005780: 41 00                      |         i32.const 0
 005782: 41 19                      |         i32.const 25
 005784: 20 02                      |         local.get 2
 005786: 41 01                      |         i32.const 1
 005788: 76                         |         i32.shr_u
 005789: 6b                         |         i32.sub
 00578a: 20 02                      |         local.get 2
 00578c: 41 1f                      |         i32.const 31
 00578e: 46                         |         i32.eq
 00578f: 1b                         |         select
 005790: 74                         |         i32.shl
 005791: 21 02                      |         local.set 2
 005793: 20 03                      |         local.get 3
 005795: 28 02 00                   |         i32.load 2 0
 005798: 21 05                      |         local.set 5
 00579a: 03 40                      |         loop
 00579c: 20 05                      |           local.get 5
 00579e: 22 04                      |           local.tee 4
 0057a0: 28 02 04                   |           i32.load 2 4
 0057a3: 41 78                      |           i32.const 4294967288
 0057a5: 71                         |           i32.and
 0057a6: 20 00                      |           local.get 0
 0057a8: 46                         |           i32.eq
 0057a9: 0d 02                      |           br_if 2
 0057ab: 20 02                      |           local.get 2
 0057ad: 41 1d                      |           i32.const 29
 0057af: 76                         |           i32.shr_u
 0057b0: 21 05                      |           local.set 5
 0057b2: 20 02                      |           local.get 2
 0057b4: 41 01                      |           i32.const 1
 0057b6: 74                         |           i32.shl
 0057b7: 21 02                      |           local.set 2
 0057b9: 20 04                      |           local.get 4
 0057bb: 20 05                      |           local.get 5
 0057bd: 41 04                      |           i32.const 4
 0057bf: 71                         |           i32.and
 0057c0: 6a                         |           i32.add
 0057c1: 41 10                      |           i32.const 16
 0057c3: 6a                         |           i32.add
 0057c4: 22 03                      |           local.tee 3
 0057c6: 28 02 00                   |           i32.load 2 0
 0057c9: 22 05                      |           local.tee 5
 0057cb: 0d 00                      |           br_if 0
 0057cd: 0b                         |         end
 0057ce: 41 08                      |         i32.const 8
 0057d0: 21 00                      |         local.set 0
 0057d2: 41 18                      |         i32.const 24
 0057d4: 21 02                      |         local.set 2
 0057d6: 20 04                      |         local.get 4
 0057d8: 21 05                      |         local.set 5
 0057da: 0b                         |       end
 0057db: 20 01                      |       local.get 1
 0057dd: 21 04                      |       local.set 4
 0057df: 20 01                      |       local.get 1
 0057e1: 21 07                      |       local.set 7
 0057e3: 0c 01                      |       br 1
 0057e5: 0b                         |     end
 0057e6: 20 04                      |     local.get 4
 0057e8: 28 02 08                   |     i32.load 2 8
 0057eb: 22 05                      |     local.tee 5
 0057ed: 20 01                      |     local.get 1
 0057ef: 36 02 0c                   |     i32.store 2 12
 0057f2: 41 08                      |     i32.const 8
 0057f4: 21 02                      |     local.set 2
 0057f6: 20 04                      |     local.get 4
 0057f8: 41 08                      |     i32.const 8
 0057fa: 6a                         |     i32.add
 0057fb: 21 03                      |     local.set 3
 0057fd: 41 00                      |     i32.const 0
 0057ff: 21 07                      |     local.set 7
 005801: 41 18                      |     i32.const 24
 005803: 21 00                      |     local.set 0
 005805: 0b                         |   end
 005806: 20 03                      |   local.get 3
 005808: 20 01                      |   local.get 1
 00580a: 36 02 00                   |   i32.store 2 0
 00580d: 20 01                      |   local.get 1
 00580f: 20 02                      |   local.get 2
 005811: 6a                         |   i32.add
 005812: 20 05                      |   local.get 5
 005814: 36 02 00                   |   i32.store 2 0
 005817: 20 01                      |   local.get 1
 005819: 20 04                      |   local.get 4
 00581b: 36 02 0c                   |   i32.store 2 12
 00581e: 20 01                      |   local.get 1
 005820: 20 00                      |   local.get 0
 005822: 6a                         |   i32.add
 005823: 20 07                      |   local.get 7
 005825: 36 02 00                   |   i32.store 2 0
 005828: 41 00                      |   i32.const 0
 00582a: 41 00                      |   i32.const 0
 00582c: 28 02 94 96 c0 80 00       |   i32.load 2 1051412
 005833: 41 7f                      |   i32.const 4294967295
 005835: 6a                         |   i32.add
 005836: 22 01                      |   local.tee 1
 005838: 41 7f                      |   i32.const 4294967295
 00583a: 20 01                      |   local.get 1
 00583c: 1b                         |   select
 00583d: 36 02 94 96 c0 80 00       |   i32.store 2 1051412
 005844: 0b                         | end
 005845: 0b                         | end
005847 func[93] <calloc>:
 005848: 01 7f                      | local[2] type=i32
 00584a: 01 7e                      | local[3] type=i64
 00584c: 02 40                      | block
 00584e: 02 40                      |   block
 005850: 20 00                      |     local.get 0
 005852: 0d 00                      |     br_if 0
 005854: 41 00                      |     i32.const 0
 005856: 21 02                      |     local.set 2
 005858: 0c 01                      |     br 1
 00585a: 0b                         |   end
 00585b: 20 00                      |   local.get 0
 00585d: ad                         |   i64.extend_i32_u
 00585e: 20 01                      |   local.get 1
 005860: ad                         |   i64.extend_i32_u
 005861: 7e                         |   i64.mul
 005862: 22 03                      |   local.tee 3
 005864: a7                         |   i32.wrap_i64
 005865: 21 02                      |   local.set 2
 005867: 20 01                      |   local.get 1
 005869: 20 00                      |   local.get 0
 00586b: 72                         |   i32.or
 00586c: 41 80 80 04                |   i32.const 65536
 005870: 49                         |   i32.lt_u
 005871: 0d 00                      |   br_if 0
 005873: 41 7f                      |   i32.const 4294967295
 005875: 20 02                      |   local.get 2
 005877: 20 03                      |   local.get 3
 005879: 42 20                      |   i64.const 32
 00587b: 88                         |   i64.shr_u
 00587c: a7                         |   i32.wrap_i64
 00587d: 41 00                      |   i32.const 0
 00587f: 47                         |   i32.ne
 005880: 1b                         |   select
 005881: 21 02                      |   local.set 2
 005883: 0b                         | end
 005884: 02 40                      | block
 005886: 20 02                      |   local.get 2
 005888: 10 d9 80 80 80 00          |   call 89 <dlmalloc>
 00588e: 22 00                      |   local.tee 0
 005890: 45                         |   i32.eqz
 005891: 0d 00                      |   br_if 0
 005893: 20 00                      |   local.get 0
 005895: 41 7c                      |   i32.const 4294967292
 005897: 6a                         |   i32.add
 005898: 2d 00 00                   |   i32.load8_u 0 0
 00589b: 41 03                      |   i32.const 3
 00589d: 71                         |   i32.and
 00589e: 45                         |   i32.eqz
 00589f: 0d 00                      |   br_if 0
 0058a1: 20 00                      |   local.get 0
 0058a3: 41 00                      |   i32.const 0
 0058a5: 20 02                      |   local.get 2
 0058a7: 10 ef 80 80 80 00          |   call 111 <memset>
 0058ad: 1a                         |   drop
 0058ae: 0b                         | end
 0058af: 20 00                      | local.get 0
 0058b1: 0b                         | end
0058b4 func[94] <realloc>:
 0058b5: 0b 7f                      | local[2..12] type=i32
 0058b7: 02 40                      | block
 0058b9: 20 00                      |   local.get 0
 0058bb: 0d 00                      |   br_if 0
 0058bd: 20 01                      |   local.get 1
 0058bf: 10 d9 80 80 80 00          |   call 89 <dlmalloc>
 0058c5: 0f                         |   return
 0058c6: 0b                         | end
 0058c7: 02 40                      | block
 0058c9: 20 01                      |   local.get 1
 0058cb: 41 40                      |   i32.const 4294967232
 0058cd: 49                         |   i32.lt_u
 0058ce: 0d 00                      |   br_if 0
 0058d0: 41 00                      |   i32.const 0
 0058d2: 41 30                      |   i32.const 48
 0058d4: 36 02 e4 99 c0 80 00       |   i32.store 2 1051876
 0058db: 41 00                      |   i32.const 0
 0058dd: 0f                         |   return
 0058de: 0b                         | end
 0058df: 41 10                      | i32.const 16
 0058e1: 20 01                      | local.get 1
 0058e3: 41 13                      | i32.const 19
 0058e5: 6a                         | i32.add
 0058e6: 41 70                      | i32.const 4294967280
 0058e8: 71                         | i32.and
 0058e9: 20 01                      | local.get 1
 0058eb: 41 0b                      | i32.const 11
 0058ed: 49                         | i32.lt_u
 0058ee: 1b                         | select
 0058ef: 21 02                      | local.set 2
 0058f1: 20 00                      | local.get 0
 0058f3: 41 7c                      | i32.const 4294967292
 0058f5: 6a                         | i32.add
 0058f6: 22 03                      | local.tee 3
 0058f8: 28 02 00                   | i32.load 2 0
 0058fb: 22 04                      | local.tee 4
 0058fd: 41 78                      | i32.const 4294967288
 0058ff: 71                         | i32.and
 005900: 21 05                      | local.set 5
 005902: 02 40                      | block
 005904: 02 40                      |   block
 005906: 02 40                      |     block
 005908: 20 04                      |       local.get 4
 00590a: 41 03                      |       i32.const 3
 00590c: 71                         |       i32.and
 00590d: 0d 00                      |       br_if 0
 00590f: 20 02                      |       local.get 2
 005911: 41 80 02                   |       i32.const 256
 005914: 49                         |       i32.lt_u
 005915: 0d 01                      |       br_if 1
 005917: 20 05                      |       local.get 5
 005919: 20 02                      |       local.get 2
 00591b: 41 04                      |       i32.const 4
 00591d: 72                         |       i32.or
 00591e: 49                         |       i32.lt_u
 00591f: 0d 01                      |       br_if 1
 005921: 20 05                      |       local.get 5
 005923: 20 02                      |       local.get 2
 005925: 6b                         |       i32.sub
 005926: 41 00                      |       i32.const 0
 005928: 28 02 d4 99 c0 80 00       |       i32.load 2 1051860
 00592f: 41 01                      |       i32.const 1
 005931: 74                         |       i32.shl
 005932: 4d                         |       i32.le_u
 005933: 0d 02                      |       br_if 2
 005935: 0c 01                      |       br 1
 005937: 0b                         |     end
 005938: 20 00                      |     local.get 0
 00593a: 41 78                      |     i32.const 4294967288
 00593c: 6a                         |     i32.add
 00593d: 22 06                      |     local.tee 6
 00593f: 20 05                      |     local.get 5
 005941: 6a                         |     i32.add
 005942: 21 07                      |     local.set 7
 005944: 02 40                      |     block
 005946: 20 05                      |       local.get 5
 005948: 20 02                      |       local.get 2
 00594a: 49                         |       i32.lt_u
 00594b: 0d 00                      |       br_if 0
 00594d: 20 05                      |       local.get 5
 00594f: 20 02                      |       local.get 2
 005951: 6b                         |       i32.sub
 005952: 22 01                      |       local.tee 1
 005954: 41 10                      |       i32.const 16
 005956: 49                         |       i32.lt_u
 005957: 0d 02                      |       br_if 2
 005959: 20 03                      |       local.get 3
 00595b: 20 02                      |       local.get 2
 00595d: 20 04                      |       local.get 4
 00595f: 41 01                      |       i32.const 1
 005961: 71                         |       i32.and
 005962: 72                         |       i32.or
 005963: 41 02                      |       i32.const 2
 005965: 72                         |       i32.or
 005966: 36 02 00                   |       i32.store 2 0
 005969: 20 06                      |       local.get 6
 00596b: 20 02                      |       local.get 2
 00596d: 6a                         |       i32.add
 00596e: 22 02                      |       local.tee 2
 005970: 20 01                      |       local.get 1
 005972: 41 03                      |       i32.const 3
 005974: 72                         |       i32.or
 005975: 36 02 04                   |       i32.store 2 4
 005978: 20 07                      |       local.get 7
 00597a: 20 07                      |       local.get 7
 00597c: 28 02 04                   |       i32.load 2 4
 00597f: 41 01                      |       i32.const 1
 005981: 72                         |       i32.or
 005982: 36 02 04                   |       i32.store 2 4
 005985: 20 02                      |       local.get 2
 005987: 20 01                      |       local.get 1
 005989: 10 df 80 80 80 00          |       call 95 <dispose_chunk>
 00598f: 20 00                      |       local.get 0
 005991: 0f                         |       return
 005992: 0b                         |     end
 005993: 02 40                      |     block
 005995: 20 07                      |       local.get 7
 005997: 41 00                      |       i32.const 0
 005999: 28 02 8c 96 c0 80 00       |       i32.load 2 1051404
 0059a0: 47                         |       i32.ne
 0059a1: 0d 00                      |       br_if 0
 0059a3: 41 00                      |       i32.const 0
 0059a5: 28 02 80 96 c0 80 00       |       i32.load 2 1051392
 0059ac: 20 05                      |       local.get 5
 0059ae: 6a                         |       i32.add
 0059af: 22 05                      |       local.tee 5
 0059b1: 20 02                      |       local.get 2
 0059b3: 4d                         |       i32.le_u
 0059b4: 0d 01                      |       br_if 1
 0059b6: 20 03                      |       local.get 3
 0059b8: 20 02                      |       local.get 2
 0059ba: 20 04                      |       local.get 4
 0059bc: 41 01                      |       i32.const 1
 0059be: 71                         |       i32.and
 0059bf: 72                         |       i32.or
 0059c0: 41 02                      |       i32.const 2
 0059c2: 72                         |       i32.or
 0059c3: 36 02 00                   |       i32.store 2 0
 0059c6: 41 00                      |       i32.const 0
 0059c8: 20 06                      |       local.get 6
 0059ca: 20 02                      |       local.get 2
 0059cc: 6a                         |       i32.add
 0059cd: 22 01                      |       local.tee 1
 0059cf: 36 02 8c 96 c0 80 00       |       i32.store 2 1051404
 0059d6: 41 00                      |       i32.const 0
 0059d8: 20 05                      |       local.get 5
 0059da: 20 02                      |       local.get 2
 0059dc: 6b                         |       i32.sub
 0059dd: 22 02                      |       local.tee 2
 0059df: 36 02 80 96 c0 80 00       |       i32.store 2 1051392
 0059e6: 20 01                      |       local.get 1
 0059e8: 20 02                      |       local.get 2
 0059ea: 41 01                      |       i32.const 1
 0059ec: 72                         |       i32.or
 0059ed: 36 02 04                   |       i32.store 2 4
 0059f0: 20 00                      |       local.get 0
 0059f2: 0f                         |       return
 0059f3: 0b                         |     end
 0059f4: 02 40                      |     block
 0059f6: 20 07                      |       local.get 7
 0059f8: 41 00                      |       i32.const 0
 0059fa: 28 02 88 96 c0 80 00       |       i32.load 2 1051400
 005a01: 47                         |       i32.ne
 005a02: 0d 00                      |       br_if 0
 005a04: 41 00                      |       i32.const 0
 005a06: 28 02 fc 95 c0 80 00       |       i32.load 2 1051388
 005a0d: 20 05                      |       local.get 5
 005a0f: 6a                         |       i32.add
 005a10: 22 05                      |       local.tee 5
 005a12: 20 02                      |       local.get 2
 005a14: 49                         |       i32.lt_u
 005a15: 0d 01                      |       br_if 1
 005a17: 02 40                      |       block
 005a19: 02 40                      |         block
 005a1b: 20 05                      |           local.get 5
 005a1d: 20 02                      |           local.get 2
 005a1f: 6b                         |           i32.sub
 005a20: 22 01                      |           local.tee 1
 005a22: 41 10                      |           i32.const 16
 005a24: 49                         |           i32.lt_u
 005a25: 0d 00                      |           br_if 0
 005a27: 20 03                      |           local.get 3
 005a29: 20 02                      |           local.get 2
 005a2b: 20 04                      |           local.get 4
 005a2d: 41 01                      |           i32.const 1
 005a2f: 71                         |           i32.and
 005a30: 72                         |           i32.or
 005a31: 41 02                      |           i32.const 2
 005a33: 72                         |           i32.or
 005a34: 36 02 00                   |           i32.store 2 0
 005a37: 20 06                      |           local.get 6
 005a39: 20 02                      |           local.get 2
 005a3b: 6a                         |           i32.add
 005a3c: 22 02                      |           local.tee 2
 005a3e: 20 01                      |           local.get 1
 005a40: 41 01                      |           i32.const 1
 005a42: 72                         |           i32.or
 005a43: 36 02 04                   |           i32.store 2 4
 005a46: 20 06                      |           local.get 6
 005a48: 20 05                      |           local.get 5
 005a4a: 6a                         |           i32.add
 005a4b: 22 05                      |           local.tee 5
 005a4d: 20 01                      |           local.get 1
 005a4f: 36 02 00                   |           i32.store 2 0
 005a52: 20 05                      |           local.get 5
 005a54: 20 05                      |           local.get 5
 005a56: 28 02 04                   |           i32.load 2 4
 005a59: 41 7e                      |           i32.const 4294967294
 005a5b: 71                         |           i32.and
 005a5c: 36 02 04                   |           i32.store 2 4
 005a5f: 0c 01                      |           br 1
 005a61: 0b                         |         end
 005a62: 20 03                      |         local.get 3
 005a64: 20 04                      |         local.get 4
 005a66: 41 01                      |         i32.const 1
 005a68: 71                         |         i32.and
 005a69: 20 05                      |         local.get 5
 005a6b: 72                         |         i32.or
 005a6c: 41 02                      |         i32.const 2
 005a6e: 72                         |         i32.or
 005a6f: 36 02 00                   |         i32.store 2 0
 005a72: 20 06                      |         local.get 6
 005a74: 20 05                      |         local.get 5
 005a76: 6a                         |         i32.add
 005a77: 22 01                      |         local.tee 1
 005a79: 20 01                      |         local.get 1
 005a7b: 28 02 04                   |         i32.load 2 4
 005a7e: 41 01                      |         i32.const 1
 005a80: 72                         |         i32.or
 005a81: 36 02 04                   |         i32.store 2 4
 005a84: 41 00                      |         i32.const 0
 005a86: 21 01                      |         local.set 1
 005a88: 41 00                      |         i32.const 0
 005a8a: 21 02                      |         local.set 2
 005a8c: 0b                         |       end
 005a8d: 41 00                      |       i32.const 0
 005a8f: 20 02                      |       local.get 2
 005a91: 36 02 88 96 c0 80 00       |       i32.store 2 1051400
 005a98: 41 00                      |       i32.const 0
 005a9a: 20 01                      |       local.get 1
 005a9c: 36 02 fc 95 c0 80 00       |       i32.store 2 1051388
 005aa3: 20 00                      |       local.get 0
 005aa5: 0f                         |       return
 005aa6: 0b                         |     end
 005aa7: 20 07                      |     local.get 7
 005aa9: 28 02 04                   |     i32.load 2 4
 005aac: 22 08                      |     local.tee 8
 005aae: 41 02                      |     i32.const 2
 005ab0: 71                         |     i32.and
 005ab1: 0d 00                      |     br_if 0
 005ab3: 20 08                      |     local.get 8
 005ab5: 41 78                      |     i32.const 4294967288
 005ab7: 71                         |     i32.and
 005ab8: 20 05                      |     local.get 5
 005aba: 6a                         |     i32.add
 005abb: 22 09                      |     local.tee 9
 005abd: 20 02                      |     local.get 2
 005abf: 49                         |     i32.lt_u
 005ac0: 0d 00                      |     br_if 0
 005ac2: 20 09                      |     local.get 9
 005ac4: 20 02                      |     local.get 2
 005ac6: 6b                         |     i32.sub
 005ac7: 21 0a                      |     local.set 10
 005ac9: 20 07                      |     local.get 7
 005acb: 28 02 0c                   |     i32.load 2 12
 005ace: 21 01                      |     local.set 1
 005ad0: 02 40                      |     block
 005ad2: 02 40                      |       block
 005ad4: 20 08                      |         local.get 8
 005ad6: 41 ff 01                   |         i32.const 255
 005ad9: 4b                         |         i32.gt_u
 005ada: 0d 00                      |         br_if 0
 005adc: 02 40                      |         block
 005ade: 20 01                      |           local.get 1
 005ae0: 20 07                      |           local.get 7
 005ae2: 28 02 08                   |           i32.load 2 8
 005ae5: 22 05                      |           local.tee 5
 005ae7: 47                         |           i32.ne
 005ae8: 0d 00                      |           br_if 0
 005aea: 41 00                      |           i32.const 0
 005aec: 41 00                      |           i32.const 0
 005aee: 28 02 f4 95 c0 80 00       |           i32.load 2 1051380
 005af5: 41 7e                      |           i32.const 4294967294
 005af7: 20 08                      |           local.get 8
 005af9: 41 03                      |           i32.const 3
 005afb: 76                         |           i32.shr_u
 005afc: 77                         |           i32.rotl
 005afd: 71                         |           i32.and
 005afe: 36 02 f4 95 c0 80 00       |           i32.store 2 1051380
 005b05: 0c 02                      |           br 2
 005b07: 0b                         |         end
 005b08: 20 01                      |         local.get 1
 005b0a: 20 05                      |         local.get 5
 005b0c: 36 02 08                   |         i32.store 2 8
 005b0f: 20 05                      |         local.get 5
 005b11: 20 01                      |         local.get 1
 005b13: 36 02 0c                   |         i32.store 2 12
 005b16: 0c 01                      |         br 1
 005b18: 0b                         |       end
 005b19: 20 07                      |       local.get 7
 005b1b: 28 02 18                   |       i32.load 2 24
 005b1e: 21 0b                      |       local.set 11
 005b20: 02 40                      |       block
 005b22: 02 40                      |         block
 005b24: 20 01                      |           local.get 1
 005b26: 20 07                      |           local.get 7
 005b28: 46                         |           i32.eq
 005b29: 0d 00                      |           br_if 0
 005b2b: 20 07                      |           local.get 7
 005b2d: 28 02 08                   |           i32.load 2 8
 005b30: 22 05                      |           local.tee 5
 005b32: 20 01                      |           local.get 1
 005b34: 36 02 0c                   |           i32.store 2 12
 005b37: 20 01                      |           local.get 1
 005b39: 20 05                      |           local.get 5
 005b3b: 36 02 08                   |           i32.store 2 8
 005b3e: 0c 01                      |           br 1
 005b40: 0b                         |         end
 005b41: 02 40                      |         block
 005b43: 02 40                      |           block
 005b45: 02 40                      |             block
 005b47: 20 07                      |               local.get 7
 005b49: 28 02 14                   |               i32.load 2 20
 005b4c: 22 05                      |               local.tee 5
 005b4e: 45                         |               i32.eqz
 005b4f: 0d 00                      |               br_if 0
 005b51: 20 07                      |               local.get 7
 005b53: 41 14                      |               i32.const 20
 005b55: 6a                         |               i32.add
 005b56: 21 08                      |               local.set 8
 005b58: 0c 01                      |               br 1
 005b5a: 0b                         |             end
 005b5b: 20 07                      |             local.get 7
 005b5d: 28 02 10                   |             i32.load 2 16
 005b60: 22 05                      |             local.tee 5
 005b62: 45                         |             i32.eqz
 005b63: 0d 01                      |             br_if 1
 005b65: 20 07                      |             local.get 7
 005b67: 41 10                      |             i32.const 16
 005b69: 6a                         |             i32.add
 005b6a: 21 08                      |             local.set 8
 005b6c: 0b                         |           end
 005b6d: 03 40                      |           loop
 005b6f: 20 08                      |             local.get 8
 005b71: 21 0c                      |             local.set 12
 005b73: 20 05                      |             local.get 5
 005b75: 22 01                      |             local.tee 1
 005b77: 41 14                      |             i32.const 20
 005b79: 6a                         |             i32.add
 005b7a: 21 08                      |             local.set 8
 005b7c: 20 01                      |             local.get 1
 005b7e: 28 02 14                   |             i32.load 2 20
 005b81: 22 05                      |             local.tee 5
 005b83: 0d 00                      |             br_if 0
 005b85: 20 01                      |             local.get 1
 005b87: 41 10                      |             i32.const 16
 005b89: 6a                         |             i32.add
 005b8a: 21 08                      |             local.set 8
 005b8c: 20 01                      |             local.get 1
 005b8e: 28 02 10                   |             i32.load 2 16
 005b91: 22 05                      |             local.tee 5
 005b93: 0d 00                      |             br_if 0
 005b95: 0b                         |           end
 005b96: 20 0c                      |           local.get 12
 005b98: 41 00                      |           i32.const 0
 005b9a: 36 02 00                   |           i32.store 2 0
 005b9d: 0c 01                      |           br 1
 005b9f: 0b                         |         end
 005ba0: 41 00                      |         i32.const 0
 005ba2: 21 01                      |         local.set 1
 005ba4: 0b                         |       end
 005ba5: 20 0b                      |       local.get 11
 005ba7: 45                         |       i32.eqz
 005ba8: 0d 00                      |       br_if 0
 005baa: 02 40                      |       block
 005bac: 02 40                      |         block
 005bae: 20 07                      |           local.get 7
 005bb0: 20 07                      |           local.get 7
 005bb2: 28 02 1c                   |           i32.load 2 28
 005bb5: 22 08                      |           local.tee 8
 005bb7: 41 02                      |           i32.const 2
 005bb9: 74                         |           i32.shl
 005bba: 41 a4 98 c0 80 00          |           i32.const 1051684
 005bc0: 6a                         |           i32.add
 005bc1: 22 05                      |           local.tee 5
 005bc3: 28 02 00                   |           i32.load 2 0
 005bc6: 47                         |           i32.ne
 005bc7: 0d 00                      |           br_if 0
 005bc9: 20 05                      |           local.get 5
 005bcb: 20 01                      |           local.get 1
 005bcd: 36 02 00                   |           i32.store 2 0
 005bd0: 20 01                      |           local.get 1
 005bd2: 0d 01                      |           br_if 1
 005bd4: 41 00                      |           i32.const 0
 005bd6: 41 00                      |           i32.const 0
 005bd8: 28 02 f8 95 c0 80 00       |           i32.load 2 1051384
 005bdf: 41 7e                      |           i32.const 4294967294
 005be1: 20 08                      |           local.get 8
 005be3: 77                         |           i32.rotl
 005be4: 71                         |           i32.and
 005be5: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 005bec: 0c 02                      |           br 2
 005bee: 0b                         |         end
 005bef: 20 0b                      |         local.get 11
 005bf1: 41 10                      |         i32.const 16
 005bf3: 41 14                      |         i32.const 20
 005bf5: 20 0b                      |         local.get 11
 005bf7: 28 02 10                   |         i32.load 2 16
 005bfa: 20 07                      |         local.get 7
 005bfc: 46                         |         i32.eq
 005bfd: 1b                         |         select
 005bfe: 6a                         |         i32.add
 005bff: 20 01                      |         local.get 1
 005c01: 36 02 00                   |         i32.store 2 0
 005c04: 20 01                      |         local.get 1
 005c06: 45                         |         i32.eqz
 005c07: 0d 01                      |         br_if 1
 005c09: 0b                         |       end
 005c0a: 20 01                      |       local.get 1
 005c0c: 20 0b                      |       local.get 11
 005c0e: 36 02 18                   |       i32.store 2 24
 005c11: 02 40                      |       block
 005c13: 20 07                      |         local.get 7
 005c15: 28 02 10                   |         i32.load 2 16
 005c18: 22 05                      |         local.tee 5
 005c1a: 45                         |         i32.eqz
 005c1b: 0d 00                      |         br_if 0
 005c1d: 20 01                      |         local.get 1
 005c1f: 20 05                      |         local.get 5
 005c21: 36 02 10                   |         i32.store 2 16
 005c24: 20 05                      |         local.get 5
 005c26: 20 01                      |         local.get 1
 005c28: 36 02 18                   |         i32.store 2 24
 005c2b: 0b                         |       end
 005c2c: 20 07                      |       local.get 7
 005c2e: 28 02 14                   |       i32.load 2 20
 005c31: 22 05                      |       local.tee 5
 005c33: 45                         |       i32.eqz
 005c34: 0d 00                      |       br_if 0
 005c36: 20 01                      |       local.get 1
 005c38: 20 05                      |       local.get 5
 005c3a: 36 02 14                   |       i32.store 2 20
 005c3d: 20 05                      |       local.get 5
 005c3f: 20 01                      |       local.get 1
 005c41: 36 02 18                   |       i32.store 2 24
 005c44: 0b                         |     end
 005c45: 02 40                      |     block
 005c47: 20 0a                      |       local.get 10
 005c49: 41 0f                      |       i32.const 15
 005c4b: 4b                         |       i32.gt_u
 005c4c: 0d 00                      |       br_if 0
 005c4e: 20 03                      |       local.get 3
 005c50: 20 04                      |       local.get 4
 005c52: 41 01                      |       i32.const 1
 005c54: 71                         |       i32.and
 005c55: 20 09                      |       local.get 9
 005c57: 72                         |       i32.or
 005c58: 41 02                      |       i32.const 2
 005c5a: 72                         |       i32.or
 005c5b: 36 02 00                   |       i32.store 2 0
 005c5e: 20 06                      |       local.get 6
 005c60: 20 09                      |       local.get 9
 005c62: 6a                         |       i32.add
 005c63: 22 01                      |       local.tee 1
 005c65: 20 01                      |       local.get 1
 005c67: 28 02 04                   |       i32.load 2 4
 005c6a: 41 01                      |       i32.const 1
 005c6c: 72                         |       i32.or
 005c6d: 36 02 04                   |       i32.store 2 4
 005c70: 20 00                      |       local.get 0
 005c72: 0f                         |       return
 005c73: 0b                         |     end
 005c74: 20 03                      |     local.get 3
 005c76: 20 02                      |     local.get 2
 005c78: 20 04                      |     local.get 4
 005c7a: 41 01                      |     i32.const 1
 005c7c: 71                         |     i32.and
 005c7d: 72                         |     i32.or
 005c7e: 41 02                      |     i32.const 2
 005c80: 72                         |     i32.or
 005c81: 36 02 00                   |     i32.store 2 0
 005c84: 20 06                      |     local.get 6
 005c86: 20 02                      |     local.get 2
 005c88: 6a                         |     i32.add
 005c89: 22 01                      |     local.tee 1
 005c8b: 20 0a                      |     local.get 10
 005c8d: 41 03                      |     i32.const 3
 005c8f: 72                         |     i32.or
 005c90: 36 02 04                   |     i32.store 2 4
 005c93: 20 06                      |     local.get 6
 005c95: 20 09                      |     local.get 9
 005c97: 6a                         |     i32.add
 005c98: 22 02                      |     local.tee 2
 005c9a: 20 02                      |     local.get 2
 005c9c: 28 02 04                   |     i32.load 2 4
 005c9f: 41 01                      |     i32.const 1
 005ca1: 72                         |     i32.or
 005ca2: 36 02 04                   |     i32.store 2 4
 005ca5: 20 01                      |     local.get 1
 005ca7: 20 0a                      |     local.get 10
 005ca9: 10 df 80 80 80 00          |     call 95 <dispose_chunk>
 005caf: 20 00                      |     local.get 0
 005cb1: 0f                         |     return
 005cb2: 0b                         |   end
 005cb3: 02 40                      |   block
 005cb5: 20 01                      |     local.get 1
 005cb7: 10 d9 80 80 80 00          |     call 89 <dlmalloc>
 005cbd: 22 02                      |     local.tee 2
 005cbf: 0d 00                      |     br_if 0
 005cc1: 41 00                      |     i32.const 0
 005cc3: 0f                         |     return
 005cc4: 0b                         |   end
 005cc5: 20 02                      |   local.get 2
 005cc7: 20 00                      |   local.get 0
 005cc9: 41 7c                      |   i32.const 4294967292
 005ccb: 41 78                      |   i32.const 4294967288
 005ccd: 20 03                      |   local.get 3
 005ccf: 28 02 00                   |   i32.load 2 0
 005cd2: 22 05                      |   local.tee 5
 005cd4: 41 03                      |   i32.const 3
 005cd6: 71                         |   i32.and
 005cd7: 1b                         |   select
 005cd8: 20 05                      |   local.get 5
 005cda: 41 78                      |   i32.const 4294967288
 005cdc: 71                         |   i32.and
 005cdd: 6a                         |   i32.add
 005cde: 22 05                      |   local.tee 5
 005ce0: 20 01                      |   local.get 1
 005ce2: 20 05                      |   local.get 5
 005ce4: 20 01                      |   local.get 1
 005ce6: 49                         |   i32.lt_u
 005ce7: 1b                         |   select
 005ce8: 10 ee 80 80 80 00          |   call 110 <memcpy>
 005cee: 21 01                      |   local.set 1
 005cf0: 20 00                      |   local.get 0
 005cf2: 10 dc 80 80 80 00          |   call 92 <dlfree>
 005cf8: 20 01                      |   local.get 1
 005cfa: 21 00                      |   local.set 0
 005cfc: 0b                         | end
 005cfd: 20 00                      | local.get 0
 005cff: 0b                         | end
005d02 func[95] <dispose_chunk>:
 005d03: 06 7f                      | local[2..7] type=i32
 005d05: 20 00                      | local.get 0
 005d07: 20 01                      | local.get 1
 005d09: 6a                         | i32.add
 005d0a: 21 02                      | local.set 2
 005d0c: 02 40                      | block
 005d0e: 02 40                      |   block
 005d10: 20 00                      |     local.get 0
 005d12: 28 02 04                   |     i32.load 2 4
 005d15: 22 03                      |     local.tee 3
 005d17: 41 01                      |     i32.const 1
 005d19: 71                         |     i32.and
 005d1a: 0d 00                      |     br_if 0
 005d1c: 20 03                      |     local.get 3
 005d1e: 41 02                      |     i32.const 2
 005d20: 71                         |     i32.and
 005d21: 45                         |     i32.eqz
 005d22: 0d 01                      |     br_if 1
 005d24: 20 00                      |     local.get 0
 005d26: 28 02 00                   |     i32.load 2 0
 005d29: 22 04                      |     local.tee 4
 005d2b: 20 01                      |     local.get 1
 005d2d: 6a                         |     i32.add
 005d2e: 21 01                      |     local.set 1
 005d30: 02 40                      |     block
 005d32: 02 40                      |       block
 005d34: 02 40                      |         block
 005d36: 02 40                      |           block
 005d38: 20 00                      |             local.get 0
 005d3a: 20 04                      |             local.get 4
 005d3c: 6b                         |             i32.sub
 005d3d: 22 00                      |             local.tee 0
 005d3f: 41 00                      |             i32.const 0
 005d41: 28 02 88 96 c0 80 00       |             i32.load 2 1051400
 005d48: 46                         |             i32.eq
 005d49: 0d 00                      |             br_if 0
 005d4b: 20 00                      |             local.get 0
 005d4d: 28 02 0c                   |             i32.load 2 12
 005d50: 21 03                      |             local.set 3
 005d52: 02 40                      |             block
 005d54: 20 04                      |               local.get 4
 005d56: 41 ff 01                   |               i32.const 255
 005d59: 4b                         |               i32.gt_u
 005d5a: 0d 00                      |               br_if 0
 005d5c: 20 03                      |               local.get 3
 005d5e: 20 00                      |               local.get 0
 005d60: 28 02 08                   |               i32.load 2 8
 005d63: 22 05                      |               local.tee 5
 005d65: 47                         |               i32.ne
 005d66: 0d 02                      |               br_if 2
 005d68: 41 00                      |               i32.const 0
 005d6a: 41 00                      |               i32.const 0
 005d6c: 28 02 f4 95 c0 80 00       |               i32.load 2 1051380
 005d73: 41 7e                      |               i32.const 4294967294
 005d75: 20 04                      |               local.get 4
 005d77: 41 03                      |               i32.const 3
 005d79: 76                         |               i32.shr_u
 005d7a: 77                         |               i32.rotl
 005d7b: 71                         |               i32.and
 005d7c: 36 02 f4 95 c0 80 00       |               i32.store 2 1051380
 005d83: 0c 05                      |               br 5
 005d85: 0b                         |             end
 005d86: 20 00                      |             local.get 0
 005d88: 28 02 18                   |             i32.load 2 24
 005d8b: 21 06                      |             local.set 6
 005d8d: 02 40                      |             block
 005d8f: 20 03                      |               local.get 3
 005d91: 20 00                      |               local.get 0
 005d93: 46                         |               i32.eq
 005d94: 0d 00                      |               br_if 0
 005d96: 20 00                      |               local.get 0
 005d98: 28 02 08                   |               i32.load 2 8
 005d9b: 22 04                      |               local.tee 4
 005d9d: 20 03                      |               local.get 3
 005d9f: 36 02 0c                   |               i32.store 2 12
 005da2: 20 03                      |               local.get 3
 005da4: 20 04                      |               local.get 4
 005da6: 36 02 08                   |               i32.store 2 8
 005da9: 0c 04                      |               br 4
 005dab: 0b                         |             end
 005dac: 02 40                      |             block
 005dae: 02 40                      |               block
 005db0: 20 00                      |                 local.get 0
 005db2: 28 02 14                   |                 i32.load 2 20
 005db5: 22 04                      |                 local.tee 4
 005db7: 45                         |                 i32.eqz
 005db8: 0d 00                      |                 br_if 0
 005dba: 20 00                      |                 local.get 0
 005dbc: 41 14                      |                 i32.const 20
 005dbe: 6a                         |                 i32.add
 005dbf: 21 05                      |                 local.set 5
 005dc1: 0c 01                      |                 br 1
 005dc3: 0b                         |               end
 005dc4: 20 00                      |               local.get 0
 005dc6: 28 02 10                   |               i32.load 2 16
 005dc9: 22 04                      |               local.tee 4
 005dcb: 45                         |               i32.eqz
 005dcc: 0d 03                      |               br_if 3
 005dce: 20 00                      |               local.get 0
 005dd0: 41 10                      |               i32.const 16
 005dd2: 6a                         |               i32.add
 005dd3: 21 05                      |               local.set 5
 005dd5: 0b                         |             end
 005dd6: 03 40                      |             loop
 005dd8: 20 05                      |               local.get 5
 005dda: 21 07                      |               local.set 7
 005ddc: 20 04                      |               local.get 4
 005dde: 22 03                      |               local.tee 3
 005de0: 41 14                      |               i32.const 20
 005de2: 6a                         |               i32.add
 005de3: 21 05                      |               local.set 5
 005de5: 20 03                      |               local.get 3
 005de7: 28 02 14                   |               i32.load 2 20
 005dea: 22 04                      |               local.tee 4
 005dec: 0d 00                      |               br_if 0
 005dee: 20 03                      |               local.get 3
 005df0: 41 10                      |               i32.const 16
 005df2: 6a                         |               i32.add
 005df3: 21 05                      |               local.set 5
 005df5: 20 03                      |               local.get 3
 005df7: 28 02 10                   |               i32.load 2 16
 005dfa: 22 04                      |               local.tee 4
 005dfc: 0d 00                      |               br_if 0
 005dfe: 0b                         |             end
 005dff: 20 07                      |             local.get 7
 005e01: 41 00                      |             i32.const 0
 005e03: 36 02 00                   |             i32.store 2 0
 005e06: 0c 03                      |             br 3
 005e08: 0b                         |           end
 005e09: 20 02                      |           local.get 2
 005e0b: 28 02 04                   |           i32.load 2 4
 005e0e: 22 03                      |           local.tee 3
 005e10: 41 03                      |           i32.const 3
 005e12: 71                         |           i32.and
 005e13: 41 03                      |           i32.const 3
 005e15: 47                         |           i32.ne
 005e16: 0d 03                      |           br_if 3
 005e18: 20 02                      |           local.get 2
 005e1a: 20 03                      |           local.get 3
 005e1c: 41 7e                      |           i32.const 4294967294
 005e1e: 71                         |           i32.and
 005e1f: 36 02 04                   |           i32.store 2 4
 005e22: 41 00                      |           i32.const 0
 005e24: 20 01                      |           local.get 1
 005e26: 36 02 fc 95 c0 80 00       |           i32.store 2 1051388
 005e2d: 20 02                      |           local.get 2
 005e2f: 20 01                      |           local.get 1
 005e31: 36 02 00                   |           i32.store 2 0
 005e34: 20 00                      |           local.get 0
 005e36: 20 01                      |           local.get 1
 005e38: 41 01                      |           i32.const 1
 005e3a: 72                         |           i32.or
 005e3b: 36 02 04                   |           i32.store 2 4
 005e3e: 0f                         |           return
 005e3f: 0b                         |         end
 005e40: 20 03                      |         local.get 3
 005e42: 20 05                      |         local.get 5
 005e44: 36 02 08                   |         i32.store 2 8
 005e47: 20 05                      |         local.get 5
 005e49: 20 03                      |         local.get 3
 005e4b: 36 02 0c                   |         i32.store 2 12
 005e4e: 0c 02                      |         br 2
 005e50: 0b                         |       end
 005e51: 41 00                      |       i32.const 0
 005e53: 21 03                      |       local.set 3
 005e55: 0b                         |     end
 005e56: 20 06                      |     local.get 6
 005e58: 45                         |     i32.eqz
 005e59: 0d 00                      |     br_if 0
 005e5b: 02 40                      |     block
 005e5d: 02 40                      |       block
 005e5f: 20 00                      |         local.get 0
 005e61: 20 00                      |         local.get 0
 005e63: 28 02 1c                   |         i32.load 2 28
 005e66: 22 05                      |         local.tee 5
 005e68: 41 02                      |         i32.const 2
 005e6a: 74                         |         i32.shl
 005e6b: 41 a4 98 c0 80 00          |         i32.const 1051684
 005e71: 6a                         |         i32.add
 005e72: 22 04                      |         local.tee 4
 005e74: 28 02 00                   |         i32.load 2 0
 005e77: 47                         |         i32.ne
 005e78: 0d 00                      |         br_if 0
 005e7a: 20 04                      |         local.get 4
 005e7c: 20 03                      |         local.get 3
 005e7e: 36 02 00                   |         i32.store 2 0
 005e81: 20 03                      |         local.get 3
 005e83: 0d 01                      |         br_if 1
 005e85: 41 00                      |         i32.const 0
 005e87: 41 00                      |         i32.const 0
 005e89: 28 02 f8 95 c0 80 00       |         i32.load 2 1051384
 005e90: 41 7e                      |         i32.const 4294967294
 005e92: 20 05                      |         local.get 5
 005e94: 77                         |         i32.rotl
 005e95: 71                         |         i32.and
 005e96: 36 02 f8 95 c0 80 00       |         i32.store 2 1051384
 005e9d: 0c 02                      |         br 2
 005e9f: 0b                         |       end
 005ea0: 20 06                      |       local.get 6
 005ea2: 41 10                      |       i32.const 16
 005ea4: 41 14                      |       i32.const 20
 005ea6: 20 06                      |       local.get 6
 005ea8: 28 02 10                   |       i32.load 2 16
 005eab: 20 00                      |       local.get 0
 005ead: 46                         |       i32.eq
 005eae: 1b                         |       select
 005eaf: 6a                         |       i32.add
 005eb0: 20 03                      |       local.get 3
 005eb2: 36 02 00                   |       i32.store 2 0
 005eb5: 20 03                      |       local.get 3
 005eb7: 45                         |       i32.eqz
 005eb8: 0d 01                      |       br_if 1
 005eba: 0b                         |     end
 005ebb: 20 03                      |     local.get 3
 005ebd: 20 06                      |     local.get 6
 005ebf: 36 02 18                   |     i32.store 2 24
 005ec2: 02 40                      |     block
 005ec4: 20 00                      |       local.get 0
 005ec6: 28 02 10                   |       i32.load 2 16
 005ec9: 22 04                      |       local.tee 4
 005ecb: 45                         |       i32.eqz
 005ecc: 0d 00                      |       br_if 0
 005ece: 20 03                      |       local.get 3
 005ed0: 20 04                      |       local.get 4
 005ed2: 36 02 10                   |       i32.store 2 16
 005ed5: 20 04                      |       local.get 4
 005ed7: 20 03                      |       local.get 3
 005ed9: 36 02 18                   |       i32.store 2 24
 005edc: 0b                         |     end
 005edd: 20 00                      |     local.get 0
 005edf: 28 02 14                   |     i32.load 2 20
 005ee2: 22 04                      |     local.tee 4
 005ee4: 45                         |     i32.eqz
 005ee5: 0d 00                      |     br_if 0
 005ee7: 20 03                      |     local.get 3
 005ee9: 20 04                      |     local.get 4
 005eeb: 36 02 14                   |     i32.store 2 20
 005eee: 20 04                      |     local.get 4
 005ef0: 20 03                      |     local.get 3
 005ef2: 36 02 18                   |     i32.store 2 24
 005ef5: 0b                         |   end
 005ef6: 02 40                      |   block
 005ef8: 02 40                      |     block
 005efa: 02 40                      |       block
 005efc: 02 40                      |         block
 005efe: 02 40                      |           block
 005f00: 20 02                      |             local.get 2
 005f02: 28 02 04                   |             i32.load 2 4
 005f05: 22 04                      |             local.tee 4
 005f07: 41 02                      |             i32.const 2
 005f09: 71                         |             i32.and
 005f0a: 0d 00                      |             br_if 0
 005f0c: 02 40                      |             block
 005f0e: 20 02                      |               local.get 2
 005f10: 41 00                      |               i32.const 0
 005f12: 28 02 8c 96 c0 80 00       |               i32.load 2 1051404
 005f19: 47                         |               i32.ne
 005f1a: 0d 00                      |               br_if 0
 005f1c: 41 00                      |               i32.const 0
 005f1e: 20 00                      |               local.get 0
 005f20: 36 02 8c 96 c0 80 00       |               i32.store 2 1051404
 005f27: 41 00                      |               i32.const 0
 005f29: 41 00                      |               i32.const 0
 005f2b: 28 02 80 96 c0 80 00       |               i32.load 2 1051392
 005f32: 20 01                      |               local.get 1
 005f34: 6a                         |               i32.add
 005f35: 22 01                      |               local.tee 1
 005f37: 36 02 80 96 c0 80 00       |               i32.store 2 1051392
 005f3e: 20 00                      |               local.get 0
 005f40: 20 01                      |               local.get 1
 005f42: 41 01                      |               i32.const 1
 005f44: 72                         |               i32.or
 005f45: 36 02 04                   |               i32.store 2 4
 005f48: 20 00                      |               local.get 0
 005f4a: 41 00                      |               i32.const 0
 005f4c: 28 02 88 96 c0 80 00       |               i32.load 2 1051400
 005f53: 47                         |               i32.ne
 005f54: 0d 06                      |               br_if 6
 005f56: 41 00                      |               i32.const 0
 005f58: 41 00                      |               i32.const 0
 005f5a: 36 02 fc 95 c0 80 00       |               i32.store 2 1051388
 005f61: 41 00                      |               i32.const 0
 005f63: 41 00                      |               i32.const 0
 005f65: 36 02 88 96 c0 80 00       |               i32.store 2 1051400
 005f6c: 0f                         |               return
 005f6d: 0b                         |             end
 005f6e: 02 40                      |             block
 005f70: 20 02                      |               local.get 2
 005f72: 41 00                      |               i32.const 0
 005f74: 28 02 88 96 c0 80 00       |               i32.load 2 1051400
 005f7b: 47                         |               i32.ne
 005f7c: 0d 00                      |               br_if 0
 005f7e: 41 00                      |               i32.const 0
 005f80: 20 00                      |               local.get 0
 005f82: 36 02 88 96 c0 80 00       |               i32.store 2 1051400
 005f89: 41 00                      |               i32.const 0
 005f8b: 41 00                      |               i32.const 0
 005f8d: 28 02 fc 95 c0 80 00       |               i32.load 2 1051388
 005f94: 20 01                      |               local.get 1
 005f96: 6a                         |               i32.add
 005f97: 22 01                      |               local.tee 1
 005f99: 36 02 fc 95 c0 80 00       |               i32.store 2 1051388
 005fa0: 20 00                      |               local.get 0
 005fa2: 20 01                      |               local.get 1
 005fa4: 41 01                      |               i32.const 1
 005fa6: 72                         |               i32.or
 005fa7: 36 02 04                   |               i32.store 2 4
 005faa: 20 00                      |               local.get 0
 005fac: 20 01                      |               local.get 1
 005fae: 6a                         |               i32.add
 005faf: 20 01                      |               local.get 1
 005fb1: 36 02 00                   |               i32.store 2 0
 005fb4: 0f                         |               return
 005fb5: 0b                         |             end
 005fb6: 20 04                      |             local.get 4
 005fb8: 41 78                      |             i32.const 4294967288
 005fba: 71                         |             i32.and
 005fbb: 20 01                      |             local.get 1
 005fbd: 6a                         |             i32.add
 005fbe: 21 01                      |             local.set 1
 005fc0: 20 02                      |             local.get 2
 005fc2: 28 02 0c                   |             i32.load 2 12
 005fc5: 21 03                      |             local.set 3
 005fc7: 02 40                      |             block
 005fc9: 20 04                      |               local.get 4
 005fcb: 41 ff 01                   |               i32.const 255
 005fce: 4b                         |               i32.gt_u
 005fcf: 0d 00                      |               br_if 0
 005fd1: 02 40                      |               block
 005fd3: 20 03                      |                 local.get 3
 005fd5: 20 02                      |                 local.get 2
 005fd7: 28 02 08                   |                 i32.load 2 8
 005fda: 22 05                      |                 local.tee 5
 005fdc: 47                         |                 i32.ne
 005fdd: 0d 00                      |                 br_if 0
 005fdf: 41 00                      |                 i32.const 0
 005fe1: 41 00                      |                 i32.const 0
 005fe3: 28 02 f4 95 c0 80 00       |                 i32.load 2 1051380
 005fea: 41 7e                      |                 i32.const 4294967294
 005fec: 20 04                      |                 local.get 4
 005fee: 41 03                      |                 i32.const 3
 005ff0: 76                         |                 i32.shr_u
 005ff1: 77                         |                 i32.rotl
 005ff2: 71                         |                 i32.and
 005ff3: 36 02 f4 95 c0 80 00       |                 i32.store 2 1051380
 005ffa: 0c 05                      |                 br 5
 005ffc: 0b                         |               end
 005ffd: 20 03                      |               local.get 3
 005fff: 20 05                      |               local.get 5
 006001: 36 02 08                   |               i32.store 2 8
 006004: 20 05                      |               local.get 5
 006006: 20 03                      |               local.get 3
 006008: 36 02 0c                   |               i32.store 2 12
 00600b: 0c 04                      |               br 4
 00600d: 0b                         |             end
 00600e: 20 02                      |             local.get 2
 006010: 28 02 18                   |             i32.load 2 24
 006013: 21 06                      |             local.set 6
 006015: 02 40                      |             block
 006017: 20 03                      |               local.get 3
 006019: 20 02                      |               local.get 2
 00601b: 46                         |               i32.eq
 00601c: 0d 00                      |               br_if 0
 00601e: 20 02                      |               local.get 2
 006020: 28 02 08                   |               i32.load 2 8
 006023: 22 04                      |               local.tee 4
 006025: 20 03                      |               local.get 3
 006027: 36 02 0c                   |               i32.store 2 12
 00602a: 20 03                      |               local.get 3
 00602c: 20 04                      |               local.get 4
 00602e: 36 02 08                   |               i32.store 2 8
 006031: 0c 03                      |               br 3
 006033: 0b                         |             end
 006034: 02 40                      |             block
 006036: 02 40                      |               block
 006038: 20 02                      |                 local.get 2
 00603a: 28 02 14                   |                 i32.load 2 20
 00603d: 22 04                      |                 local.tee 4
 00603f: 45                         |                 i32.eqz
 006040: 0d 00                      |                 br_if 0
 006042: 20 02                      |                 local.get 2
 006044: 41 14                      |                 i32.const 20
 006046: 6a                         |                 i32.add
 006047: 21 05                      |                 local.set 5
 006049: 0c 01                      |                 br 1
 00604b: 0b                         |               end
 00604c: 20 02                      |               local.get 2
 00604e: 28 02 10                   |               i32.load 2 16
 006051: 22 04                      |               local.tee 4
 006053: 45                         |               i32.eqz
 006054: 0d 02                      |               br_if 2
 006056: 20 02                      |               local.get 2
 006058: 41 10                      |               i32.const 16
 00605a: 6a                         |               i32.add
 00605b: 21 05                      |               local.set 5
 00605d: 0b                         |             end
 00605e: 03 40                      |             loop
 006060: 20 05                      |               local.get 5
 006062: 21 07                      |               local.set 7
 006064: 20 04                      |               local.get 4
 006066: 22 03                      |               local.tee 3
 006068: 41 14                      |               i32.const 20
 00606a: 6a                         |               i32.add
 00606b: 21 05                      |               local.set 5
 00606d: 20 03                      |               local.get 3
 00606f: 28 02 14                   |               i32.load 2 20
 006072: 22 04                      |               local.tee 4
 006074: 0d 00                      |               br_if 0
 006076: 20 03                      |               local.get 3
 006078: 41 10                      |               i32.const 16
 00607a: 6a                         |               i32.add
 00607b: 21 05                      |               local.set 5
 00607d: 20 03                      |               local.get 3
 00607f: 28 02 10                   |               i32.load 2 16
 006082: 22 04                      |               local.tee 4
 006084: 0d 00                      |               br_if 0
 006086: 0b                         |             end
 006087: 20 07                      |             local.get 7
 006089: 41 00                      |             i32.const 0
 00608b: 36 02 00                   |             i32.store 2 0
 00608e: 0c 02                      |             br 2
 006090: 0b                         |           end
 006091: 20 02                      |           local.get 2
 006093: 20 04                      |           local.get 4
 006095: 41 7e                      |           i32.const 4294967294
 006097: 71                         |           i32.and
 006098: 36 02 04                   |           i32.store 2 4
 00609b: 20 00                      |           local.get 0
 00609d: 20 01                      |           local.get 1
 00609f: 6a                         |           i32.add
 0060a0: 20 01                      |           local.get 1
 0060a2: 36 02 00                   |           i32.store 2 0
 0060a5: 20 00                      |           local.get 0
 0060a7: 20 01                      |           local.get 1
 0060a9: 41 01                      |           i32.const 1
 0060ab: 72                         |           i32.or
 0060ac: 36 02 04                   |           i32.store 2 4
 0060af: 0c 03                      |           br 3
 0060b1: 0b                         |         end
 0060b2: 41 00                      |         i32.const 0
 0060b4: 21 03                      |         local.set 3
 0060b6: 0b                         |       end
 0060b7: 20 06                      |       local.get 6
 0060b9: 45                         |       i32.eqz
 0060ba: 0d 00                      |       br_if 0
 0060bc: 02 40                      |       block
 0060be: 02 40                      |         block
 0060c0: 20 02                      |           local.get 2
 0060c2: 20 02                      |           local.get 2
 0060c4: 28 02 1c                   |           i32.load 2 28
 0060c7: 22 05                      |           local.tee 5
 0060c9: 41 02                      |           i32.const 2
 0060cb: 74                         |           i32.shl
 0060cc: 41 a4 98 c0 80 00          |           i32.const 1051684
 0060d2: 6a                         |           i32.add
 0060d3: 22 04                      |           local.tee 4
 0060d5: 28 02 00                   |           i32.load 2 0
 0060d8: 47                         |           i32.ne
 0060d9: 0d 00                      |           br_if 0
 0060db: 20 04                      |           local.get 4
 0060dd: 20 03                      |           local.get 3
 0060df: 36 02 00                   |           i32.store 2 0
 0060e2: 20 03                      |           local.get 3
 0060e4: 0d 01                      |           br_if 1
 0060e6: 41 00                      |           i32.const 0
 0060e8: 41 00                      |           i32.const 0
 0060ea: 28 02 f8 95 c0 80 00       |           i32.load 2 1051384
 0060f1: 41 7e                      |           i32.const 4294967294
 0060f3: 20 05                      |           local.get 5
 0060f5: 77                         |           i32.rotl
 0060f6: 71                         |           i32.and
 0060f7: 36 02 f8 95 c0 80 00       |           i32.store 2 1051384
 0060fe: 0c 02                      |           br 2
 006100: 0b                         |         end
 006101: 20 06                      |         local.get 6
 006103: 41 10                      |         i32.const 16
 006105: 41 14                      |         i32.const 20
 006107: 20 06                      |         local.get 6
 006109: 28 02 10                   |         i32.load 2 16
 00610c: 20 02                      |         local.get 2
 00610e: 46                         |         i32.eq
 00610f: 1b                         |         select
 006110: 6a                         |         i32.add
 006111: 20 03                      |         local.get 3
 006113: 36 02 00                   |         i32.store 2 0
 006116: 20 03                      |         local.get 3
 006118: 45                         |         i32.eqz
 006119: 0d 01                      |         br_if 1
 00611b: 0b                         |       end
 00611c: 20 03                      |       local.get 3
 00611e: 20 06                      |       local.get 6
 006120: 36 02 18                   |       i32.store 2 24
 006123: 02 40                      |       block
 006125: 20 02                      |         local.get 2
 006127: 28 02 10                   |         i32.load 2 16
 00612a: 22 04                      |         local.tee 4
 00612c: 45                         |         i32.eqz
 00612d: 0d 00                      |         br_if 0
 00612f: 20 03                      |         local.get 3
 006131: 20 04                      |         local.get 4
 006133: 36 02 10                   |         i32.store 2 16
 006136: 20 04                      |         local.get 4
 006138: 20 03                      |         local.get 3
 00613a: 36 02 18                   |         i32.store 2 24
 00613d: 0b                         |       end
 00613e: 20 02                      |       local.get 2
 006140: 28 02 14                   |       i32.load 2 20
 006143: 22 04                      |       local.tee 4
 006145: 45                         |       i32.eqz
 006146: 0d 00                      |       br_if 0
 006148: 20 03                      |       local.get 3
 00614a: 20 04                      |       local.get 4
 00614c: 36 02 14                   |       i32.store 2 20
 00614f: 20 04                      |       local.get 4
 006151: 20 03                      |       local.get 3
 006153: 36 02 18                   |       i32.store 2 24
 006156: 0b                         |     end
 006157: 20 00                      |     local.get 0
 006159: 20 01                      |     local.get 1
 00615b: 6a                         |     i32.add
 00615c: 20 01                      |     local.get 1
 00615e: 36 02 00                   |     i32.store 2 0
 006161: 20 00                      |     local.get 0
 006163: 20 01                      |     local.get 1
 006165: 41 01                      |     i32.const 1
 006167: 72                         |     i32.or
 006168: 36 02 04                   |     i32.store 2 4
 00616b: 20 00                      |     local.get 0
 00616d: 41 00                      |     i32.const 0
 00616f: 28 02 88 96 c0 80 00       |     i32.load 2 1051400
 006176: 47                         |     i32.ne
 006177: 0d 00                      |     br_if 0
 006179: 41 00                      |     i32.const 0
 00617b: 20 01                      |     local.get 1
 00617d: 36 02 fc 95 c0 80 00       |     i32.store 2 1051388
 006184: 0f                         |     return
 006185: 0b                         |   end
 006186: 02 40                      |   block
 006188: 20 01                      |     local.get 1
 00618a: 41 ff 01                   |     i32.const 255
 00618d: 4b                         |     i32.gt_u
 00618e: 0d 00                      |     br_if 0
 006190: 20 01                      |     local.get 1
 006192: 41 78                      |     i32.const 4294967288
 006194: 71                         |     i32.and
 006195: 41 9c 96 c0 80 00          |     i32.const 1051420
 00619b: 6a                         |     i32.add
 00619c: 21 03                      |     local.set 3
 00619e: 02 40                      |     block
 0061a0: 02 40                      |       block
 0061a2: 41 00                      |         i32.const 0
 0061a4: 28 02 f4 95 c0 80 00       |         i32.load 2 1051380
 0061ab: 22 04                      |         local.tee 4
 0061ad: 41 01                      |         i32.const 1
 0061af: 20 01                      |         local.get 1
 0061b1: 41 03                      |         i32.const 3
 0061b3: 76                         |         i32.shr_u
 0061b4: 74                         |         i32.shl
 0061b5: 22 01                      |         local.tee 1
 0061b7: 71                         |         i32.and
 0061b8: 0d 00                      |         br_if 0
 0061ba: 41 00                      |         i32.const 0
 0061bc: 20 04                      |         local.get 4
 0061be: 20 01                      |         local.get 1
 0061c0: 72                         |         i32.or
 0061c1: 36 02 f4 95 c0 80 00       |         i32.store 2 1051380
 0061c8: 20 03                      |         local.get 3
 0061ca: 21 01                      |         local.set 1
 0061cc: 0c 01                      |         br 1
 0061ce: 0b                         |       end
 0061cf: 20 03                      |       local.get 3
 0061d1: 28 02 08                   |       i32.load 2 8
 0061d4: 21 01                      |       local.set 1
 0061d6: 0b                         |     end
 0061d7: 20 01                      |     local.get 1
 0061d9: 20 00                      |     local.get 0
 0061db: 36 02 0c                   |     i32.store 2 12
 0061de: 20 03                      |     local.get 3
 0061e0: 20 00                      |     local.get 0
 0061e2: 36 02 08                   |     i32.store 2 8
 0061e5: 20 00                      |     local.get 0
 0061e7: 20 03                      |     local.get 3
 0061e9: 36 02 0c                   |     i32.store 2 12
 0061ec: 20 00                      |     local.get 0
 0061ee: 20 01                      |     local.get 1
 0061f0: 36 02 08                   |     i32.store 2 8
 0061f3: 0f                         |     return
 0061f4: 0b                         |   end
 0061f5: 41 1f                      |   i32.const 31
 0061f7: 21 03                      |   local.set 3
 0061f9: 02 40                      |   block
 0061fb: 20 01                      |     local.get 1
 0061fd: 41 ff ff ff 07             |     i32.const 16777215
 006202: 4b                         |     i32.gt_u
 006203: 0d 00                      |     br_if 0
 006205: 20 01                      |     local.get 1
 006207: 41 26                      |     i32.const 38
 006209: 20 01                      |     local.get 1
 00620b: 41 08                      |     i32.const 8
 00620d: 76                         |     i32.shr_u
 00620e: 67                         |     i32.clz
 00620f: 22 03                      |     local.tee 3
 006211: 6b                         |     i32.sub
 006212: 76                         |     i32.shr_u
 006213: 41 01                      |     i32.const 1
 006215: 71                         |     i32.and
 006216: 20 03                      |     local.get 3
 006218: 41 01                      |     i32.const 1
 00621a: 74                         |     i32.shl
 00621b: 6b                         |     i32.sub
 00621c: 41 3e                      |     i32.const 62
 00621e: 6a                         |     i32.add
 00621f: 21 03                      |     local.set 3
 006221: 0b                         |   end
 006222: 20 00                      |   local.get 0
 006224: 20 03                      |   local.get 3
 006226: 36 02 1c                   |   i32.store 2 28
 006229: 20 00                      |   local.get 0
 00622b: 42 00                      |   i64.const 0
 00622d: 37 02 10                   |   i64.store 2 16
 006230: 20 03                      |   local.get 3
 006232: 41 02                      |   i32.const 2
 006234: 74                         |   i32.shl
 006235: 41 a4 98 c0 80 00          |   i32.const 1051684
 00623b: 6a                         |   i32.add
 00623c: 21 04                      |   local.set 4
 00623e: 02 40                      |   block
 006240: 41 00                      |     i32.const 0
 006242: 28 02 f8 95 c0 80 00       |     i32.load 2 1051384
 006249: 22 05                      |     local.tee 5
 00624b: 41 01                      |     i32.const 1
 00624d: 20 03                      |     local.get 3
 00624f: 74                         |     i32.shl
 006250: 22 02                      |     local.tee 2
 006252: 71                         |     i32.and
 006253: 0d 00                      |     br_if 0
 006255: 20 04                      |     local.get 4
 006257: 20 00                      |     local.get 0
 006259: 36 02 00                   |     i32.store 2 0
 00625c: 41 00                      |     i32.const 0
 00625e: 20 05                      |     local.get 5
 006260: 20 02                      |     local.get 2
 006262: 72                         |     i32.or
 006263: 36 02 f8 95 c0 80 00       |     i32.store 2 1051384
 00626a: 20 00                      |     local.get 0
 00626c: 20 04                      |     local.get 4
 00626e: 36 02 18                   |     i32.store 2 24
 006271: 20 00                      |     local.get 0
 006273: 20 00                      |     local.get 0
 006275: 36 02 08                   |     i32.store 2 8
 006278: 20 00                      |     local.get 0
 00627a: 20 00                      |     local.get 0
 00627c: 36 02 0c                   |     i32.store 2 12
 00627f: 0f                         |     return
 006280: 0b                         |   end
 006281: 20 01                      |   local.get 1
 006283: 41 00                      |   i32.const 0
 006285: 41 19                      |   i32.const 25
 006287: 20 03                      |   local.get 3
 006289: 41 01                      |   i32.const 1
 00628b: 76                         |   i32.shr_u
 00628c: 6b                         |   i32.sub
 00628d: 20 03                      |   local.get 3
 00628f: 41 1f                      |   i32.const 31
 006291: 46                         |   i32.eq
 006292: 1b                         |   select
 006293: 74                         |   i32.shl
 006294: 21 03                      |   local.set 3
 006296: 20 04                      |   local.get 4
 006298: 28 02 00                   |   i32.load 2 0
 00629b: 21 05                      |   local.set 5
 00629d: 02 40                      |   block
 00629f: 03 40                      |     loop
 0062a1: 20 05                      |       local.get 5
 0062a3: 22 04                      |       local.tee 4
 0062a5: 28 02 04                   |       i32.load 2 4
 0062a8: 41 78                      |       i32.const 4294967288
 0062aa: 71                         |       i32.and
 0062ab: 20 01                      |       local.get 1
 0062ad: 46                         |       i32.eq
 0062ae: 0d 01                      |       br_if 1
 0062b0: 20 03                      |       local.get 3
 0062b2: 41 1d                      |       i32.const 29
 0062b4: 76                         |       i32.shr_u
 0062b5: 21 05                      |       local.set 5
 0062b7: 20 03                      |       local.get 3
 0062b9: 41 01                      |       i32.const 1
 0062bb: 74                         |       i32.shl
 0062bc: 21 03                      |       local.set 3
 0062be: 20 04                      |       local.get 4
 0062c0: 20 05                      |       local.get 5
 0062c2: 41 04                      |       i32.const 4
 0062c4: 71                         |       i32.and
 0062c5: 6a                         |       i32.add
 0062c6: 41 10                      |       i32.const 16
 0062c8: 6a                         |       i32.add
 0062c9: 22 02                      |       local.tee 2
 0062cb: 28 02 00                   |       i32.load 2 0
 0062ce: 22 05                      |       local.tee 5
 0062d0: 0d 00                      |       br_if 0
 0062d2: 0b                         |     end
 0062d3: 20 02                      |     local.get 2
 0062d5: 20 00                      |     local.get 0
 0062d7: 36 02 00                   |     i32.store 2 0
 0062da: 20 00                      |     local.get 0
 0062dc: 20 04                      |     local.get 4
 0062de: 36 02 18                   |     i32.store 2 24
 0062e1: 20 00                      |     local.get 0
 0062e3: 20 00                      |     local.get 0
 0062e5: 36 02 0c                   |     i32.store 2 12
 0062e8: 20 00                      |     local.get 0
 0062ea: 20 00                      |     local.get 0
 0062ec: 36 02 08                   |     i32.store 2 8
 0062ef: 0f                         |     return
 0062f0: 0b                         |   end
 0062f1: 20 04                      |   local.get 4
 0062f3: 28 02 08                   |   i32.load 2 8
 0062f6: 22 01                      |   local.tee 1
 0062f8: 20 00                      |   local.get 0
 0062fa: 36 02 0c                   |   i32.store 2 12
 0062fd: 20 04                      |   local.get 4
 0062ff: 20 00                      |   local.get 0
 006301: 36 02 08                   |   i32.store 2 8
 006304: 20 00                      |   local.get 0
 006306: 41 00                      |   i32.const 0
 006308: 36 02 18                   |   i32.store 2 24
 00630b: 20 00                      |   local.get 0
 00630d: 20 04                      |   local.get 4
 00630f: 36 02 0c                   |   i32.store 2 12
 006312: 20 00                      |   local.get 0
 006314: 20 01                      |   local.get 1
 006316: 36 02 08                   |   i32.store 2 8
 006319: 0b                         | end
 00631a: 0b                         | end
00631c func[96] <posix_memalign>:
 00631d: 02 7f                      | local[3..4] type=i32
 00631f: 02 40                      | block
 006321: 02 40                      |   block
 006323: 02 40                      |     block
 006325: 20 01                      |       local.get 1
 006327: 41 10                      |       i32.const 16
 006329: 47                         |       i32.ne
 00632a: 0d 00                      |       br_if 0
 00632c: 20 02                      |       local.get 2
 00632e: 10 d9 80 80 80 00          |       call 89 <dlmalloc>
 006334: 21 01                      |       local.set 1
 006336: 0c 01                      |       br 1
 006338: 0b                         |     end
 006339: 41 1c                      |     i32.const 28
 00633b: 21 03                      |     local.set 3
 00633d: 20 01                      |     local.get 1
 00633f: 41 04                      |     i32.const 4
 006341: 49                         |     i32.lt_u
 006342: 0d 01                      |     br_if 1
 006344: 20 01                      |     local.get 1
 006346: 41 03                      |     i32.const 3
 006348: 71                         |     i32.and
 006349: 0d 01                      |     br_if 1
 00634b: 20 01                      |     local.get 1
 00634d: 41 02                      |     i32.const 2
 00634f: 76                         |     i32.shr_u
 006350: 22 04                      |     local.tee 4
 006352: 20 04                      |     local.get 4
 006354: 41 7f                      |     i32.const 4294967295
 006356: 6a                         |     i32.add
 006357: 71                         |     i32.and
 006358: 0d 01                      |     br_if 1
 00635a: 02 40                      |     block
 00635c: 41 40                      |       i32.const 4294967232
 00635e: 20 01                      |       local.get 1
 006360: 6b                         |       i32.sub
 006361: 20 02                      |       local.get 2
 006363: 4f                         |       i32.ge_u
 006364: 0d 00                      |       br_if 0
 006366: 41 30                      |       i32.const 48
 006368: 0f                         |       return
 006369: 0b                         |     end
 00636a: 20 01                      |     local.get 1
 00636c: 41 10                      |     i32.const 16
 00636e: 20 01                      |     local.get 1
 006370: 41 10                      |     i32.const 16
 006372: 4b                         |     i32.gt_u
 006373: 1b                         |     select
 006374: 20 02                      |     local.get 2
 006376: 10 e1 80 80 80 00          |     call 97 <internal_memalign>
 00637c: 21 01                      |     local.set 1
 00637e: 0b                         |   end
 00637f: 02 40                      |   block
 006381: 20 01                      |     local.get 1
 006383: 0d 00                      |     br_if 0
 006385: 41 30                      |     i32.const 48
 006387: 0f                         |     return
 006388: 0b                         |   end
 006389: 20 00                      |   local.get 0
 00638b: 20 01                      |   local.get 1
 00638d: 36 02 00                   |   i32.store 2 0
 006390: 41 00                      |   i32.const 0
 006392: 21 03                      |   local.set 3
 006394: 0b                         | end
 006395: 20 03                      | local.get 3
 006397: 0b                         | end
00639a func[97] <internal_memalign>:
 00639b: 05 7f                      | local[2..6] type=i32
 00639d: 02 40                      | block
 00639f: 02 40                      |   block
 0063a1: 20 00                      |     local.get 0
 0063a3: 41 10                      |     i32.const 16
 0063a5: 20 00                      |     local.get 0
 0063a7: 41 10                      |     i32.const 16
 0063a9: 4b                         |     i32.gt_u
 0063aa: 1b                         |     select
 0063ab: 22 02                      |     local.tee 2
 0063ad: 20 02                      |     local.get 2
 0063af: 41 7f                      |     i32.const 4294967295
 0063b1: 6a                         |     i32.add
 0063b2: 71                         |     i32.and
 0063b3: 0d 00                      |     br_if 0
 0063b5: 20 02                      |     local.get 2
 0063b7: 21 00                      |     local.set 0
 0063b9: 0c 01                      |     br 1
 0063bb: 0b                         |   end
 0063bc: 41 20                      |   i32.const 32
 0063be: 21 03                      |   local.set 3
 0063c0: 03 40                      |   loop
 0063c2: 20 03                      |     local.get 3
 0063c4: 22 00                      |     local.tee 0
 0063c6: 41 01                      |     i32.const 1
 0063c8: 74                         |     i32.shl
 0063c9: 21 03                      |     local.set 3
 0063cb: 20 00                      |     local.get 0
 0063cd: 20 02                      |     local.get 2
 0063cf: 49                         |     i32.lt_u
 0063d0: 0d 00                      |     br_if 0
 0063d2: 0b                         |   end
 0063d3: 0b                         | end
 0063d4: 02 40                      | block
 0063d6: 41 40                      |   i32.const 4294967232
 0063d8: 20 00                      |   local.get 0
 0063da: 6b                         |   i32.sub
 0063db: 20 01                      |   local.get 1
 0063dd: 4b                         |   i32.gt_u
 0063de: 0d 00                      |   br_if 0
 0063e0: 41 00                      |   i32.const 0
 0063e2: 41 30                      |   i32.const 48
 0063e4: 36 02 e4 99 c0 80 00       |   i32.store 2 1051876
 0063eb: 41 00                      |   i32.const 0
 0063ed: 0f                         |   return
 0063ee: 0b                         | end
 0063ef: 02 40                      | block
 0063f1: 20 00                      |   local.get 0
 0063f3: 41 10                      |   i32.const 16
 0063f5: 20 01                      |   local.get 1
 0063f7: 41 13                      |   i32.const 19
 0063f9: 6a                         |   i32.add
 0063fa: 41 70                      |   i32.const 4294967280
 0063fc: 71                         |   i32.and
 0063fd: 20 01                      |   local.get 1
 0063ff: 41 0b                      |   i32.const 11
 006401: 49                         |   i32.lt_u
 006402: 1b                         |   select
 006403: 22 01                      |   local.tee 1
 006405: 6a                         |   i32.add
 006406: 41 0c                      |   i32.const 12
 006408: 6a                         |   i32.add
 006409: 10 d9 80 80 80 00          |   call 89 <dlmalloc>
 00640f: 22 03                      |   local.tee 3
 006411: 0d 00                      |   br_if 0
 006413: 41 00                      |   i32.const 0
 006415: 0f                         |   return
 006416: 0b                         | end
 006417: 20 03                      | local.get 3
 006419: 41 78                      | i32.const 4294967288
 00641b: 6a                         | i32.add
 00641c: 21 02                      | local.set 2
 00641e: 02 40                      | block
 006420: 02 40                      |   block
 006422: 20 00                      |     local.get 0
 006424: 41 7f                      |     i32.const 4294967295
 006426: 6a                         |     i32.add
 006427: 20 03                      |     local.get 3
 006429: 71                         |     i32.and
 00642a: 0d 00                      |     br_if 0
 00642c: 20 02                      |     local.get 2
 00642e: 21 00                      |     local.set 0
 006430: 0c 01                      |     br 1
 006432: 0b                         |   end
 006433: 20 03                      |   local.get 3
 006435: 41 7c                      |   i32.const 4294967292
 006437: 6a                         |   i32.add
 006438: 22 04                      |   local.tee 4
 00643a: 28 02 00                   |   i32.load 2 0
 00643d: 22 05                      |   local.tee 5
 00643f: 41 78                      |   i32.const 4294967288
 006441: 71                         |   i32.and
 006442: 20 03                      |   local.get 3
 006444: 20 00                      |   local.get 0
 006446: 6a                         |   i32.add
 006447: 41 7f                      |   i32.const 4294967295
 006449: 6a                         |   i32.add
 00644a: 41 00                      |   i32.const 0
 00644c: 20 00                      |   local.get 0
 00644e: 6b                         |   i32.sub
 00644f: 71                         |   i32.and
 006450: 41 78                      |   i32.const 4294967288
 006452: 6a                         |   i32.add
 006453: 22 03                      |   local.tee 3
 006455: 41 00                      |   i32.const 0
 006457: 20 00                      |   local.get 0
 006459: 20 03                      |   local.get 3
 00645b: 20 02                      |   local.get 2
 00645d: 6b                         |   i32.sub
 00645e: 41 0f                      |   i32.const 15
 006460: 4b                         |   i32.gt_u
 006461: 1b                         |   select
 006462: 6a                         |   i32.add
 006463: 22 00                      |   local.tee 0
 006465: 20 02                      |   local.get 2
 006467: 6b                         |   i32.sub
 006468: 22 03                      |   local.tee 3
 00646a: 6b                         |   i32.sub
 00646b: 21 06                      |   local.set 6
 00646d: 02 40                      |   block
 00646f: 20 05                      |     local.get 5
 006471: 41 03                      |     i32.const 3
 006473: 71                         |     i32.and
 006474: 0d 00                      |     br_if 0
 006476: 20 00                      |     local.get 0
 006478: 20 06                      |     local.get 6
 00647a: 36 02 04                   |     i32.store 2 4
 00647d: 20 00                      |     local.get 0
 00647f: 20 02                      |     local.get 2
 006481: 28 02 00                   |     i32.load 2 0
 006484: 20 03                      |     local.get 3
 006486: 6a                         |     i32.add
 006487: 36 02 00                   |     i32.store 2 0
 00648a: 0c 01                      |     br 1
 00648c: 0b                         |   end
 00648d: 20 00                      |   local.get 0
 00648f: 20 06                      |   local.get 6
 006491: 20 00                      |   local.get 0
 006493: 28 02 04                   |   i32.load 2 4
 006496: 41 01                      |   i32.const 1
 006498: 71                         |   i32.and
 006499: 72                         |   i32.or
 00649a: 41 02                      |   i32.const 2
 00649c: 72                         |   i32.or
 00649d: 36 02 04                   |   i32.store 2 4
 0064a0: 20 00                      |   local.get 0
 0064a2: 20 06                      |   local.get 6
 0064a4: 6a                         |   i32.add
 0064a5: 22 06                      |   local.tee 6
 0064a7: 20 06                      |   local.get 6
 0064a9: 28 02 04                   |   i32.load 2 4
 0064ac: 41 01                      |   i32.const 1
 0064ae: 72                         |   i32.or
 0064af: 36 02 04                   |   i32.store 2 4
 0064b2: 20 04                      |   local.get 4
 0064b4: 20 03                      |   local.get 3
 0064b6: 20 04                      |   local.get 4
 0064b8: 28 02 00                   |   i32.load 2 0
 0064bb: 41 01                      |   i32.const 1
 0064bd: 71                         |   i32.and
 0064be: 72                         |   i32.or
 0064bf: 41 02                      |   i32.const 2
 0064c1: 72                         |   i32.or
 0064c2: 36 02 00                   |   i32.store 2 0
 0064c5: 20 02                      |   local.get 2
 0064c7: 20 03                      |   local.get 3
 0064c9: 6a                         |   i32.add
 0064ca: 22 06                      |   local.tee 6
 0064cc: 20 06                      |   local.get 6
 0064ce: 28 02 04                   |   i32.load 2 4
 0064d1: 41 01                      |   i32.const 1
 0064d3: 72                         |   i32.or
 0064d4: 36 02 04                   |   i32.store 2 4
 0064d7: 20 02                      |   local.get 2
 0064d9: 20 03                      |   local.get 3
 0064db: 10 df 80 80 80 00          |   call 95 <dispose_chunk>
 0064e1: 0b                         | end
 0064e2: 02 40                      | block
 0064e4: 20 00                      |   local.get 0
 0064e6: 28 02 04                   |   i32.load 2 4
 0064e9: 22 03                      |   local.tee 3
 0064eb: 41 03                      |   i32.const 3
 0064ed: 71                         |   i32.and
 0064ee: 45                         |   i32.eqz
 0064ef: 0d 00                      |   br_if 0
 0064f1: 20 03                      |   local.get 3
 0064f3: 41 78                      |   i32.const 4294967288
 0064f5: 71                         |   i32.and
 0064f6: 22 02                      |   local.tee 2
 0064f8: 20 01                      |   local.get 1
 0064fa: 41 10                      |   i32.const 16
 0064fc: 6a                         |   i32.add
 0064fd: 4d                         |   i32.le_u
 0064fe: 0d 00                      |   br_if 0
 006500: 20 00                      |   local.get 0
 006502: 20 01                      |   local.get 1
 006504: 20 03                      |   local.get 3
 006506: 41 01                      |   i32.const 1
 006508: 71                         |   i32.and
 006509: 72                         |   i32.or
 00650a: 41 02                      |   i32.const 2
 00650c: 72                         |   i32.or
 00650d: 36 02 04                   |   i32.store 2 4
 006510: 20 00                      |   local.get 0
 006512: 20 01                      |   local.get 1
 006514: 6a                         |   i32.add
 006515: 22 03                      |   local.tee 3
 006517: 20 02                      |   local.get 2
 006519: 20 01                      |   local.get 1
 00651b: 6b                         |   i32.sub
 00651c: 22 01                      |   local.tee 1
 00651e: 41 03                      |   i32.const 3
 006520: 72                         |   i32.or
 006521: 36 02 04                   |   i32.store 2 4
 006524: 20 00                      |   local.get 0
 006526: 20 02                      |   local.get 2
 006528: 6a                         |   i32.add
 006529: 22 02                      |   local.tee 2
 00652b: 20 02                      |   local.get 2
 00652d: 28 02 04                   |   i32.load 2 4
 006530: 41 01                      |   i32.const 1
 006532: 72                         |   i32.or
 006533: 36 02 04                   |   i32.store 2 4
 006536: 20 03                      |   local.get 3
 006538: 20 01                      |   local.get 1
 00653a: 10 df 80 80 80 00          |   call 95 <dispose_chunk>
 006540: 0b                         | end
 006541: 20 00                      | local.get 0
 006543: 41 08                      | i32.const 8
 006545: 6a                         | i32.add
 006546: 0b                         | end
006548 func[98] <_Exit>:
 006549: 20 00                      | local.get 0
 00654b: 10 e7 80 80 80 00          | call 103 <__wasi_proc_exit>
 006551: 00                         | unreachable
 006552: 0b                         | end
006554 func[99] <__wasilibc_ensure_environ>:
 006555: 02 40                      | block
 006557: 41 00                      |   i32.const 0
 006559: 28 02 a8 95 c0 80 00       |   i32.load 2 1051304
 006560: 41 7f                      |   i32.const 4294967295
 006562: 47                         |   i32.ne
 006563: 0d 00                      |   br_if 0
 006565: 10 e4 80 80 80 00          |   call 100 <__wasilibc_initialize_environ>
 00656b: 0b                         | end
 00656c: 0b                         | end
00656f func[100] <__wasilibc_initialize_environ>:
 006570: 03 7f                      | local[0..2] type=i32
 006572: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 006578: 41 10                      | i32.const 16
 00657a: 6b                         | i32.sub
 00657b: 22 00                      | local.tee 0
 00657d: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 006583: 02 40                      | block
 006585: 02 40                      |   block
 006587: 20 00                      |     local.get 0
 006589: 41 0c                      |     i32.const 12
 00658b: 6a                         |     i32.add
 00658c: 20 00                      |     local.get 0
 00658e: 41 08                      |     i32.const 8
 006590: 6a                         |     i32.add
 006591: 10 e6 80 80 80 00          |     call 102 <__wasi_environ_sizes_get>
 006597: 0d 00                      |     br_if 0
 006599: 02 40                      |     block
 00659b: 20 00                      |       local.get 0
 00659d: 28 02 0c                   |       i32.load 2 12
 0065a0: 22 01                      |       local.tee 1
 0065a2: 0d 00                      |       br_if 0
 0065a4: 41 e8 99 c0 80 00          |       i32.const 1051880
 0065aa: 21 01                      |       local.set 1
 0065ac: 0c 02                      |       br 2
 0065ae: 0b                         |     end
 0065af: 02 40                      |     block
 0065b1: 02 40                      |       block
 0065b3: 20 01                      |         local.get 1
 0065b5: 41 01                      |         i32.const 1
 0065b7: 6a                         |         i32.add
 0065b8: 22 01                      |         local.tee 1
 0065ba: 45                         |         i32.eqz
 0065bb: 0d 00                      |         br_if 0
 0065bd: 20 00                      |         local.get 0
 0065bf: 28 02 08                   |         i32.load 2 8
 0065c2: 10 d8 80 80 80 00          |         call 88 <malloc>
 0065c8: 22 02                      |         local.tee 2
 0065ca: 45                         |         i32.eqz
 0065cb: 0d 00                      |         br_if 0
 0065cd: 20 01                      |         local.get 1
 0065cf: 41 04                      |         i32.const 4
 0065d1: 10 dd 80 80 80 00          |         call 93 <calloc>
 0065d7: 22 01                      |         local.tee 1
 0065d9: 0d 01                      |         br_if 1
 0065db: 20 02                      |         local.get 2
 0065dd: 10 db 80 80 80 00          |         call 91 <free>
 0065e3: 0b                         |       end
 0065e4: 41 c6 00                   |       i32.const 70
 0065e7: 10 e2 80 80 80 00          |       call 98 <_Exit>
 0065ed: 00                         |       unreachable
 0065ee: 0b                         |     end
 0065ef: 20 01                      |     local.get 1
 0065f1: 20 02                      |     local.get 2
 0065f3: 10 e5 80 80 80 00          |     call 101 <__wasi_environ_get>
 0065f9: 45                         |     i32.eqz
 0065fa: 0d 01                      |     br_if 1
 0065fc: 20 02                      |     local.get 2
 0065fe: 10 db 80 80 80 00          |     call 91 <free>
 006604: 20 01                      |     local.get 1
 006606: 10 db 80 80 80 00          |     call 91 <free>
 00660c: 0b                         |   end
 00660d: 41 c7 00                   |   i32.const 71
 006610: 10 e2 80 80 80 00          |   call 98 <_Exit>
 006616: 00                         |   unreachable
 006617: 0b                         | end
 006618: 41 00                      | i32.const 0
 00661a: 20 01                      | local.get 1
 00661c: 36 02 a8 95 c0 80 00       | i32.store 2 1051304
 006623: 20 00                      | local.get 0
 006625: 41 10                      | i32.const 16
 006627: 6a                         | i32.add
 006628: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00662e: 0b                         | end
006630 func[101] <__wasi_environ_get>:
 006631: 20 00                      | local.get 0
 006633: 20 01                      | local.get 1
 006635: 10 81 80 80 80 00          | call 1 <__imported_wasi_snapshot_preview1_environ_get>
 00663b: 41 ff ff 03                | i32.const 65535
 00663f: 71                         | i32.and
 006640: 0b                         | end
006642 func[102] <__wasi_environ_sizes_get>:
 006643: 20 00                      | local.get 0
 006645: 20 01                      | local.get 1
 006647: 10 82 80 80 80 00          | call 2 <__imported_wasi_snapshot_preview1_environ_sizes_get>
 00664d: 41 ff ff 03                | i32.const 65535
 006651: 71                         | i32.and
 006652: 0b                         | end
006654 func[103] <__wasi_proc_exit>:
 006655: 20 00                      | local.get 0
 006657: 10 83 80 80 80 00          | call 3 <__imported_wasi_snapshot_preview1_proc_exit>
 00665d: 00                         | unreachable
 00665e: 0b                         | end
006660 func[104] <abort>:
 006661: 00                         | unreachable
 006662: 0b                         | end
006664 func[105] <getcwd>:
 006665: 01 7f                      | local[2] type=i32
 006667: 41 00                      | i32.const 0
 006669: 28 02 ac 95 c0 80 00       | i32.load 2 1051308
 006670: 21 02                      | local.set 2
 006672: 02 40                      | block
 006674: 02 40                      |   block
 006676: 20 00                      |     local.get 0
 006678: 0d 00                      |     br_if 0
 00667a: 20 02                      |     local.get 2
 00667c: 10 f3 80 80 80 00          |     call 115 <strdup>
 006682: 22 00                      |     local.tee 0
 006684: 0d 01                      |     br_if 1
 006686: 41 00                      |     i32.const 0
 006688: 41 30                      |     i32.const 48
 00668a: 36 02 e4 99 c0 80 00       |     i32.store 2 1051876
 006691: 41 00                      |     i32.const 0
 006693: 0f                         |     return
 006694: 0b                         |   end
 006695: 02 40                      |   block
 006697: 20 02                      |     local.get 2
 006699: 10 f4 80 80 80 00          |     call 116 <strlen>
 00669f: 41 01                      |     i32.const 1
 0066a1: 6a                         |     i32.add
 0066a2: 20 01                      |     local.get 1
 0066a4: 4d                         |     i32.le_u
 0066a5: 0d 00                      |     br_if 0
 0066a7: 41 00                      |     i32.const 0
 0066a9: 41 c4 00                   |     i32.const 68
 0066ac: 36 02 e4 99 c0 80 00       |     i32.store 2 1051876
 0066b3: 41 00                      |     i32.const 0
 0066b5: 0f                         |     return
 0066b6: 0b                         |   end
 0066b7: 20 00                      |   local.get 0
 0066b9: 20 02                      |   local.get 2
 0066bb: 10 f2 80 80 80 00          |   call 114 <strcpy>
 0066c1: 21 00                      |   local.set 0
 0066c3: 0b                         | end
 0066c4: 20 00                      | local.get 0
 0066c6: 0b                         | end
0066c8 func[106] <sbrk>:
 0066c9: 02 40                      | block
 0066cb: 20 00                      |   local.get 0
 0066cd: 0d 00                      |   br_if 0
 0066cf: 3f 00                      |   memory.size 0
 0066d1: 41 10                      |   i32.const 16
 0066d3: 74                         |   i32.shl
 0066d4: 0f                         |   return
 0066d5: 0b                         | end
 0066d6: 02 40                      | block
 0066d8: 20 00                      |   local.get 0
 0066da: 41 ff ff 03                |   i32.const 65535
 0066de: 71                         |   i32.and
 0066df: 0d 00                      |   br_if 0
 0066e1: 20 00                      |   local.get 0
 0066e3: 41 7f                      |   i32.const 4294967295
 0066e5: 4c                         |   i32.le_s
 0066e6: 0d 00                      |   br_if 0
 0066e8: 02 40                      |   block
 0066ea: 20 00                      |     local.get 0
 0066ec: 41 10                      |     i32.const 16
 0066ee: 76                         |     i32.shr_u
 0066ef: 40 00                      |     memory.grow 0
 0066f1: 22 00                      |     local.tee 0
 0066f3: 41 7f                      |     i32.const 4294967295
 0066f5: 47                         |     i32.ne
 0066f6: 0d 00                      |     br_if 0
 0066f8: 41 00                      |     i32.const 0
 0066fa: 41 30                      |     i32.const 48
 0066fc: 36 02 e4 99 c0 80 00       |     i32.store 2 1051876
 006703: 41 7f                      |     i32.const 4294967295
 006705: 0f                         |     return
 006706: 0b                         |   end
 006707: 20 00                      |   local.get 0
 006709: 41 10                      |   i32.const 16
 00670b: 74                         |   i32.shl
 00670c: 0f                         |   return
 00670d: 0b                         | end
 00670e: 10 e8 80 80 80 00          | call 104 <abort>
 006714: 00                         | unreachable
 006715: 0b                         | end
006718 func[107] <getenv>:
 006719: 04 7f                      | local[1..4] type=i32
 00671b: 10 e3 80 80 80 00          | call 99 <__wasilibc_ensure_environ>
 006721: 02 40                      | block
 006723: 20 00                      |   local.get 0
 006725: 41 3d                      |   i32.const 61
 006727: 10 f0 80 80 80 00          |   call 112 <__strchrnul>
 00672d: 22 01                      |   local.tee 1
 00672f: 20 00                      |   local.get 0
 006731: 47                         |   i32.ne
 006732: 0d 00                      |   br_if 0
 006734: 41 00                      |   i32.const 0
 006736: 0f                         |   return
 006737: 0b                         | end
 006738: 41 00                      | i32.const 0
 00673a: 21 02                      | local.set 2
 00673c: 02 40                      | block
 00673e: 20 00                      |   local.get 0
 006740: 20 01                      |   local.get 1
 006742: 20 00                      |   local.get 0
 006744: 6b                         |   i32.sub
 006745: 22 03                      |   local.tee 3
 006747: 6a                         |   i32.add
 006748: 2d 00 00                   |   i32.load8_u 0 0
 00674b: 0d 00                      |   br_if 0
 00674d: 41 00                      |   i32.const 0
 00674f: 28 02 a8 95 c0 80 00       |   i32.load 2 1051304
 006756: 22 04                      |   local.tee 4
 006758: 45                         |   i32.eqz
 006759: 0d 00                      |   br_if 0
 00675b: 20 04                      |   local.get 4
 00675d: 28 02 00                   |   i32.load 2 0
 006760: 22 01                      |   local.tee 1
 006762: 45                         |   i32.eqz
 006763: 0d 00                      |   br_if 0
 006765: 20 04                      |   local.get 4
 006767: 41 04                      |   i32.const 4
 006769: 6a                         |   i32.add
 00676a: 21 04                      |   local.set 4
 00676c: 02 40                      |   block
 00676e: 03 40                      |     loop
 006770: 02 40                      |       block
 006772: 20 00                      |         local.get 0
 006774: 20 01                      |         local.get 1
 006776: 20 03                      |         local.get 3
 006778: 10 f5 80 80 80 00          |         call 117 <strncmp>
 00677e: 0d 00                      |         br_if 0
 006780: 20 01                      |         local.get 1
 006782: 20 03                      |         local.get 3
 006784: 6a                         |         i32.add
 006785: 22 01                      |         local.tee 1
 006787: 2d 00 00                   |         i32.load8_u 0 0
 00678a: 41 3d                      |         i32.const 61
 00678c: 46                         |         i32.eq
 00678d: 0d 02                      |         br_if 2
 00678f: 0b                         |       end
 006790: 20 04                      |       local.get 4
 006792: 28 02 00                   |       i32.load 2 0
 006795: 21 01                      |       local.set 1
 006797: 20 04                      |       local.get 4
 006799: 41 04                      |       i32.const 4
 00679b: 6a                         |       i32.add
 00679c: 21 04                      |       local.set 4
 00679e: 20 01                      |       local.get 1
 0067a0: 0d 00                      |       br_if 0
 0067a2: 0c 02                      |       br 2
 0067a4: 0b                         |     end
 0067a5: 0b                         |   end
 0067a6: 20 01                      |   local.get 1
 0067a8: 41 01                      |   i32.const 1
 0067aa: 6a                         |   i32.add
 0067ab: 21 02                      |   local.set 2
 0067ad: 0b                         | end
 0067ae: 20 02                      | local.get 2
 0067b0: 0b                         | end
0067b2 func[108] <dummy>:
 0067b3: 0b                         | end
0067b5 func[109] <__wasm_call_dtors>:
 0067b6: 10 ec 80 80 80 00          | call 108 <dummy>
 0067bc: 10 ec 80 80 80 00          | call 108 <dummy>
 0067c2: 0b                         | end
0067c5 func[110] <memcpy>:
 0067c6: 04 7f                      | local[3..6] type=i32
 0067c8: 02 40                      | block
 0067ca: 02 40                      |   block
 0067cc: 02 40                      |     block
 0067ce: 20 02                      |       local.get 2
 0067d0: 41 20                      |       i32.const 32
 0067d2: 4b                         |       i32.gt_u
 0067d3: 0d 00                      |       br_if 0
 0067d5: 20 01                      |       local.get 1
 0067d7: 41 03                      |       i32.const 3
 0067d9: 71                         |       i32.and
 0067da: 45                         |       i32.eqz
 0067db: 0d 01                      |       br_if 1
 0067dd: 20 02                      |       local.get 2
 0067df: 45                         |       i32.eqz
 0067e0: 0d 01                      |       br_if 1
 0067e2: 20 00                      |       local.get 0
 0067e4: 20 01                      |       local.get 1
 0067e6: 2d 00 00                   |       i32.load8_u 0 0
 0067e9: 3a 00 00                   |       i32.store8 0 0
 0067ec: 20 02                      |       local.get 2
 0067ee: 41 7f                      |       i32.const 4294967295
 0067f0: 6a                         |       i32.add
 0067f1: 21 03                      |       local.set 3
 0067f3: 20 00                      |       local.get 0
 0067f5: 41 01                      |       i32.const 1
 0067f7: 6a                         |       i32.add
 0067f8: 21 04                      |       local.set 4
 0067fa: 20 01                      |       local.get 1
 0067fc: 41 01                      |       i32.const 1
 0067fe: 6a                         |       i32.add
 0067ff: 22 05                      |       local.tee 5
 006801: 41 03                      |       i32.const 3
 006803: 71                         |       i32.and
 006804: 45                         |       i32.eqz
 006805: 0d 02                      |       br_if 2
 006807: 20 03                      |       local.get 3
 006809: 45                         |       i32.eqz
 00680a: 0d 02                      |       br_if 2
 00680c: 20 00                      |       local.get 0
 00680e: 20 01                      |       local.get 1
 006810: 2d 00 01                   |       i32.load8_u 0 1
 006813: 3a 00 01                   |       i32.store8 0 1
 006816: 20 02                      |       local.get 2
 006818: 41 7e                      |       i32.const 4294967294
 00681a: 6a                         |       i32.add
 00681b: 21 03                      |       local.set 3
 00681d: 20 00                      |       local.get 0
 00681f: 41 02                      |       i32.const 2
 006821: 6a                         |       i32.add
 006822: 21 04                      |       local.set 4
 006824: 20 01                      |       local.get 1
 006826: 41 02                      |       i32.const 2
 006828: 6a                         |       i32.add
 006829: 22 05                      |       local.tee 5
 00682b: 41 03                      |       i32.const 3
 00682d: 71                         |       i32.and
 00682e: 45                         |       i32.eqz
 00682f: 0d 02                      |       br_if 2
 006831: 20 03                      |       local.get 3
 006833: 45                         |       i32.eqz
 006834: 0d 02                      |       br_if 2
 006836: 20 00                      |       local.get 0
 006838: 20 01                      |       local.get 1
 00683a: 2d 00 02                   |       i32.load8_u 0 2
 00683d: 3a 00 02                   |       i32.store8 0 2
 006840: 20 02                      |       local.get 2
 006842: 41 7d                      |       i32.const 4294967293
 006844: 6a                         |       i32.add
 006845: 21 03                      |       local.set 3
 006847: 20 00                      |       local.get 0
 006849: 41 03                      |       i32.const 3
 00684b: 6a                         |       i32.add
 00684c: 21 04                      |       local.set 4
 00684e: 20 01                      |       local.get 1
 006850: 41 03                      |       i32.const 3
 006852: 6a                         |       i32.add
 006853: 22 05                      |       local.tee 5
 006855: 41 03                      |       i32.const 3
 006857: 71                         |       i32.and
 006858: 45                         |       i32.eqz
 006859: 0d 02                      |       br_if 2
 00685b: 20 03                      |       local.get 3
 00685d: 45                         |       i32.eqz
 00685e: 0d 02                      |       br_if 2
 006860: 20 00                      |       local.get 0
 006862: 20 01                      |       local.get 1
 006864: 2d 00 03                   |       i32.load8_u 0 3
 006867: 3a 00 03                   |       i32.store8 0 3
 00686a: 20 02                      |       local.get 2
 00686c: 41 7c                      |       i32.const 4294967292
 00686e: 6a                         |       i32.add
 00686f: 21 03                      |       local.set 3
 006871: 20 00                      |       local.get 0
 006873: 41 04                      |       i32.const 4
 006875: 6a                         |       i32.add
 006876: 21 04                      |       local.set 4
 006878: 20 01                      |       local.get 1
 00687a: 41 04                      |       i32.const 4
 00687c: 6a                         |       i32.add
 00687d: 21 05                      |       local.set 5
 00687f: 0c 02                      |       br 2
 006881: 0b                         |     end
 006882: 20 00                      |     local.get 0
 006884: 20 01                      |     local.get 1
 006886: 20 02                      |     local.get 2
 006888: fc 0a 00 00                |     memory.copy 0 0
 00688c: 20 00                      |     local.get 0
 00688e: 0f                         |     return
 00688f: 0b                         |   end
 006890: 20 02                      |   local.get 2
 006892: 21 03                      |   local.set 3
 006894: 20 00                      |   local.get 0
 006896: 21 04                      |   local.set 4
 006898: 20 01                      |   local.get 1
 00689a: 21 05                      |   local.set 5
 00689c: 0b                         | end
 00689d: 02 40                      | block
 00689f: 02 40                      |   block
 0068a1: 20 04                      |     local.get 4
 0068a3: 41 03                      |     i32.const 3
 0068a5: 71                         |     i32.and
 0068a6: 22 02                      |     local.tee 2
 0068a8: 0d 00                      |     br_if 0
 0068aa: 02 40                      |     block
 0068ac: 02 40                      |       block
 0068ae: 20 03                      |         local.get 3
 0068b0: 41 10                      |         i32.const 16
 0068b2: 4f                         |         i32.ge_u
 0068b3: 0d 00                      |         br_if 0
 0068b5: 20 03                      |         local.get 3
 0068b7: 21 02                      |         local.set 2
 0068b9: 0c 01                      |         br 1
 0068bb: 0b                         |       end
 0068bc: 02 40                      |       block
 0068be: 20 03                      |         local.get 3
 0068c0: 41 70                      |         i32.const 4294967280
 0068c2: 6a                         |         i32.add
 0068c3: 22 02                      |         local.tee 2
 0068c5: 41 10                      |         i32.const 16
 0068c7: 71                         |         i32.and
 0068c8: 0d 00                      |         br_if 0
 0068ca: 20 04                      |         local.get 4
 0068cc: 20 05                      |         local.get 5
 0068ce: 29 02 00                   |         i64.load 2 0
 0068d1: 37 02 00                   |         i64.store 2 0
 0068d4: 20 04                      |         local.get 4
 0068d6: 20 05                      |         local.get 5
 0068d8: 29 02 08                   |         i64.load 2 8
 0068db: 37 02 08                   |         i64.store 2 8
 0068de: 20 04                      |         local.get 4
 0068e0: 41 10                      |         i32.const 16
 0068e2: 6a                         |         i32.add
 0068e3: 21 04                      |         local.set 4
 0068e5: 20 05                      |         local.get 5
 0068e7: 41 10                      |         i32.const 16
 0068e9: 6a                         |         i32.add
 0068ea: 21 05                      |         local.set 5
 0068ec: 20 02                      |         local.get 2
 0068ee: 21 03                      |         local.set 3
 0068f0: 0b                         |       end
 0068f1: 20 02                      |       local.get 2
 0068f3: 41 10                      |       i32.const 16
 0068f5: 49                         |       i32.lt_u
 0068f6: 0d 00                      |       br_if 0
 0068f8: 20 03                      |       local.get 3
 0068fa: 21 02                      |       local.set 2
 0068fc: 03 40                      |       loop
 0068fe: 20 04                      |         local.get 4
 006900: 20 05                      |         local.get 5
 006902: 29 02 00                   |         i64.load 2 0
 006905: 37 02 00                   |         i64.store 2 0
 006908: 20 04                      |         local.get 4
 00690a: 20 05                      |         local.get 5
 00690c: 29 02 08                   |         i64.load 2 8
 00690f: 37 02 08                   |         i64.store 2 8
 006912: 20 04                      |         local.get 4
 006914: 20 05                      |         local.get 5
 006916: 29 02 10                   |         i64.load 2 16
 006919: 37 02 10                   |         i64.store 2 16
 00691c: 20 04                      |         local.get 4
 00691e: 20 05                      |         local.get 5
 006920: 29 02 18                   |         i64.load 2 24
 006923: 37 02 18                   |         i64.store 2 24
 006926: 20 04                      |         local.get 4
 006928: 41 20                      |         i32.const 32
 00692a: 6a                         |         i32.add
 00692b: 21 04                      |         local.set 4
 00692d: 20 05                      |         local.get 5
 00692f: 41 20                      |         i32.const 32
 006931: 6a                         |         i32.add
 006932: 21 05                      |         local.set 5
 006934: 20 02                      |         local.get 2
 006936: 41 60                      |         i32.const 4294967264
 006938: 6a                         |         i32.add
 006939: 22 02                      |         local.tee 2
 00693b: 41 0f                      |         i32.const 15
 00693d: 4b                         |         i32.gt_u
 00693e: 0d 00                      |         br_if 0
 006940: 0b                         |       end
 006941: 0b                         |     end
 006942: 02 40                      |     block
 006944: 20 02                      |       local.get 2
 006946: 41 08                      |       i32.const 8
 006948: 49                         |       i32.lt_u
 006949: 0d 00                      |       br_if 0
 00694b: 20 04                      |       local.get 4
 00694d: 20 05                      |       local.get 5
 00694f: 29 02 00                   |       i64.load 2 0
 006952: 37 02 00                   |       i64.store 2 0
 006955: 20 05                      |       local.get 5
 006957: 41 08                      |       i32.const 8
 006959: 6a                         |       i32.add
 00695a: 21 05                      |       local.set 5
 00695c: 20 04                      |       local.get 4
 00695e: 41 08                      |       i32.const 8
 006960: 6a                         |       i32.add
 006961: 21 04                      |       local.set 4
 006963: 0b                         |     end
 006964: 02 40                      |     block
 006966: 20 02                      |       local.get 2
 006968: 41 04                      |       i32.const 4
 00696a: 71                         |       i32.and
 00696b: 45                         |       i32.eqz
 00696c: 0d 00                      |       br_if 0
 00696e: 20 04                      |       local.get 4
 006970: 20 05                      |       local.get 5
 006972: 28 02 00                   |       i32.load 2 0
 006975: 36 02 00                   |       i32.store 2 0
 006978: 20 05                      |       local.get 5
 00697a: 41 04                      |       i32.const 4
 00697c: 6a                         |       i32.add
 00697d: 21 05                      |       local.set 5
 00697f: 20 04                      |       local.get 4
 006981: 41 04                      |       i32.const 4
 006983: 6a                         |       i32.add
 006984: 21 04                      |       local.set 4
 006986: 0b                         |     end
 006987: 02 40                      |     block
 006989: 20 02                      |       local.get 2
 00698b: 41 02                      |       i32.const 2
 00698d: 71                         |       i32.and
 00698e: 45                         |       i32.eqz
 00698f: 0d 00                      |       br_if 0
 006991: 20 04                      |       local.get 4
 006993: 20 05                      |       local.get 5
 006995: 2f 00 00                   |       i32.load16_u 0 0
 006998: 3b 00 00                   |       i32.store16 0 0
 00699b: 20 04                      |       local.get 4
 00699d: 41 02                      |       i32.const 2
 00699f: 6a                         |       i32.add
 0069a0: 21 04                      |       local.set 4
 0069a2: 20 05                      |       local.get 5
 0069a4: 41 02                      |       i32.const 2
 0069a6: 6a                         |       i32.add
 0069a7: 21 05                      |       local.set 5
 0069a9: 0b                         |     end
 0069aa: 20 02                      |     local.get 2
 0069ac: 41 01                      |     i32.const 1
 0069ae: 71                         |     i32.and
 0069af: 45                         |     i32.eqz
 0069b0: 0d 01                      |     br_if 1
 0069b2: 20 04                      |     local.get 4
 0069b4: 20 05                      |     local.get 5
 0069b6: 2d 00 00                   |     i32.load8_u 0 0
 0069b9: 3a 00 00                   |     i32.store8 0 0
 0069bc: 20 00                      |     local.get 0
 0069be: 0f                         |     return
 0069bf: 0b                         |   end
 0069c0: 02 40                      |   block
 0069c2: 02 40                      |     block
 0069c4: 02 40                      |       block
 0069c6: 02 40                      |         block
 0069c8: 02 40                      |           block
 0069ca: 20 03                      |             local.get 3
 0069cc: 41 20                      |             i32.const 32
 0069ce: 49                         |             i32.lt_u
 0069cf: 0d 00                      |             br_if 0
 0069d1: 20 04                      |             local.get 4
 0069d3: 20 05                      |             local.get 5
 0069d5: 28 02 00                   |             i32.load 2 0
 0069d8: 22 03                      |             local.tee 3
 0069da: 3a 00 00                   |             i32.store8 0 0
 0069dd: 02 40                      |             block
 0069df: 02 40                      |               block
 0069e1: 20 02                      |                 local.get 2
 0069e3: 41 7f                      |                 i32.const 4294967295
 0069e5: 6a                         |                 i32.add
 0069e6: 0e 03 03 00 01 03          |                 br_table 3 0 1 3
 0069ec: 0b                         |               end
 0069ed: 20 04                      |               local.get 4
 0069ef: 20 03                      |               local.get 3
 0069f1: 41 08                      |               i32.const 8
 0069f3: 76                         |               i32.shr_u
 0069f4: 3a 00 01                   |               i32.store8 0 1
 0069f7: 20 04                      |               local.get 4
 0069f9: 20 05                      |               local.get 5
 0069fb: 41 06                      |               i32.const 6
 0069fd: 6a                         |               i32.add
 0069fe: 29 01 00                   |               i64.load 1 0
 006a01: 37 02 06                   |               i64.store 2 6
 006a04: 20 04                      |               local.get 4
 006a06: 20 05                      |               local.get 5
 006a08: 28 02 04                   |               i32.load 2 4
 006a0b: 41 10                      |               i32.const 16
 006a0d: 74                         |               i32.shl
 006a0e: 20 03                      |               local.get 3
 006a10: 41 10                      |               i32.const 16
 006a12: 76                         |               i32.shr_u
 006a13: 72                         |               i32.or
 006a14: 36 02 02                   |               i32.store 2 2
 006a17: 20 04                      |               local.get 4
 006a19: 41 12                      |               i32.const 18
 006a1b: 6a                         |               i32.add
 006a1c: 21 02                      |               local.set 2
 006a1e: 20 05                      |               local.get 5
 006a20: 41 12                      |               i32.const 18
 006a22: 6a                         |               i32.add
 006a23: 21 01                      |               local.set 1
 006a25: 41 0e                      |               i32.const 14
 006a27: 21 06                      |               local.set 6
 006a29: 20 05                      |               local.get 5
 006a2b: 41 0e                      |               i32.const 14
 006a2d: 6a                         |               i32.add
 006a2e: 28 01 00                   |               i32.load 1 0
 006a31: 21 05                      |               local.set 5
 006a33: 41 0e                      |               i32.const 14
 006a35: 21 03                      |               local.set 3
 006a37: 0c 03                      |               br 3
 006a39: 0b                         |             end
 006a3a: 20 04                      |             local.get 4
 006a3c: 20 05                      |             local.get 5
 006a3e: 41 05                      |             i32.const 5
 006a40: 6a                         |             i32.add
 006a41: 29 00 00                   |             i64.load 0 0
 006a44: 37 02 05                   |             i64.store 2 5
 006a47: 20 04                      |             local.get 4
 006a49: 20 05                      |             local.get 5
 006a4b: 28 02 04                   |             i32.load 2 4
 006a4e: 41 18                      |             i32.const 24
 006a50: 74                         |             i32.shl
 006a51: 20 03                      |             local.get 3
 006a53: 41 08                      |             i32.const 8
 006a55: 76                         |             i32.shr_u
 006a56: 72                         |             i32.or
 006a57: 36 02 01                   |             i32.store 2 1
 006a5a: 20 04                      |             local.get 4
 006a5c: 41 11                      |             i32.const 17
 006a5e: 6a                         |             i32.add
 006a5f: 21 02                      |             local.set 2
 006a61: 20 05                      |             local.get 5
 006a63: 41 11                      |             i32.const 17
 006a65: 6a                         |             i32.add
 006a66: 21 01                      |             local.set 1
 006a68: 41 0d                      |             i32.const 13
 006a6a: 21 06                      |             local.set 6
 006a6c: 20 05                      |             local.get 5
 006a6e: 41 0d                      |             i32.const 13
 006a70: 6a                         |             i32.add
 006a71: 28 00 00                   |             i32.load 0 0
 006a74: 21 05                      |             local.set 5
 006a76: 41 0f                      |             i32.const 15
 006a78: 21 03                      |             local.set 3
 006a7a: 0c 02                      |             br 2
 006a7c: 0b                         |           end
 006a7d: 02 40                      |           block
 006a7f: 02 40                      |             block
 006a81: 20 03                      |               local.get 3
 006a83: 41 10                      |               i32.const 16
 006a85: 4f                         |               i32.ge_u
 006a86: 0d 00                      |               br_if 0
 006a88: 20 04                      |               local.get 4
 006a8a: 21 02                      |               local.set 2
 006a8c: 20 05                      |               local.get 5
 006a8e: 21 01                      |               local.set 1
 006a90: 0c 01                      |               br 1
 006a92: 0b                         |             end
 006a93: 20 04                      |             local.get 4
 006a95: 20 05                      |             local.get 5
 006a97: 2d 00 00                   |             i32.load8_u 0 0
 006a9a: 3a 00 00                   |             i32.store8 0 0
 006a9d: 20 04                      |             local.get 4
 006a9f: 20 05                      |             local.get 5
 006aa1: 28 00 01                   |             i32.load 0 1
 006aa4: 36 00 01                   |             i32.store 0 1
 006aa7: 20 04                      |             local.get 4
 006aa9: 20 05                      |             local.get 5
 006aab: 29 00 05                   |             i64.load 0 5
 006aae: 37 00 05                   |             i64.store 0 5
 006ab1: 20 04                      |             local.get 4
 006ab3: 20 05                      |             local.get 5
 006ab5: 2f 00 0d                   |             i32.load16_u 0 13
 006ab8: 3b 00 0d                   |             i32.store16 0 13
 006abb: 20 04                      |             local.get 4
 006abd: 20 05                      |             local.get 5
 006abf: 2d 00 0f                   |             i32.load8_u 0 15
 006ac2: 3a 00 0f                   |             i32.store8 0 15
 006ac5: 20 04                      |             local.get 4
 006ac7: 41 10                      |             i32.const 16
 006ac9: 6a                         |             i32.add
 006aca: 21 02                      |             local.set 2
 006acc: 20 05                      |             local.get 5
 006ace: 41 10                      |             i32.const 16
 006ad0: 6a                         |             i32.add
 006ad1: 21 01                      |             local.set 1
 006ad3: 0b                         |           end
 006ad4: 20 03                      |           local.get 3
 006ad6: 41 08                      |           i32.const 8
 006ad8: 71                         |           i32.and
 006ad9: 0d 02                      |           br_if 2
 006adb: 0c 03                      |           br 3
 006add: 0b                         |         end
 006ade: 20 04                      |         local.get 4
 006ae0: 20 03                      |         local.get 3
 006ae2: 41 10                      |         i32.const 16
 006ae4: 76                         |         i32.shr_u
 006ae5: 3a 00 02                   |         i32.store8 0 2
 006ae8: 20 04                      |         local.get 4
 006aea: 20 03                      |         local.get 3
 006aec: 41 08                      |         i32.const 8
 006aee: 76                         |         i32.shr_u
 006aef: 3a 00 01                   |         i32.store8 0 1
 006af2: 20 04                      |         local.get 4
 006af4: 20 05                      |         local.get 5
 006af6: 41 07                      |         i32.const 7
 006af8: 6a                         |         i32.add
 006af9: 29 00 00                   |         i64.load 0 0
 006afc: 37 02 07                   |         i64.store 2 7
 006aff: 20 04                      |         local.get 4
 006b01: 20 05                      |         local.get 5
 006b03: 28 02 04                   |         i32.load 2 4
 006b06: 41 08                      |         i32.const 8
 006b08: 74                         |         i32.shl
 006b09: 20 03                      |         local.get 3
 006b0b: 41 18                      |         i32.const 24
 006b0d: 76                         |         i32.shr_u
 006b0e: 72                         |         i32.or
 006b0f: 36 02 03                   |         i32.store 2 3
 006b12: 20 04                      |         local.get 4
 006b14: 41 13                      |         i32.const 19
 006b16: 6a                         |         i32.add
 006b17: 21 02                      |         local.set 2
 006b19: 20 05                      |         local.get 5
 006b1b: 41 13                      |         i32.const 19
 006b1d: 6a                         |         i32.add
 006b1e: 21 01                      |         local.set 1
 006b20: 41 0f                      |         i32.const 15
 006b22: 21 06                      |         local.set 6
 006b24: 20 05                      |         local.get 5
 006b26: 41 0f                      |         i32.const 15
 006b28: 6a                         |         i32.add
 006b29: 28 00 00                   |         i32.load 0 0
 006b2c: 21 05                      |         local.set 5
 006b2e: 41 0d                      |         i32.const 13
 006b30: 21 03                      |         local.set 3
 006b32: 0b                         |       end
 006b33: 20 04                      |       local.get 4
 006b35: 20 06                      |       local.get 6
 006b37: 6a                         |       i32.add
 006b38: 20 05                      |       local.get 5
 006b3a: 36 02 00                   |       i32.store 2 0
 006b3d: 0b                         |     end
 006b3e: 20 02                      |     local.get 2
 006b40: 20 01                      |     local.get 1
 006b42: 29 00 00                   |     i64.load 0 0
 006b45: 37 00 00                   |     i64.store 0 0
 006b48: 20 02                      |     local.get 2
 006b4a: 41 08                      |     i32.const 8
 006b4c: 6a                         |     i32.add
 006b4d: 21 02                      |     local.set 2
 006b4f: 20 01                      |     local.get 1
 006b51: 41 08                      |     i32.const 8
 006b53: 6a                         |     i32.add
 006b54: 21 01                      |     local.set 1
 006b56: 0b                         |   end
 006b57: 02 40                      |   block
 006b59: 20 03                      |     local.get 3
 006b5b: 41 04                      |     i32.const 4
 006b5d: 71                         |     i32.and
 006b5e: 45                         |     i32.eqz
 006b5f: 0d 00                      |     br_if 0
 006b61: 20 02                      |     local.get 2
 006b63: 20 01                      |     local.get 1
 006b65: 28 00 00                   |     i32.load 0 0
 006b68: 36 00 00                   |     i32.store 0 0
 006b6b: 20 02                      |     local.get 2
 006b6d: 41 04                      |     i32.const 4
 006b6f: 6a                         |     i32.add
 006b70: 21 02                      |     local.set 2
 006b72: 20 01                      |     local.get 1
 006b74: 41 04                      |     i32.const 4
 006b76: 6a                         |     i32.add
 006b77: 21 01                      |     local.set 1
 006b79: 0b                         |   end
 006b7a: 02 40                      |   block
 006b7c: 20 03                      |     local.get 3
 006b7e: 41 02                      |     i32.const 2
 006b80: 71                         |     i32.and
 006b81: 45                         |     i32.eqz
 006b82: 0d 00                      |     br_if 0
 006b84: 20 02                      |     local.get 2
 006b86: 20 01                      |     local.get 1
 006b88: 2f 00 00                   |     i32.load16_u 0 0
 006b8b: 3b 00 00                   |     i32.store16 0 0
 006b8e: 20 02                      |     local.get 2
 006b90: 41 02                      |     i32.const 2
 006b92: 6a                         |     i32.add
 006b93: 21 02                      |     local.set 2
 006b95: 20 01                      |     local.get 1
 006b97: 41 02                      |     i32.const 2
 006b99: 6a                         |     i32.add
 006b9a: 21 01                      |     local.set 1
 006b9c: 0b                         |   end
 006b9d: 20 03                      |   local.get 3
 006b9f: 41 01                      |   i32.const 1
 006ba1: 71                         |   i32.and
 006ba2: 45                         |   i32.eqz
 006ba3: 0d 00                      |   br_if 0
 006ba5: 20 02                      |   local.get 2
 006ba7: 20 01                      |   local.get 1
 006ba9: 2d 00 00                   |   i32.load8_u 0 0
 006bac: 3a 00 00                   |   i32.store8 0 0
 006baf: 0b                         | end
 006bb0: 20 00                      | local.get 0
 006bb2: 0b                         | end
006bb5 func[111] <memset>:
 006bb6: 03 7f                      | local[3..5] type=i32
 006bb8: 01 7e                      | local[6] type=i64
 006bba: 02 40                      | block
 006bbc: 20 02                      |   local.get 2
 006bbe: 41 21                      |   i32.const 33
 006bc0: 49                         |   i32.lt_u
 006bc1: 0d 00                      |   br_if 0
 006bc3: 20 00                      |   local.get 0
 006bc5: 20 01                      |   local.get 1
 006bc7: 20 02                      |   local.get 2
 006bc9: fc 0b 00                   |   memory.fill 0
 006bcc: 20 00                      |   local.get 0
 006bce: 0f                         |   return
 006bcf: 0b                         | end
 006bd0: 02 40                      | block
 006bd2: 20 02                      |   local.get 2
 006bd4: 45                         |   i32.eqz
 006bd5: 0d 00                      |   br_if 0
 006bd7: 20 00                      |   local.get 0
 006bd9: 20 01                      |   local.get 1
 006bdb: 3a 00 00                   |   i32.store8 0 0
 006bde: 20 00                      |   local.get 0
 006be0: 20 02                      |   local.get 2
 006be2: 6a                         |   i32.add
 006be3: 22 03                      |   local.tee 3
 006be5: 41 7f                      |   i32.const 4294967295
 006be7: 6a                         |   i32.add
 006be8: 20 01                      |   local.get 1
 006bea: 3a 00 00                   |   i32.store8 0 0
 006bed: 20 02                      |   local.get 2
 006bef: 41 03                      |   i32.const 3
 006bf1: 49                         |   i32.lt_u
 006bf2: 0d 00                      |   br_if 0
 006bf4: 20 00                      |   local.get 0
 006bf6: 20 01                      |   local.get 1
 006bf8: 3a 00 02                   |   i32.store8 0 2
 006bfb: 20 00                      |   local.get 0
 006bfd: 20 01                      |   local.get 1
 006bff: 3a 00 01                   |   i32.store8 0 1
 006c02: 20 03                      |   local.get 3
 006c04: 41 7d                      |   i32.const 4294967293
 006c06: 6a                         |   i32.add
 006c07: 20 01                      |   local.get 1
 006c09: 3a 00 00                   |   i32.store8 0 0
 006c0c: 20 03                      |   local.get 3
 006c0e: 41 7e                      |   i32.const 4294967294
 006c10: 6a                         |   i32.add
 006c11: 20 01                      |   local.get 1
 006c13: 3a 00 00                   |   i32.store8 0 0
 006c16: 20 02                      |   local.get 2
 006c18: 41 07                      |   i32.const 7
 006c1a: 49                         |   i32.lt_u
 006c1b: 0d 00                      |   br_if 0
 006c1d: 20 00                      |   local.get 0
 006c1f: 20 01                      |   local.get 1
 006c21: 3a 00 03                   |   i32.store8 0 3
 006c24: 20 03                      |   local.get 3
 006c26: 41 7c                      |   i32.const 4294967292
 006c28: 6a                         |   i32.add
 006c29: 20 01                      |   local.get 1
 006c2b: 3a 00 00                   |   i32.store8 0 0
 006c2e: 20 02                      |   local.get 2
 006c30: 41 09                      |   i32.const 9
 006c32: 49                         |   i32.lt_u
 006c33: 0d 00                      |   br_if 0
 006c35: 20 00                      |   local.get 0
 006c37: 41 00                      |   i32.const 0
 006c39: 20 00                      |   local.get 0
 006c3b: 6b                         |   i32.sub
 006c3c: 41 03                      |   i32.const 3
 006c3e: 71                         |   i32.and
 006c3f: 22 04                      |   local.tee 4
 006c41: 6a                         |   i32.add
 006c42: 22 05                      |   local.tee 5
 006c44: 20 01                      |   local.get 1
 006c46: 41 ff 01                   |   i32.const 255
 006c49: 71                         |   i32.and
 006c4a: 41 81 82 84 08             |   i32.const 16843009
 006c4f: 6c                         |   i32.mul
 006c50: 22 03                      |   local.tee 3
 006c52: 36 02 00                   |   i32.store 2 0
 006c55: 20 05                      |   local.get 5
 006c57: 20 02                      |   local.get 2
 006c59: 20 04                      |   local.get 4
 006c5b: 6b                         |   i32.sub
 006c5c: 41 3c                      |   i32.const 60
 006c5e: 71                         |   i32.and
 006c5f: 22 01                      |   local.tee 1
 006c61: 6a                         |   i32.add
 006c62: 22 02                      |   local.tee 2
 006c64: 41 7c                      |   i32.const 4294967292
 006c66: 6a                         |   i32.add
 006c67: 20 03                      |   local.get 3
 006c69: 36 02 00                   |   i32.store 2 0
 006c6c: 20 01                      |   local.get 1
 006c6e: 41 09                      |   i32.const 9
 006c70: 49                         |   i32.lt_u
 006c71: 0d 00                      |   br_if 0
 006c73: 20 05                      |   local.get 5
 006c75: 20 03                      |   local.get 3
 006c77: 36 02 08                   |   i32.store 2 8
 006c7a: 20 05                      |   local.get 5
 006c7c: 20 03                      |   local.get 3
 006c7e: 36 02 04                   |   i32.store 2 4
 006c81: 20 02                      |   local.get 2
 006c83: 41 78                      |   i32.const 4294967288
 006c85: 6a                         |   i32.add
 006c86: 20 03                      |   local.get 3
 006c88: 36 02 00                   |   i32.store 2 0
 006c8b: 20 02                      |   local.get 2
 006c8d: 41 74                      |   i32.const 4294967284
 006c8f: 6a                         |   i32.add
 006c90: 20 03                      |   local.get 3
 006c92: 36 02 00                   |   i32.store 2 0
 006c95: 20 01                      |   local.get 1
 006c97: 41 19                      |   i32.const 25
 006c99: 49                         |   i32.lt_u
 006c9a: 0d 00                      |   br_if 0
 006c9c: 20 05                      |   local.get 5
 006c9e: 20 03                      |   local.get 3
 006ca0: 36 02 18                   |   i32.store 2 24
 006ca3: 20 05                      |   local.get 5
 006ca5: 20 03                      |   local.get 3
 006ca7: 36 02 14                   |   i32.store 2 20
 006caa: 20 05                      |   local.get 5
 006cac: 20 03                      |   local.get 3
 006cae: 36 02 10                   |   i32.store 2 16
 006cb1: 20 05                      |   local.get 5
 006cb3: 20 03                      |   local.get 3
 006cb5: 36 02 0c                   |   i32.store 2 12
 006cb8: 20 02                      |   local.get 2
 006cba: 41 70                      |   i32.const 4294967280
 006cbc: 6a                         |   i32.add
 006cbd: 20 03                      |   local.get 3
 006cbf: 36 02 00                   |   i32.store 2 0
 006cc2: 20 02                      |   local.get 2
 006cc4: 41 6c                      |   i32.const 4294967276
 006cc6: 6a                         |   i32.add
 006cc7: 20 03                      |   local.get 3
 006cc9: 36 02 00                   |   i32.store 2 0
 006ccc: 20 02                      |   local.get 2
 006cce: 41 68                      |   i32.const 4294967272
 006cd0: 6a                         |   i32.add
 006cd1: 20 03                      |   local.get 3
 006cd3: 36 02 00                   |   i32.store 2 0
 006cd6: 20 02                      |   local.get 2
 006cd8: 41 64                      |   i32.const 4294967268
 006cda: 6a                         |   i32.add
 006cdb: 20 03                      |   local.get 3
 006cdd: 36 02 00                   |   i32.store 2 0
 006ce0: 20 01                      |   local.get 1
 006ce2: 20 05                      |   local.get 5
 006ce4: 41 04                      |   i32.const 4
 006ce6: 71                         |   i32.and
 006ce7: 41 18                      |   i32.const 24
 006ce9: 72                         |   i32.or
 006cea: 22 02                      |   local.tee 2
 006cec: 6b                         |   i32.sub
 006ced: 22 01                      |   local.tee 1
 006cef: 41 20                      |   i32.const 32
 006cf1: 49                         |   i32.lt_u
 006cf2: 0d 00                      |   br_if 0
 006cf4: 20 03                      |   local.get 3
 006cf6: ad                         |   i64.extend_i32_u
 006cf7: 42 81 80 80 80 10          |   i64.const 4294967297
 006cfd: 7e                         |   i64.mul
 006cfe: 21 06                      |   local.set 6
 006d00: 20 05                      |   local.get 5
 006d02: 20 02                      |   local.get 2
 006d04: 6a                         |   i32.add
 006d05: 21 02                      |   local.set 2
 006d07: 03 40                      |   loop
 006d09: 20 02                      |     local.get 2
 006d0b: 20 06                      |     local.get 6
 006d0d: 37 03 18                   |     i64.store 3 24
 006d10: 20 02                      |     local.get 2
 006d12: 20 06                      |     local.get 6
 006d14: 37 03 10                   |     i64.store 3 16
 006d17: 20 02                      |     local.get 2
 006d19: 20 06                      |     local.get 6
 006d1b: 37 03 08                   |     i64.store 3 8
 006d1e: 20 02                      |     local.get 2
 006d20: 20 06                      |     local.get 6
 006d22: 37 03 00                   |     i64.store 3 0
 006d25: 20 02                      |     local.get 2
 006d27: 41 20                      |     i32.const 32
 006d29: 6a                         |     i32.add
 006d2a: 21 02                      |     local.set 2
 006d2c: 20 01                      |     local.get 1
 006d2e: 41 60                      |     i32.const 4294967264
 006d30: 6a                         |     i32.add
 006d31: 22 01                      |     local.tee 1
 006d33: 41 1f                      |     i32.const 31
 006d35: 4b                         |     i32.gt_u
 006d36: 0d 00                      |     br_if 0
 006d38: 0b                         |   end
 006d39: 0b                         | end
 006d3a: 20 00                      | local.get 0
 006d3c: 0b                         | end
006d3f func[112] <__strchrnul>:
 006d40: 03 7f                      | local[2..4] type=i32
 006d42: 02 40                      | block
 006d44: 02 40                      |   block
 006d46: 02 40                      |     block
 006d48: 02 40                      |       block
 006d4a: 20 01                      |         local.get 1
 006d4c: 41 ff 01                   |         i32.const 255
 006d4f: 71                         |         i32.and
 006d50: 22 02                      |         local.tee 2
 006d52: 45                         |         i32.eqz
 006d53: 0d 00                      |         br_if 0
 006d55: 20 00                      |         local.get 0
 006d57: 41 03                      |         i32.const 3
 006d59: 71                         |         i32.and
 006d5a: 45                         |         i32.eqz
 006d5b: 0d 02                      |         br_if 2
 006d5d: 02 40                      |         block
 006d5f: 20 00                      |           local.get 0
 006d61: 2d 00 00                   |           i32.load8_u 0 0
 006d64: 22 03                      |           local.tee 3
 006d66: 0d 00                      |           br_if 0
 006d68: 20 00                      |           local.get 0
 006d6a: 0f                         |           return
 006d6b: 0b                         |         end
 006d6c: 20 03                      |         local.get 3
 006d6e: 20 01                      |         local.get 1
 006d70: 41 ff 01                   |         i32.const 255
 006d73: 71                         |         i32.and
 006d74: 47                         |         i32.ne
 006d75: 0d 01                      |         br_if 1
 006d77: 20 00                      |         local.get 0
 006d79: 0f                         |         return
 006d7a: 0b                         |       end
 006d7b: 20 00                      |       local.get 0
 006d7d: 20 00                      |       local.get 0
 006d7f: 10 f4 80 80 80 00          |       call 116 <strlen>
 006d85: 6a                         |       i32.add
 006d86: 0f                         |       return
 006d87: 0b                         |     end
 006d88: 02 40                      |     block
 006d8a: 20 00                      |       local.get 0
 006d8c: 41 01                      |       i32.const 1
 006d8e: 6a                         |       i32.add
 006d8f: 22 03                      |       local.tee 3
 006d91: 41 03                      |       i32.const 3
 006d93: 71                         |       i32.and
 006d94: 0d 00                      |       br_if 0
 006d96: 20 03                      |       local.get 3
 006d98: 21 00                      |       local.set 0
 006d9a: 0c 01                      |       br 1
 006d9c: 0b                         |     end
 006d9d: 20 03                      |     local.get 3
 006d9f: 2d 00 00                   |     i32.load8_u 0 0
 006da2: 22 04                      |     local.tee 4
 006da4: 45                         |     i32.eqz
 006da5: 0d 01                      |     br_if 1
 006da7: 20 04                      |     local.get 4
 006da9: 20 01                      |     local.get 1
 006dab: 41 ff 01                   |     i32.const 255
 006dae: 71                         |     i32.and
 006daf: 46                         |     i32.eq
 006db0: 0d 01                      |     br_if 1
 006db2: 02 40                      |     block
 006db4: 20 00                      |       local.get 0
 006db6: 41 02                      |       i32.const 2
 006db8: 6a                         |       i32.add
 006db9: 22 03                      |       local.tee 3
 006dbb: 41 03                      |       i32.const 3
 006dbd: 71                         |       i32.and
 006dbe: 0d 00                      |       br_if 0
 006dc0: 20 03                      |       local.get 3
 006dc2: 21 00                      |       local.set 0
 006dc4: 0c 01                      |       br 1
 006dc6: 0b                         |     end
 006dc7: 20 03                      |     local.get 3
 006dc9: 2d 00 00                   |     i32.load8_u 0 0
 006dcc: 22 04                      |     local.tee 4
 006dce: 45                         |     i32.eqz
 006dcf: 0d 01                      |     br_if 1
 006dd1: 20 04                      |     local.get 4
 006dd3: 20 01                      |     local.get 1
 006dd5: 41 ff 01                   |     i32.const 255
 006dd8: 71                         |     i32.and
 006dd9: 46                         |     i32.eq
 006dda: 0d 01                      |     br_if 1
 006ddc: 02 40                      |     block
 006dde: 20 00                      |       local.get 0
 006de0: 41 03                      |       i32.const 3
 006de2: 6a                         |       i32.add
 006de3: 22 03                      |       local.tee 3
 006de5: 41 03                      |       i32.const 3
 006de7: 71                         |       i32.and
 006de8: 0d 00                      |       br_if 0
 006dea: 20 03                      |       local.get 3
 006dec: 21 00                      |       local.set 0
 006dee: 0c 01                      |       br 1
 006df0: 0b                         |     end
 006df1: 20 03                      |     local.get 3
 006df3: 2d 00 00                   |     i32.load8_u 0 0
 006df6: 22 04                      |     local.tee 4
 006df8: 45                         |     i32.eqz
 006df9: 0d 01                      |     br_if 1
 006dfb: 20 04                      |     local.get 4
 006dfd: 20 01                      |     local.get 1
 006dff: 41 ff 01                   |     i32.const 255
 006e02: 71                         |     i32.and
 006e03: 46                         |     i32.eq
 006e04: 0d 01                      |     br_if 1
 006e06: 20 00                      |     local.get 0
 006e08: 41 04                      |     i32.const 4
 006e0a: 6a                         |     i32.add
 006e0b: 21 00                      |     local.set 0
 006e0d: 0b                         |   end
 006e0e: 02 40                      |   block
 006e10: 02 40                      |     block
 006e12: 41 80 82 84 08             |       i32.const 16843008
 006e17: 20 00                      |       local.get 0
 006e19: 28 02 00                   |       i32.load 2 0
 006e1c: 22 03                      |       local.tee 3
 006e1e: 6b                         |       i32.sub
 006e1f: 20 03                      |       local.get 3
 006e21: 72                         |       i32.or
 006e22: 41 80 81 82 84 78          |       i32.const 2155905152
 006e28: 71                         |       i32.and
 006e29: 41 80 81 82 84 78          |       i32.const 2155905152
 006e2f: 46                         |       i32.eq
 006e30: 0d 00                      |       br_if 0
 006e32: 20 00                      |       local.get 0
 006e34: 21 02                      |       local.set 2
 006e36: 0c 01                      |       br 1
 006e38: 0b                         |     end
 006e39: 20 02                      |     local.get 2
 006e3b: 41 81 82 84 08             |     i32.const 16843009
 006e40: 6c                         |     i32.mul
 006e41: 21 04                      |     local.set 4
 006e43: 03 40                      |     loop
 006e45: 02 40                      |       block
 006e47: 41 80 82 84 08             |         i32.const 16843008
 006e4c: 20 03                      |         local.get 3
 006e4e: 20 04                      |         local.get 4
 006e50: 73                         |         i32.xor
 006e51: 22 03                      |         local.tee 3
 006e53: 6b                         |         i32.sub
 006e54: 20 03                      |         local.get 3
 006e56: 72                         |         i32.or
 006e57: 41 80 81 82 84 78          |         i32.const 2155905152
 006e5d: 71                         |         i32.and
 006e5e: 41 80 81 82 84 78          |         i32.const 2155905152
 006e64: 46                         |         i32.eq
 006e65: 0d 00                      |         br_if 0
 006e67: 20 00                      |         local.get 0
 006e69: 21 02                      |         local.set 2
 006e6b: 0c 02                      |         br 2
 006e6d: 0b                         |       end
 006e6e: 20 00                      |       local.get 0
 006e70: 28 02 04                   |       i32.load 2 4
 006e73: 21 03                      |       local.set 3
 006e75: 20 00                      |       local.get 0
 006e77: 41 04                      |       i32.const 4
 006e79: 6a                         |       i32.add
 006e7a: 22 02                      |       local.tee 2
 006e7c: 21 00                      |       local.set 0
 006e7e: 20 03                      |       local.get 3
 006e80: 41 80 82 84 08             |       i32.const 16843008
 006e85: 20 03                      |       local.get 3
 006e87: 6b                         |       i32.sub
 006e88: 72                         |       i32.or
 006e89: 41 80 81 82 84 78          |       i32.const 2155905152
 006e8f: 71                         |       i32.and
 006e90: 41 80 81 82 84 78          |       i32.const 2155905152
 006e96: 46                         |       i32.eq
 006e97: 0d 00                      |       br_if 0
 006e99: 0b                         |     end
 006e9a: 0b                         |   end
 006e9b: 20 02                      |   local.get 2
 006e9d: 41 7f                      |   i32.const 4294967295
 006e9f: 6a                         |   i32.add
 006ea0: 21 03                      |   local.set 3
 006ea2: 03 40                      |   loop
 006ea4: 20 03                      |     local.get 3
 006ea6: 41 01                      |     i32.const 1
 006ea8: 6a                         |     i32.add
 006ea9: 22 03                      |     local.tee 3
 006eab: 2d 00 00                   |     i32.load8_u 0 0
 006eae: 22 00                      |     local.tee 0
 006eb0: 45                         |     i32.eqz
 006eb1: 0d 01                      |     br_if 1
 006eb3: 20 00                      |     local.get 0
 006eb5: 20 01                      |     local.get 1
 006eb7: 41 ff 01                   |     i32.const 255
 006eba: 71                         |     i32.and
 006ebb: 47                         |     i32.ne
 006ebc: 0d 00                      |     br_if 0
 006ebe: 0b                         |   end
 006ebf: 0b                         | end
 006ec0: 20 03                      | local.get 3
 006ec2: 0b                         | end
006ec5 func[113] <__stpcpy>:
 006ec6: 02 7f                      | local[2..3] type=i32
 006ec8: 02 40                      | block
 006eca: 02 40                      |   block
 006ecc: 02 40                      |     block
 006ece: 20 01                      |       local.get 1
 006ed0: 20 00                      |       local.get 0
 006ed2: 73                         |       i32.xor
 006ed3: 41 03                      |       i32.const 3
 006ed5: 71                         |       i32.and
 006ed6: 45                         |       i32.eqz
 006ed7: 0d 00                      |       br_if 0
 006ed9: 20 01                      |       local.get 1
 006edb: 2d 00 00                   |       i32.load8_u 0 0
 006ede: 21 02                      |       local.set 2
 006ee0: 0c 01                      |       br 1
 006ee2: 0b                         |     end
 006ee3: 02 40                      |     block
 006ee5: 02 40                      |       block
 006ee7: 20 01                      |         local.get 1
 006ee9: 41 03                      |         i32.const 3
 006eeb: 71                         |         i32.and
 006eec: 0d 00                      |         br_if 0
 006eee: 20 01                      |         local.get 1
 006ef0: 21 03                      |         local.set 3
 006ef2: 0c 01                      |         br 1
 006ef4: 0b                         |       end
 006ef5: 20 00                      |       local.get 0
 006ef7: 20 01                      |       local.get 1
 006ef9: 2d 00 00                   |       i32.load8_u 0 0
 006efc: 22 02                      |       local.tee 2
 006efe: 3a 00 00                   |       i32.store8 0 0
 006f01: 02 40                      |       block
 006f03: 20 02                      |         local.get 2
 006f05: 0d 00                      |         br_if 0
 006f07: 20 00                      |         local.get 0
 006f09: 0f                         |         return
 006f0a: 0b                         |       end
 006f0b: 20 00                      |       local.get 0
 006f0d: 41 01                      |       i32.const 1
 006f0f: 6a                         |       i32.add
 006f10: 21 02                      |       local.set 2
 006f12: 02 40                      |       block
 006f14: 20 01                      |         local.get 1
 006f16: 41 01                      |         i32.const 1
 006f18: 6a                         |         i32.add
 006f19: 22 03                      |         local.tee 3
 006f1b: 41 03                      |         i32.const 3
 006f1d: 71                         |         i32.and
 006f1e: 0d 00                      |         br_if 0
 006f20: 20 02                      |         local.get 2
 006f22: 21 00                      |         local.set 0
 006f24: 0c 01                      |         br 1
 006f26: 0b                         |       end
 006f27: 20 02                      |       local.get 2
 006f29: 20 03                      |       local.get 3
 006f2b: 2d 00 00                   |       i32.load8_u 0 0
 006f2e: 22 03                      |       local.tee 3
 006f30: 3a 00 00                   |       i32.store8 0 0
 006f33: 20 03                      |       local.get 3
 006f35: 45                         |       i32.eqz
 006f36: 0d 02                      |       br_if 2
 006f38: 20 00                      |       local.get 0
 006f3a: 41 02                      |       i32.const 2
 006f3c: 6a                         |       i32.add
 006f3d: 21 02                      |       local.set 2
 006f3f: 02 40                      |       block
 006f41: 20 01                      |         local.get 1
 006f43: 41 02                      |         i32.const 2
 006f45: 6a                         |         i32.add
 006f46: 22 03                      |         local.tee 3
 006f48: 41 03                      |         i32.const 3
 006f4a: 71                         |         i32.and
 006f4b: 0d 00                      |         br_if 0
 006f4d: 20 02                      |         local.get 2
 006f4f: 21 00                      |         local.set 0
 006f51: 0c 01                      |         br 1
 006f53: 0b                         |       end
 006f54: 20 02                      |       local.get 2
 006f56: 20 03                      |       local.get 3
 006f58: 2d 00 00                   |       i32.load8_u 0 0
 006f5b: 22 03                      |       local.tee 3
 006f5d: 3a 00 00                   |       i32.store8 0 0
 006f60: 20 03                      |       local.get 3
 006f62: 45                         |       i32.eqz
 006f63: 0d 02                      |       br_if 2
 006f65: 20 00                      |       local.get 0
 006f67: 41 03                      |       i32.const 3
 006f69: 6a                         |       i32.add
 006f6a: 21 02                      |       local.set 2
 006f6c: 02 40                      |       block
 006f6e: 20 01                      |         local.get 1
 006f70: 41 03                      |         i32.const 3
 006f72: 6a                         |         i32.add
 006f73: 22 03                      |         local.tee 3
 006f75: 41 03                      |         i32.const 3
 006f77: 71                         |         i32.and
 006f78: 0d 00                      |         br_if 0
 006f7a: 20 02                      |         local.get 2
 006f7c: 21 00                      |         local.set 0
 006f7e: 0c 01                      |         br 1
 006f80: 0b                         |       end
 006f81: 20 02                      |       local.get 2
 006f83: 20 03                      |       local.get 3
 006f85: 2d 00 00                   |       i32.load8_u 0 0
 006f88: 22 03                      |       local.tee 3
 006f8a: 3a 00 00                   |       i32.store8 0 0
 006f8d: 20 03                      |       local.get 3
 006f8f: 45                         |       i32.eqz
 006f90: 0d 02                      |       br_if 2
 006f92: 20 00                      |       local.get 0
 006f94: 41 04                      |       i32.const 4
 006f96: 6a                         |       i32.add
 006f97: 21 00                      |       local.set 0
 006f99: 20 01                      |       local.get 1
 006f9b: 41 04                      |       i32.const 4
 006f9d: 6a                         |       i32.add
 006f9e: 21 03                      |       local.set 3
 006fa0: 0b                         |     end
 006fa1: 02 40                      |     block
 006fa3: 41 80 82 84 08             |       i32.const 16843008
 006fa8: 20 03                      |       local.get 3
 006faa: 28 02 00                   |       i32.load 2 0
 006fad: 22 02                      |       local.tee 2
 006faf: 6b                         |       i32.sub
 006fb0: 20 02                      |       local.get 2
 006fb2: 72                         |       i32.or
 006fb3: 41 80 81 82 84 78          |       i32.const 2155905152
 006fb9: 71                         |       i32.and
 006fba: 41 80 81 82 84 78          |       i32.const 2155905152
 006fc0: 46                         |       i32.eq
 006fc1: 0d 00                      |       br_if 0
 006fc3: 20 03                      |       local.get 3
 006fc5: 21 01                      |       local.set 1
 006fc7: 0c 01                      |       br 1
 006fc9: 0b                         |     end
 006fca: 03 40                      |     loop
 006fcc: 20 00                      |       local.get 0
 006fce: 20 02                      |       local.get 2
 006fd0: 36 02 00                   |       i32.store 2 0
 006fd3: 20 00                      |       local.get 0
 006fd5: 41 04                      |       i32.const 4
 006fd7: 6a                         |       i32.add
 006fd8: 21 00                      |       local.set 0
 006fda: 20 03                      |       local.get 3
 006fdc: 28 02 04                   |       i32.load 2 4
 006fdf: 21 02                      |       local.set 2
 006fe1: 20 03                      |       local.get 3
 006fe3: 41 04                      |       i32.const 4
 006fe5: 6a                         |       i32.add
 006fe6: 22 01                      |       local.tee 1
 006fe8: 21 03                      |       local.set 3
 006fea: 20 02                      |       local.get 2
 006fec: 41 80 82 84 08             |       i32.const 16843008
 006ff1: 20 02                      |       local.get 2
 006ff3: 6b                         |       i32.sub
 006ff4: 72                         |       i32.or
 006ff5: 41 80 81 82 84 78          |       i32.const 2155905152
 006ffb: 71                         |       i32.and
 006ffc: 41 80 81 82 84 78          |       i32.const 2155905152
 007002: 46                         |       i32.eq
 007003: 0d 00                      |       br_if 0
 007005: 0b                         |     end
 007006: 0b                         |   end
 007007: 20 00                      |   local.get 0
 007009: 20 02                      |   local.get 2
 00700b: 3a 00 00                   |   i32.store8 0 0
 00700e: 02 40                      |   block
 007010: 20 02                      |     local.get 2
 007012: 41 ff 01                   |     i32.const 255
 007015: 71                         |     i32.and
 007016: 0d 00                      |     br_if 0
 007018: 20 00                      |     local.get 0
 00701a: 0f                         |     return
 00701b: 0b                         |   end
 00701c: 20 01                      |   local.get 1
 00701e: 41 01                      |   i32.const 1
 007020: 6a                         |   i32.add
 007021: 21 03                      |   local.set 3
 007023: 20 00                      |   local.get 0
 007025: 21 02                      |   local.set 2
 007027: 03 40                      |   loop
 007029: 20 02                      |     local.get 2
 00702b: 20 03                      |     local.get 3
 00702d: 2d 00 00                   |     i32.load8_u 0 0
 007030: 22 00                      |     local.tee 0
 007032: 3a 00 01                   |     i32.store8 0 1
 007035: 20 03                      |     local.get 3
 007037: 41 01                      |     i32.const 1
 007039: 6a                         |     i32.add
 00703a: 21 03                      |     local.set 3
 00703c: 20 02                      |     local.get 2
 00703e: 41 01                      |     i32.const 1
 007040: 6a                         |     i32.add
 007041: 21 02                      |     local.set 2
 007043: 20 00                      |     local.get 0
 007045: 0d 00                      |     br_if 0
 007047: 0b                         |   end
 007048: 0b                         | end
 007049: 20 02                      | local.get 2
 00704b: 0b                         | end
00704d func[114] <strcpy>:
 00704e: 20 00                      | local.get 0
 007050: 20 01                      | local.get 1
 007052: 10 f1 80 80 80 00          | call 113 <__stpcpy>
 007058: 1a                         | drop
 007059: 20 00                      | local.get 0
 00705b: 0b                         | end
00705d func[115] <strdup>:
 00705e: 02 7f                      | local[1..2] type=i32
 007060: 02 40                      | block
 007062: 20 00                      |   local.get 0
 007064: 10 f4 80 80 80 00          |   call 116 <strlen>
 00706a: 41 01                      |   i32.const 1
 00706c: 6a                         |   i32.add
 00706d: 22 01                      |   local.tee 1
 00706f: 10 d8 80 80 80 00          |   call 88 <malloc>
 007075: 22 02                      |   local.tee 2
 007077: 45                         |   i32.eqz
 007078: 0d 00                      |   br_if 0
 00707a: 20 02                      |   local.get 2
 00707c: 20 00                      |   local.get 0
 00707e: 20 01                      |   local.get 1
 007080: 10 ee 80 80 80 00          |   call 110 <memcpy>
 007086: 1a                         |   drop
 007087: 0b                         | end
 007088: 20 02                      | local.get 2
 00708a: 0b                         | end
00708d func[116] <strlen>:
 00708e: 03 7f                      | local[1..3] type=i32
 007090: 20 00                      | local.get 0
 007092: 21 01                      | local.set 1
 007094: 02 40                      | block
 007096: 02 40                      |   block
 007098: 20 00                      |     local.get 0
 00709a: 41 03                      |     i32.const 3
 00709c: 71                         |     i32.and
 00709d: 45                         |     i32.eqz
 00709e: 0d 00                      |     br_if 0
 0070a0: 02 40                      |     block
 0070a2: 20 00                      |       local.get 0
 0070a4: 2d 00 00                   |       i32.load8_u 0 0
 0070a7: 0d 00                      |       br_if 0
 0070a9: 20 00                      |       local.get 0
 0070ab: 20 00                      |       local.get 0
 0070ad: 6b                         |       i32.sub
 0070ae: 0f                         |       return
 0070af: 0b                         |     end
 0070b0: 20 00                      |     local.get 0
 0070b2: 41 01                      |     i32.const 1
 0070b4: 6a                         |     i32.add
 0070b5: 22 01                      |     local.tee 1
 0070b7: 41 03                      |     i32.const 3
 0070b9: 71                         |     i32.and
 0070ba: 45                         |     i32.eqz
 0070bb: 0d 00                      |     br_if 0
 0070bd: 20 01                      |     local.get 1
 0070bf: 2d 00 00                   |     i32.load8_u 0 0
 0070c2: 45                         |     i32.eqz
 0070c3: 0d 01                      |     br_if 1
 0070c5: 20 00                      |     local.get 0
 0070c7: 41 02                      |     i32.const 2
 0070c9: 6a                         |     i32.add
 0070ca: 22 01                      |     local.tee 1
 0070cc: 41 03                      |     i32.const 3
 0070ce: 71                         |     i32.and
 0070cf: 45                         |     i32.eqz
 0070d0: 0d 00                      |     br_if 0
 0070d2: 20 01                      |     local.get 1
 0070d4: 2d 00 00                   |     i32.load8_u 0 0
 0070d7: 45                         |     i32.eqz
 0070d8: 0d 01                      |     br_if 1
 0070da: 20 00                      |     local.get 0
 0070dc: 41 03                      |     i32.const 3
 0070de: 6a                         |     i32.add
 0070df: 22 01                      |     local.tee 1
 0070e1: 41 03                      |     i32.const 3
 0070e3: 71                         |     i32.and
 0070e4: 45                         |     i32.eqz
 0070e5: 0d 00                      |     br_if 0
 0070e7: 20 01                      |     local.get 1
 0070e9: 2d 00 00                   |     i32.load8_u 0 0
 0070ec: 45                         |     i32.eqz
 0070ed: 0d 01                      |     br_if 1
 0070ef: 20 00                      |     local.get 0
 0070f1: 41 04                      |     i32.const 4
 0070f3: 6a                         |     i32.add
 0070f4: 22 01                      |     local.tee 1
 0070f6: 41 03                      |     i32.const 3
 0070f8: 71                         |     i32.and
 0070f9: 0d 01                      |     br_if 1
 0070fb: 0b                         |   end
 0070fc: 20 01                      |   local.get 1
 0070fe: 41 7c                      |   i32.const 4294967292
 007100: 6a                         |   i32.add
 007101: 21 02                      |   local.set 2
 007103: 20 01                      |   local.get 1
 007105: 41 7b                      |   i32.const 4294967291
 007107: 6a                         |   i32.add
 007108: 21 01                      |   local.set 1
 00710a: 03 40                      |   loop
 00710c: 20 01                      |     local.get 1
 00710e: 41 04                      |     i32.const 4
 007110: 6a                         |     i32.add
 007111: 21 01                      |     local.set 1
 007113: 41 80 82 84 08             |     i32.const 16843008
 007118: 20 02                      |     local.get 2
 00711a: 41 04                      |     i32.const 4
 00711c: 6a                         |     i32.add
 00711d: 22 02                      |     local.tee 2
 00711f: 28 02 00                   |     i32.load 2 0
 007122: 22 03                      |     local.tee 3
 007124: 6b                         |     i32.sub
 007125: 20 03                      |     local.get 3
 007127: 72                         |     i32.or
 007128: 41 80 81 82 84 78          |     i32.const 2155905152
 00712e: 71                         |     i32.and
 00712f: 41 80 81 82 84 78          |     i32.const 2155905152
 007135: 46                         |     i32.eq
 007136: 0d 00                      |     br_if 0
 007138: 0b                         |   end
 007139: 03 40                      |   loop
 00713b: 20 01                      |     local.get 1
 00713d: 41 01                      |     i32.const 1
 00713f: 6a                         |     i32.add
 007140: 21 01                      |     local.set 1
 007142: 20 02                      |     local.get 2
 007144: 2d 00 00                   |     i32.load8_u 0 0
 007147: 21 03                      |     local.set 3
 007149: 20 02                      |     local.get 2
 00714b: 41 01                      |     i32.const 1
 00714d: 6a                         |     i32.add
 00714e: 21 02                      |     local.set 2
 007150: 20 03                      |     local.get 3
 007152: 0d 00                      |     br_if 0
 007154: 0b                         |   end
 007155: 0b                         | end
 007156: 20 01                      | local.get 1
 007158: 20 00                      | local.get 0
 00715a: 6b                         | i32.sub
 00715b: 0b                         | end
00715e func[117] <strncmp>:
 00715f: 02 7f                      | local[3..4] type=i32
 007161: 02 40                      | block
 007163: 20 02                      |   local.get 2
 007165: 0d 00                      |   br_if 0
 007167: 41 00                      |   i32.const 0
 007169: 0f                         |   return
 00716a: 0b                         | end
 00716b: 02 40                      | block
 00716d: 02 40                      |   block
 00716f: 20 00                      |     local.get 0
 007171: 2d 00 00                   |     i32.load8_u 0 0
 007174: 22 03                      |     local.tee 3
 007176: 0d 00                      |     br_if 0
 007178: 41 00                      |     i32.const 0
 00717a: 21 03                      |     local.set 3
 00717c: 0c 01                      |     br 1
 00717e: 0b                         |   end
 00717f: 20 00                      |   local.get 0
 007181: 41 01                      |   i32.const 1
 007183: 6a                         |   i32.add
 007184: 21 00                      |   local.set 0
 007186: 20 02                      |   local.get 2
 007188: 41 7f                      |   i32.const 4294967295
 00718a: 6a                         |   i32.add
 00718b: 21 02                      |   local.set 2
 00718d: 02 40                      |   block
 00718f: 03 40                      |     loop
 007191: 20 03                      |       local.get 3
 007193: 41 ff 01                   |       i32.const 255
 007196: 71                         |       i32.and
 007197: 20 01                      |       local.get 1
 007199: 2d 00 00                   |       i32.load8_u 0 0
 00719c: 22 04                      |       local.tee 4
 00719e: 47                         |       i32.ne
 00719f: 0d 01                      |       br_if 1
 0071a1: 20 04                      |       local.get 4
 0071a3: 45                         |       i32.eqz
 0071a4: 0d 01                      |       br_if 1
 0071a6: 20 02                      |       local.get 2
 0071a8: 41 00                      |       i32.const 0
 0071aa: 46                         |       i32.eq
 0071ab: 0d 01                      |       br_if 1
 0071ad: 20 02                      |       local.get 2
 0071af: 41 7f                      |       i32.const 4294967295
 0071b1: 6a                         |       i32.add
 0071b2: 21 02                      |       local.set 2
 0071b4: 20 01                      |       local.get 1
 0071b6: 41 01                      |       i32.const 1
 0071b8: 6a                         |       i32.add
 0071b9: 21 01                      |       local.set 1
 0071bb: 20 00                      |       local.get 0
 0071bd: 2d 00 00                   |       i32.load8_u 0 0
 0071c0: 21 03                      |       local.set 3
 0071c2: 20 00                      |       local.get 0
 0071c4: 41 01                      |       i32.const 1
 0071c6: 6a                         |       i32.add
 0071c7: 21 00                      |       local.set 0
 0071c9: 20 03                      |       local.get 3
 0071cb: 0d 00                      |       br_if 0
 0071cd: 0b                         |     end
 0071ce: 41 00                      |     i32.const 0
 0071d0: 21 03                      |     local.set 3
 0071d2: 0b                         |   end
 0071d3: 20 03                      |   local.get 3
 0071d5: 41 ff 01                   |   i32.const 255
 0071d8: 71                         |   i32.and
 0071d9: 21 03                      |   local.set 3
 0071db: 0b                         | end
 0071dc: 20 03                      | local.get 3
 0071de: 20 01                      | local.get 1
 0071e0: 2d 00 00                   | i32.load8_u 0 0
 0071e3: 6b                         | i32.sub
 0071e4: 0b                         | end
0071e6 func[118] <_ZN5alloc7raw_vec17capacity_overflow17h0fb74a5685c13d41E>:
 0071e7: 01 7f                      | local[1] type=i32
 0071e9: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0071ef: 41 20                      | i32.const 32
 0071f1: 6b                         | i32.sub
 0071f2: 22 01                      | local.tee 1
 0071f4: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0071fa: 20 01                      | local.get 1
 0071fc: 41 00                      | i32.const 0
 0071fe: 36 02 18                   | i32.store 2 24
 007201: 20 01                      | local.get 1
 007203: 41 01                      | i32.const 1
 007205: 36 02 0c                   | i32.store 2 12
 007208: 20 01                      | local.get 1
 00720a: 41 b4 90 c0 80 00          | i32.const 1050676
 007210: 36 02 08                   | i32.store 2 8
 007213: 20 01                      | local.get 1
 007215: 42 04                      | i64.const 4
 007217: 37 02 10                   | i64.store 2 16
 00721a: 20 01                      | local.get 1
 00721c: 41 08                      | i32.const 8
 00721e: 6a                         | i32.add
 00721f: 20 00                      | local.get 0
 007221: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 007227: 00                         | unreachable
 007228: 0b                         | end
00722b func[119] <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h6df1577f21db3553E>:
 00722c: 04 7f                      | local[2..5] type=i32
 00722e: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007234: 41 20                      | i32.const 32
 007236: 6b                         | i32.sub
 007237: 22 02                      | local.tee 2
 007239: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 00723f: 02 40                      | block
 007241: 20 00                      |   local.get 0
 007243: 28 02 00                   |   i32.load 2 0
 007246: 22 03                      |   local.tee 3
 007248: 41 01                      |   i32.const 1
 00724a: 6a                         |   i32.add
 00724b: 22 04                      |   local.tee 4
 00724d: 20 03                      |   local.get 3
 00724f: 41 01                      |   i32.const 1
 007251: 74                         |   i32.shl
 007252: 22 05                      |   local.tee 5
 007254: 20 04                      |   local.get 4
 007256: 20 05                      |   local.get 5
 007258: 4b                         |   i32.gt_u
 007259: 1b                         |   select
 00725a: 22 04                      |   local.tee 4
 00725c: 41 08                      |   i32.const 8
 00725e: 20 04                      |   local.get 4
 007260: 41 08                      |   i32.const 8
 007262: 4b                         |   i32.gt_u
 007263: 1b                         |   select
 007264: 22 04                      |   local.tee 4
 007266: 41 00                      |   i32.const 0
 007268: 4e                         |   i32.ge_s
 007269: 0d 00                      |   br_if 0
 00726b: 41 00                      |   i32.const 0
 00726d: 41 00                      |   i32.const 0
 00726f: 20 01                      |   local.get 1
 007271: 10 f8 80 80 80 00          |   call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 007277: 00                         |   unreachable
 007278: 0b                         | end
 007279: 41 00                      | i32.const 0
 00727b: 21 05                      | local.set 5
 00727d: 02 40                      | block
 00727f: 20 03                      |   local.get 3
 007281: 45                         |   i32.eqz
 007282: 0d 00                      |   br_if 0
 007284: 20 02                      |   local.get 2
 007286: 20 03                      |   local.get 3
 007288: 36 02 1c                   |   i32.store 2 28
 00728b: 20 02                      |   local.get 2
 00728d: 20 00                      |   local.get 0
 00728f: 28 02 04                   |   i32.load 2 4
 007292: 36 02 14                   |   i32.store 2 20
 007295: 41 01                      |   i32.const 1
 007297: 21 05                      |   local.set 5
 007299: 0b                         | end
 00729a: 20 02                      | local.get 2
 00729c: 20 05                      | local.get 5
 00729e: 36 02 18                   | i32.store 2 24
 0072a1: 20 02                      | local.get 2
 0072a3: 41 08                      | i32.const 8
 0072a5: 6a                         | i32.add
 0072a6: 41 01                      | i32.const 1
 0072a8: 20 04                      | local.get 4
 0072aa: 20 02                      | local.get 2
 0072ac: 41 14                      | i32.const 20
 0072ae: 6a                         | i32.add
 0072af: 10 f9 80 80 80 00          | call 121 <_ZN5alloc7raw_vec11finish_grow17h3921ab8d299433e4E>
 0072b5: 02 40                      | block
 0072b7: 20 02                      |   local.get 2
 0072b9: 28 02 08                   |   i32.load 2 8
 0072bc: 41 01                      |   i32.const 1
 0072be: 47                         |   i32.ne
 0072bf: 0d 00                      |   br_if 0
 0072c1: 20 02                      |   local.get 2
 0072c3: 28 02 0c                   |   i32.load 2 12
 0072c6: 20 02                      |   local.get 2
 0072c8: 28 02 10                   |   i32.load 2 16
 0072cb: 20 01                      |   local.get 1
 0072cd: 10 f8 80 80 80 00          |   call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 0072d3: 00                         |   unreachable
 0072d4: 0b                         | end
 0072d5: 20 02                      | local.get 2
 0072d7: 28 02 0c                   | i32.load 2 12
 0072da: 21 03                      | local.set 3
 0072dc: 20 00                      | local.get 0
 0072de: 20 04                      | local.get 4
 0072e0: 36 02 00                   | i32.store 2 0
 0072e3: 20 00                      | local.get 0
 0072e5: 20 03                      | local.get 3
 0072e7: 36 02 04                   | i32.store 2 4
 0072ea: 20 02                      | local.get 2
 0072ec: 41 20                      | i32.const 32
 0072ee: 6a                         | i32.add
 0072ef: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0072f5: 0b                         | end
0072f7 func[120] <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>:
 0072f8: 02 40                      | block
 0072fa: 20 00                      |   local.get 0
 0072fc: 0d 00                      |   br_if 0
 0072fe: 20 02                      |   local.get 2
 007300: 10 f6 80 80 80 00          |   call 118 <_ZN5alloc7raw_vec17capacity_overflow17h0fb74a5685c13d41E>
 007306: 00                         |   unreachable
 007307: 0b                         | end
 007308: 20 00                      | local.get 0
 00730a: 20 01                      | local.get 1
 00730c: 10 fa 80 80 80 00          | call 122 <_ZN5alloc5alloc18handle_alloc_error17h26e54cf75ece9ad8E>
 007312: 00                         | unreachable
 007313: 0b                         | end
007316 func[121] <_ZN5alloc7raw_vec11finish_grow17h3921ab8d299433e4E>:
 007317: 01 7f                      | local[4] type=i32
 007319: 02 40                      | block
 00731b: 02 40                      |   block
 00731d: 20 02                      |     local.get 2
 00731f: 41 00                      |     i32.const 0
 007321: 48                         |     i32.lt_s
 007322: 0d 00                      |     br_if 0
 007324: 02 40                      |     block
 007326: 02 40                      |       block
 007328: 02 40                      |         block
 00732a: 20 03                      |           local.get 3
 00732c: 28 02 04                   |           i32.load 2 4
 00732f: 45                         |           i32.eqz
 007330: 0d 00                      |           br_if 0
 007332: 02 40                      |           block
 007334: 20 03                      |             local.get 3
 007336: 28 02 08                   |             i32.load 2 8
 007339: 22 04                      |             local.tee 4
 00733b: 0d 00                      |             br_if 0
 00733d: 02 40                      |             block
 00733f: 20 02                      |               local.get 2
 007341: 0d 00                      |               br_if 0
 007343: 20 01                      |               local.get 1
 007345: 21 03                      |               local.set 3
 007347: 0c 04                      |               br 4
 007349: 0b                         |             end
 00734a: 41 00                      |             i32.const 0
 00734c: 2d 00 b1 95 c0 80 00       |             i32.load8_u 0 1051313
 007353: 1a                         |             drop
 007354: 0c 02                      |             br 2
 007356: 0b                         |           end
 007357: 20 03                      |           local.get 3
 007359: 28 02 00                   |           i32.load 2 0
 00735c: 20 04                      |           local.get 4
 00735e: 20 01                      |           local.get 1
 007360: 20 02                      |           local.get 2
 007362: 10 87 80 80 80 00          |           call 7 <__rust_realloc>
 007368: 21 03                      |           local.set 3
 00736a: 0c 02                      |           br 2
 00736c: 0b                         |         end
 00736d: 02 40                      |         block
 00736f: 20 02                      |           local.get 2
 007371: 0d 00                      |           br_if 0
 007373: 20 01                      |           local.get 1
 007375: 21 03                      |           local.set 3
 007377: 0c 02                      |           br 2
 007379: 0b                         |         end
 00737a: 41 00                      |         i32.const 0
 00737c: 2d 00 b1 95 c0 80 00       |         i32.load8_u 0 1051313
 007383: 1a                         |         drop
 007384: 0b                         |       end
 007385: 20 02                      |       local.get 2
 007387: 20 01                      |       local.get 1
 007389: 10 85 80 80 80 00          |       call 5 <__rust_alloc>
 00738f: 21 03                      |       local.set 3
 007391: 0b                         |     end
 007392: 02 40                      |     block
 007394: 20 03                      |       local.get 3
 007396: 45                         |       i32.eqz
 007397: 0d 00                      |       br_if 0
 007399: 20 00                      |       local.get 0
 00739b: 20 02                      |       local.get 2
 00739d: 36 02 08                   |       i32.store 2 8
 0073a0: 20 00                      |       local.get 0
 0073a2: 20 03                      |       local.get 3
 0073a4: 36 02 04                   |       i32.store 2 4
 0073a7: 20 00                      |       local.get 0
 0073a9: 41 00                      |       i32.const 0
 0073ab: 36 02 00                   |       i32.store 2 0
 0073ae: 0f                         |       return
 0073af: 0b                         |     end
 0073b0: 20 00                      |     local.get 0
 0073b2: 20 02                      |     local.get 2
 0073b4: 36 02 08                   |     i32.store 2 8
 0073b7: 20 00                      |     local.get 0
 0073b9: 20 01                      |     local.get 1
 0073bb: 36 02 04                   |     i32.store 2 4
 0073be: 0c 01                      |     br 1
 0073c0: 0b                         |   end
 0073c1: 20 00                      |   local.get 0
 0073c3: 41 00                      |   i32.const 0
 0073c5: 36 02 04                   |   i32.store 2 4
 0073c8: 0b                         | end
 0073c9: 20 00                      | local.get 0
 0073cb: 41 01                      | i32.const 1
 0073cd: 36 02 00                   | i32.store 2 0
 0073d0: 0b                         | end
0073d2 func[122] <_ZN5alloc5alloc18handle_alloc_error17h26e54cf75ece9ad8E>:
 0073d3: 20 01                      | local.get 1
 0073d5: 20 00                      | local.get 0
 0073d7: 10 88 80 80 80 00          | call 8 <__rust_alloc_error_handler>
 0073dd: 00                         | unreachable
 0073de: 0b                         | end
0073e1 func[123] <_ZN72_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$13spec_new_impl17h2a7f5495f35dd8d5E>:
 0073e2: 04 7f                      | local[3..6] type=i32
 0073e4: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 0073ea: 41 20                      | i32.const 32
 0073ec: 6b                         | i32.sub
 0073ed: 22 03                      | local.tee 3
 0073ef: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0073f5: 02 40                      | block
 0073f7: 02 40                      |   block
 0073f9: 02 40                      |     block
 0073fb: 02 40                      |       block
 0073fd: 02 40                      |         block
 0073ff: 20 02                      |           local.get 2
 007401: 41 7f                      |           i32.const 4294967295
 007403: 46                         |           i32.eq
 007404: 0d 00                      |           br_if 0
 007406: 41 00                      |           i32.const 0
 007408: 21 04                      |           local.set 4
 00740a: 20 02                      |           local.get 2
 00740c: 41 01                      |           i32.const 1
 00740e: 6a                         |           i32.add
 00740f: 22 05                      |           local.tee 5
 007411: 41 00                      |           i32.const 0
 007413: 48                         |           i32.lt_s
 007414: 0d 01                      |           br_if 1
 007416: 41 00                      |           i32.const 0
 007418: 2d 00 b1 95 c0 80 00       |           i32.load8_u 0 1051313
 00741f: 1a                         |           drop
 007420: 41 01                      |           i32.const 1
 007422: 21 04                      |           local.set 4
 007424: 20 05                      |           local.get 5
 007426: 41 01                      |           i32.const 1
 007428: 10 85 80 80 80 00          |           call 5 <__rust_alloc>
 00742e: 22 06                      |           local.tee 6
 007430: 45                         |           i32.eqz
 007431: 0d 01                      |           br_if 1
 007433: 20 06                      |           local.get 6
 007435: 20 01                      |           local.get 1
 007437: 20 02                      |           local.get 2
 007439: 10 ee 80 80 80 00          |           call 110 <memcpy>
 00743f: 21 04                      |           local.set 4
 007441: 02 40                      |           block
 007443: 20 02                      |             local.get 2
 007445: 41 07                      |             i32.const 7
 007447: 4b                         |             i32.gt_u
 007448: 0d 00                      |             br_if 0
 00744a: 20 02                      |             local.get 2
 00744c: 45                         |             i32.eqz
 00744d: 0d 03                      |             br_if 3
 00744f: 02 40                      |             block
 007451: 20 01                      |               local.get 1
 007453: 2d 00 00                   |               i32.load8_u 0 0
 007456: 0d 00                      |               br_if 0
 007458: 41 00                      |               i32.const 0
 00745a: 21 06                      |               local.set 6
 00745c: 0c 05                      |               br 5
 00745e: 0b                         |             end
 00745f: 41 01                      |             i32.const 1
 007461: 21 06                      |             local.set 6
 007463: 20 02                      |             local.get 2
 007465: 41 01                      |             i32.const 1
 007467: 46                         |             i32.eq
 007468: 0d 03                      |             br_if 3
 00746a: 20 01                      |             local.get 1
 00746c: 2d 00 01                   |             i32.load8_u 0 1
 00746f: 45                         |             i32.eqz
 007470: 0d 04                      |             br_if 4
 007472: 41 02                      |             i32.const 2
 007474: 21 06                      |             local.set 6
 007476: 20 02                      |             local.get 2
 007478: 41 02                      |             i32.const 2
 00747a: 46                         |             i32.eq
 00747b: 0d 03                      |             br_if 3
 00747d: 20 01                      |             local.get 1
 00747f: 2d 00 02                   |             i32.load8_u 0 2
 007482: 45                         |             i32.eqz
 007483: 0d 04                      |             br_if 4
 007485: 41 03                      |             i32.const 3
 007487: 21 06                      |             local.set 6
 007489: 20 02                      |             local.get 2
 00748b: 41 03                      |             i32.const 3
 00748d: 46                         |             i32.eq
 00748e: 0d 03                      |             br_if 3
 007490: 20 01                      |             local.get 1
 007492: 2d 00 03                   |             i32.load8_u 0 3
 007495: 45                         |             i32.eqz
 007496: 0d 04                      |             br_if 4
 007498: 41 04                      |             i32.const 4
 00749a: 21 06                      |             local.set 6
 00749c: 20 02                      |             local.get 2
 00749e: 41 04                      |             i32.const 4
 0074a0: 46                         |             i32.eq
 0074a1: 0d 03                      |             br_if 3
 0074a3: 20 01                      |             local.get 1
 0074a5: 2d 00 04                   |             i32.load8_u 0 4
 0074a8: 45                         |             i32.eqz
 0074a9: 0d 04                      |             br_if 4
 0074ab: 41 05                      |             i32.const 5
 0074ad: 21 06                      |             local.set 6
 0074af: 20 02                      |             local.get 2
 0074b1: 41 05                      |             i32.const 5
 0074b3: 46                         |             i32.eq
 0074b4: 0d 03                      |             br_if 3
 0074b6: 20 01                      |             local.get 1
 0074b8: 2d 00 05                   |             i32.load8_u 0 5
 0074bb: 45                         |             i32.eqz
 0074bc: 0d 04                      |             br_if 4
 0074be: 41 06                      |             i32.const 6
 0074c0: 21 06                      |             local.set 6
 0074c2: 20 02                      |             local.get 2
 0074c4: 41 06                      |             i32.const 6
 0074c6: 46                         |             i32.eq
 0074c7: 0d 03                      |             br_if 3
 0074c9: 20 01                      |             local.get 1
 0074cb: 2d 00 06                   |             i32.load8_u 0 6
 0074ce: 45                         |             i32.eqz
 0074cf: 0d 04                      |             br_if 4
 0074d1: 0c 03                      |             br 3
 0074d3: 0b                         |           end
 0074d4: 20 03                      |           local.get 3
 0074d6: 41 08                      |           i32.const 8
 0074d8: 6a                         |           i32.add
 0074d9: 41 00                      |           i32.const 0
 0074db: 20 01                      |           local.get 1
 0074dd: 20 02                      |           local.get 2
 0074df: 10 91 81 80 80 00          |           call 145 <_ZN4core5slice6memchr14memchr_aligned17h01406d79f3f55b97E>
 0074e5: 20 03                      |           local.get 3
 0074e7: 28 02 08                   |           i32.load 2 8
 0074ea: 45                         |           i32.eqz
 0074eb: 0d 02                      |           br_if 2
 0074ed: 20 03                      |           local.get 3
 0074ef: 28 02 0c                   |           i32.load 2 12
 0074f2: 21 06                      |           local.set 6
 0074f4: 0c 03                      |           br 3
 0074f6: 0b                         |         end
 0074f7: 41 ec 90 c0 80 00          |         i32.const 1050732
 0074fd: 10 87 81 80 80 00          |         call 135 <_ZN4core6option13unwrap_failed17h17d660f18fd2c19eE>
 007503: 00                         |         unreachable
 007504: 0b                         |       end
 007505: 20 04                      |       local.get 4
 007507: 20 05                      |       local.get 5
 007509: 41 dc 90 c0 80 00          |       i32.const 1050716
 00750f: 10 f8 80 80 80 00          |       call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 007515: 00                         |       unreachable
 007516: 0b                         |     end
 007517: 20 03                      |     local.get 3
 007519: 20 02                      |     local.get 2
 00751b: 36 02 1c                   |     i32.store 2 28
 00751e: 20 03                      |     local.get 3
 007520: 20 04                      |     local.get 4
 007522: 36 02 18                   |     i32.store 2 24
 007525: 20 03                      |     local.get 3
 007527: 20 05                      |     local.get 5
 007529: 36 02 14                   |     i32.store 2 20
 00752c: 20 03                      |     local.get 3
 00752e: 20 03                      |     local.get 3
 007530: 41 14                      |     i32.const 20
 007532: 6a                         |     i32.add
 007533: 10 fc 80 80 80 00          |     call 124 <_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17h2bbf045fac612f86E>
 007539: 20 00                      |     local.get 0
 00753b: 20 03                      |     local.get 3
 00753d: 29 03 00                   |     i64.load 3 0
 007540: 37 02 04                   |     i64.store 2 4
 007543: 20 00                      |     local.get 0
 007545: 41 80 80 80 80 78          |     i32.const 2147483648
 00754b: 36 02 00                   |     i32.store 2 0
 00754e: 0c 01                      |     br 1
 007550: 0b                         |   end
 007551: 20 00                      |   local.get 0
 007553: 20 06                      |   local.get 6
 007555: 36 02 0c                   |   i32.store 2 12
 007558: 20 00                      |   local.get 0
 00755a: 20 02                      |   local.get 2
 00755c: 36 02 08                   |   i32.store 2 8
 00755f: 20 00                      |   local.get 0
 007561: 20 04                      |   local.get 4
 007563: 36 02 04                   |   i32.store 2 4
 007566: 20 00                      |   local.get 0
 007568: 20 05                      |   local.get 5
 00756a: 36 02 00                   |   i32.store 2 0
 00756d: 0b                         | end
 00756e: 20 03                      | local.get 3
 007570: 41 20                      | i32.const 32
 007572: 6a                         | i32.add
 007573: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007579: 0b                         | end
00757c func[124] <_ZN5alloc3ffi5c_str7CString19_from_vec_unchecked17h2bbf045fac612f86E>:
 00757d: 04 7f                      | local[2..5] type=i32
 00757f: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007585: 41 20                      | i32.const 32
 007587: 6b                         | i32.sub
 007588: 22 02                      | local.tee 2
 00758a: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007590: 02 40                      | block
 007592: 20 01                      |   local.get 1
 007594: 28 02 00                   |   i32.load 2 0
 007597: 22 03                      |   local.tee 3
 007599: 20 01                      |   local.get 1
 00759b: 28 02 08                   |   i32.load 2 8
 00759e: 22 04                      |   local.tee 4
 0075a0: 47                         |   i32.ne
 0075a1: 0d 00                      |   br_if 0
 0075a3: 41 00                      |   i32.const 0
 0075a5: 21 05                      |   local.set 5
 0075a7: 02 40                      |   block
 0075a9: 02 40                      |     block
 0075ab: 02 40                      |       block
 0075ad: 20 04                      |         local.get 4
 0075af: 41 01                      |         i32.const 1
 0075b1: 6a                         |         i32.add
 0075b2: 22 03                      |         local.tee 3
 0075b4: 41 00                      |         i32.const 0
 0075b6: 4e                         |         i32.ge_s
 0075b7: 0d 00                      |         br_if 0
 0075b9: 0c 01                      |         br 1
 0075bb: 0b                         |       end
 0075bc: 41 00                      |       i32.const 0
 0075be: 21 05                      |       local.set 5
 0075c0: 02 40                      |       block
 0075c2: 20 04                      |         local.get 4
 0075c4: 45                         |         i32.eqz
 0075c5: 0d 00                      |         br_if 0
 0075c7: 20 02                      |         local.get 2
 0075c9: 20 04                      |         local.get 4
 0075cb: 36 02 1c                   |         i32.store 2 28
 0075ce: 20 02                      |         local.get 2
 0075d0: 20 01                      |         local.get 1
 0075d2: 28 02 04                   |         i32.load 2 4
 0075d5: 36 02 14                   |         i32.store 2 20
 0075d8: 41 01                      |         i32.const 1
 0075da: 21 05                      |         local.set 5
 0075dc: 0b                         |       end
 0075dd: 20 02                      |       local.get 2
 0075df: 20 05                      |       local.get 5
 0075e1: 36 02 18                   |       i32.store 2 24
 0075e4: 20 02                      |       local.get 2
 0075e6: 41 08                      |       i32.const 8
 0075e8: 6a                         |       i32.add
 0075e9: 41 01                      |       i32.const 1
 0075eb: 20 03                      |       local.get 3
 0075ed: 20 02                      |       local.get 2
 0075ef: 41 14                      |       i32.const 20
 0075f1: 6a                         |       i32.add
 0075f2: 10 f9 80 80 80 00          |       call 121 <_ZN5alloc7raw_vec11finish_grow17h3921ab8d299433e4E>
 0075f8: 20 02                      |       local.get 2
 0075fa: 28 02 08                   |       i32.load 2 8
 0075fd: 41 01                      |       i32.const 1
 0075ff: 47                         |       i32.ne
 007600: 0d 01                      |       br_if 1
 007602: 20 02                      |       local.get 2
 007604: 28 02 10                   |       i32.load 2 16
 007607: 21 01                      |       local.set 1
 007609: 20 02                      |       local.get 2
 00760b: 28 02 0c                   |       i32.load 2 12
 00760e: 21 05                      |       local.set 5
 007610: 0b                         |     end
 007611: 20 05                      |     local.get 5
 007613: 20 01                      |     local.get 1
 007615: 41 fc 90 c0 80 00          |     i32.const 1050748
 00761b: 10 f8 80 80 80 00          |     call 120 <_ZN5alloc7raw_vec12handle_error17h7ab716323ae4d286E>
 007621: 00                         |     unreachable
 007622: 0b                         |   end
 007623: 20 02                      |   local.get 2
 007625: 28 02 0c                   |   i32.load 2 12
 007628: 21 05                      |   local.set 5
 00762a: 20 01                      |   local.get 1
 00762c: 20 03                      |   local.get 3
 00762e: 36 02 00                   |   i32.store 2 0
 007631: 20 01                      |   local.get 1
 007633: 20 05                      |   local.get 5
 007635: 36 02 04                   |   i32.store 2 4
 007638: 0b                         | end
 007639: 20 01                      | local.get 1
 00763b: 20 04                      | local.get 4
 00763d: 41 01                      | i32.const 1
 00763f: 6a                         | i32.add
 007640: 22 05                      | local.tee 5
 007642: 36 02 08                   | i32.store 2 8
 007645: 20 01                      | local.get 1
 007647: 28 02 04                   | i32.load 2 4
 00764a: 22 01                      | local.tee 1
 00764c: 20 04                      | local.get 4
 00764e: 6a                         | i32.add
 00764f: 41 00                      | i32.const 0
 007651: 3a 00 00                   | i32.store8 0 0
 007654: 02 40                      | block
 007656: 02 40                      |   block
 007658: 20 03                      |     local.get 3
 00765a: 20 05                      |     local.get 5
 00765c: 4b                         |     i32.gt_u
 00765d: 0d 00                      |     br_if 0
 00765f: 20 01                      |     local.get 1
 007661: 21 04                      |     local.set 4
 007663: 0c 01                      |     br 1
 007665: 0b                         |   end
 007666: 02 40                      |   block
 007668: 20 05                      |     local.get 5
 00766a: 0d 00                      |     br_if 0
 00766c: 41 01                      |     i32.const 1
 00766e: 21 04                      |     local.set 4
 007670: 20 01                      |     local.get 1
 007672: 20 03                      |     local.get 3
 007674: 41 01                      |     i32.const 1
 007676: 10 86 80 80 80 00          |     call 6 <__rust_dealloc>
 00767c: 0c 01                      |     br 1
 00767e: 0b                         |   end
 00767f: 20 01                      |   local.get 1
 007681: 20 03                      |   local.get 3
 007683: 41 01                      |   i32.const 1
 007685: 20 05                      |   local.get 5
 007687: 10 87 80 80 80 00          |   call 7 <__rust_realloc>
 00768d: 22 04                      |   local.tee 4
 00768f: 0d 00                      |   br_if 0
 007691: 41 01                      |   i32.const 1
 007693: 20 05                      |   local.get 5
 007695: 10 fa 80 80 80 00          |   call 122 <_ZN5alloc5alloc18handle_alloc_error17h26e54cf75ece9ad8E>
 00769b: 00                         |   unreachable
 00769c: 0b                         | end
 00769d: 20 00                      | local.get 0
 00769f: 20 05                      | local.get 5
 0076a1: 36 02 04                   | i32.store 2 4
 0076a4: 20 00                      | local.get 0
 0076a6: 20 04                      | local.get 4
 0076a8: 36 02 00                   | i32.store 2 0
 0076ab: 20 02                      | local.get 2
 0076ad: 41 20                      | i32.const 32
 0076af: 6a                         | i32.add
 0076b0: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 0076b6: 0b                         | end
0076b8 func[125] <_ZN4core5slice5index26slice_start_index_len_fail17h456df2a688f92522E>:
 0076b9: 20 00                      | local.get 0
 0076bb: 20 01                      | local.get 1
 0076bd: 20 02                      | local.get 2
 0076bf: 10 92 81 80 80 00          | call 146 <_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17h250462ce45fab21cE>
 0076c5: 00                         | unreachable
 0076c6: 0b                         | end
0076c8 func[126] <_ZN4core5slice5index24slice_end_index_len_fail17hac06667177b4ebacE>:
 0076c9: 20 00                      | local.get 0
 0076cb: 20 01                      | local.get 1
 0076cd: 20 02                      | local.get 2
 0076cf: 10 93 81 80 80 00          | call 147 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17hea2e113a73aa6cc8E>
 0076d5: 00                         | unreachable
 0076d6: 0b                         | end
0076d9 func[127] <_ZN4core3fmt9Formatter3pad17h64f752386689f2e2E>:
 0076da: 06 7f                      | local[3..8] type=i32
 0076dc: 02 40                      | block
 0076de: 20 00                      |   local.get 0
 0076e0: 28 02 00                   |   i32.load 2 0
 0076e3: 22 03                      |   local.tee 3
 0076e5: 20 00                      |   local.get 0
 0076e7: 28 02 08                   |   i32.load 2 8
 0076ea: 22 04                      |   local.tee 4
 0076ec: 72                         |   i32.or
 0076ed: 45                         |   i32.eqz
 0076ee: 0d 00                      |   br_if 0
 0076f0: 02 40                      |   block
 0076f2: 20 04                      |     local.get 4
 0076f4: 41 01                      |     i32.const 1
 0076f6: 71                         |     i32.and
 0076f7: 45                         |     i32.eqz
 0076f8: 0d 00                      |     br_if 0
 0076fa: 20 01                      |     local.get 1
 0076fc: 20 02                      |     local.get 2
 0076fe: 6a                         |     i32.add
 0076ff: 21 05                      |     local.set 5
 007701: 02 40                      |     block
 007703: 02 40                      |       block
 007705: 20 00                      |         local.get 0
 007707: 28 02 0c                   |         i32.load 2 12
 00770a: 22 06                      |         local.tee 6
 00770c: 0d 00                      |         br_if 0
 00770e: 41 00                      |         i32.const 0
 007710: 21 07                      |         local.set 7
 007712: 20 01                      |         local.get 1
 007714: 21 08                      |         local.set 8
 007716: 0c 01                      |         br 1
 007718: 0b                         |       end
 007719: 41 00                      |       i32.const 0
 00771b: 21 07                      |       local.set 7
 00771d: 20 01                      |       local.get 1
 00771f: 21 08                      |       local.set 8
 007721: 03 40                      |       loop
 007723: 20 08                      |         local.get 8
 007725: 22 04                      |         local.tee 4
 007727: 20 05                      |         local.get 5
 007729: 46                         |         i32.eq
 00772a: 0d 02                      |         br_if 2
 00772c: 02 40                      |         block
 00772e: 02 40                      |           block
 007730: 20 04                      |             local.get 4
 007732: 2c 00 00                   |             i32.load8_s 0 0
 007735: 22 08                      |             local.tee 8
 007737: 41 7f                      |             i32.const 4294967295
 007739: 4c                         |             i32.le_s
 00773a: 0d 00                      |             br_if 0
 00773c: 20 04                      |             local.get 4
 00773e: 41 01                      |             i32.const 1
 007740: 6a                         |             i32.add
 007741: 21 08                      |             local.set 8
 007743: 0c 01                      |             br 1
 007745: 0b                         |           end
 007746: 02 40                      |           block
 007748: 20 08                      |             local.get 8
 00774a: 41 60                      |             i32.const 4294967264
 00774c: 4f                         |             i32.ge_u
 00774d: 0d 00                      |             br_if 0
 00774f: 20 04                      |             local.get 4
 007751: 41 02                      |             i32.const 2
 007753: 6a                         |             i32.add
 007754: 21 08                      |             local.set 8
 007756: 0c 01                      |             br 1
 007758: 0b                         |           end
 007759: 02 40                      |           block
 00775b: 20 08                      |             local.get 8
 00775d: 41 70                      |             i32.const 4294967280
 00775f: 4f                         |             i32.ge_u
 007760: 0d 00                      |             br_if 0
 007762: 20 04                      |             local.get 4
 007764: 41 03                      |             i32.const 3
 007766: 6a                         |             i32.add
 007767: 21 08                      |             local.set 8
 007769: 0c 01                      |             br 1
 00776b: 0b                         |           end
 00776c: 20 04                      |           local.get 4
 00776e: 41 04                      |           i32.const 4
 007770: 6a                         |           i32.add
 007771: 21 08                      |           local.set 8
 007773: 0b                         |         end
 007774: 20 08                      |         local.get 8
 007776: 20 04                      |         local.get 4
 007778: 6b                         |         i32.sub
 007779: 20 07                      |         local.get 7
 00777b: 6a                         |         i32.add
 00777c: 21 07                      |         local.set 7
 00777e: 20 06                      |         local.get 6
 007780: 41 7f                      |         i32.const 4294967295
 007782: 6a                         |         i32.add
 007783: 22 06                      |         local.tee 6
 007785: 0d 00                      |         br_if 0
 007787: 0b                         |       end
 007788: 0b                         |     end
 007789: 20 08                      |     local.get 8
 00778b: 20 05                      |     local.get 5
 00778d: 46                         |     i32.eq
 00778e: 0d 00                      |     br_if 0
 007790: 02 40                      |     block
 007792: 20 08                      |       local.get 8
 007794: 2c 00 00                   |       i32.load8_s 0 0
 007797: 22 04                      |       local.tee 4
 007799: 41 7f                      |       i32.const 4294967295
 00779b: 4a                         |       i32.gt_s
 00779c: 0d 00                      |       br_if 0
 00779e: 20 04                      |       local.get 4
 0077a0: 41 60                      |       i32.const 4294967264
 0077a2: 49                         |       i32.lt_u
 0077a3: 1a                         |       drop
 0077a4: 0b                         |     end
 0077a5: 02 40                      |     block
 0077a7: 02 40                      |       block
 0077a9: 20 07                      |         local.get 7
 0077ab: 45                         |         i32.eqz
 0077ac: 0d 00                      |         br_if 0
 0077ae: 02 40                      |         block
 0077b0: 20 07                      |           local.get 7
 0077b2: 20 02                      |           local.get 2
 0077b4: 49                         |           i32.lt_u
 0077b5: 0d 00                      |           br_if 0
 0077b7: 20 07                      |           local.get 7
 0077b9: 20 02                      |           local.get 2
 0077bb: 46                         |           i32.eq
 0077bc: 0d 01                      |           br_if 1
 0077be: 41 00                      |           i32.const 0
 0077c0: 21 04                      |           local.set 4
 0077c2: 0c 02                      |           br 2
 0077c4: 0b                         |         end
 0077c5: 20 01                      |         local.get 1
 0077c7: 20 07                      |         local.get 7
 0077c9: 6a                         |         i32.add
 0077ca: 2c 00 00                   |         i32.load8_s 0 0
 0077cd: 41 40                      |         i32.const 4294967232
 0077cf: 4e                         |         i32.ge_s
 0077d0: 0d 00                      |         br_if 0
 0077d2: 41 00                      |         i32.const 0
 0077d4: 21 04                      |         local.set 4
 0077d6: 0c 01                      |         br 1
 0077d8: 0b                         |       end
 0077d9: 20 01                      |       local.get 1
 0077db: 21 04                      |       local.set 4
 0077dd: 0b                         |     end
 0077de: 20 07                      |     local.get 7
 0077e0: 20 02                      |     local.get 2
 0077e2: 20 04                      |     local.get 4
 0077e4: 1b                         |     select
 0077e5: 21 02                      |     local.set 2
 0077e7: 20 04                      |     local.get 4
 0077e9: 20 01                      |     local.get 1
 0077eb: 20 04                      |     local.get 4
 0077ed: 1b                         |     select
 0077ee: 21 01                      |     local.set 1
 0077f0: 0b                         |   end
 0077f1: 02 40                      |   block
 0077f3: 20 03                      |     local.get 3
 0077f5: 0d 00                      |     br_if 0
 0077f7: 20 00                      |     local.get 0
 0077f9: 28 02 1c                   |     i32.load 2 28
 0077fc: 20 01                      |     local.get 1
 0077fe: 20 02                      |     local.get 2
 007800: 20 00                      |     local.get 0
 007802: 28 02 20                   |     i32.load 2 32
 007805: 28 02 0c                   |     i32.load 2 12
 007808: 11 83 80 80 80 00 80 80 80 |     call_indirect 0 (type 3)
 007811: 80 00                      | 
 007813: 0f                         |     return
 007814: 0b                         |   end
 007815: 20 00                      |   local.get 0
 007817: 28 02 04                   |   i32.load 2 4
 00781a: 21 03                      |   local.set 3
 00781c: 02 40                      |   block
 00781e: 02 40                      |     block
 007820: 20 02                      |       local.get 2
 007822: 41 10                      |       i32.const 16
 007824: 49                         |       i32.lt_u
 007825: 0d 00                      |       br_if 0
 007827: 20 01                      |       local.get 1
 007829: 20 02                      |       local.get 2
 00782b: 10 8c 81 80 80 00          |       call 140 <_ZN4core3str5count14do_count_chars17h38be9ed0b8048c10E>
 007831: 21 04                      |       local.set 4
 007833: 0c 01                      |       br 1
 007835: 0b                         |     end
 007836: 02 40                      |     block
 007838: 20 02                      |       local.get 2
 00783a: 0d 00                      |       br_if 0
 00783c: 41 00                      |       i32.const 0
 00783e: 21 04                      |       local.set 4
 007840: 0c 01                      |       br 1
 007842: 0b                         |     end
 007843: 20 02                      |     local.get 2
 007845: 41 03                      |     i32.const 3
 007847: 71                         |     i32.and
 007848: 21 06                      |     local.set 6
 00784a: 02 40                      |     block
 00784c: 02 40                      |       block
 00784e: 20 02                      |         local.get 2
 007850: 41 04                      |         i32.const 4
 007852: 4f                         |         i32.ge_u
 007853: 0d 00                      |         br_if 0
 007855: 41 00                      |         i32.const 0
 007857: 21 04                      |         local.set 4
 007859: 41 00                      |         i32.const 0
 00785b: 21 07                      |         local.set 7
 00785d: 0c 01                      |         br 1
 00785f: 0b                         |       end
 007860: 20 02                      |       local.get 2
 007862: 41 0c                      |       i32.const 12
 007864: 71                         |       i32.and
 007865: 21 05                      |       local.set 5
 007867: 41 00                      |       i32.const 0
 007869: 21 04                      |       local.set 4
 00786b: 41 00                      |       i32.const 0
 00786d: 21 07                      |       local.set 7
 00786f: 03 40                      |       loop
 007871: 20 04                      |         local.get 4
 007873: 20 01                      |         local.get 1
 007875: 20 07                      |         local.get 7
 007877: 6a                         |         i32.add
 007878: 22 08                      |         local.tee 8
 00787a: 2c 00 00                   |         i32.load8_s 0 0
 00787d: 41 bf 7f                   |         i32.const 4294967231
 007880: 4a                         |         i32.gt_s
 007881: 6a                         |         i32.add
 007882: 20 08                      |         local.get 8
 007884: 41 01                      |         i32.const 1
 007886: 6a                         |         i32.add
 007887: 2c 00 00                   |         i32.load8_s 0 0
 00788a: 41 bf 7f                   |         i32.const 4294967231
 00788d: 4a                         |         i32.gt_s
 00788e: 6a                         |         i32.add
 00788f: 20 08                      |         local.get 8
 007891: 41 02                      |         i32.const 2
 007893: 6a                         |         i32.add
 007894: 2c 00 00                   |         i32.load8_s 0 0
 007897: 41 bf 7f                   |         i32.const 4294967231
 00789a: 4a                         |         i32.gt_s
 00789b: 6a                         |         i32.add
 00789c: 20 08                      |         local.get 8
 00789e: 41 03                      |         i32.const 3
 0078a0: 6a                         |         i32.add
 0078a1: 2c 00 00                   |         i32.load8_s 0 0
 0078a4: 41 bf 7f                   |         i32.const 4294967231
 0078a7: 4a                         |         i32.gt_s
 0078a8: 6a                         |         i32.add
 0078a9: 21 04                      |         local.set 4
 0078ab: 20 05                      |         local.get 5
 0078ad: 20 07                      |         local.get 7
 0078af: 41 04                      |         i32.const 4
 0078b1: 6a                         |         i32.add
 0078b2: 22 07                      |         local.tee 7
 0078b4: 47                         |         i32.ne
 0078b5: 0d 00                      |         br_if 0
 0078b7: 0b                         |       end
 0078b8: 0b                         |     end
 0078b9: 20 06                      |     local.get 6
 0078bb: 45                         |     i32.eqz
 0078bc: 0d 00                      |     br_if 0
 0078be: 20 01                      |     local.get 1
 0078c0: 20 07                      |     local.get 7
 0078c2: 6a                         |     i32.add
 0078c3: 21 08                      |     local.set 8
 0078c5: 03 40                      |     loop
 0078c7: 20 04                      |       local.get 4
 0078c9: 20 08                      |       local.get 8
 0078cb: 2c 00 00                   |       i32.load8_s 0 0
 0078ce: 41 bf 7f                   |       i32.const 4294967231
 0078d1: 4a                         |       i32.gt_s
 0078d2: 6a                         |       i32.add
 0078d3: 21 04                      |       local.set 4
 0078d5: 20 08                      |       local.get 8
 0078d7: 41 01                      |       i32.const 1
 0078d9: 6a                         |       i32.add
 0078da: 21 08                      |       local.set 8
 0078dc: 20 06                      |       local.get 6
 0078de: 41 7f                      |       i32.const 4294967295
 0078e0: 6a                         |       i32.add
 0078e1: 22 06                      |       local.tee 6
 0078e3: 0d 00                      |       br_if 0
 0078e5: 0b                         |     end
 0078e6: 0b                         |   end
 0078e7: 02 40                      |   block
 0078e9: 02 40                      |     block
 0078eb: 20 03                      |       local.get 3
 0078ed: 20 04                      |       local.get 4
 0078ef: 4d                         |       i32.le_u
 0078f0: 0d 00                      |       br_if 0
 0078f2: 20 03                      |       local.get 3
 0078f4: 20 04                      |       local.get 4
 0078f6: 6b                         |       i32.sub
 0078f7: 21 06                      |       local.set 6
 0078f9: 02 40                      |       block
 0078fb: 02 40                      |         block
 0078fd: 02 40                      |           block
 0078ff: 41 00                      |             i32.const 0
 007901: 20 00                      |             local.get 0
 007903: 2d 00 18                   |             i32.load8_u 0 24
 007906: 22 04                      |             local.tee 4
 007908: 20 04                      |             local.get 4
 00790a: 41 03                      |             i32.const 3
 00790c: 46                         |             i32.eq
 00790d: 1b                         |             select
 00790e: 22 04                      |             local.tee 4
 007910: 0e 03 02 00 01 02          |             br_table 2 0 1 2
 007916: 0b                         |           end
 007917: 20 06                      |           local.get 6
 007919: 21 04                      |           local.set 4
 00791b: 41 00                      |           i32.const 0
 00791d: 21 06                      |           local.set 6
 00791f: 0c 01                      |           br 1
 007921: 0b                         |         end
 007922: 20 06                      |         local.get 6
 007924: 41 01                      |         i32.const 1
 007926: 76                         |         i32.shr_u
 007927: 21 04                      |         local.set 4
 007929: 20 06                      |         local.get 6
 00792b: 41 01                      |         i32.const 1
 00792d: 6a                         |         i32.add
 00792e: 41 01                      |         i32.const 1
 007930: 76                         |         i32.shr_u
 007931: 21 06                      |         local.set 6
 007933: 0b                         |       end
 007934: 20 04                      |       local.get 4
 007936: 41 01                      |       i32.const 1
 007938: 6a                         |       i32.add
 007939: 21 04                      |       local.set 4
 00793b: 20 00                      |       local.get 0
 00793d: 28 02 10                   |       i32.load 2 16
 007940: 21 07                      |       local.set 7
 007942: 20 00                      |       local.get 0
 007944: 28 02 20                   |       i32.load 2 32
 007947: 21 08                      |       local.set 8
 007949: 20 00                      |       local.get 0
 00794b: 28 02 1c                   |       i32.load 2 28
 00794e: 21 00                      |       local.set 0
 007950: 03 40                      |       loop
 007952: 20 04                      |         local.get 4
 007954: 41 7f                      |         i32.const 4294967295
 007956: 6a                         |         i32.add
 007957: 22 04                      |         local.tee 4
 007959: 45                         |         i32.eqz
 00795a: 0d 02                      |         br_if 2
 00795c: 20 00                      |         local.get 0
 00795e: 20 07                      |         local.get 7
 007960: 20 08                      |         local.get 8
 007962: 28 02 10                   |         i32.load 2 16
 007965: 11 81 80 80 80 00 80 80 80 |         call_indirect 0 (type 1)
 00796e: 80 00                      | 
 007970: 45                         |         i32.eqz
 007971: 0d 00                      |         br_if 0
 007973: 0b                         |       end
 007974: 41 01                      |       i32.const 1
 007976: 0f                         |       return
 007977: 0b                         |     end
 007978: 20 00                      |     local.get 0
 00797a: 28 02 1c                   |     i32.load 2 28
 00797d: 20 01                      |     local.get 1
 00797f: 20 02                      |     local.get 2
 007981: 20 00                      |     local.get 0
 007983: 28 02 20                   |     i32.load 2 32
 007986: 28 02 0c                   |     i32.load 2 12
 007989: 11 83 80 80 80 00 80 80 80 |     call_indirect 0 (type 3)
 007992: 80 00                      | 
 007994: 0f                         |     return
 007995: 0b                         |   end
 007996: 02 40                      |   block
 007998: 20 00                      |     local.get 0
 00799a: 20 01                      |     local.get 1
 00799c: 20 02                      |     local.get 2
 00799e: 20 08                      |     local.get 8
 0079a0: 28 02 0c                   |     i32.load 2 12
 0079a3: 11 83 80 80 80 00 80 80 80 |     call_indirect 0 (type 3)
 0079ac: 80 00                      | 
 0079ae: 45                         |     i32.eqz
 0079af: 0d 00                      |     br_if 0
 0079b1: 41 01                      |     i32.const 1
 0079b3: 0f                         |     return
 0079b4: 0b                         |   end
 0079b5: 41 00                      |   i32.const 0
 0079b7: 21 04                      |   local.set 4
 0079b9: 03 40                      |   loop
 0079bb: 02 40                      |     block
 0079bd: 20 06                      |       local.get 6
 0079bf: 20 04                      |       local.get 4
 0079c1: 47                         |       i32.ne
 0079c2: 0d 00                      |       br_if 0
 0079c4: 20 06                      |       local.get 6
 0079c6: 20 06                      |       local.get 6
 0079c8: 49                         |       i32.lt_u
 0079c9: 0f                         |       return
 0079ca: 0b                         |     end
 0079cb: 20 04                      |     local.get 4
 0079cd: 41 01                      |     i32.const 1
 0079cf: 6a                         |     i32.add
 0079d0: 21 04                      |     local.set 4
 0079d2: 20 00                      |     local.get 0
 0079d4: 20 07                      |     local.get 7
 0079d6: 20 08                      |     local.get 8
 0079d8: 28 02 10                   |     i32.load 2 16
 0079db: 11 81 80 80 80 00 80 80 80 |     call_indirect 0 (type 1)
 0079e4: 80 00                      | 
 0079e6: 45                         |     i32.eqz
 0079e7: 0d 00                      |     br_if 0
 0079e9: 0b                         |   end
 0079ea: 20 04                      |   local.get 4
 0079ec: 41 7f                      |   i32.const 4294967295
 0079ee: 6a                         |   i32.add
 0079ef: 20 06                      |   local.get 6
 0079f1: 49                         |   i32.lt_u
 0079f2: 0f                         |   return
 0079f3: 0b                         | end
 0079f4: 20 00                      | local.get 0
 0079f6: 28 02 1c                   | i32.load 2 28
 0079f9: 20 01                      | local.get 1
 0079fb: 20 02                      | local.get 2
 0079fd: 20 00                      | local.get 0
 0079ff: 28 02 20                   | i32.load 2 32
 007a02: 28 02 0c                   | i32.load 2 12
 007a05: 11 83 80 80 80 00 80 80 80 | call_indirect 0 (type 3)
 007a0e: 80 00                      | 
 007a10: 0b                         | end
007a12 func[128] <_ZN4core9panicking5panic17hc73239fa121fb30eE>:
 007a13: 01 7f                      | local[3] type=i32
 007a15: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007a1b: 41 20                      | i32.const 32
 007a1d: 6b                         | i32.sub
 007a1e: 22 03                      | local.tee 3
 007a20: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007a26: 20 03                      | local.get 3
 007a28: 41 00                      | i32.const 0
 007a2a: 36 02 10                   | i32.store 2 16
 007a2d: 20 03                      | local.get 3
 007a2f: 41 01                      | i32.const 1
 007a31: 36 02 04                   | i32.store 2 4
 007a34: 20 03                      | local.get 3
 007a36: 42 04                      | i64.const 4
 007a38: 37 02 08                   | i64.store 2 8
 007a3b: 20 03                      | local.get 3
 007a3d: 20 01                      | local.get 1
 007a3f: 36 02 1c                   | i32.store 2 28
 007a42: 20 03                      | local.get 3
 007a44: 20 00                      | local.get 0
 007a46: 36 02 18                   | i32.store 2 24
 007a49: 20 03                      | local.get 3
 007a4b: 20 03                      | local.get 3
 007a4d: 41 18                      | i32.const 24
 007a4f: 6a                         | i32.add
 007a50: 36 02 00                   | i32.store 2 0
 007a53: 20 03                      | local.get 3
 007a55: 20 02                      | local.get 2
 007a57: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 007a5d: 00                         | unreachable
 007a5e: 0b                         | end
007a60 func[129] <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>:
 007a61: 01 7f                      | local[2] type=i32
 007a63: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007a69: 41 10                      | i32.const 16
 007a6b: 6b                         | i32.sub
 007a6c: 22 02                      | local.tee 2
 007a6e: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007a74: 20 02                      | local.get 2
 007a76: 41 01                      | i32.const 1
 007a78: 3b 01 0c                   | i32.store16 1 12
 007a7b: 20 02                      | local.get 2
 007a7d: 20 01                      | local.get 1
 007a7f: 36 02 08                   | i32.store 2 8
 007a82: 20 02                      | local.get 2
 007a84: 20 00                      | local.get 0
 007a86: 36 02 04                   | i32.store 2 4
 007a89: 20 02                      | local.get 2
 007a8b: 41 04                      | i32.const 4
 007a8d: 6a                         | i32.add
 007a8e: 10 c6 80 80 80 00          | call 70 <rust_begin_unwind>
 007a94: 00                         | unreachable
 007a95: 0b                         | end
007a98 func[130] <_ZN4core3fmt5write17h7df898af4051b9beE>:
 007a99: 0a 7f                      | local[3..12] type=i32
 007a9b: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007aa1: 41 30                      | i32.const 48
 007aa3: 6b                         | i32.sub
 007aa4: 22 03                      | local.tee 3
 007aa6: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007aac: 20 03                      | local.get 3
 007aae: 20 01                      | local.get 1
 007ab0: 36 02 2c                   | i32.store 2 44
 007ab3: 20 03                      | local.get 3
 007ab5: 20 00                      | local.get 0
 007ab7: 36 02 28                   | i32.store 2 40
 007aba: 20 03                      | local.get 3
 007abc: 41 03                      | i32.const 3
 007abe: 3a 00 24                   | i32.store8 0 36
 007ac1: 20 03                      | local.get 3
 007ac3: 42 20                      | i64.const 32
 007ac5: 37 02 1c                   | i64.store 2 28
 007ac8: 41 00                      | i32.const 0
 007aca: 21 04                      | local.set 4
 007acc: 20 03                      | local.get 3
 007ace: 41 00                      | i32.const 0
 007ad0: 36 02 14                   | i32.store 2 20
 007ad3: 20 03                      | local.get 3
 007ad5: 41 00                      | i32.const 0
 007ad7: 36 02 0c                   | i32.store 2 12
 007ada: 02 40                      | block
 007adc: 02 40                      |   block
 007ade: 02 40                      |     block
 007ae0: 02 40                      |       block
 007ae2: 02 40                      |         block
 007ae4: 20 02                      |           local.get 2
 007ae6: 28 02 10                   |           i32.load 2 16
 007ae9: 22 05                      |           local.tee 5
 007aeb: 0d 00                      |           br_if 0
 007aed: 20 02                      |           local.get 2
 007aef: 28 02 0c                   |           i32.load 2 12
 007af2: 22 00                      |           local.tee 0
 007af4: 45                         |           i32.eqz
 007af5: 0d 01                      |           br_if 1
 007af7: 20 02                      |           local.get 2
 007af9: 28 02 08                   |           i32.load 2 8
 007afc: 22 01                      |           local.tee 1
 007afe: 20 00                      |           local.get 0
 007b00: 41 03                      |           i32.const 3
 007b02: 74                         |           i32.shl
 007b03: 6a                         |           i32.add
 007b04: 21 06                      |           local.set 6
 007b06: 20 00                      |           local.get 0
 007b08: 41 7f                      |           i32.const 4294967295
 007b0a: 6a                         |           i32.add
 007b0b: 41 ff ff ff ff 01          |           i32.const 536870911
 007b11: 71                         |           i32.and
 007b12: 41 01                      |           i32.const 1
 007b14: 6a                         |           i32.add
 007b15: 21 04                      |           local.set 4
 007b17: 20 02                      |           local.get 2
 007b19: 28 02 00                   |           i32.load 2 0
 007b1c: 21 00                      |           local.set 0
 007b1e: 03 40                      |           loop
 007b20: 02 40                      |             block
 007b22: 20 00                      |               local.get 0
 007b24: 41 04                      |               i32.const 4
 007b26: 6a                         |               i32.add
 007b27: 28 02 00                   |               i32.load 2 0
 007b2a: 22 07                      |               local.tee 7
 007b2c: 45                         |               i32.eqz
 007b2d: 0d 00                      |               br_if 0
 007b2f: 20 03                      |               local.get 3
 007b31: 28 02 28                   |               i32.load 2 40
 007b34: 20 00                      |               local.get 0
 007b36: 28 02 00                   |               i32.load 2 0
 007b39: 20 07                      |               local.get 7
 007b3b: 20 03                      |               local.get 3
 007b3d: 28 02 2c                   |               i32.load 2 44
 007b40: 28 02 0c                   |               i32.load 2 12
 007b43: 11 83 80 80 80 00 80 80 80 |               call_indirect 0 (type 3)
 007b4c: 80 00                      | 
 007b4e: 0d 04                      |               br_if 4
 007b50: 0b                         |             end
 007b51: 20 01                      |             local.get 1
 007b53: 28 02 00                   |             i32.load 2 0
 007b56: 20 03                      |             local.get 3
 007b58: 41 0c                      |             i32.const 12
 007b5a: 6a                         |             i32.add
 007b5b: 20 01                      |             local.get 1
 007b5d: 41 04                      |             i32.const 4
 007b5f: 6a                         |             i32.add
 007b60: 28 02 00                   |             i32.load 2 0
 007b63: 11 81 80 80 80 00 80 80 80 |             call_indirect 0 (type 1)
 007b6c: 80 00                      | 
 007b6e: 0d 03                      |             br_if 3
 007b70: 20 00                      |             local.get 0
 007b72: 41 08                      |             i32.const 8
 007b74: 6a                         |             i32.add
 007b75: 21 00                      |             local.set 0
 007b77: 20 01                      |             local.get 1
 007b79: 41 08                      |             i32.const 8
 007b7b: 6a                         |             i32.add
 007b7c: 22 01                      |             local.tee 1
 007b7e: 20 06                      |             local.get 6
 007b80: 47                         |             i32.ne
 007b81: 0d 00                      |             br_if 0
 007b83: 0c 02                      |             br 2
 007b85: 0b                         |           end
 007b86: 0b                         |         end
 007b87: 20 02                      |         local.get 2
 007b89: 28 02 14                   |         i32.load 2 20
 007b8c: 22 01                      |         local.tee 1
 007b8e: 45                         |         i32.eqz
 007b8f: 0d 00                      |         br_if 0
 007b91: 20 01                      |         local.get 1
 007b93: 41 05                      |         i32.const 5
 007b95: 74                         |         i32.shl
 007b96: 21 08                      |         local.set 8
 007b98: 20 01                      |         local.get 1
 007b9a: 41 7f                      |         i32.const 4294967295
 007b9c: 6a                         |         i32.add
 007b9d: 41 ff ff ff 3f             |         i32.const 134217727
 007ba2: 71                         |         i32.and
 007ba3: 41 01                      |         i32.const 1
 007ba5: 6a                         |         i32.add
 007ba6: 21 04                      |         local.set 4
 007ba8: 20 02                      |         local.get 2
 007baa: 28 02 08                   |         i32.load 2 8
 007bad: 21 09                      |         local.set 9
 007baf: 20 02                      |         local.get 2
 007bb1: 28 02 00                   |         i32.load 2 0
 007bb4: 21 00                      |         local.set 0
 007bb6: 41 00                      |         i32.const 0
 007bb8: 21 07                      |         local.set 7
 007bba: 03 40                      |         loop
 007bbc: 02 40                      |           block
 007bbe: 20 00                      |             local.get 0
 007bc0: 41 04                      |             i32.const 4
 007bc2: 6a                         |             i32.add
 007bc3: 28 02 00                   |             i32.load 2 0
 007bc6: 22 01                      |             local.tee 1
 007bc8: 45                         |             i32.eqz
 007bc9: 0d 00                      |             br_if 0
 007bcb: 20 03                      |             local.get 3
 007bcd: 28 02 28                   |             i32.load 2 40
 007bd0: 20 00                      |             local.get 0
 007bd2: 28 02 00                   |             i32.load 2 0
 007bd5: 20 01                      |             local.get 1
 007bd7: 20 03                      |             local.get 3
 007bd9: 28 02 2c                   |             i32.load 2 44
 007bdc: 28 02 0c                   |             i32.load 2 12
 007bdf: 11 83 80 80 80 00 80 80 80 |             call_indirect 0 (type 3)
 007be8: 80 00                      | 
 007bea: 0d 03                      |             br_if 3
 007bec: 0b                         |           end
 007bed: 20 03                      |           local.get 3
 007bef: 20 05                      |           local.get 5
 007bf1: 20 07                      |           local.get 7
 007bf3: 6a                         |           i32.add
 007bf4: 22 01                      |           local.tee 1
 007bf6: 41 10                      |           i32.const 16
 007bf8: 6a                         |           i32.add
 007bf9: 28 02 00                   |           i32.load 2 0
 007bfc: 36 02 1c                   |           i32.store 2 28
 007bff: 20 03                      |           local.get 3
 007c01: 20 01                      |           local.get 1
 007c03: 41 1c                      |           i32.const 28
 007c05: 6a                         |           i32.add
 007c06: 2d 00 00                   |           i32.load8_u 0 0
 007c09: 3a 00 24                   |           i32.store8 0 36
 007c0c: 20 03                      |           local.get 3
 007c0e: 20 01                      |           local.get 1
 007c10: 41 18                      |           i32.const 24
 007c12: 6a                         |           i32.add
 007c13: 28 02 00                   |           i32.load 2 0
 007c16: 36 02 20                   |           i32.store 2 32
 007c19: 20 01                      |           local.get 1
 007c1b: 41 0c                      |           i32.const 12
 007c1d: 6a                         |           i32.add
 007c1e: 28 02 00                   |           i32.load 2 0
 007c21: 21 06                      |           local.set 6
 007c23: 41 00                      |           i32.const 0
 007c25: 21 0a                      |           local.set 10
 007c27: 41 00                      |           i32.const 0
 007c29: 21 0b                      |           local.set 11
 007c2b: 02 40                      |           block
 007c2d: 02 40                      |             block
 007c2f: 02 40                      |               block
 007c31: 20 01                      |                 local.get 1
 007c33: 41 08                      |                 i32.const 8
 007c35: 6a                         |                 i32.add
 007c36: 28 02 00                   |                 i32.load 2 0
 007c39: 0e 03 01 00 02 01          |                 br_table 1 0 2 1
 007c3f: 0b                         |               end
 007c40: 20 06                      |               local.get 6
 007c42: 41 03                      |               i32.const 3
 007c44: 74                         |               i32.shl
 007c45: 21 0c                      |               local.set 12
 007c47: 41 00                      |               i32.const 0
 007c49: 21 0b                      |               local.set 11
 007c4b: 20 09                      |               local.get 9
 007c4d: 20 0c                      |               local.get 12
 007c4f: 6a                         |               i32.add
 007c50: 22 0c                      |               local.tee 12
 007c52: 28 02 00                   |               i32.load 2 0
 007c55: 0d 01                      |               br_if 1
 007c57: 20 0c                      |               local.get 12
 007c59: 28 02 04                   |               i32.load 2 4
 007c5c: 21 06                      |               local.set 6
 007c5e: 0b                         |             end
 007c5f: 41 01                      |             i32.const 1
 007c61: 21 0b                      |             local.set 11
 007c63: 0b                         |           end
 007c64: 20 03                      |           local.get 3
 007c66: 20 06                      |           local.get 6
 007c68: 36 02 10                   |           i32.store 2 16
 007c6b: 20 03                      |           local.get 3
 007c6d: 20 0b                      |           local.get 11
 007c6f: 36 02 0c                   |           i32.store 2 12
 007c72: 20 01                      |           local.get 1
 007c74: 41 04                      |           i32.const 4
 007c76: 6a                         |           i32.add
 007c77: 28 02 00                   |           i32.load 2 0
 007c7a: 21 06                      |           local.set 6
 007c7c: 02 40                      |           block
 007c7e: 02 40                      |             block
 007c80: 02 40                      |               block
 007c82: 20 01                      |                 local.get 1
 007c84: 28 02 00                   |                 i32.load 2 0
 007c87: 0e 03 01 00 02 01          |                 br_table 1 0 2 1
 007c8d: 0b                         |               end
 007c8e: 20 06                      |               local.get 6
 007c90: 41 03                      |               i32.const 3
 007c92: 74                         |               i32.shl
 007c93: 21 0b                      |               local.set 11
 007c95: 20 09                      |               local.get 9
 007c97: 20 0b                      |               local.get 11
 007c99: 6a                         |               i32.add
 007c9a: 22 0b                      |               local.tee 11
 007c9c: 28 02 00                   |               i32.load 2 0
 007c9f: 0d 01                      |               br_if 1
 007ca1: 20 0b                      |               local.get 11
 007ca3: 28 02 04                   |               i32.load 2 4
 007ca6: 21 06                      |               local.set 6
 007ca8: 0b                         |             end
 007ca9: 41 01                      |             i32.const 1
 007cab: 21 0a                      |             local.set 10
 007cad: 0b                         |           end
 007cae: 20 03                      |           local.get 3
 007cb0: 20 06                      |           local.get 6
 007cb2: 36 02 18                   |           i32.store 2 24
 007cb5: 20 03                      |           local.get 3
 007cb7: 20 0a                      |           local.get 10
 007cb9: 36 02 14                   |           i32.store 2 20
 007cbc: 20 09                      |           local.get 9
 007cbe: 20 01                      |           local.get 1
 007cc0: 41 14                      |           i32.const 20
 007cc2: 6a                         |           i32.add
 007cc3: 28 02 00                   |           i32.load 2 0
 007cc6: 41 03                      |           i32.const 3
 007cc8: 74                         |           i32.shl
 007cc9: 6a                         |           i32.add
 007cca: 22 01                      |           local.tee 1
 007ccc: 28 02 00                   |           i32.load 2 0
 007ccf: 20 03                      |           local.get 3
 007cd1: 41 0c                      |           i32.const 12
 007cd3: 6a                         |           i32.add
 007cd4: 20 01                      |           local.get 1
 007cd6: 41 04                      |           i32.const 4
 007cd8: 6a                         |           i32.add
 007cd9: 28 02 00                   |           i32.load 2 0
 007cdc: 11 81 80 80 80 00 80 80 80 |           call_indirect 0 (type 1)
 007ce5: 80 00                      | 
 007ce7: 0d 02                      |           br_if 2
 007ce9: 20 00                      |           local.get 0
 007ceb: 41 08                      |           i32.const 8
 007ced: 6a                         |           i32.add
 007cee: 21 00                      |           local.set 0
 007cf0: 20 08                      |           local.get 8
 007cf2: 20 07                      |           local.get 7
 007cf4: 41 20                      |           i32.const 32
 007cf6: 6a                         |           i32.add
 007cf7: 22 07                      |           local.tee 7
 007cf9: 47                         |           i32.ne
 007cfa: 0d 00                      |           br_if 0
 007cfc: 0b                         |         end
 007cfd: 0b                         |       end
 007cfe: 20 04                      |       local.get 4
 007d00: 20 02                      |       local.get 2
 007d02: 28 02 04                   |       i32.load 2 4
 007d05: 4f                         |       i32.ge_u
 007d06: 0d 01                      |       br_if 1
 007d08: 20 03                      |       local.get 3
 007d0a: 28 02 28                   |       i32.load 2 40
 007d0d: 20 02                      |       local.get 2
 007d0f: 28 02 00                   |       i32.load 2 0
 007d12: 20 04                      |       local.get 4
 007d14: 41 03                      |       i32.const 3
 007d16: 74                         |       i32.shl
 007d17: 6a                         |       i32.add
 007d18: 22 01                      |       local.tee 1
 007d1a: 28 02 00                   |       i32.load 2 0
 007d1d: 20 01                      |       local.get 1
 007d1f: 28 02 04                   |       i32.load 2 4
 007d22: 20 03                      |       local.get 3
 007d24: 28 02 2c                   |       i32.load 2 44
 007d27: 28 02 0c                   |       i32.load 2 12
 007d2a: 11 83 80 80 80 00 80 80 80 |       call_indirect 0 (type 3)
 007d33: 80 00                      | 
 007d35: 45                         |       i32.eqz
 007d36: 0d 01                      |       br_if 1
 007d38: 0b                         |     end
 007d39: 41 01                      |     i32.const 1
 007d3b: 21 01                      |     local.set 1
 007d3d: 0c 01                      |     br 1
 007d3f: 0b                         |   end
 007d40: 41 00                      |   i32.const 0
 007d42: 21 01                      |   local.set 1
 007d44: 0b                         | end
 007d45: 20 03                      | local.get 3
 007d47: 41 30                      | i32.const 48
 007d49: 6a                         | i32.add
 007d4a: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007d50: 20 01                      | local.get 1
 007d52: 0b                         | end
007d55 func[131] <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17h04fb0286b416ca7bE>:
 007d56: 08 7f                      | local[3..10] type=i32
 007d58: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 007d5e: 41 10                      | i32.const 16
 007d60: 6b                         | i32.sub
 007d61: 22 03                      | local.tee 3
 007d63: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007d69: 41 0a                      | i32.const 10
 007d6b: 21 04                      | local.set 4
 007d6d: 20 00                      | local.get 0
 007d6f: 21 05                      | local.set 5
 007d71: 02 40                      | block
 007d73: 20 00                      |   local.get 0
 007d75: 41 e8 07                   |   i32.const 1000
 007d78: 49                         |   i32.lt_u
 007d79: 0d 00                      |   br_if 0
 007d7b: 41 0a                      |   i32.const 10
 007d7d: 21 04                      |   local.set 4
 007d7f: 20 00                      |   local.get 0
 007d81: 21 06                      |   local.set 6
 007d83: 03 40                      |   loop
 007d85: 20 03                      |     local.get 3
 007d87: 41 06                      |     i32.const 6
 007d89: 6a                         |     i32.add
 007d8a: 20 04                      |     local.get 4
 007d8c: 6a                         |     i32.add
 007d8d: 22 07                      |     local.tee 7
 007d8f: 41 7d                      |     i32.const 4294967293
 007d91: 6a                         |     i32.add
 007d92: 20 06                      |     local.get 6
 007d94: 20 06                      |     local.get 6
 007d96: 41 90 ce 00                |     i32.const 10000
 007d9a: 6e                         |     i32.div_u
 007d9b: 22 05                      |     local.tee 5
 007d9d: 41 90 ce 00                |     i32.const 10000
 007da1: 6c                         |     i32.mul
 007da2: 6b                         |     i32.sub
 007da3: 22 08                      |     local.tee 8
 007da5: 41 ff ff 03                |     i32.const 65535
 007da9: 71                         |     i32.and
 007daa: 41 e4 00                   |     i32.const 100
 007dad: 6e                         |     i32.div_u
 007dae: 22 09                      |     local.tee 9
 007db0: 41 01                      |     i32.const 1
 007db2: 74                         |     i32.shl
 007db3: 22 0a                      |     local.tee 10
 007db5: 41 ed 92 c0 80 00          |     i32.const 1050989
 007dbb: 6a                         |     i32.add
 007dbc: 2d 00 00                   |     i32.load8_u 0 0
 007dbf: 3a 00 00                   |     i32.store8 0 0
 007dc2: 20 07                      |     local.get 7
 007dc4: 41 7c                      |     i32.const 4294967292
 007dc6: 6a                         |     i32.add
 007dc7: 20 0a                      |     local.get 10
 007dc9: 41 ec 92 c0 80 00          |     i32.const 1050988
 007dcf: 6a                         |     i32.add
 007dd0: 2d 00 00                   |     i32.load8_u 0 0
 007dd3: 3a 00 00                   |     i32.store8 0 0
 007dd6: 20 07                      |     local.get 7
 007dd8: 41 7f                      |     i32.const 4294967295
 007dda: 6a                         |     i32.add
 007ddb: 20 08                      |     local.get 8
 007ddd: 20 09                      |     local.get 9
 007ddf: 41 e4 00                   |     i32.const 100
 007de2: 6c                         |     i32.mul
 007de3: 6b                         |     i32.sub
 007de4: 41 ff ff 03                |     i32.const 65535
 007de8: 71                         |     i32.and
 007de9: 41 01                      |     i32.const 1
 007deb: 74                         |     i32.shl
 007dec: 22 08                      |     local.tee 8
 007dee: 41 ed 92 c0 80 00          |     i32.const 1050989
 007df4: 6a                         |     i32.add
 007df5: 2d 00 00                   |     i32.load8_u 0 0
 007df8: 3a 00 00                   |     i32.store8 0 0
 007dfb: 20 07                      |     local.get 7
 007dfd: 41 7e                      |     i32.const 4294967294
 007dff: 6a                         |     i32.add
 007e00: 20 08                      |     local.get 8
 007e02: 41 ec 92 c0 80 00          |     i32.const 1050988
 007e08: 6a                         |     i32.add
 007e09: 2d 00 00                   |     i32.load8_u 0 0
 007e0c: 3a 00 00                   |     i32.store8 0 0
 007e0f: 20 04                      |     local.get 4
 007e11: 41 7c                      |     i32.const 4294967292
 007e13: 6a                         |     i32.add
 007e14: 21 04                      |     local.set 4
 007e16: 20 06                      |     local.get 6
 007e18: 41 ff ac e2 04             |     i32.const 9999999
 007e1d: 4b                         |     i32.gt_u
 007e1e: 21 07                      |     local.set 7
 007e20: 20 05                      |     local.get 5
 007e22: 21 06                      |     local.set 6
 007e24: 20 07                      |     local.get 7
 007e26: 0d 00                      |     br_if 0
 007e28: 0b                         |   end
 007e29: 0b                         | end
 007e2a: 02 40                      | block
 007e2c: 02 40                      |   block
 007e2e: 20 05                      |     local.get 5
 007e30: 41 09                      |     i32.const 9
 007e32: 4b                         |     i32.gt_u
 007e33: 0d 00                      |     br_if 0
 007e35: 20 05                      |     local.get 5
 007e37: 21 06                      |     local.set 6
 007e39: 0c 01                      |     br 1
 007e3b: 0b                         |   end
 007e3c: 20 03                      |   local.get 3
 007e3e: 41 06                      |   i32.const 6
 007e40: 6a                         |   i32.add
 007e41: 20 04                      |   local.get 4
 007e43: 6a                         |   i32.add
 007e44: 41 7f                      |   i32.const 4294967295
 007e46: 6a                         |   i32.add
 007e47: 20 05                      |   local.get 5
 007e49: 20 05                      |   local.get 5
 007e4b: 41 ff ff 03                |   i32.const 65535
 007e4f: 71                         |   i32.and
 007e50: 41 e4 00                   |   i32.const 100
 007e53: 6e                         |   i32.div_u
 007e54: 22 06                      |   local.tee 6
 007e56: 41 e4 00                   |   i32.const 100
 007e59: 6c                         |   i32.mul
 007e5a: 6b                         |   i32.sub
 007e5b: 41 ff ff 03                |   i32.const 65535
 007e5f: 71                         |   i32.and
 007e60: 41 01                      |   i32.const 1
 007e62: 74                         |   i32.shl
 007e63: 22 07                      |   local.tee 7
 007e65: 41 ed 92 c0 80 00          |   i32.const 1050989
 007e6b: 6a                         |   i32.add
 007e6c: 2d 00 00                   |   i32.load8_u 0 0
 007e6f: 3a 00 00                   |   i32.store8 0 0
 007e72: 20 03                      |   local.get 3
 007e74: 41 06                      |   i32.const 6
 007e76: 6a                         |   i32.add
 007e77: 20 04                      |   local.get 4
 007e79: 41 7e                      |   i32.const 4294967294
 007e7b: 6a                         |   i32.add
 007e7c: 22 04                      |   local.tee 4
 007e7e: 6a                         |   i32.add
 007e7f: 20 07                      |   local.get 7
 007e81: 41 ec 92 c0 80 00          |   i32.const 1050988
 007e87: 6a                         |   i32.add
 007e88: 2d 00 00                   |   i32.load8_u 0 0
 007e8b: 3a 00 00                   |   i32.store8 0 0
 007e8e: 0b                         | end
 007e8f: 02 40                      | block
 007e91: 02 40                      |   block
 007e93: 20 00                      |     local.get 0
 007e95: 45                         |     i32.eqz
 007e96: 0d 00                      |     br_if 0
 007e98: 20 06                      |     local.get 6
 007e9a: 45                         |     i32.eqz
 007e9b: 0d 01                      |     br_if 1
 007e9d: 0b                         |   end
 007e9e: 20 03                      |   local.get 3
 007ea0: 41 06                      |   i32.const 6
 007ea2: 6a                         |   i32.add
 007ea3: 20 04                      |   local.get 4
 007ea5: 41 7f                      |   i32.const 4294967295
 007ea7: 6a                         |   i32.add
 007ea8: 22 04                      |   local.tee 4
 007eaa: 6a                         |   i32.add
 007eab: 20 06                      |   local.get 6
 007ead: 41 01                      |   i32.const 1
 007eaf: 74                         |   i32.shl
 007eb0: 41 1e                      |   i32.const 30
 007eb2: 71                         |   i32.and
 007eb3: 41 ed 92 c0 80 00          |   i32.const 1050989
 007eb9: 6a                         |   i32.add
 007eba: 2d 00 00                   |   i32.load8_u 0 0
 007ebd: 3a 00 00                   |   i32.store8 0 0
 007ec0: 0b                         | end
 007ec1: 20 02                      | local.get 2
 007ec3: 20 01                      | local.get 1
 007ec5: 41 01                      | i32.const 1
 007ec7: 41 00                      | i32.const 0
 007ec9: 20 03                      | local.get 3
 007ecb: 41 06                      | i32.const 6
 007ecd: 6a                         | i32.add
 007ece: 20 04                      | local.get 4
 007ed0: 6a                         | i32.add
 007ed1: 41 0a                      | i32.const 10
 007ed3: 20 04                      | local.get 4
 007ed5: 6b                         | i32.sub
 007ed6: 10 84 81 80 80 00          | call 132 <_ZN4core3fmt9Formatter12pad_integral17hf2029a31bf0e4d0eE>
 007edc: 21 06                      | local.set 6
 007ede: 20 03                      | local.get 3
 007ee0: 41 10                      | i32.const 16
 007ee2: 6a                         | i32.add
 007ee3: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 007ee9: 20 06                      | local.get 6
 007eeb: 0b                         | end
007eee func[132] <_ZN4core3fmt9Formatter12pad_integral17hf2029a31bf0e4d0eE>:
 007eef: 07 7f                      | local[6..12] type=i32
 007ef1: 02 40                      | block
 007ef3: 02 40                      |   block
 007ef5: 20 01                      |     local.get 1
 007ef7: 0d 00                      |     br_if 0
 007ef9: 20 05                      |     local.get 5
 007efb: 41 01                      |     i32.const 1
 007efd: 6a                         |     i32.add
 007efe: 21 06                      |     local.set 6
 007f00: 20 00                      |     local.get 0
 007f02: 28 02 14                   |     i32.load 2 20
 007f05: 21 07                      |     local.set 7
 007f07: 41 2d                      |     i32.const 45
 007f09: 21 08                      |     local.set 8
 007f0b: 0c 01                      |     br 1
 007f0d: 0b                         |   end
 007f0e: 41 2b                      |   i32.const 43
 007f10: 41 80 80 c4 00             |   i32.const 1114112
 007f15: 20 00                      |   local.get 0
 007f17: 28 02 14                   |   i32.load 2 20
 007f1a: 22 07                      |   local.tee 7
 007f1c: 41 01                      |   i32.const 1
 007f1e: 71                         |   i32.and
 007f1f: 22 01                      |   local.tee 1
 007f21: 1b                         |   select
 007f22: 21 08                      |   local.set 8
 007f24: 20 01                      |   local.get 1
 007f26: 20 05                      |   local.get 5
 007f28: 6a                         |   i32.add
 007f29: 21 06                      |   local.set 6
 007f2b: 0b                         | end
 007f2c: 02 40                      | block
 007f2e: 02 40                      |   block
 007f30: 20 07                      |     local.get 7
 007f32: 41 04                      |     i32.const 4
 007f34: 71                         |     i32.and
 007f35: 0d 00                      |     br_if 0
 007f37: 41 00                      |     i32.const 0
 007f39: 21 02                      |     local.set 2
 007f3b: 0c 01                      |     br 1
 007f3d: 0b                         |   end
 007f3e: 02 40                      |   block
 007f40: 20 03                      |     local.get 3
 007f42: 41 10                      |     i32.const 16
 007f44: 49                         |     i32.lt_u
 007f45: 0d 00                      |     br_if 0
 007f47: 20 02                      |     local.get 2
 007f49: 20 03                      |     local.get 3
 007f4b: 10 8c 81 80 80 00          |     call 140 <_ZN4core3str5count14do_count_chars17h38be9ed0b8048c10E>
 007f51: 20 06                      |     local.get 6
 007f53: 6a                         |     i32.add
 007f54: 21 06                      |     local.set 6
 007f56: 0c 01                      |     br 1
 007f58: 0b                         |   end
 007f59: 02 40                      |   block
 007f5b: 20 03                      |     local.get 3
 007f5d: 0d 00                      |     br_if 0
 007f5f: 41 00                      |     i32.const 0
 007f61: 20 06                      |     local.get 6
 007f63: 6a                         |     i32.add
 007f64: 21 06                      |     local.set 6
 007f66: 0c 01                      |     br 1
 007f68: 0b                         |   end
 007f69: 20 03                      |   local.get 3
 007f6b: 41 03                      |   i32.const 3
 007f6d: 71                         |   i32.and
 007f6e: 21 09                      |   local.set 9
 007f70: 02 40                      |   block
 007f72: 02 40                      |     block
 007f74: 20 03                      |       local.get 3
 007f76: 41 04                      |       i32.const 4
 007f78: 4f                         |       i32.ge_u
 007f79: 0d 00                      |       br_if 0
 007f7b: 41 00                      |       i32.const 0
 007f7d: 21 01                      |       local.set 1
 007f7f: 41 00                      |       i32.const 0
 007f81: 21 0a                      |       local.set 10
 007f83: 0c 01                      |       br 1
 007f85: 0b                         |     end
 007f86: 20 03                      |     local.get 3
 007f88: 41 0c                      |     i32.const 12
 007f8a: 71                         |     i32.and
 007f8b: 21 0b                      |     local.set 11
 007f8d: 41 00                      |     i32.const 0
 007f8f: 21 01                      |     local.set 1
 007f91: 41 00                      |     i32.const 0
 007f93: 21 0a                      |     local.set 10
 007f95: 03 40                      |     loop
 007f97: 20 01                      |       local.get 1
 007f99: 20 02                      |       local.get 2
 007f9b: 20 0a                      |       local.get 10
 007f9d: 6a                         |       i32.add
 007f9e: 22 0c                      |       local.tee 12
 007fa0: 2c 00 00                   |       i32.load8_s 0 0
 007fa3: 41 bf 7f                   |       i32.const 4294967231
 007fa6: 4a                         |       i32.gt_s
 007fa7: 6a                         |       i32.add
 007fa8: 20 0c                      |       local.get 12
 007faa: 41 01                      |       i32.const 1
 007fac: 6a                         |       i32.add
 007fad: 2c 00 00                   |       i32.load8_s 0 0
 007fb0: 41 bf 7f                   |       i32.const 4294967231
 007fb3: 4a                         |       i32.gt_s
 007fb4: 6a                         |       i32.add
 007fb5: 20 0c                      |       local.get 12
 007fb7: 41 02                      |       i32.const 2
 007fb9: 6a                         |       i32.add
 007fba: 2c 00 00                   |       i32.load8_s 0 0
 007fbd: 41 bf 7f                   |       i32.const 4294967231
 007fc0: 4a                         |       i32.gt_s
 007fc1: 6a                         |       i32.add
 007fc2: 20 0c                      |       local.get 12
 007fc4: 41 03                      |       i32.const 3
 007fc6: 6a                         |       i32.add
 007fc7: 2c 00 00                   |       i32.load8_s 0 0
 007fca: 41 bf 7f                   |       i32.const 4294967231
 007fcd: 4a                         |       i32.gt_s
 007fce: 6a                         |       i32.add
 007fcf: 21 01                      |       local.set 1
 007fd1: 20 0b                      |       local.get 11
 007fd3: 20 0a                      |       local.get 10
 007fd5: 41 04                      |       i32.const 4
 007fd7: 6a                         |       i32.add
 007fd8: 22 0a                      |       local.tee 10
 007fda: 47                         |       i32.ne
 007fdb: 0d 00                      |       br_if 0
 007fdd: 0b                         |     end
 007fde: 0b                         |   end
 007fdf: 02 40                      |   block
 007fe1: 20 09                      |     local.get 9
 007fe3: 45                         |     i32.eqz
 007fe4: 0d 00                      |     br_if 0
 007fe6: 20 02                      |     local.get 2
 007fe8: 20 0a                      |     local.get 10
 007fea: 6a                         |     i32.add
 007feb: 21 0c                      |     local.set 12
 007fed: 03 40                      |     loop
 007fef: 20 01                      |       local.get 1
 007ff1: 20 0c                      |       local.get 12
 007ff3: 2c 00 00                   |       i32.load8_s 0 0
 007ff6: 41 bf 7f                   |       i32.const 4294967231
 007ff9: 4a                         |       i32.gt_s
 007ffa: 6a                         |       i32.add
 007ffb: 21 01                      |       local.set 1
 007ffd: 20 0c                      |       local.get 12
 007fff: 41 01                      |       i32.const 1
 008001: 6a                         |       i32.add
 008002: 21 0c                      |       local.set 12
 008004: 20 09                      |       local.get 9
 008006: 41 7f                      |       i32.const 4294967295
 008008: 6a                         |       i32.add
 008009: 22 09                      |       local.tee 9
 00800b: 0d 00                      |       br_if 0
 00800d: 0b                         |     end
 00800e: 0b                         |   end
 00800f: 20 01                      |   local.get 1
 008011: 20 06                      |   local.get 6
 008013: 6a                         |   i32.add
 008014: 21 06                      |   local.set 6
 008016: 0b                         | end
 008017: 02 40                      | block
 008019: 20 00                      |   local.get 0
 00801b: 28 02 00                   |   i32.load 2 0
 00801e: 0d 00                      |   br_if 0
 008020: 02 40                      |   block
 008022: 20 00                      |     local.get 0
 008024: 28 02 1c                   |     i32.load 2 28
 008027: 22 01                      |     local.tee 1
 008029: 20 00                      |     local.get 0
 00802b: 28 02 20                   |     i32.load 2 32
 00802e: 22 0c                      |     local.tee 12
 008030: 20 08                      |     local.get 8
 008032: 20 02                      |     local.get 2
 008034: 20 03                      |     local.get 3
 008036: 10 8d 81 80 80 00          |     call 141 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc470ff4c8c303e15E>
 00803c: 45                         |     i32.eqz
 00803d: 0d 00                      |     br_if 0
 00803f: 41 01                      |     i32.const 1
 008041: 0f                         |     return
 008042: 0b                         |   end
 008043: 20 01                      |   local.get 1
 008045: 20 04                      |   local.get 4
 008047: 20 05                      |   local.get 5
 008049: 20 0c                      |   local.get 12
 00804b: 28 02 0c                   |   i32.load 2 12
 00804e: 11 83 80 80 80 00 80 80 80 |   call_indirect 0 (type 3)
 008057: 80 00                      | 
 008059: 0f                         |   return
 00805a: 0b                         | end
 00805b: 02 40                      | block
 00805d: 02 40                      |   block
 00805f: 02 40                      |     block
 008061: 02 40                      |       block
 008063: 20 00                      |         local.get 0
 008065: 28 02 04                   |         i32.load 2 4
 008068: 22 01                      |         local.tee 1
 00806a: 20 06                      |         local.get 6
 00806c: 4b                         |         i32.gt_u
 00806d: 0d 00                      |         br_if 0
 00806f: 20 00                      |         local.get 0
 008071: 28 02 1c                   |         i32.load 2 28
 008074: 22 01                      |         local.tee 1
 008076: 20 00                      |         local.get 0
 008078: 28 02 20                   |         i32.load 2 32
 00807b: 22 0c                      |         local.tee 12
 00807d: 20 08                      |         local.get 8
 00807f: 20 02                      |         local.get 2
 008081: 20 03                      |         local.get 3
 008083: 10 8d 81 80 80 00          |         call 141 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc470ff4c8c303e15E>
 008089: 45                         |         i32.eqz
 00808a: 0d 01                      |         br_if 1
 00808c: 41 01                      |         i32.const 1
 00808e: 0f                         |         return
 00808f: 0b                         |       end
 008090: 20 07                      |       local.get 7
 008092: 41 08                      |       i32.const 8
 008094: 71                         |       i32.and
 008095: 45                         |       i32.eqz
 008096: 0d 01                      |       br_if 1
 008098: 20 00                      |       local.get 0
 00809a: 28 02 10                   |       i32.load 2 16
 00809d: 21 09                      |       local.set 9
 00809f: 20 00                      |       local.get 0
 0080a1: 41 30                      |       i32.const 48
 0080a3: 36 02 10                   |       i32.store 2 16
 0080a6: 20 00                      |       local.get 0
 0080a8: 2d 00 18                   |       i32.load8_u 0 24
 0080ab: 21 07                      |       local.set 7
 0080ad: 41 01                      |       i32.const 1
 0080af: 21 0b                      |       local.set 11
 0080b1: 20 00                      |       local.get 0
 0080b3: 41 01                      |       i32.const 1
 0080b5: 3a 00 18                   |       i32.store8 0 24
 0080b8: 20 00                      |       local.get 0
 0080ba: 28 02 1c                   |       i32.load 2 28
 0080bd: 22 0c                      |       local.tee 12
 0080bf: 20 00                      |       local.get 0
 0080c1: 28 02 20                   |       i32.load 2 32
 0080c4: 22 0a                      |       local.tee 10
 0080c6: 20 08                      |       local.get 8
 0080c8: 20 02                      |       local.get 2
 0080ca: 20 03                      |       local.get 3
 0080cc: 10 8d 81 80 80 00          |       call 141 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc470ff4c8c303e15E>
 0080d2: 0d 02                      |       br_if 2
 0080d4: 20 01                      |       local.get 1
 0080d6: 20 06                      |       local.get 6
 0080d8: 6b                         |       i32.sub
 0080d9: 41 01                      |       i32.const 1
 0080db: 6a                         |       i32.add
 0080dc: 21 01                      |       local.set 1
 0080de: 02 40                      |       block
 0080e0: 03 40                      |         loop
 0080e2: 20 01                      |           local.get 1
 0080e4: 41 7f                      |           i32.const 4294967295
 0080e6: 6a                         |           i32.add
 0080e7: 22 01                      |           local.tee 1
 0080e9: 45                         |           i32.eqz
 0080ea: 0d 01                      |           br_if 1
 0080ec: 20 0c                      |           local.get 12
 0080ee: 41 30                      |           i32.const 48
 0080f0: 20 0a                      |           local.get 10
 0080f2: 28 02 10                   |           i32.load 2 16
 0080f5: 11 81 80 80 80 00 80 80 80 |           call_indirect 0 (type 1)
 0080fe: 80 00                      | 
 008100: 45                         |           i32.eqz
 008101: 0d 00                      |           br_if 0
 008103: 0b                         |         end
 008104: 41 01                      |         i32.const 1
 008106: 0f                         |         return
 008107: 0b                         |       end
 008108: 02 40                      |       block
 00810a: 20 0c                      |         local.get 12
 00810c: 20 04                      |         local.get 4
 00810e: 20 05                      |         local.get 5
 008110: 20 0a                      |         local.get 10
 008112: 28 02 0c                   |         i32.load 2 12
 008115: 11 83 80 80 80 00 80 80 80 |         call_indirect 0 (type 3)
 00811e: 80 00                      | 
 008120: 45                         |         i32.eqz
 008121: 0d 00                      |         br_if 0
 008123: 41 01                      |         i32.const 1
 008125: 0f                         |         return
 008126: 0b                         |       end
 008127: 20 00                      |       local.get 0
 008129: 20 07                      |       local.get 7
 00812b: 3a 00 18                   |       i32.store8 0 24
 00812e: 20 00                      |       local.get 0
 008130: 20 09                      |       local.get 9
 008132: 36 02 10                   |       i32.store 2 16
 008135: 41 00                      |       i32.const 0
 008137: 0f                         |       return
 008138: 0b                         |     end
 008139: 20 01                      |     local.get 1
 00813b: 20 04                      |     local.get 4
 00813d: 20 05                      |     local.get 5
 00813f: 20 0c                      |     local.get 12
 008141: 28 02 0c                   |     i32.load 2 12
 008144: 11 83 80 80 80 00 80 80 80 |     call_indirect 0 (type 3)
 00814d: 80 00                      | 
 00814f: 21 0b                      |     local.set 11
 008151: 0c 01                      |     br 1
 008153: 0b                         |   end
 008154: 20 01                      |   local.get 1
 008156: 20 06                      |   local.get 6
 008158: 6b                         |   i32.sub
 008159: 21 06                      |   local.set 6
 00815b: 02 40                      |   block
 00815d: 02 40                      |     block
 00815f: 02 40                      |       block
 008161: 41 01                      |         i32.const 1
 008163: 20 00                      |         local.get 0
 008165: 2d 00 18                   |         i32.load8_u 0 24
 008168: 22 01                      |         local.tee 1
 00816a: 20 01                      |         local.get 1
 00816c: 41 03                      |         i32.const 3
 00816e: 46                         |         i32.eq
 00816f: 1b                         |         select
 008170: 22 01                      |         local.tee 1
 008172: 0e 03 02 00 01 02          |         br_table 2 0 1 2
 008178: 0b                         |       end
 008179: 20 06                      |       local.get 6
 00817b: 21 01                      |       local.set 1
 00817d: 41 00                      |       i32.const 0
 00817f: 21 06                      |       local.set 6
 008181: 0c 01                      |       br 1
 008183: 0b                         |     end
 008184: 20 06                      |     local.get 6
 008186: 41 01                      |     i32.const 1
 008188: 76                         |     i32.shr_u
 008189: 21 01                      |     local.set 1
 00818b: 20 06                      |     local.get 6
 00818d: 41 01                      |     i32.const 1
 00818f: 6a                         |     i32.add
 008190: 41 01                      |     i32.const 1
 008192: 76                         |     i32.shr_u
 008193: 21 06                      |     local.set 6
 008195: 0b                         |   end
 008196: 20 01                      |   local.get 1
 008198: 41 01                      |   i32.const 1
 00819a: 6a                         |   i32.add
 00819b: 21 01                      |   local.set 1
 00819d: 20 00                      |   local.get 0
 00819f: 28 02 10                   |   i32.load 2 16
 0081a2: 21 09                      |   local.set 9
 0081a4: 20 00                      |   local.get 0
 0081a6: 28 02 20                   |   i32.load 2 32
 0081a9: 21 0c                      |   local.set 12
 0081ab: 20 00                      |   local.get 0
 0081ad: 28 02 1c                   |   i32.load 2 28
 0081b0: 21 0a                      |   local.set 10
 0081b2: 02 40                      |   block
 0081b4: 03 40                      |     loop
 0081b6: 20 01                      |       local.get 1
 0081b8: 41 7f                      |       i32.const 4294967295
 0081ba: 6a                         |       i32.add
 0081bb: 22 01                      |       local.tee 1
 0081bd: 45                         |       i32.eqz
 0081be: 0d 01                      |       br_if 1
 0081c0: 20 0a                      |       local.get 10
 0081c2: 20 09                      |       local.get 9
 0081c4: 20 0c                      |       local.get 12
 0081c6: 28 02 10                   |       i32.load 2 16
 0081c9: 11 81 80 80 80 00 80 80 80 |       call_indirect 0 (type 1)
 0081d2: 80 00                      | 
 0081d4: 45                         |       i32.eqz
 0081d5: 0d 00                      |       br_if 0
 0081d7: 0b                         |     end
 0081d8: 41 01                      |     i32.const 1
 0081da: 0f                         |     return
 0081db: 0b                         |   end
 0081dc: 41 01                      |   i32.const 1
 0081de: 21 0b                      |   local.set 11
 0081e0: 20 0a                      |   local.get 10
 0081e2: 20 0c                      |   local.get 12
 0081e4: 20 08                      |   local.get 8
 0081e6: 20 02                      |   local.get 2
 0081e8: 20 03                      |   local.get 3
 0081ea: 10 8d 81 80 80 00          |   call 141 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc470ff4c8c303e15E>
 0081f0: 0d 00                      |   br_if 0
 0081f2: 20 0a                      |   local.get 10
 0081f4: 20 04                      |   local.get 4
 0081f6: 20 05                      |   local.get 5
 0081f8: 20 0c                      |   local.get 12
 0081fa: 28 02 0c                   |   i32.load 2 12
 0081fd: 11 83 80 80 80 00 80 80 80 |   call_indirect 0 (type 3)
 008206: 80 00                      | 
 008208: 0d 00                      |   br_if 0
 00820a: 41 00                      |   i32.const 0
 00820c: 21 01                      |   local.set 1
 00820e: 03 40                      |   loop
 008210: 02 40                      |     block
 008212: 20 06                      |       local.get 6
 008214: 20 01                      |       local.get 1
 008216: 47                         |       i32.ne
 008217: 0d 00                      |       br_if 0
 008219: 20 06                      |       local.get 6
 00821b: 20 06                      |       local.get 6
 00821d: 49                         |       i32.lt_u
 00821e: 0f                         |       return
 00821f: 0b                         |     end
 008220: 20 01                      |     local.get 1
 008222: 41 01                      |     i32.const 1
 008224: 6a                         |     i32.add
 008225: 21 01                      |     local.set 1
 008227: 20 0a                      |     local.get 10
 008229: 20 09                      |     local.get 9
 00822b: 20 0c                      |     local.get 12
 00822d: 28 02 10                   |     i32.load 2 16
 008230: 11 81 80 80 80 00 80 80 80 |     call_indirect 0 (type 1)
 008239: 80 00                      | 
 00823b: 45                         |     i32.eqz
 00823c: 0d 00                      |     br_if 0
 00823e: 0b                         |   end
 00823f: 20 01                      |   local.get 1
 008241: 41 7f                      |   i32.const 4294967295
 008243: 6a                         |   i32.add
 008244: 20 06                      |   local.get 6
 008246: 49                         |   i32.lt_u
 008247: 0f                         |   return
 008248: 0b                         | end
 008249: 20 0b                      | local.get 11
 00824b: 0b                         | end
00824e func[133] <_ZN4core3ffi5c_str4CStr19from_bytes_with_nul17h64494a15f58030c4E>:
 00824f: 04 7f                      | local[3..6] type=i32
 008251: 02 40                      | block
 008253: 02 40                      |   block
 008255: 02 40                      |     block
 008257: 02 40                      |       block
 008259: 02 40                      |         block
 00825b: 20 02                      |           local.get 2
 00825d: 41 07                      |           i32.const 7
 00825f: 4b                         |           i32.gt_u
 008260: 0d 00                      |           br_if 0
 008262: 20 02                      |           local.get 2
 008264: 45                         |           i32.eqz
 008265: 0d 03                      |           br_if 3
 008267: 20 01                      |           local.get 1
 008269: 2d 00 00                   |           i32.load8_u 0 0
 00826c: 0d 01                      |           br_if 1
 00826e: 41 00                      |           i32.const 0
 008270: 21 03                      |           local.set 3
 008272: 0c 04                      |           br 4
 008274: 0b                         |         end
 008275: 02 40                      |         block
 008277: 02 40                      |           block
 008279: 20 01                      |             local.get 1
 00827b: 41 03                      |             i32.const 3
 00827d: 6a                         |             i32.add
 00827e: 41 7c                      |             i32.const 4294967292
 008280: 71                         |             i32.and
 008281: 20 01                      |             local.get 1
 008283: 6b                         |             i32.sub
 008284: 22 04                      |             local.tee 4
 008286: 45                         |             i32.eqz
 008287: 0d 00                      |             br_if 0
 008289: 41 00                      |             i32.const 0
 00828b: 21 03                      |             local.set 3
 00828d: 03 40                      |             loop
 00828f: 20 01                      |               local.get 1
 008291: 20 03                      |               local.get 3
 008293: 6a                         |               i32.add
 008294: 2d 00 00                   |               i32.load8_u 0 0
 008297: 45                         |               i32.eqz
 008298: 0d 06                      |               br_if 6
 00829a: 20 04                      |               local.get 4
 00829c: 20 03                      |               local.get 3
 00829e: 41 01                      |               i32.const 1
 0082a0: 6a                         |               i32.add
 0082a1: 22 03                      |               local.tee 3
 0082a3: 47                         |               i32.ne
 0082a4: 0d 00                      |               br_if 0
 0082a6: 0b                         |             end
 0082a7: 20 04                      |             local.get 4
 0082a9: 20 02                      |             local.get 2
 0082ab: 41 78                      |             i32.const 4294967288
 0082ad: 6a                         |             i32.add
 0082ae: 22 05                      |             local.tee 5
 0082b0: 4d                         |             i32.le_u
 0082b1: 0d 01                      |             br_if 1
 0082b3: 0c 03                      |             br 3
 0082b5: 0b                         |           end
 0082b6: 20 02                      |           local.get 2
 0082b8: 41 78                      |           i32.const 4294967288
 0082ba: 6a                         |           i32.add
 0082bb: 21 05                      |           local.set 5
 0082bd: 0b                         |         end
 0082be: 03 40                      |         loop
 0082c0: 41 80 82 84 08             |           i32.const 16843008
 0082c5: 20 01                      |           local.get 1
 0082c7: 20 04                      |           local.get 4
 0082c9: 6a                         |           i32.add
 0082ca: 22 03                      |           local.tee 3
 0082cc: 28 02 00                   |           i32.load 2 0
 0082cf: 22 06                      |           local.tee 6
 0082d1: 6b                         |           i32.sub
 0082d2: 20 06                      |           local.get 6
 0082d4: 72                         |           i32.or
 0082d5: 41 80 82 84 08             |           i32.const 16843008
 0082da: 20 03                      |           local.get 3
 0082dc: 41 04                      |           i32.const 4
 0082de: 6a                         |           i32.add
 0082df: 28 02 00                   |           i32.load 2 0
 0082e2: 22 03                      |           local.tee 3
 0082e4: 6b                         |           i32.sub
 0082e5: 20 03                      |           local.get 3
 0082e7: 72                         |           i32.or
 0082e8: 71                         |           i32.and
 0082e9: 41 80 81 82 84 78          |           i32.const 2155905152
 0082ef: 71                         |           i32.and
 0082f0: 41 80 81 82 84 78          |           i32.const 2155905152
 0082f6: 47                         |           i32.ne
 0082f7: 0d 02                      |           br_if 2
 0082f9: 20 04                      |           local.get 4
 0082fb: 41 08                      |           i32.const 8
 0082fd: 6a                         |           i32.add
 0082fe: 22 04                      |           local.tee 4
 008300: 20 05                      |           local.get 5
 008302: 4d                         |           i32.le_u
 008303: 0d 00                      |           br_if 0
 008305: 0c 02                      |           br 2
 008307: 0b                         |         end
 008308: 0b                         |       end
 008309: 41 01                      |       i32.const 1
 00830b: 21 03                      |       local.set 3
 00830d: 20 02                      |       local.get 2
 00830f: 41 01                      |       i32.const 1
 008311: 46                         |       i32.eq
 008312: 0d 01                      |       br_if 1
 008314: 20 01                      |       local.get 1
 008316: 2d 00 01                   |       i32.load8_u 0 1
 008319: 45                         |       i32.eqz
 00831a: 0d 02                      |       br_if 2
 00831c: 41 02                      |       i32.const 2
 00831e: 21 03                      |       local.set 3
 008320: 20 02                      |       local.get 2
 008322: 41 02                      |       i32.const 2
 008324: 46                         |       i32.eq
 008325: 0d 01                      |       br_if 1
 008327: 20 01                      |       local.get 1
 008329: 2d 00 02                   |       i32.load8_u 0 2
 00832c: 45                         |       i32.eqz
 00832d: 0d 02                      |       br_if 2
 00832f: 41 03                      |       i32.const 3
 008331: 21 03                      |       local.set 3
 008333: 20 02                      |       local.get 2
 008335: 41 03                      |       i32.const 3
 008337: 46                         |       i32.eq
 008338: 0d 01                      |       br_if 1
 00833a: 20 01                      |       local.get 1
 00833c: 2d 00 03                   |       i32.load8_u 0 3
 00833f: 45                         |       i32.eqz
 008340: 0d 02                      |       br_if 2
 008342: 41 04                      |       i32.const 4
 008344: 21 03                      |       local.set 3
 008346: 20 02                      |       local.get 2
 008348: 41 04                      |       i32.const 4
 00834a: 46                         |       i32.eq
 00834b: 0d 01                      |       br_if 1
 00834d: 20 01                      |       local.get 1
 00834f: 2d 00 04                   |       i32.load8_u 0 4
 008352: 45                         |       i32.eqz
 008353: 0d 02                      |       br_if 2
 008355: 41 05                      |       i32.const 5
 008357: 21 03                      |       local.set 3
 008359: 20 02                      |       local.get 2
 00835b: 41 05                      |       i32.const 5
 00835d: 46                         |       i32.eq
 00835e: 0d 01                      |       br_if 1
 008360: 20 01                      |       local.get 1
 008362: 2d 00 05                   |       i32.load8_u 0 5
 008365: 45                         |       i32.eqz
 008366: 0d 02                      |       br_if 2
 008368: 41 06                      |       i32.const 6
 00836a: 21 03                      |       local.set 3
 00836c: 20 02                      |       local.get 2
 00836e: 41 06                      |       i32.const 6
 008370: 46                         |       i32.eq
 008371: 0d 01                      |       br_if 1
 008373: 20 01                      |       local.get 1
 008375: 2d 00 06                   |       i32.load8_u 0 6
 008378: 45                         |       i32.eqz
 008379: 0d 02                      |       br_if 2
 00837b: 0c 01                      |       br 1
 00837d: 0b                         |     end
 00837e: 20 04                      |     local.get 4
 008380: 20 02                      |     local.get 2
 008382: 46                         |     i32.eq
 008383: 0d 00                      |     br_if 0
 008385: 03 40                      |     loop
 008387: 02 40                      |       block
 008389: 20 01                      |         local.get 1
 00838b: 20 04                      |         local.get 4
 00838d: 6a                         |         i32.add
 00838e: 2d 00 00                   |         i32.load8_u 0 0
 008391: 0d 00                      |         br_if 0
 008393: 20 04                      |         local.get 4
 008395: 21 03                      |         local.set 3
 008397: 0c 03                      |         br 3
 008399: 0b                         |       end
 00839a: 20 02                      |       local.get 2
 00839c: 20 04                      |       local.get 4
 00839e: 41 01                      |       i32.const 1
 0083a0: 6a                         |       i32.add
 0083a1: 22 04                      |       local.tee 4
 0083a3: 47                         |       i32.ne
 0083a4: 0d 00                      |       br_if 0
 0083a6: 0b                         |     end
 0083a7: 0b                         |   end
 0083a8: 20 00                      |   local.get 0
 0083aa: 41 01                      |   i32.const 1
 0083ac: 36 02 04                   |   i32.store 2 4
 0083af: 20 00                      |   local.get 0
 0083b1: 41 01                      |   i32.const 1
 0083b3: 36 02 00                   |   i32.store 2 0
 0083b6: 0f                         |   return
 0083b7: 0b                         | end
 0083b8: 02 40                      | block
 0083ba: 20 03                      |   local.get 3
 0083bc: 41 01                      |   i32.const 1
 0083be: 6a                         |   i32.add
 0083bf: 20 02                      |   local.get 2
 0083c1: 46                         |   i32.eq
 0083c2: 0d 00                      |   br_if 0
 0083c4: 20 00                      |   local.get 0
 0083c6: 20 03                      |   local.get 3
 0083c8: 36 02 08                   |   i32.store 2 8
 0083cb: 20 00                      |   local.get 0
 0083cd: 41 00                      |   i32.const 0
 0083cf: 36 02 04                   |   i32.store 2 4
 0083d2: 20 00                      |   local.get 0
 0083d4: 41 01                      |   i32.const 1
 0083d6: 36 02 00                   |   i32.store 2 0
 0083d9: 0f                         |   return
 0083da: 0b                         | end
 0083db: 20 00                      | local.get 0
 0083dd: 20 02                      | local.get 2
 0083df: 36 02 08                   | i32.store 2 8
 0083e2: 20 00                      | local.get 0
 0083e4: 20 01                      | local.get 1
 0083e6: 36 02 04                   | i32.store 2 4
 0083e9: 20 00                      | local.get 0
 0083eb: 41 00                      | i32.const 0
 0083ed: 36 02 00                   | i32.store 2 0
 0083f0: 0b                         | end
0083f2 func[134] <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha8ed8789b6afaeccE>:
 0083f3: 20 00                      | local.get 0
 0083f5: 28 02 00                   | i32.load 2 0
 0083f8: 41 01                      | i32.const 1
 0083fa: 20 01                      | local.get 1
 0083fc: 10 83 81 80 80 00          | call 131 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17h04fb0286b416ca7bE>
 008402: 0b                         | end
008404 func[135] <_ZN4core6option13unwrap_failed17h17d660f18fd2c19eE>:
 008405: 41 b0 91 c0 80 00          | i32.const 1050800
 00840b: 41 2b                      | i32.const 43
 00840d: 20 00                      | local.get 0
 00840f: 10 80 81 80 80 00          | call 128 <_ZN4core9panicking5panic17hc73239fa121fb30eE>
 008415: 00                         | unreachable
 008416: 0b                         | end
008418 func[136] <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h1cce0a67f90b54bdE>:
 008419: 20 01                      | local.get 1
 00841b: 20 00                      | local.get 0
 00841d: 28 02 00                   | i32.load 2 0
 008420: 20 00                      | local.get 0
 008422: 28 02 04                   | i32.load 2 4
 008425: 10 ff 80 80 80 00          | call 127 <_ZN4core3fmt9Formatter3pad17h64f752386689f2e2E>
 00842b: 0b                         | end
00842e func[137] <_ZN4core9panicking19assert_failed_inner17h2ae9db04c28d43e1E>:
 00842f: 01 7f                      | local[7] type=i32
 008431: 01 7e                      | local[8] type=i64
 008433: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 008439: 41 f0 00                   | i32.const 112
 00843c: 6b                         | i32.sub
 00843d: 22 07                      | local.tee 7
 00843f: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 008445: 20 07                      | local.get 7
 008447: 20 02                      | local.get 2
 008449: 36 02 0c                   | i32.store 2 12
 00844c: 20 07                      | local.get 7
 00844e: 20 01                      | local.get 1
 008450: 36 02 08                   | i32.store 2 8
 008453: 20 07                      | local.get 7
 008455: 20 04                      | local.get 4
 008457: 36 02 14                   | i32.store 2 20
 00845a: 20 07                      | local.get 7
 00845c: 20 03                      | local.get 3
 00845e: 36 02 10                   | i32.store 2 16
 008461: 02 40                      | block
 008463: 02 40                      |   block
 008465: 02 40                      |     block
 008467: 02 40                      |       block
 008469: 20 00                      |         local.get 0
 00846b: 41 ff 01                   |         i32.const 255
 00846e: 71                         |         i32.and
 00846f: 0e 03 00 01 02 00          |         br_table 0 1 2 0
 008475: 0b                         |       end
 008476: 20 07                      |       local.get 7
 008478: 41 db 91 c0 80 00          |       i32.const 1050843
 00847e: 36 02 18                   |       i32.store 2 24
 008481: 41 02                      |       i32.const 2
 008483: 21 02                      |       local.set 2
 008485: 0c 02                      |       br 2
 008487: 0b                         |     end
 008488: 20 07                      |     local.get 7
 00848a: 41 dd 91 c0 80 00          |     i32.const 1050845
 008490: 36 02 18                   |     i32.store 2 24
 008493: 41 02                      |     i32.const 2
 008495: 21 02                      |     local.set 2
 008497: 0c 01                      |     br 1
 008499: 0b                         |   end
 00849a: 20 07                      |   local.get 7
 00849c: 41 df 91 c0 80 00          |   i32.const 1050847
 0084a2: 36 02 18                   |   i32.store 2 24
 0084a5: 41 07                      |   i32.const 7
 0084a7: 21 02                      |   local.set 2
 0084a9: 0b                         | end
 0084aa: 20 07                      | local.get 7
 0084ac: 20 02                      | local.get 2
 0084ae: 36 02 1c                   | i32.store 2 28
 0084b1: 02 40                      | block
 0084b3: 20 05                      |   local.get 5
 0084b5: 28 02 00                   |   i32.load 2 0
 0084b8: 0d 00                      |   br_if 0
 0084ba: 20 07                      |   local.get 7
 0084bc: 41 03                      |   i32.const 3
 0084be: 36 02 5c                   |   i32.store 2 92
 0084c1: 20 07                      |   local.get 7
 0084c3: 41 98 92 c0 80 00          |   i32.const 1050904
 0084c9: 36 02 58                   |   i32.store 2 88
 0084cc: 20 07                      |   local.get 7
 0084ce: 42 03                      |   i64.const 3
 0084d0: 37 02 64                   |   i64.store 2 100
 0084d3: 20 07                      |   local.get 7
 0084d5: 41 b0 80 80 80 00          |   i32.const 48
 0084db: ad                         |   i64.extend_i32_u
 0084dc: 42 20                      |   i64.const 32
 0084de: 86                         |   i64.shl
 0084df: 22 08                      |   local.tee 8
 0084e1: 20 07                      |   local.get 7
 0084e3: 41 10                      |   i32.const 16
 0084e5: 6a                         |   i32.add
 0084e6: ad                         |   i64.extend_i32_u
 0084e7: 84                         |   i64.or
 0084e8: 37 03 48                   |   i64.store 3 72
 0084eb: 20 07                      |   local.get 7
 0084ed: 20 08                      |   local.get 8
 0084ef: 20 07                      |   local.get 7
 0084f1: 41 08                      |   i32.const 8
 0084f3: 6a                         |   i32.add
 0084f4: ad                         |   i64.extend_i32_u
 0084f5: 84                         |   i64.or
 0084f6: 37 03 40                   |   i64.store 3 64
 0084f9: 20 07                      |   local.get 7
 0084fb: 41 b1 80 80 80 00          |   i32.const 49
 008501: ad                         |   i64.extend_i32_u
 008502: 42 20                      |   i64.const 32
 008504: 86                         |   i64.shl
 008505: 20 07                      |   local.get 7
 008507: 41 18                      |   i32.const 24
 008509: 6a                         |   i32.add
 00850a: ad                         |   i64.extend_i32_u
 00850b: 84                         |   i64.or
 00850c: 37 03 38                   |   i64.store 3 56
 00850f: 20 07                      |   local.get 7
 008511: 20 07                      |   local.get 7
 008513: 41 38                      |   i32.const 56
 008515: 6a                         |   i32.add
 008516: 36 02 60                   |   i32.store 2 96
 008519: 20 07                      |   local.get 7
 00851b: 41 d8 00                   |   i32.const 88
 00851e: 6a                         |   i32.add
 00851f: 20 06                      |   local.get 6
 008521: 10 81 81 80 80 00          |   call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 008527: 00                         |   unreachable
 008528: 0b                         | end
 008529: 20 07                      | local.get 7
 00852b: 41 20                      | i32.const 32
 00852d: 6a                         | i32.add
 00852e: 41 10                      | i32.const 16
 008530: 6a                         | i32.add
 008531: 20 05                      | local.get 5
 008533: 41 10                      | i32.const 16
 008535: 6a                         | i32.add
 008536: 29 02 00                   | i64.load 2 0
 008539: 37 03 00                   | i64.store 3 0
 00853c: 20 07                      | local.get 7
 00853e: 41 20                      | i32.const 32
 008540: 6a                         | i32.add
 008541: 41 08                      | i32.const 8
 008543: 6a                         | i32.add
 008544: 20 05                      | local.get 5
 008546: 41 08                      | i32.const 8
 008548: 6a                         | i32.add
 008549: 29 02 00                   | i64.load 2 0
 00854c: 37 03 00                   | i64.store 3 0
 00854f: 20 07                      | local.get 7
 008551: 20 05                      | local.get 5
 008553: 29 02 00                   | i64.load 2 0
 008556: 37 03 20                   | i64.store 3 32
 008559: 20 07                      | local.get 7
 00855b: 41 04                      | i32.const 4
 00855d: 36 02 5c                   | i32.store 2 92
 008560: 20 07                      | local.get 7
 008562: 41 cc 92 c0 80 00          | i32.const 1050956
 008568: 36 02 58                   | i32.store 2 88
 00856b: 20 07                      | local.get 7
 00856d: 42 04                      | i64.const 4
 00856f: 37 02 64                   | i64.store 2 100
 008572: 20 07                      | local.get 7
 008574: 41 b0 80 80 80 00          | i32.const 48
 00857a: ad                         | i64.extend_i32_u
 00857b: 42 20                      | i64.const 32
 00857d: 86                         | i64.shl
 00857e: 22 08                      | local.tee 8
 008580: 20 07                      | local.get 7
 008582: 41 10                      | i32.const 16
 008584: 6a                         | i32.add
 008585: ad                         | i64.extend_i32_u
 008586: 84                         | i64.or
 008587: 37 03 50                   | i64.store 3 80
 00858a: 20 07                      | local.get 7
 00858c: 20 08                      | local.get 8
 00858e: 20 07                      | local.get 7
 008590: 41 08                      | i32.const 8
 008592: 6a                         | i32.add
 008593: ad                         | i64.extend_i32_u
 008594: 84                         | i64.or
 008595: 37 03 48                   | i64.store 3 72
 008598: 20 07                      | local.get 7
 00859a: 41 b2 80 80 80 00          | i32.const 50
 0085a0: ad                         | i64.extend_i32_u
 0085a1: 42 20                      | i64.const 32
 0085a3: 86                         | i64.shl
 0085a4: 20 07                      | local.get 7
 0085a6: 41 20                      | i32.const 32
 0085a8: 6a                         | i32.add
 0085a9: ad                         | i64.extend_i32_u
 0085aa: 84                         | i64.or
 0085ab: 37 03 40                   | i64.store 3 64
 0085ae: 20 07                      | local.get 7
 0085b0: 41 b1 80 80 80 00          | i32.const 49
 0085b6: ad                         | i64.extend_i32_u
 0085b7: 42 20                      | i64.const 32
 0085b9: 86                         | i64.shl
 0085ba: 20 07                      | local.get 7
 0085bc: 41 18                      | i32.const 24
 0085be: 6a                         | i32.add
 0085bf: ad                         | i64.extend_i32_u
 0085c0: 84                         | i64.or
 0085c1: 37 03 38                   | i64.store 3 56
 0085c4: 20 07                      | local.get 7
 0085c6: 20 07                      | local.get 7
 0085c8: 41 38                      | i32.const 56
 0085ca: 6a                         | i32.add
 0085cb: 36 02 60                   | i32.store 2 96
 0085ce: 20 07                      | local.get 7
 0085d0: 41 d8 00                   | i32.const 88
 0085d3: 6a                         | i32.add
 0085d4: 20 06                      | local.get 6
 0085d6: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 0085dc: 00                         | unreachable
 0085dd: 0b                         | end
0085df func[138] <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0fe70d4203f3700aE>:
 0085e0: 20 00                      | local.get 0
 0085e2: 28 02 00                   | i32.load 2 0
 0085e5: 20 01                      | local.get 1
 0085e7: 20 00                      | local.get 0
 0085e9: 28 02 04                   | i32.load 2 4
 0085ec: 28 02 0c                   | i32.load 2 12
 0085ef: 11 81 80 80 80 00 80 80 80 | call_indirect 0 (type 1)
 0085f8: 80 00                      | 
 0085fa: 0b                         | end
0085fc func[139] <_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17he80d1ffb61fdffafE>:
 0085fd: 20 01                      | local.get 1
 0085ff: 28 02 1c                   | i32.load 2 28
 008602: 20 01                      | local.get 1
 008604: 28 02 20                   | i32.load 2 32
 008607: 20 00                      | local.get 0
 008609: 10 82 81 80 80 00          | call 130 <_ZN4core3fmt5write17h7df898af4051b9beE>
 00860f: 0b                         | end
008612 func[140] <_ZN4core3str5count14do_count_chars17h38be9ed0b8048c10E>:
 008613: 08 7f                      | local[2..9] type=i32
 008615: 02 40                      | block
 008617: 02 40                      |   block
 008619: 20 01                      |     local.get 1
 00861b: 20 00                      |     local.get 0
 00861d: 41 03                      |     i32.const 3
 00861f: 6a                         |     i32.add
 008620: 41 7c                      |     i32.const 4294967292
 008622: 71                         |     i32.and
 008623: 22 02                      |     local.tee 2
 008625: 20 00                      |     local.get 0
 008627: 6b                         |     i32.sub
 008628: 22 03                      |     local.tee 3
 00862a: 49                         |     i32.lt_u
 00862b: 0d 00                      |     br_if 0
 00862d: 20 01                      |     local.get 1
 00862f: 20 03                      |     local.get 3
 008631: 6b                         |     i32.sub
 008632: 22 04                      |     local.tee 4
 008634: 41 04                      |     i32.const 4
 008636: 49                         |     i32.lt_u
 008637: 0d 00                      |     br_if 0
 008639: 20 04                      |     local.get 4
 00863b: 41 03                      |     i32.const 3
 00863d: 71                         |     i32.and
 00863e: 21 05                      |     local.set 5
 008640: 41 00                      |     i32.const 0
 008642: 21 06                      |     local.set 6
 008644: 41 00                      |     i32.const 0
 008646: 21 01                      |     local.set 1
 008648: 02 40                      |     block
 00864a: 20 02                      |       local.get 2
 00864c: 20 00                      |       local.get 0
 00864e: 46                         |       i32.eq
 00864f: 22 07                      |       local.tee 7
 008651: 0d 00                      |       br_if 0
 008653: 41 00                      |       i32.const 0
 008655: 21 01                      |       local.set 1
 008657: 02 40                      |       block
 008659: 02 40                      |         block
 00865b: 20 00                      |           local.get 0
 00865d: 20 02                      |           local.get 2
 00865f: 6b                         |           i32.sub
 008660: 22 08                      |           local.tee 8
 008662: 41 7c                      |           i32.const 4294967292
 008664: 4d                         |           i32.le_u
 008665: 0d 00                      |           br_if 0
 008667: 41 00                      |           i32.const 0
 008669: 21 09                      |           local.set 9
 00866b: 0c 01                      |           br 1
 00866d: 0b                         |         end
 00866e: 41 00                      |         i32.const 0
 008670: 21 09                      |         local.set 9
 008672: 03 40                      |         loop
 008674: 20 01                      |           local.get 1
 008676: 20 00                      |           local.get 0
 008678: 20 09                      |           local.get 9
 00867a: 6a                         |           i32.add
 00867b: 22 02                      |           local.tee 2
 00867d: 2c 00 00                   |           i32.load8_s 0 0
 008680: 41 bf 7f                   |           i32.const 4294967231
 008683: 4a                         |           i32.gt_s
 008684: 6a                         |           i32.add
 008685: 20 02                      |           local.get 2
 008687: 41 01                      |           i32.const 1
 008689: 6a                         |           i32.add
 00868a: 2c 00 00                   |           i32.load8_s 0 0
 00868d: 41 bf 7f                   |           i32.const 4294967231
 008690: 4a                         |           i32.gt_s
 008691: 6a                         |           i32.add
 008692: 20 02                      |           local.get 2
 008694: 41 02                      |           i32.const 2
 008696: 6a                         |           i32.add
 008697: 2c 00 00                   |           i32.load8_s 0 0
 00869a: 41 bf 7f                   |           i32.const 4294967231
 00869d: 4a                         |           i32.gt_s
 00869e: 6a                         |           i32.add
 00869f: 20 02                      |           local.get 2
 0086a1: 41 03                      |           i32.const 3
 0086a3: 6a                         |           i32.add
 0086a4: 2c 00 00                   |           i32.load8_s 0 0
 0086a7: 41 bf 7f                   |           i32.const 4294967231
 0086aa: 4a                         |           i32.gt_s
 0086ab: 6a                         |           i32.add
 0086ac: 21 01                      |           local.set 1
 0086ae: 20 09                      |           local.get 9
 0086b0: 41 04                      |           i32.const 4
 0086b2: 6a                         |           i32.add
 0086b3: 22 09                      |           local.tee 9
 0086b5: 0d 00                      |           br_if 0
 0086b7: 0b                         |         end
 0086b8: 0b                         |       end
 0086b9: 20 07                      |       local.get 7
 0086bb: 0d 00                      |       br_if 0
 0086bd: 20 00                      |       local.get 0
 0086bf: 20 09                      |       local.get 9
 0086c1: 6a                         |       i32.add
 0086c2: 21 02                      |       local.set 2
 0086c4: 03 40                      |       loop
 0086c6: 20 01                      |         local.get 1
 0086c8: 20 02                      |         local.get 2
 0086ca: 2c 00 00                   |         i32.load8_s 0 0
 0086cd: 41 bf 7f                   |         i32.const 4294967231
 0086d0: 4a                         |         i32.gt_s
 0086d1: 6a                         |         i32.add
 0086d2: 21 01                      |         local.set 1
 0086d4: 20 02                      |         local.get 2
 0086d6: 41 01                      |         i32.const 1
 0086d8: 6a                         |         i32.add
 0086d9: 21 02                      |         local.set 2
 0086db: 20 08                      |         local.get 8
 0086dd: 41 01                      |         i32.const 1
 0086df: 6a                         |         i32.add
 0086e0: 22 08                      |         local.tee 8
 0086e2: 0d 00                      |         br_if 0
 0086e4: 0b                         |       end
 0086e5: 0b                         |     end
 0086e6: 20 00                      |     local.get 0
 0086e8: 20 03                      |     local.get 3
 0086ea: 6a                         |     i32.add
 0086eb: 21 00                      |     local.set 0
 0086ed: 02 40                      |     block
 0086ef: 20 05                      |       local.get 5
 0086f1: 45                         |       i32.eqz
 0086f2: 0d 00                      |       br_if 0
 0086f4: 20 00                      |       local.get 0
 0086f6: 20 04                      |       local.get 4
 0086f8: 41 7c                      |       i32.const 4294967292
 0086fa: 71                         |       i32.and
 0086fb: 6a                         |       i32.add
 0086fc: 22 02                      |       local.tee 2
 0086fe: 2c 00 00                   |       i32.load8_s 0 0
 008701: 41 bf 7f                   |       i32.const 4294967231
 008704: 4a                         |       i32.gt_s
 008705: 21 06                      |       local.set 6
 008707: 20 05                      |       local.get 5
 008709: 41 01                      |       i32.const 1
 00870b: 46                         |       i32.eq
 00870c: 0d 00                      |       br_if 0
 00870e: 20 06                      |       local.get 6
 008710: 20 02                      |       local.get 2
 008712: 2c 00 01                   |       i32.load8_s 0 1
 008715: 41 bf 7f                   |       i32.const 4294967231
 008718: 4a                         |       i32.gt_s
 008719: 6a                         |       i32.add
 00871a: 21 06                      |       local.set 6
 00871c: 20 05                      |       local.get 5
 00871e: 41 02                      |       i32.const 2
 008720: 46                         |       i32.eq
 008721: 0d 00                      |       br_if 0
 008723: 20 06                      |       local.get 6
 008725: 20 02                      |       local.get 2
 008727: 2c 00 02                   |       i32.load8_s 0 2
 00872a: 41 bf 7f                   |       i32.const 4294967231
 00872d: 4a                         |       i32.gt_s
 00872e: 6a                         |       i32.add
 00872f: 21 06                      |       local.set 6
 008731: 0b                         |     end
 008732: 20 04                      |     local.get 4
 008734: 41 02                      |     i32.const 2
 008736: 76                         |     i32.shr_u
 008737: 21 08                      |     local.set 8
 008739: 20 06                      |     local.get 6
 00873b: 20 01                      |     local.get 1
 00873d: 6a                         |     i32.add
 00873e: 21 03                      |     local.set 3
 008740: 03 40                      |     loop
 008742: 20 00                      |       local.get 0
 008744: 21 04                      |       local.set 4
 008746: 20 08                      |       local.get 8
 008748: 45                         |       i32.eqz
 008749: 0d 02                      |       br_if 2
 00874b: 20 08                      |       local.get 8
 00874d: 41 c0 01                   |       i32.const 192
 008750: 20 08                      |       local.get 8
 008752: 41 c0 01                   |       i32.const 192
 008755: 49                         |       i32.lt_u
 008756: 1b                         |       select
 008757: 22 06                      |       local.tee 6
 008759: 41 03                      |       i32.const 3
 00875b: 71                         |       i32.and
 00875c: 21 07                      |       local.set 7
 00875e: 20 06                      |       local.get 6
 008760: 41 02                      |       i32.const 2
 008762: 74                         |       i32.shl
 008763: 21 05                      |       local.set 5
 008765: 41 00                      |       i32.const 0
 008767: 21 02                      |       local.set 2
 008769: 02 40                      |       block
 00876b: 20 08                      |         local.get 8
 00876d: 41 04                      |         i32.const 4
 00876f: 49                         |         i32.lt_u
 008770: 0d 00                      |         br_if 0
 008772: 20 04                      |         local.get 4
 008774: 20 05                      |         local.get 5
 008776: 41 f0 07                   |         i32.const 1008
 008779: 71                         |         i32.and
 00877a: 6a                         |         i32.add
 00877b: 21 09                      |         local.set 9
 00877d: 41 00                      |         i32.const 0
 00877f: 21 02                      |         local.set 2
 008781: 20 04                      |         local.get 4
 008783: 21 01                      |         local.set 1
 008785: 03 40                      |         loop
 008787: 20 01                      |           local.get 1
 008789: 28 02 0c                   |           i32.load 2 12
 00878c: 22 00                      |           local.tee 0
 00878e: 41 7f                      |           i32.const 4294967295
 008790: 73                         |           i32.xor
 008791: 41 07                      |           i32.const 7
 008793: 76                         |           i32.shr_u
 008794: 20 00                      |           local.get 0
 008796: 41 06                      |           i32.const 6
 008798: 76                         |           i32.shr_u
 008799: 72                         |           i32.or
 00879a: 41 81 82 84 08             |           i32.const 16843009
 00879f: 71                         |           i32.and
 0087a0: 20 01                      |           local.get 1
 0087a2: 28 02 08                   |           i32.load 2 8
 0087a5: 22 00                      |           local.tee 0
 0087a7: 41 7f                      |           i32.const 4294967295
 0087a9: 73                         |           i32.xor
 0087aa: 41 07                      |           i32.const 7
 0087ac: 76                         |           i32.shr_u
 0087ad: 20 00                      |           local.get 0
 0087af: 41 06                      |           i32.const 6
 0087b1: 76                         |           i32.shr_u
 0087b2: 72                         |           i32.or
 0087b3: 41 81 82 84 08             |           i32.const 16843009
 0087b8: 71                         |           i32.and
 0087b9: 20 01                      |           local.get 1
 0087bb: 28 02 04                   |           i32.load 2 4
 0087be: 22 00                      |           local.tee 0
 0087c0: 41 7f                      |           i32.const 4294967295
 0087c2: 73                         |           i32.xor
 0087c3: 41 07                      |           i32.const 7
 0087c5: 76                         |           i32.shr_u
 0087c6: 20 00                      |           local.get 0
 0087c8: 41 06                      |           i32.const 6
 0087ca: 76                         |           i32.shr_u
 0087cb: 72                         |           i32.or
 0087cc: 41 81 82 84 08             |           i32.const 16843009
 0087d1: 71                         |           i32.and
 0087d2: 20 01                      |           local.get 1
 0087d4: 28 02 00                   |           i32.load 2 0
 0087d7: 22 00                      |           local.tee 0
 0087d9: 41 7f                      |           i32.const 4294967295
 0087db: 73                         |           i32.xor
 0087dc: 41 07                      |           i32.const 7
 0087de: 76                         |           i32.shr_u
 0087df: 20 00                      |           local.get 0
 0087e1: 41 06                      |           i32.const 6
 0087e3: 76                         |           i32.shr_u
 0087e4: 72                         |           i32.or
 0087e5: 41 81 82 84 08             |           i32.const 16843009
 0087ea: 71                         |           i32.and
 0087eb: 20 02                      |           local.get 2
 0087ed: 6a                         |           i32.add
 0087ee: 6a                         |           i32.add
 0087ef: 6a                         |           i32.add
 0087f0: 6a                         |           i32.add
 0087f1: 21 02                      |           local.set 2
 0087f3: 20 01                      |           local.get 1
 0087f5: 41 10                      |           i32.const 16
 0087f7: 6a                         |           i32.add
 0087f8: 22 01                      |           local.tee 1
 0087fa: 20 09                      |           local.get 9
 0087fc: 47                         |           i32.ne
 0087fd: 0d 00                      |           br_if 0
 0087ff: 0b                         |         end
 008800: 0b                         |       end
 008801: 20 08                      |       local.get 8
 008803: 20 06                      |       local.get 6
 008805: 6b                         |       i32.sub
 008806: 21 08                      |       local.set 8
 008808: 20 04                      |       local.get 4
 00880a: 20 05                      |       local.get 5
 00880c: 6a                         |       i32.add
 00880d: 21 00                      |       local.set 0
 00880f: 20 02                      |       local.get 2
 008811: 41 08                      |       i32.const 8
 008813: 76                         |       i32.shr_u
 008814: 41 ff 81 fc 07             |       i32.const 16711935
 008819: 71                         |       i32.and
 00881a: 20 02                      |       local.get 2
 00881c: 41 ff 81 fc 07             |       i32.const 16711935
 008821: 71                         |       i32.and
 008822: 6a                         |       i32.add
 008823: 41 81 80 04                |       i32.const 65537
 008827: 6c                         |       i32.mul
 008828: 41 10                      |       i32.const 16
 00882a: 76                         |       i32.shr_u
 00882b: 20 03                      |       local.get 3
 00882d: 6a                         |       i32.add
 00882e: 21 03                      |       local.set 3
 008830: 20 07                      |       local.get 7
 008832: 45                         |       i32.eqz
 008833: 0d 00                      |       br_if 0
 008835: 0b                         |     end
 008836: 20 04                      |     local.get 4
 008838: 20 06                      |     local.get 6
 00883a: 41 fc 01                   |     i32.const 252
 00883d: 71                         |     i32.and
 00883e: 41 02                      |     i32.const 2
 008840: 74                         |     i32.shl
 008841: 6a                         |     i32.add
 008842: 22 02                      |     local.tee 2
 008844: 28 02 00                   |     i32.load 2 0
 008847: 22 01                      |     local.tee 1
 008849: 41 7f                      |     i32.const 4294967295
 00884b: 73                         |     i32.xor
 00884c: 41 07                      |     i32.const 7
 00884e: 76                         |     i32.shr_u
 00884f: 20 01                      |     local.get 1
 008851: 41 06                      |     i32.const 6
 008853: 76                         |     i32.shr_u
 008854: 72                         |     i32.or
 008855: 41 81 82 84 08             |     i32.const 16843009
 00885a: 71                         |     i32.and
 00885b: 21 01                      |     local.set 1
 00885d: 02 40                      |     block
 00885f: 20 07                      |       local.get 7
 008861: 41 01                      |       i32.const 1
 008863: 46                         |       i32.eq
 008864: 0d 00                      |       br_if 0
 008866: 20 02                      |       local.get 2
 008868: 28 02 04                   |       i32.load 2 4
 00886b: 22 00                      |       local.tee 0
 00886d: 41 7f                      |       i32.const 4294967295
 00886f: 73                         |       i32.xor
 008870: 41 07                      |       i32.const 7
 008872: 76                         |       i32.shr_u
 008873: 20 00                      |       local.get 0
 008875: 41 06                      |       i32.const 6
 008877: 76                         |       i32.shr_u
 008878: 72                         |       i32.or
 008879: 41 81 82 84 08             |       i32.const 16843009
 00887e: 71                         |       i32.and
 00887f: 20 01                      |       local.get 1
 008881: 6a                         |       i32.add
 008882: 21 01                      |       local.set 1
 008884: 20 07                      |       local.get 7
 008886: 41 02                      |       i32.const 2
 008888: 46                         |       i32.eq
 008889: 0d 00                      |       br_if 0
 00888b: 20 02                      |       local.get 2
 00888d: 28 02 08                   |       i32.load 2 8
 008890: 22 02                      |       local.tee 2
 008892: 41 7f                      |       i32.const 4294967295
 008894: 73                         |       i32.xor
 008895: 41 07                      |       i32.const 7
 008897: 76                         |       i32.shr_u
 008898: 20 02                      |       local.get 2
 00889a: 41 06                      |       i32.const 6
 00889c: 76                         |       i32.shr_u
 00889d: 72                         |       i32.or
 00889e: 41 81 82 84 08             |       i32.const 16843009
 0088a3: 71                         |       i32.and
 0088a4: 20 01                      |       local.get 1
 0088a6: 6a                         |       i32.add
 0088a7: 21 01                      |       local.set 1
 0088a9: 0b                         |     end
 0088aa: 20 01                      |     local.get 1
 0088ac: 41 08                      |     i32.const 8
 0088ae: 76                         |     i32.shr_u
 0088af: 41 ff 81 1c                |     i32.const 459007
 0088b3: 71                         |     i32.and
 0088b4: 20 01                      |     local.get 1
 0088b6: 41 ff 81 fc 07             |     i32.const 16711935
 0088bb: 71                         |     i32.and
 0088bc: 6a                         |     i32.add
 0088bd: 41 81 80 04                |     i32.const 65537
 0088c1: 6c                         |     i32.mul
 0088c2: 41 10                      |     i32.const 16
 0088c4: 76                         |     i32.shr_u
 0088c5: 20 03                      |     local.get 3
 0088c7: 6a                         |     i32.add
 0088c8: 0f                         |     return
 0088c9: 0b                         |   end
 0088ca: 02 40                      |   block
 0088cc: 20 01                      |     local.get 1
 0088ce: 0d 00                      |     br_if 0
 0088d0: 41 00                      |     i32.const 0
 0088d2: 0f                         |     return
 0088d3: 0b                         |   end
 0088d4: 20 01                      |   local.get 1
 0088d6: 41 03                      |   i32.const 3
 0088d8: 71                         |   i32.and
 0088d9: 21 09                      |   local.set 9
 0088db: 02 40                      |   block
 0088dd: 02 40                      |     block
 0088df: 20 01                      |       local.get 1
 0088e1: 41 04                      |       i32.const 4
 0088e3: 4f                         |       i32.ge_u
 0088e4: 0d 00                      |       br_if 0
 0088e6: 41 00                      |       i32.const 0
 0088e8: 21 03                      |       local.set 3
 0088ea: 41 00                      |       i32.const 0
 0088ec: 21 02                      |       local.set 2
 0088ee: 0c 01                      |       br 1
 0088f0: 0b                         |     end
 0088f1: 20 01                      |     local.get 1
 0088f3: 41 7c                      |     i32.const 4294967292
 0088f5: 71                         |     i32.and
 0088f6: 21 08                      |     local.set 8
 0088f8: 41 00                      |     i32.const 0
 0088fa: 21 03                      |     local.set 3
 0088fc: 41 00                      |     i32.const 0
 0088fe: 21 02                      |     local.set 2
 008900: 03 40                      |     loop
 008902: 20 03                      |       local.get 3
 008904: 20 00                      |       local.get 0
 008906: 20 02                      |       local.get 2
 008908: 6a                         |       i32.add
 008909: 22 01                      |       local.tee 1
 00890b: 2c 00 00                   |       i32.load8_s 0 0
 00890e: 41 bf 7f                   |       i32.const 4294967231
 008911: 4a                         |       i32.gt_s
 008912: 6a                         |       i32.add
 008913: 20 01                      |       local.get 1
 008915: 41 01                      |       i32.const 1
 008917: 6a                         |       i32.add
 008918: 2c 00 00                   |       i32.load8_s 0 0
 00891b: 41 bf 7f                   |       i32.const 4294967231
 00891e: 4a                         |       i32.gt_s
 00891f: 6a                         |       i32.add
 008920: 20 01                      |       local.get 1
 008922: 41 02                      |       i32.const 2
 008924: 6a                         |       i32.add
 008925: 2c 00 00                   |       i32.load8_s 0 0
 008928: 41 bf 7f                   |       i32.const 4294967231
 00892b: 4a                         |       i32.gt_s
 00892c: 6a                         |       i32.add
 00892d: 20 01                      |       local.get 1
 00892f: 41 03                      |       i32.const 3
 008931: 6a                         |       i32.add
 008932: 2c 00 00                   |       i32.load8_s 0 0
 008935: 41 bf 7f                   |       i32.const 4294967231
 008938: 4a                         |       i32.gt_s
 008939: 6a                         |       i32.add
 00893a: 21 03                      |       local.set 3
 00893c: 20 08                      |       local.get 8
 00893e: 20 02                      |       local.get 2
 008940: 41 04                      |       i32.const 4
 008942: 6a                         |       i32.add
 008943: 22 02                      |       local.tee 2
 008945: 47                         |       i32.ne
 008946: 0d 00                      |       br_if 0
 008948: 0b                         |     end
 008949: 0b                         |   end
 00894a: 20 09                      |   local.get 9
 00894c: 45                         |   i32.eqz
 00894d: 0d 00                      |   br_if 0
 00894f: 20 00                      |   local.get 0
 008951: 20 02                      |   local.get 2
 008953: 6a                         |   i32.add
 008954: 21 01                      |   local.set 1
 008956: 03 40                      |   loop
 008958: 20 03                      |     local.get 3
 00895a: 20 01                      |     local.get 1
 00895c: 2c 00 00                   |     i32.load8_s 0 0
 00895f: 41 bf 7f                   |     i32.const 4294967231
 008962: 4a                         |     i32.gt_s
 008963: 6a                         |     i32.add
 008964: 21 03                      |     local.set 3
 008966: 20 01                      |     local.get 1
 008968: 41 01                      |     i32.const 1
 00896a: 6a                         |     i32.add
 00896b: 21 01                      |     local.set 1
 00896d: 20 09                      |     local.get 9
 00896f: 41 7f                      |     i32.const 4294967295
 008971: 6a                         |     i32.add
 008972: 22 09                      |     local.tee 9
 008974: 0d 00                      |     br_if 0
 008976: 0b                         |   end
 008977: 0b                         | end
 008978: 20 03                      | local.get 3
 00897a: 0b                         | end
00897c func[141] <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hc470ff4c8c303e15E>:
 00897d: 02 40                      | block
 00897f: 20 02                      |   local.get 2
 008981: 41 80 80 c4 00             |   i32.const 1114112
 008986: 46                         |   i32.eq
 008987: 0d 00                      |   br_if 0
 008989: 20 00                      |   local.get 0
 00898b: 20 02                      |   local.get 2
 00898d: 20 01                      |   local.get 1
 00898f: 28 02 10                   |   i32.load 2 16
 008992: 11 81 80 80 80 00 80 80 80 |   call_indirect 0 (type 1)
 00899b: 80 00                      | 
 00899d: 45                         |   i32.eqz
 00899e: 0d 00                      |   br_if 0
 0089a0: 41 01                      |   i32.const 1
 0089a2: 0f                         |   return
 0089a3: 0b                         | end
 0089a4: 02 40                      | block
 0089a6: 20 03                      |   local.get 3
 0089a8: 0d 00                      |   br_if 0
 0089aa: 41 00                      |   i32.const 0
 0089ac: 0f                         |   return
 0089ad: 0b                         | end
 0089ae: 20 00                      | local.get 0
 0089b0: 20 03                      | local.get 3
 0089b2: 20 04                      | local.get 4
 0089b4: 20 01                      | local.get 1
 0089b6: 28 02 0c                   | i32.load 2 12
 0089b9: 11 83 80 80 80 00 80 80 80 | call_indirect 0 (type 3)
 0089c2: 80 00                      | 
 0089c4: 0b                         | end
0089c6 func[142] <_ZN4core3fmt9Formatter9write_str17h68e107edfb8ed693E>:
 0089c7: 20 00                      | local.get 0
 0089c9: 28 02 1c                   | i32.load 2 28
 0089cc: 20 01                      | local.get 1
 0089ce: 20 02                      | local.get 2
 0089d0: 20 00                      | local.get 0
 0089d2: 28 02 20                   | i32.load 2 32
 0089d5: 28 02 0c                   | i32.load 2 12
 0089d8: 11 83 80 80 80 00 80 80 80 | call_indirect 0 (type 3)
 0089e1: 80 00                      | 
 0089e3: 0b                         | end
0089e5 func[143] <_ZN43_$LT$bool$u20$as$u20$core..fmt..Display$GT$3fmt17hd7f80a1f6696b855E>:
 0089e6: 02 40                      | block
 0089e8: 20 00                      |   local.get 0
 0089ea: 2d 00 00                   |   i32.load8_u 0 0
 0089ed: 0d 00                      |   br_if 0
 0089ef: 20 01                      |   local.get 1
 0089f1: 41 b4 94 c0 80 00          |   i32.const 1051188
 0089f7: 41 05                      |   i32.const 5
 0089f9: 10 ff 80 80 80 00          |   call 127 <_ZN4core3fmt9Formatter3pad17h64f752386689f2e2E>
 0089ff: 0f                         |   return
 008a00: 0b                         | end
 008a01: 20 01                      | local.get 1
 008a03: 41 b9 94 c0 80 00          | i32.const 1051193
 008a09: 41 04                      | i32.const 4
 008a0b: 10 ff 80 80 80 00          | call 127 <_ZN4core3fmt9Formatter3pad17h64f752386689f2e2E>
 008a11: 0b                         | end
008a13 func[144] <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17ha381131a80be27b3E>:
 008a14: 20 02                      | local.get 2
 008a16: 20 00                      | local.get 0
 008a18: 20 01                      | local.get 1
 008a1a: 10 ff 80 80 80 00          | call 127 <_ZN4core3fmt9Formatter3pad17h64f752386689f2e2E>
 008a20: 0b                         | end
008a23 func[145] <_ZN4core5slice6memchr14memchr_aligned17h01406d79f3f55b97E>:
 008a24: 05 7f                      | local[4..8] type=i32
 008a26: 02 40                      | block
 008a28: 02 40                      |   block
 008a2a: 02 40                      |     block
 008a2c: 02 40                      |       block
 008a2e: 20 02                      |         local.get 2
 008a30: 41 03                      |         i32.const 3
 008a32: 6a                         |         i32.add
 008a33: 41 7c                      |         i32.const 4294967292
 008a35: 71                         |         i32.and
 008a36: 22 04                      |         local.tee 4
 008a38: 20 02                      |         local.get 2
 008a3a: 46                         |         i32.eq
 008a3b: 0d 00                      |         br_if 0
 008a3d: 20 04                      |         local.get 4
 008a3f: 20 02                      |         local.get 2
 008a41: 6b                         |         i32.sub
 008a42: 22 04                      |         local.tee 4
 008a44: 20 03                      |         local.get 3
 008a46: 20 04                      |         local.get 4
 008a48: 20 03                      |         local.get 3
 008a4a: 49                         |         i32.lt_u
 008a4b: 1b                         |         select
 008a4c: 22 04                      |         local.tee 4
 008a4e: 45                         |         i32.eqz
 008a4f: 0d 00                      |         br_if 0
 008a51: 41 00                      |         i32.const 0
 008a53: 21 05                      |         local.set 5
 008a55: 20 01                      |         local.get 1
 008a57: 41 ff 01                   |         i32.const 255
 008a5a: 71                         |         i32.and
 008a5b: 21 06                      |         local.set 6
 008a5d: 41 01                      |         i32.const 1
 008a5f: 21 07                      |         local.set 7
 008a61: 03 40                      |         loop
 008a63: 20 02                      |           local.get 2
 008a65: 20 05                      |           local.get 5
 008a67: 6a                         |           i32.add
 008a68: 2d 00 00                   |           i32.load8_u 0 0
 008a6b: 20 06                      |           local.get 6
 008a6d: 46                         |           i32.eq
 008a6e: 0d 04                      |           br_if 4
 008a70: 20 04                      |           local.get 4
 008a72: 20 05                      |           local.get 5
 008a74: 41 01                      |           i32.const 1
 008a76: 6a                         |           i32.add
 008a77: 22 05                      |           local.tee 5
 008a79: 47                         |           i32.ne
 008a7a: 0d 00                      |           br_if 0
 008a7c: 0b                         |         end
 008a7d: 20 04                      |         local.get 4
 008a7f: 20 03                      |         local.get 3
 008a81: 41 78                      |         i32.const 4294967288
 008a83: 6a                         |         i32.add
 008a84: 22 08                      |         local.tee 8
 008a86: 4b                         |         i32.gt_u
 008a87: 0d 02                      |         br_if 2
 008a89: 0c 01                      |         br 1
 008a8b: 0b                         |       end
 008a8c: 20 03                      |       local.get 3
 008a8e: 41 78                      |       i32.const 4294967288
 008a90: 6a                         |       i32.add
 008a91: 21 08                      |       local.set 8
 008a93: 41 00                      |       i32.const 0
 008a95: 21 04                      |       local.set 4
 008a97: 0b                         |     end
 008a98: 20 01                      |     local.get 1
 008a9a: 41 ff 01                   |     i32.const 255
 008a9d: 71                         |     i32.and
 008a9e: 41 81 82 84 08             |     i32.const 16843009
 008aa3: 6c                         |     i32.mul
 008aa4: 21 05                      |     local.set 5
 008aa6: 03 40                      |     loop
 008aa8: 41 80 82 84 08             |       i32.const 16843008
 008aad: 20 02                      |       local.get 2
 008aaf: 20 04                      |       local.get 4
 008ab1: 6a                         |       i32.add
 008ab2: 22 06                      |       local.tee 6
 008ab4: 28 02 00                   |       i32.load 2 0
 008ab7: 20 05                      |       local.get 5
 008ab9: 73                         |       i32.xor
 008aba: 22 07                      |       local.tee 7
 008abc: 6b                         |       i32.sub
 008abd: 20 07                      |       local.get 7
 008abf: 72                         |       i32.or
 008ac0: 41 80 82 84 08             |       i32.const 16843008
 008ac5: 20 06                      |       local.get 6
 008ac7: 41 04                      |       i32.const 4
 008ac9: 6a                         |       i32.add
 008aca: 28 02 00                   |       i32.load 2 0
 008acd: 20 05                      |       local.get 5
 008acf: 73                         |       i32.xor
 008ad0: 22 06                      |       local.tee 6
 008ad2: 6b                         |       i32.sub
 008ad3: 20 06                      |       local.get 6
 008ad5: 72                         |       i32.or
 008ad6: 71                         |       i32.and
 008ad7: 41 80 81 82 84 78          |       i32.const 2155905152
 008add: 71                         |       i32.and
 008ade: 41 80 81 82 84 78          |       i32.const 2155905152
 008ae4: 47                         |       i32.ne
 008ae5: 0d 01                      |       br_if 1
 008ae7: 20 04                      |       local.get 4
 008ae9: 41 08                      |       i32.const 8
 008aeb: 6a                         |       i32.add
 008aec: 22 04                      |       local.tee 4
 008aee: 20 08                      |       local.get 8
 008af0: 4d                         |       i32.le_u
 008af1: 0d 00                      |       br_if 0
 008af3: 0b                         |     end
 008af4: 0b                         |   end
 008af5: 02 40                      |   block
 008af7: 20 04                      |     local.get 4
 008af9: 20 03                      |     local.get 3
 008afb: 46                         |     i32.eq
 008afc: 0d 00                      |     br_if 0
 008afe: 20 01                      |     local.get 1
 008b00: 41 ff 01                   |     i32.const 255
 008b03: 71                         |     i32.and
 008b04: 21 05                      |     local.set 5
 008b06: 41 01                      |     i32.const 1
 008b08: 21 07                      |     local.set 7
 008b0a: 03 40                      |     loop
 008b0c: 02 40                      |       block
 008b0e: 20 02                      |         local.get 2
 008b10: 20 04                      |         local.get 4
 008b12: 6a                         |         i32.add
 008b13: 2d 00 00                   |         i32.load8_u 0 0
 008b16: 20 05                      |         local.get 5
 008b18: 47                         |         i32.ne
 008b19: 0d 00                      |         br_if 0
 008b1b: 20 04                      |         local.get 4
 008b1d: 21 05                      |         local.set 5
 008b1f: 0c 03                      |         br 3
 008b21: 0b                         |       end
 008b22: 20 03                      |       local.get 3
 008b24: 20 04                      |       local.get 4
 008b26: 41 01                      |       i32.const 1
 008b28: 6a                         |       i32.add
 008b29: 22 04                      |       local.tee 4
 008b2b: 47                         |       i32.ne
 008b2c: 0d 00                      |       br_if 0
 008b2e: 0b                         |     end
 008b2f: 0b                         |   end
 008b30: 41 00                      |   i32.const 0
 008b32: 21 07                      |   local.set 7
 008b34: 0b                         | end
 008b35: 20 00                      | local.get 0
 008b37: 20 05                      | local.get 5
 008b39: 36 02 04                   | i32.store 2 4
 008b3c: 20 00                      | local.get 0
 008b3e: 20 07                      | local.get 7
 008b40: 36 02 00                   | i32.store 2 0
 008b43: 0b                         | end
008b45 func[146] <_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17h250462ce45fab21cE>:
 008b46: 01 7f                      | local[3] type=i32
 008b48: 01 7e                      | local[4] type=i64
 008b4a: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 008b50: 41 30                      | i32.const 48
 008b52: 6b                         | i32.sub
 008b53: 22 03                      | local.tee 3
 008b55: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 008b5b: 20 03                      | local.get 3
 008b5d: 20 01                      | local.get 1
 008b5f: 36 02 04                   | i32.store 2 4
 008b62: 20 03                      | local.get 3
 008b64: 20 00                      | local.get 0
 008b66: 36 02 00                   | i32.store 2 0
 008b69: 20 03                      | local.get 3
 008b6b: 41 02                      | i32.const 2
 008b6d: 36 02 0c                   | i32.store 2 12
 008b70: 20 03                      | local.get 3
 008b72: 41 f4 94 c0 80 00          | i32.const 1051252
 008b78: 36 02 08                   | i32.store 2 8
 008b7b: 20 03                      | local.get 3
 008b7d: 42 02                      | i64.const 2
 008b7f: 37 02 14                   | i64.store 2 20
 008b82: 20 03                      | local.get 3
 008b84: 41 82 80 80 80 00          | i32.const 2
 008b8a: ad                         | i64.extend_i32_u
 008b8b: 42 20                      | i64.const 32
 008b8d: 86                         | i64.shl
 008b8e: 22 04                      | local.tee 4
 008b90: 20 03                      | local.get 3
 008b92: 41 04                      | i32.const 4
 008b94: 6a                         | i32.add
 008b95: ad                         | i64.extend_i32_u
 008b96: 84                         | i64.or
 008b97: 37 03 28                   | i64.store 3 40
 008b9a: 20 03                      | local.get 3
 008b9c: 20 04                      | local.get 4
 008b9e: 20 03                      | local.get 3
 008ba0: ad                         | i64.extend_i32_u
 008ba1: 84                         | i64.or
 008ba2: 37 03 20                   | i64.store 3 32
 008ba5: 20 03                      | local.get 3
 008ba7: 20 03                      | local.get 3
 008ba9: 41 20                      | i32.const 32
 008bab: 6a                         | i32.add
 008bac: 36 02 10                   | i32.store 2 16
 008baf: 20 03                      | local.get 3
 008bb1: 41 08                      | i32.const 8
 008bb3: 6a                         | i32.add
 008bb4: 20 02                      | local.get 2
 008bb6: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 008bbc: 00                         | unreachable
 008bbd: 0b                         | end
008bbf func[147] <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17hea2e113a73aa6cc8E>:
 008bc0: 01 7f                      | local[3] type=i32
 008bc2: 01 7e                      | local[4] type=i64
 008bc4: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 008bca: 41 30                      | i32.const 48
 008bcc: 6b                         | i32.sub
 008bcd: 22 03                      | local.tee 3
 008bcf: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 008bd5: 20 03                      | local.get 3
 008bd7: 20 01                      | local.get 1
 008bd9: 36 02 04                   | i32.store 2 4
 008bdc: 20 03                      | local.get 3
 008bde: 20 00                      | local.get 0
 008be0: 36 02 00                   | i32.store 2 0
 008be3: 20 03                      | local.get 3
 008be5: 41 02                      | i32.const 2
 008be7: 36 02 0c                   | i32.store 2 12
 008bea: 20 03                      | local.get 3
 008bec: 41 94 95 c0 80 00          | i32.const 1051284
 008bf2: 36 02 08                   | i32.store 2 8
 008bf5: 20 03                      | local.get 3
 008bf7: 42 02                      | i64.const 2
 008bf9: 37 02 14                   | i64.store 2 20
 008bfc: 20 03                      | local.get 3
 008bfe: 41 82 80 80 80 00          | i32.const 2
 008c04: ad                         | i64.extend_i32_u
 008c05: 42 20                      | i64.const 32
 008c07: 86                         | i64.shl
 008c08: 22 04                      | local.tee 4
 008c0a: 20 03                      | local.get 3
 008c0c: 41 04                      | i32.const 4
 008c0e: 6a                         | i32.add
 008c0f: ad                         | i64.extend_i32_u
 008c10: 84                         | i64.or
 008c11: 37 03 28                   | i64.store 3 40
 008c14: 20 03                      | local.get 3
 008c16: 20 04                      | local.get 4
 008c18: 20 03                      | local.get 3
 008c1a: ad                         | i64.extend_i32_u
 008c1b: 84                         | i64.or
 008c1c: 37 03 20                   | i64.store 3 32
 008c1f: 20 03                      | local.get 3
 008c21: 20 03                      | local.get 3
 008c23: 41 20                      | i32.const 32
 008c25: 6a                         | i32.add
 008c26: 36 02 10                   | i32.store 2 16
 008c29: 20 03                      | local.get 3
 008c2b: 41 08                      | i32.const 8
 008c2d: 6a                         | i32.add
 008c2e: 20 02                      | local.get 2
 008c30: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 008c36: 00                         | unreachable
 008c37: 0b                         | end
008c39 func[148] <_ZN4core9panicking11panic_const24panic_const_add_overflow17hed5b4e550c49fa6dE>:
 008c3a: 01 7f                      | local[1] type=i32
 008c3c: 23 80 80 80 80 00          | global.get 0 <__stack_pointer>
 008c42: 41 20                      | i32.const 32
 008c44: 6b                         | i32.sub
 008c45: 22 01                      | local.tee 1
 008c47: 24 80 80 80 80 00          | global.set 0 <__stack_pointer>
 008c4d: 20 01                      | local.get 1
 008c4f: 41 00                      | i32.const 0
 008c51: 36 02 18                   | i32.store 2 24
 008c54: 20 01                      | local.get 1
 008c56: 41 01                      | i32.const 1
 008c58: 36 02 0c                   | i32.store 2 12
 008c5b: 20 01                      | local.get 1
 008c5d: 41 a8 91 c0 80 00          | i32.const 1050792
 008c63: 36 02 08                   | i32.store 2 8
 008c66: 20 01                      | local.get 1
 008c68: 42 04                      | i64.const 4
 008c6a: 37 02 10                   | i64.store 2 16
 008c6d: 20 01                      | local.get 1
 008c6f: 41 08                      | i32.const 8
 008c71: 6a                         | i32.add
 008c72: 20 00                      | local.get 0
 008c74: 10 81 81 80 80 00          | call 129 <_ZN4core9panicking9panic_fmt17he306018bf71f8e67E>
 008c7a: 00                         | unreachable
 008c7b: 0b                         | end
008c7d func[149] <add.command_export>:
 008c7e: 20 00                      | local.get 0
 008c80: 20 01                      | local.get 1
 008c82: 10 04                      | call 4 <add>
 008c84: 10 6d                      | call 109 <__wasm_call_dtors>
 008c86: 0b                         | end
