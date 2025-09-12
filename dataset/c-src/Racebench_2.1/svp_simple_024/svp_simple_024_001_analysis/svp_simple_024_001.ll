; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_024/svp_simple_024_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_024/svp_simple_024_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%union.bytetoword = type { i32 }

@svp_simple_024_001_global_array = common global [100 x i32*] zeroinitializer, align 16, !dbg !0
@svp_simple_024_001_reset_RT = common global i8 0, align 1, !dbg !11
@svp_simple_024_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_024_001_main() #0 !dbg !27 {
  %1 = alloca %union.bytetoword, align 4
  %2 = alloca %union.bytetoword, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %union.bytetoword* %1, metadata !30, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %union.bytetoword* %2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @svp_simple_024_001_init(), !dbg !42
  %4 = call i32 @svp_simple_024_001_RTData(i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i32 0), !dbg !43
  %5 = bitcast %union.bytetoword* %1 to i32*, !dbg !44
  store i32 %4, i32* %5, align 4, !dbg !45
  %6 = call i32 @svp_simple_024_001_RTData(i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i32 1), !dbg !46
  %7 = bitcast %union.bytetoword* %2 to i32*, !dbg !47
  store i32 %6, i32* %7, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %3, metadata !49, metadata !DIExpression()), !dbg !50
  %8 = bitcast %union.bytetoword* %1 to i32*, !dbg !51
  %9 = load i32, i32* %8, align 4, !dbg !51
  %10 = bitcast %union.bytetoword* %2 to i32*, !dbg !52
  %11 = load i32, i32* %10, align 4, !dbg !52
  %12 = and i32 %11, 752, !dbg !53
  %13 = or i32 %9, %12, !dbg !54
  store i32 %13, i32* %3, align 4, !dbg !50
  %14 = load i32, i32* %3, align 4, !dbg !55
  switch i32 %14, label %17 [
    i32 752, label %15
    i32 912, label %16
  ], !dbg !56

15:                                               ; preds = %0
  store volatile i8 1, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !57
  br label %18, !dbg !59

16:                                               ; preds = %0
  store volatile i8 0, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !60
  br label %18, !dbg !61

17:                                               ; preds = %0
  br label %18, !dbg !62

18:                                               ; preds = %17, %16, %15
  ret void, !dbg !63
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_024_001_RTData(i32* %0, i32 %1) #0 !dbg !64 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %union.bytetoword, align 4
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %union.bytetoword* %5, metadata !72, metadata !DIExpression()), !dbg !73
  %6 = load i32*, i32** %3, align 8, !dbg !74
  %7 = load i32, i32* %4, align 4, !dbg !75
  %8 = add nsw i32 %7, 1, !dbg !76
  %9 = sext i32 %8 to i64, !dbg !74
  %10 = getelementptr inbounds i32, i32* %6, i64 %9, !dbg !74
  %11 = load i32, i32* %10, align 4, !dbg !74
  %12 = trunc i32 %11 to i8, !dbg !74
  %13 = bitcast %union.bytetoword* %5 to [2 x i8]*, !dbg !77
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* %13, i64 0, i64 0, !dbg !78
  store i8 %12, i8* %14, align 4, !dbg !79
  %15 = load i32*, i32** %3, align 8, !dbg !80
  %16 = load i32, i32* %4, align 4, !dbg !81
  %17 = sext i32 %16 to i64, !dbg !80
  %18 = getelementptr inbounds i32, i32* %15, i64 %17, !dbg !80
  %19 = load i32, i32* %18, align 4, !dbg !80
  %20 = trunc i32 %19 to i8, !dbg !80
  %21 = bitcast %union.bytetoword* %5 to [2 x i8]*, !dbg !82
  %22 = getelementptr inbounds [2 x i8], [2 x i8]* %21, i64 0, i64 1, !dbg !83
  store i8 %20, i8* %22, align 1, !dbg !84
  %23 = bitcast %union.bytetoword* %5 to i32*, !dbg !85
  %24 = load i32, i32* %23, align 4, !dbg !85
  ret i32 %24, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_024_001_init() #0 !dbg !87 {
  call void (...) @init(), !dbg !88
  ret void, !dbg !89
}

declare void @init(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_024_001_isr_1() #0 !dbg !90 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !91, metadata !DIExpression()), !dbg !93
  store i32 0, i32* %1, align 4, !dbg !93
  br label %2, !dbg !94

2:                                                ; preds = %9, %0
  %3 = load i32, i32* %1, align 4, !dbg !95
  %4 = icmp slt i32 %3, 100, !dbg !97
  br i1 %4, label %5, label %12, !dbg !98

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !99
  %7 = sext i32 %6 to i64, !dbg !101
  %8 = getelementptr inbounds [100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 %7, !dbg !101
  store i32* null, i32** %8, align 8, !dbg !102
  br label %9, !dbg !103

9:                                                ; preds = %5
  %10 = load i32, i32* %1, align 4, !dbg !104
  %11 = add nsw i32 %10, 1, !dbg !104
  store i32 %11, i32* %1, align 4, !dbg !104
  br label %2, !dbg !105, !llvm.loop !106

12:                                               ; preds = %2
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_024_001_global_array", scope: !2, file: !8, line: 9, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_024/svp_simple_024_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!6, !0, !11}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_024_001_global_var", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_024/svp_simple_024_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_024_001_reset_RT", scope: !2, file: !8, line: 10, type: !13, isLocal: false, isDefinition: true)
!13 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "unsigned8", file: !15, line: 20, baseType: !16)
!15 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_024/../common.h", directory: "/Users/hehang03/code/clover")
!16 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !19)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!19 = !{!20}
!20 = !DISubrange(count: 100)
!21 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{!"clang version 10.0.0 "}
!27 = distinct !DISubprogram(name: "svp_simple_024_001_main", scope: !8, file: !8, line: 14, type: !28, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "svp_simple_024_001_local_a", scope: !27, file: !8, line: 15, type: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "bytetoword", file: !8, line: 3, size: 32, elements: !32)
!32 = !{!33, !37}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "bytedata", scope: !31, file: !8, line: 4, baseType: !34, size: 16)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 2)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "worddata", scope: !31, file: !8, line: 5, baseType: !38, size: 32)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 15, column: 20, scope: !27)
!40 = !DILocalVariable(name: "svp_simple_024_001_local_b", scope: !27, file: !8, line: 15, type: !31)
!41 = !DILocation(line: 15, column: 48, scope: !27)
!42 = !DILocation(line: 16, column: 3, scope: !27)
!43 = !DILocation(line: 17, column: 41, scope: !27)
!44 = !DILocation(line: 17, column: 30, scope: !27)
!45 = !DILocation(line: 17, column: 39, scope: !27)
!46 = !DILocation(line: 18, column: 41, scope: !27)
!47 = !DILocation(line: 18, column: 30, scope: !27)
!48 = !DILocation(line: 18, column: 39, scope: !27)
!49 = !DILocalVariable(name: "svp_simple_024_001_local_casereg", scope: !27, file: !8, line: 19, type: !10)
!50 = !DILocation(line: 19, column: 7, scope: !27)
!51 = !DILocation(line: 20, column: 34, scope: !27)
!52 = !DILocation(line: 20, column: 72, scope: !27)
!53 = !DILocation(line: 20, column: 81, scope: !27)
!54 = !DILocation(line: 20, column: 43, scope: !27)
!55 = !DILocation(line: 22, column: 11, scope: !27)
!56 = !DILocation(line: 22, column: 3, scope: !27)
!57 = !DILocation(line: 24, column: 35, scope: !58)
!58 = distinct !DILexicalBlock(scope: !27, file: !8, line: 22, column: 45)
!59 = !DILocation(line: 25, column: 7, scope: !58)
!60 = !DILocation(line: 27, column: 35, scope: !58)
!61 = !DILocation(line: 28, column: 7, scope: !58)
!62 = !DILocation(line: 30, column: 7, scope: !58)
!63 = !DILocation(line: 32, column: 1, scope: !27)
!64 = distinct !DISubprogram(name: "svp_simple_024_001_RTData", scope: !8, file: !8, line: 39, type: !65, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!38, !67, !10}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!68 = !DILocalVariable(name: "array", arg: 1, scope: !64, file: !8, line: 39, type: !67)
!69 = !DILocation(line: 39, column: 45, scope: !64)
!70 = !DILocalVariable(name: "index", arg: 2, scope: !64, file: !8, line: 39, type: !10)
!71 = !DILocation(line: 39, column: 56, scope: !64)
!72 = !DILocalVariable(name: "svp_simple_024_001_local_r", scope: !64, file: !8, line: 40, type: !31)
!73 = !DILocation(line: 40, column: 20, scope: !64)
!74 = !DILocation(line: 41, column: 44, scope: !64)
!75 = !DILocation(line: 41, column: 50, scope: !64)
!76 = !DILocation(line: 41, column: 56, scope: !64)
!77 = !DILocation(line: 41, column: 30, scope: !64)
!78 = !DILocation(line: 41, column: 3, scope: !64)
!79 = !DILocation(line: 41, column: 42, scope: !64)
!80 = !DILocation(line: 42, column: 44, scope: !64)
!81 = !DILocation(line: 42, column: 50, scope: !64)
!82 = !DILocation(line: 42, column: 30, scope: !64)
!83 = !DILocation(line: 42, column: 3, scope: !64)
!84 = !DILocation(line: 42, column: 42, scope: !64)
!85 = !DILocation(line: 44, column: 37, scope: !64)
!86 = !DILocation(line: 44, column: 3, scope: !64)
!87 = distinct !DISubprogram(name: "svp_simple_024_001_init", scope: !8, file: !8, line: 33, type: !28, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 36, column: 3, scope: !87)
!89 = !DILocation(line: 37, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "svp_simple_024_001_isr_1", scope: !8, file: !8, line: 46, type: !28, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "i", scope: !92, file: !8, line: 47, type: !10)
!92 = distinct !DILexicalBlock(scope: !90, file: !8, line: 47, column: 3)
!93 = !DILocation(line: 47, column: 12, scope: !92)
!94 = !DILocation(line: 47, column: 8, scope: !92)
!95 = !DILocation(line: 47, column: 19, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !8, line: 47, column: 3)
!97 = !DILocation(line: 47, column: 21, scope: !96)
!98 = !DILocation(line: 47, column: 3, scope: !92)
!99 = !DILocation(line: 48, column: 37, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !8, line: 47, column: 33)
!101 = !DILocation(line: 48, column: 5, scope: !100)
!102 = !DILocation(line: 48, column: 40, scope: !100)
!103 = !DILocation(line: 49, column: 3, scope: !100)
!104 = !DILocation(line: 47, column: 29, scope: !96)
!105 = !DILocation(line: 47, column: 3, scope: !96)
!106 = distinct !{!106, !98, !107}
!107 = !DILocation(line: 49, column: 3, scope: !92)
!108 = !DILocation(line: 50, column: 1, scope: !90)
