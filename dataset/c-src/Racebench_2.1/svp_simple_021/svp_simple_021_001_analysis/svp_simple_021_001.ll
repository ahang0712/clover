; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_021/svp_simple_021_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_021/svp_simple_021_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2, !dbg !0
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16, !dbg !19
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8, !dbg !29
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2, !dbg !17
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16, !dbg !27
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_021_001_init() #0 !dbg !38 {
  call void (...) @init(), !dbg !41
  ret void, !dbg !42
}

declare void @init(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !43 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %1, align 4, !dbg !46
  %3 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !47
  %4 = zext i16 %3 to i32, !dbg !47
  %5 = icmp sge i32 %4, 16, !dbg !49
  br i1 %5, label %6, label %18, !dbg !50

6:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %2, metadata !53, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %2, align 4, !dbg !56
  br label %7, !dbg !58

7:                                                ; preds = %14, %6
  %8 = load i32, i32* %2, align 4, !dbg !59
  %9 = icmp slt i32 %8, 256, !dbg !61
  br i1 %9, label %10, label %17, !dbg !62

10:                                               ; preds = %7
  %11 = load i32, i32* %2, align 4, !dbg !63
  %12 = sext i32 %11 to i64, !dbg !65
  %13 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %12, !dbg !65
  store volatile i8 0, i8* %13, align 1, !dbg !66
  br label %14, !dbg !67

14:                                               ; preds = %10
  %15 = load i32, i32* %2, align 4, !dbg !68
  %16 = add nsw i32 %15, 1, !dbg !68
  store i32 %16, i32* %2, align 4, !dbg !68
  br label %7, !dbg !69, !llvm.loop !70

17:                                               ; preds = %7
  store i32 255, i32* %1, align 4, !dbg !72
  br label %18, !dbg !73

18:                                               ; preds = %17, %0
  ret void, !dbg !74
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_021_001_main() #0 !dbg !75 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.svp_simple_021_001_tc_block_data* %1, metadata !76, metadata !DIExpression()), !dbg !82
  call void @svp_simple_021_001_init(), !dbg !83
  call void @svp_simple_021_001_RecvTcBlock(), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %2, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 0, i32* %2, align 4, !dbg !87
  br label %3, !dbg !89

3:                                                ; preds = %26, %0
  %4 = load i32, i32* %2, align 4, !dbg !90
  %5 = icmp slt i32 %4, 2, !dbg !92
  br i1 %5, label %6, label %29, !dbg !93

6:                                                ; preds = %3
  %7 = load i32, i32* %2, align 4, !dbg !94
  %8 = icmp eq i32 %7, 0, !dbg !97
  br i1 %8, label %9, label %11, !dbg !98

9:                                                ; preds = %6
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !99
  %10 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !101
  store volatile i16 %10, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !102
  br label %13, !dbg !103

11:                                               ; preds = %6
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i64 0, i64 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !104
  %12 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !106
  store volatile i16 %12, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !107
  br label %13

13:                                               ; preds = %11, %9
  %14 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !108
  %15 = getelementptr inbounds i8, i8* %14, i64 2, !dbg !109
  %16 = load volatile i8, i8* %15, align 1, !dbg !110
  %17 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !111
  store i8 %16, i8* %17, align 1, !dbg !112
  %18 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !113
  %19 = getelementptr inbounds i8, i8* %18, i64 4, !dbg !114
  %20 = load volatile i8, i8* %19, align 1, !dbg !115
  %21 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !116
  store i8 %20, i8* %21, align 1, !dbg !117
  %22 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !118
  %23 = getelementptr inbounds i8, i8* %22, i64 5, !dbg !119
  %24 = load volatile i8, i8* %23, align 1, !dbg !120
  %25 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !121
  store i8 %24, i8* %25, align 1, !dbg !122
  br label %26, !dbg !123

26:                                               ; preds = %13
  %27 = load i32, i32* %2, align 4, !dbg !124
  %28 = add nsw i32 %27, 1, !dbg !124
  store i32 %28, i32* %2, align 4, !dbg !124
  br label %3, !dbg !125, !llvm.loop !126

29:                                               ; preds = %3
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !129 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !130
  %2 = lshr i32 %1, 3, !dbg !131
  %3 = and i32 %2, 8191, !dbg !132
  %4 = trunc i32 %3 to i16, !dbg !133
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!32, !33, !34, !35, !36}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_block_rcvd_bytes_ch1", scope: !2, file: !12, line: 5, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_021/svp_simple_021_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !17, !19, !27, !29}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_block_rcvd_bytes_ch2", scope: !2, file: !12, line: 6, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_021/svp_simple_021_001.c", directory: "/Users/hehang03/code/clover")
!13 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned16", file: !15, line: 21, baseType: !16)
!15 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_021/../common.h", directory: "/Users/hehang03/code/clover")
!16 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_block_rcvd_bytes", scope: !2, file: !12, line: 7, type: !13, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_chan1_buff", scope: !2, file: !12, line: 8, type: !21, isLocal: false, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 2048, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned8", file: !15, line: 20, baseType: !24)
!24 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!25 = !{!26}
!26 = !DISubrange(count: 256)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_chan2_buff", scope: !2, file: !12, line: 9, type: !21, isLocal: false, isDefinition: true)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "svp_simple_021_001_tc_buff_p", scope: !2, file: !12, line: 10, type: !31, isLocal: false, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!32 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!33 = !{i32 7, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{!"clang version 10.0.0 "}
!38 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !12, file: !12, line: 18, type: !39, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocation(line: 22, column: 3, scope: !38)
!42 = !DILocation(line: 23, column: 1, scope: !38)
!43 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !12, file: !12, line: 25, type: !39, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocalVariable(name: "svp_simple_021_001_flag_chan1", scope: !43, file: !12, line: 26, type: !8)
!45 = !DILocation(line: 26, column: 12, scope: !43)
!46 = !DILocation(line: 27, column: 33, scope: !43)
!47 = !DILocation(line: 29, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !12, line: 29, column: 7)
!49 = !DILocation(line: 29, column: 50, scope: !48)
!50 = !DILocation(line: 29, column: 7, scope: !43)
!51 = !DILocation(line: 30, column: 48, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 29, column: 57)
!53 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 31, type: !54)
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DILocation(line: 31, column: 9, scope: !52)
!56 = !DILocation(line: 32, column: 12, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 32, column: 5)
!58 = !DILocation(line: 32, column: 10, scope: !57)
!59 = !DILocation(line: 32, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 32, column: 5)
!61 = !DILocation(line: 32, column: 19, scope: !60)
!62 = !DILocation(line: 32, column: 5, scope: !57)
!63 = !DILocation(line: 33, column: 40, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 32, column: 31)
!65 = !DILocation(line: 33, column: 7, scope: !64)
!66 = !DILocation(line: 33, column: 43, scope: !64)
!67 = !DILocation(line: 34, column: 5, scope: !64)
!68 = !DILocation(line: 32, column: 27, scope: !60)
!69 = !DILocation(line: 32, column: 5, scope: !60)
!70 = distinct !{!70, !62, !71}
!71 = !DILocation(line: 34, column: 5, scope: !57)
!72 = !DILocation(line: 35, column: 35, scope: !52)
!73 = !DILocation(line: 36, column: 3, scope: !52)
!74 = !DILocation(line: 37, column: 1, scope: !43)
!75 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !12, file: !12, line: 39, type: !39, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "tc_block", scope: !75, file: !12, line: 40, type: !77)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "svp_simple_021_001_tc_block_data", file: !12, line: 12, size: 24, elements: !78)
!78 = !{!79, !80, !81}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !77, file: !12, line: 13, baseType: !23, size: 8)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !77, file: !12, line: 14, baseType: !23, size: 8, offset: 8)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "valid_len", scope: !77, file: !12, line: 15, baseType: !23, size: 8, offset: 16)
!82 = !DILocation(line: 40, column: 43, scope: !75)
!83 = !DILocation(line: 42, column: 3, scope: !75)
!84 = !DILocation(line: 44, column: 3, scope: !75)
!85 = !DILocalVariable(name: "ichan", scope: !75, file: !12, line: 45, type: !54)
!86 = !DILocation(line: 45, column: 7, scope: !75)
!87 = !DILocation(line: 46, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !75, file: !12, line: 46, column: 3)
!89 = !DILocation(line: 46, column: 8, scope: !88)
!90 = !DILocation(line: 46, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 46, column: 3)
!92 = !DILocation(line: 46, column: 25, scope: !91)
!93 = !DILocation(line: 46, column: 3, scope: !88)
!94 = !DILocation(line: 47, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !12, line: 47, column: 9)
!96 = distinct !DILexicalBlock(scope: !91, file: !12, line: 46, column: 39)
!97 = !DILocation(line: 47, column: 15, scope: !95)
!98 = !DILocation(line: 47, column: 9, scope: !96)
!99 = !DILocation(line: 48, column: 36, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !12, line: 47, column: 21)
!101 = !DILocation(line: 50, column: 11, scope: !100)
!102 = !DILocation(line: 49, column: 46, scope: !100)
!103 = !DILocation(line: 51, column: 5, scope: !100)
!104 = !DILocation(line: 52, column: 36, scope: !105)
!105 = distinct !DILexicalBlock(scope: !95, file: !12, line: 51, column: 12)
!106 = !DILocation(line: 54, column: 11, scope: !105)
!107 = !DILocation(line: 53, column: 46, scope: !105)
!108 = !DILocation(line: 57, column: 23, scope: !96)
!109 = !DILocation(line: 57, column: 52, scope: !96)
!110 = !DILocation(line: 57, column: 21, scope: !96)
!111 = !DILocation(line: 57, column: 14, scope: !96)
!112 = !DILocation(line: 57, column: 19, scope: !96)
!113 = !DILocation(line: 58, column: 21, scope: !96)
!114 = !DILocation(line: 58, column: 50, scope: !96)
!115 = !DILocation(line: 58, column: 19, scope: !96)
!116 = !DILocation(line: 58, column: 14, scope: !96)
!117 = !DILocation(line: 58, column: 17, scope: !96)
!118 = !DILocation(line: 59, column: 28, scope: !96)
!119 = !DILocation(line: 59, column: 57, scope: !96)
!120 = !DILocation(line: 59, column: 26, scope: !96)
!121 = !DILocation(line: 59, column: 14, scope: !96)
!122 = !DILocation(line: 59, column: 24, scope: !96)
!123 = !DILocation(line: 60, column: 3, scope: !96)
!124 = !DILocation(line: 46, column: 35, scope: !91)
!125 = !DILocation(line: 46, column: 3, scope: !91)
!126 = distinct !{!126, !93, !127}
!127 = !DILocation(line: 60, column: 3, scope: !88)
!128 = !DILocation(line: 61, column: 1, scope: !75)
!129 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !12, file: !12, line: 63, type: !39, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocation(line: 65, column: 8, scope: !129)
!131 = !DILocation(line: 65, column: 34, scope: !129)
!132 = !DILocation(line: 65, column: 40, scope: !129)
!133 = !DILocation(line: 65, column: 7, scope: !129)
!134 = !DILocation(line: 64, column: 46, scope: !129)
!135 = !DILocation(line: 66, column: 1, scope: !129)
