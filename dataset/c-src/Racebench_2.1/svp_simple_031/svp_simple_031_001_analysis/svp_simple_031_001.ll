; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_031/svp_simple_031_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_031/svp_simple_031_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%struct.svp_simple_031_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_031_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16, !dbg !0
@svp_simple_031_001_tc_buff_p = common global i8* null, align 8, !dbg !29
@svp_simple_031_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2, !dbg !10
@svp_simple_031_001_tc_block_rcvd_bytes = common global i16 0, align 2, !dbg !19
@svp_simple_031_001_gloable_var1 = common global i32 0, align 4, !dbg !32
@svp_simple_031_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2, !dbg !17
@svp_simple_031_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16, !dbg !21

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_031_001_main() #0 !dbg !42 {
  %1 = alloca %struct.svp_simple_031_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  call void @svp_simple_031_001_init(), !dbg !45
  call void @llvm.dbg.declare(metadata %struct.svp_simple_031_001_tc_block_data* %1, metadata !46, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %2, metadata !53, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %2, align 4, !dbg !55
  %3 = load i32, i32* %2, align 4, !dbg !56
  %4 = icmp eq i32 %3, 0, !dbg !58
  br i1 %4, label %5, label %7, !dbg !59

5:                                                ; preds = %0
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_031_001_tc_chan1_buff, i64 0, i64 0), i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !60
  %6 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !62
  store volatile i16 %6, i16* @svp_simple_031_001_tc_block_rcvd_bytes, align 2, !dbg !63
  br label %7, !dbg !64

7:                                                ; preds = %5, %0
  %8 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !65
  %9 = getelementptr inbounds i8, i8* %8, i64 2, !dbg !66
  %10 = load volatile i8, i8* %9, align 1, !dbg !67
  %11 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 0, !dbg !68
  store i8 %10, i8* %11, align 1, !dbg !69
  %12 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !70
  %13 = getelementptr inbounds i8, i8* %12, i64 4, !dbg !71
  %14 = load volatile i8, i8* %13, align 1, !dbg !72
  %15 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 1, !dbg !73
  store i8 %14, i8* %15, align 1, !dbg !74
  %16 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !75
  %17 = getelementptr inbounds i8, i8* %16, i64 5, !dbg !76
  %18 = load volatile i8, i8* %17, align 1, !dbg !77
  %19 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 2, !dbg !78
  store i8 %18, i8* %19, align 1, !dbg !79
  call void @svp_simple_031_001_func_3(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_031_001_func_1(i32 %0, i32 %1) #0 !dbg !82 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %5, metadata !89, metadata !DIExpression()), !dbg !90
  %6 = load i32, i32* %3, align 4, !dbg !91
  %7 = load i32, i32* %4, align 4, !dbg !93
  %8 = icmp slt i32 %6, %7, !dbg !94
  br i1 %8, label %9, label %13, !dbg !95

9:                                                ; preds = %2
  %10 = load i32, i32* %3, align 4, !dbg !96
  %11 = load i32, i32* %4, align 4, !dbg !98
  %12 = mul nsw i32 %10, %11, !dbg !99
  store i32 %12, i32* %5, align 4, !dbg !100
  br label %15, !dbg !101

13:                                               ; preds = %2
  %14 = call i32 @svp_simple_031_001_func_2(i32 10), !dbg !102
  store i32 %14, i32* %5, align 4, !dbg !104
  br label %15

15:                                               ; preds = %13, %9
  %16 = load i32, i32* %5, align 4, !dbg !105
  ret i32 %16, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_031_001_func_2(i32 %0) #0 !dbg !107 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !110, metadata !DIExpression()), !dbg !111
  %4 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !112
  %5 = zext i16 %4 to i32, !dbg !112
  %6 = icmp sgt i32 %5, 0, !dbg !114
  br i1 %6, label %7, label %9, !dbg !115

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !116
  store i32 %8, i32* %2, align 4, !dbg !118
  br label %10, !dbg !118

9:                                                ; preds = %1
  store i32 0, i32* %2, align 4, !dbg !119
  br label %10, !dbg !119

10:                                               ; preds = %9, %7
  %11 = load i32, i32* %2, align 4, !dbg !121
  ret i32 %11, !dbg !121
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_031_001_init() #0 !dbg !122 {
  call void (...) @init(), !dbg !123
  ret void, !dbg !124
}

declare void @init(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_031_001_func_3() #0 !dbg !125 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 0, i32* %1, align 4, !dbg !128
  %2 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !129
  %3 = zext i16 %2 to i32, !dbg !129
  %4 = icmp sge i32 %3, 16, !dbg !131
  br i1 %4, label %5, label %10, !dbg !132

5:                                                ; preds = %0
  %6 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !133
  %7 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !135
  %8 = zext i16 %7 to i32, !dbg !135
  %9 = call i32 @svp_simple_031_001_func_1(i32 %6, i32 %8), !dbg !136
  br label %10, !dbg !137

10:                                               ; preds = %5, %0
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_031_001_isr_1() #0 !dbg !139 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !140
  %2 = lshr i32 %1, 3, !dbg !141
  %3 = and i32 %2, 8191, !dbg !142
  %4 = trunc i32 %3 to i16, !dbg !143
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!36, !37, !38, !39, !40}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_chan1_buff", scope: !2, file: !12, line: 13, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_031/svp_simple_031_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!10, !17, !19, !0, !21, !29, !32}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_block_rcvd_bytes_ch1", scope: !2, file: !12, line: 10, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_031/svp_simple_031_001.c", directory: "/Users/hehang03/code/clover")
!13 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned16", file: !15, line: 21, baseType: !16)
!15 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_031/../common.h", directory: "/Users/hehang03/code/clover")
!16 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_block_rcvd_bytes_ch2", scope: !2, file: !12, line: 11, type: !13, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_block_rcvd_bytes", scope: !2, file: !12, line: 12, type: !13, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_chan2_buff", scope: !2, file: !12, line: 14, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 2048, elements: !27)
!24 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned8", file: !15, line: 20, baseType: !26)
!26 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!27 = !{!28}
!28 = !DISubrange(count: 256)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "svp_simple_031_001_tc_buff_p", scope: !2, file: !12, line: 15, type: !31, isLocal: false, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "svp_simple_031_001_gloable_var1", scope: !2, file: !12, line: 16, type: !34, isLocal: false, isDefinition: true)
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned32", file: !15, line: 22, baseType: !8)
!36 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!37 = !{i32 7, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"PIC Level", i32 2}
!41 = !{!"clang version 10.0.0 "}
!42 = distinct !DISubprogram(name: "svp_simple_031_001_main", scope: !12, file: !12, line: 23, type: !43, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !DILocation(line: 24, column: 3, scope: !42)
!46 = !DILocalVariable(name: "tc_block", scope: !42, file: !12, line: 25, type: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "svp_simple_031_001_tc_block_data", file: !12, line: 18, size: 24, elements: !48)
!48 = !{!49, !50, !51}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !47, file: !12, line: 19, baseType: !25, size: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !47, file: !12, line: 20, baseType: !25, size: 8, offset: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "valid_len", scope: !47, file: !12, line: 21, baseType: !25, size: 8, offset: 16)
!52 = !DILocation(line: 25, column: 43, scope: !42)
!53 = !DILocalVariable(name: "ichan", scope: !42, file: !12, line: 27, type: !54)
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DILocation(line: 27, column: 7, scope: !42)
!56 = !DILocation(line: 28, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !12, line: 28, column: 7)
!58 = !DILocation(line: 28, column: 13, scope: !57)
!59 = !DILocation(line: 28, column: 7, scope: !42)
!60 = !DILocation(line: 29, column: 34, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !12, line: 28, column: 19)
!62 = !DILocation(line: 31, column: 9, scope: !61)
!63 = !DILocation(line: 30, column: 44, scope: !61)
!64 = !DILocation(line: 32, column: 3, scope: !61)
!65 = !DILocation(line: 34, column: 21, scope: !42)
!66 = !DILocation(line: 34, column: 50, scope: !42)
!67 = !DILocation(line: 34, column: 19, scope: !42)
!68 = !DILocation(line: 34, column: 12, scope: !42)
!69 = !DILocation(line: 34, column: 17, scope: !42)
!70 = !DILocation(line: 35, column: 19, scope: !42)
!71 = !DILocation(line: 35, column: 48, scope: !42)
!72 = !DILocation(line: 35, column: 17, scope: !42)
!73 = !DILocation(line: 35, column: 12, scope: !42)
!74 = !DILocation(line: 35, column: 15, scope: !42)
!75 = !DILocation(line: 36, column: 26, scope: !42)
!76 = !DILocation(line: 36, column: 55, scope: !42)
!77 = !DILocation(line: 36, column: 24, scope: !42)
!78 = !DILocation(line: 36, column: 12, scope: !42)
!79 = !DILocation(line: 36, column: 22, scope: !42)
!80 = !DILocation(line: 37, column: 3, scope: !42)
!81 = !DILocation(line: 38, column: 1, scope: !42)
!82 = distinct !DISubprogram(name: "svp_simple_031_001_func_1", scope: !12, file: !12, line: 40, type: !83, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!54, !54, !54}
!85 = !DILocalVariable(name: "a", arg: 1, scope: !82, file: !12, line: 40, type: !54)
!86 = !DILocation(line: 40, column: 35, scope: !82)
!87 = !DILocalVariable(name: "b", arg: 2, scope: !82, file: !12, line: 40, type: !54)
!88 = !DILocation(line: 40, column: 42, scope: !82)
!89 = !DILocalVariable(name: "c", scope: !82, file: !12, line: 41, type: !54)
!90 = !DILocation(line: 41, column: 7, scope: !82)
!91 = !DILocation(line: 42, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !12, line: 42, column: 7)
!93 = !DILocation(line: 42, column: 11, scope: !92)
!94 = !DILocation(line: 42, column: 9, scope: !92)
!95 = !DILocation(line: 42, column: 7, scope: !82)
!96 = !DILocation(line: 43, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !12, line: 42, column: 14)
!98 = !DILocation(line: 43, column: 13, scope: !97)
!99 = !DILocation(line: 43, column: 11, scope: !97)
!100 = !DILocation(line: 43, column: 7, scope: !97)
!101 = !DILocation(line: 44, column: 3, scope: !97)
!102 = !DILocation(line: 45, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !92, file: !12, line: 44, column: 10)
!104 = !DILocation(line: 45, column: 7, scope: !103)
!105 = !DILocation(line: 47, column: 10, scope: !82)
!106 = !DILocation(line: 47, column: 3, scope: !82)
!107 = distinct !DISubprogram(name: "svp_simple_031_001_func_2", scope: !12, file: !12, line: 49, type: !108, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DISubroutineType(types: !109)
!109 = !{!54, !54}
!110 = !DILocalVariable(name: "x", arg: 1, scope: !107, file: !12, line: 49, type: !54)
!111 = !DILocation(line: 49, column: 35, scope: !107)
!112 = !DILocation(line: 50, column: 7, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 50, column: 7)
!114 = !DILocation(line: 50, column: 50, scope: !113)
!115 = !DILocation(line: 50, column: 7, scope: !107)
!116 = !DILocation(line: 51, column: 12, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 50, column: 55)
!118 = !DILocation(line: 51, column: 5, scope: !117)
!119 = !DILocation(line: 53, column: 5, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !12, line: 52, column: 10)
!121 = !DILocation(line: 55, column: 1, scope: !107)
!122 = distinct !DISubprogram(name: "svp_simple_031_001_init", scope: !12, file: !12, line: 57, type: !43, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocation(line: 61, column: 3, scope: !122)
!124 = !DILocation(line: 62, column: 1, scope: !122)
!125 = distinct !DISubprogram(name: "svp_simple_031_001_func_3", scope: !12, file: !12, line: 64, type: !43, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "svp_simple_031_001_flag_chan1", scope: !125, file: !12, line: 65, type: !8)
!127 = !DILocation(line: 65, column: 12, scope: !125)
!128 = !DILocation(line: 66, column: 33, scope: !125)
!129 = !DILocation(line: 68, column: 7, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 68, column: 7)
!131 = !DILocation(line: 68, column: 50, scope: !130)
!132 = !DILocation(line: 68, column: 7, scope: !125)
!133 = !DILocation(line: 69, column: 31, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 68, column: 57)
!135 = !DILocation(line: 70, column: 27, scope: !134)
!136 = !DILocation(line: 69, column: 5, scope: !134)
!137 = !DILocation(line: 71, column: 3, scope: !134)
!138 = !DILocation(line: 72, column: 1, scope: !125)
!139 = distinct !DISubprogram(name: "svp_simple_031_001_isr_1", scope: !12, file: !12, line: 74, type: !43, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocation(line: 76, column: 8, scope: !139)
!141 = !DILocation(line: 76, column: 34, scope: !139)
!142 = !DILocation(line: 76, column: 40, scope: !139)
!143 = !DILocation(line: 76, column: 7, scope: !139)
!144 = !DILocation(line: 75, column: 46, scope: !139)
!145 = !DILocation(line: 77, column: 1, scope: !139)
