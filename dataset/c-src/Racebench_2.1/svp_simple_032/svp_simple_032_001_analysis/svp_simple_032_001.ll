; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_032/svp_simple_032_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_032/svp_simple_032_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_022_001_global_var1 = common global i32 0, align 4, !dbg !0
@svp_simple_022_001_global_var2 = common global i32 0, align 4, !dbg !6
@svp_simple_022_001_global_var3 = common global i32 0, align 4, !dbg !11
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_main() #0 !dbg !24 {
  %1 = alloca i32, align 4
  %2 = call i32 (...) @rand(), !dbg !27
  store volatile i32 %2, i32* @svp_simple_022_001_global_var1, align 4, !dbg !28
  %3 = call i32 (...) @rand(), !dbg !29
  store volatile i32 %3, i32* @svp_simple_022_001_global_var2, align 4, !dbg !30
  %4 = call i32 (...) @rand(), !dbg !31
  store volatile i32 %4, i32* @svp_simple_022_001_global_var3, align 4, !dbg !32
  call void (...) @init(), !dbg !33
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !34
  %5 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !35
  %6 = icmp sge i32 %5, 12, !dbg !37
  br i1 %6, label %7, label %8, !dbg !38

7:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !39
  br label %9, !dbg !41

8:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !42
  br label %9

9:                                                ; preds = %8, %7
  call void @llvm.dbg.declare(metadata i32* %1, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %1, align 4, !dbg !46
  br label %10, !dbg !48

10:                                               ; preds = %17, %9
  %11 = load i32, i32* %1, align 4, !dbg !49
  %12 = icmp slt i32 %11, 256, !dbg !51
  br i1 %12, label %13, label %20, !dbg !52

13:                                               ; preds = %10
  %14 = load i32, i32* %1, align 4, !dbg !53
  %15 = sext i32 %14 to i64, !dbg !55
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %15, !dbg !55
  store volatile i32 0, i32* %16, align 4, !dbg !56
  br label %17, !dbg !57

17:                                               ; preds = %13
  %18 = load i32, i32* %1, align 4, !dbg !58
  %19 = add nsw i32 %18, 1, !dbg !58
  store i32 %19, i32* %1, align 4, !dbg !58
  br label %10, !dbg !59, !llvm.loop !60

20:                                               ; preds = %10
  %21 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !62
  store volatile i32 %21, i32* @svp_simple_022_001_global_var3, align 4, !dbg !63
  %22 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !64
  store volatile i32 %22, i32* @svp_simple_022_001_global_var3, align 4, !dbg !65
  ret void, !dbg !66
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_init() #0 !dbg !67 {
  %1 = call i32 (...) @rand(), !dbg !68
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !69
  %2 = call i32 (...) @rand(), !dbg !70
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !71
  %3 = call i32 (...) @rand(), !dbg !72
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !73
  call void (...) @init(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !76 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !77
  %2 = icmp sge i32 %1, 12, !dbg !79
  br i1 %2, label %3, label %4, !dbg !80

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !81
  br label %5, !dbg !83

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !84
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !87 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !88
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !91 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !92
  %2 = icmp sge i32 %1, 12, !dbg !94
  br i1 %2, label %3, label %4, !dbg !95

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !96
  br label %5, !dbg !98

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !99
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !102 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !103
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !106 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var1", scope: !2, file: !8, line: 3, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_032/svp_simple_032_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var2", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_032/svp_simple_032_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_var3", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_022_001_global_array", scope: !2, file: !8, line: 6, type: !15, isLocal: false, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8192, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 256)
!18 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{!"clang version 10.0.0 "}
!24 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 18, type: !25, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocation(line: 19, column: 38, scope: !24)
!28 = !DILocation(line: 19, column: 36, scope: !24)
!29 = !DILocation(line: 20, column: 38, scope: !24)
!30 = !DILocation(line: 20, column: 36, scope: !24)
!31 = !DILocation(line: 21, column: 38, scope: !24)
!32 = !DILocation(line: 21, column: 36, scope: !24)
!33 = !DILocation(line: 23, column: 5, scope: !24)
!34 = !DILocation(line: 25, column: 34, scope: !24)
!35 = !DILocation(line: 26, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !24, file: !8, line: 26, column: 11)
!37 = !DILocation(line: 26, column: 42, scope: !36)
!38 = !DILocation(line: 26, column: 11, scope: !24)
!39 = !DILocation(line: 28, column: 40, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !8, line: 27, column: 7)
!41 = !DILocation(line: 29, column: 7, scope: !40)
!42 = !DILocation(line: 32, column: 40, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !8, line: 31, column: 7)
!44 = !DILocalVariable(name: "i", scope: !24, file: !8, line: 34, type: !10)
!45 = !DILocation(line: 34, column: 7, scope: !24)
!46 = !DILocation(line: 35, column: 10, scope: !47)
!47 = distinct !DILexicalBlock(scope: !24, file: !8, line: 35, column: 3)
!48 = !DILocation(line: 35, column: 8, scope: !47)
!49 = !DILocation(line: 35, column: 15, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !8, line: 35, column: 3)
!51 = !DILocation(line: 35, column: 17, scope: !50)
!52 = !DILocation(line: 35, column: 3, scope: !47)
!53 = !DILocation(line: 37, column: 37, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !8, line: 36, column: 3)
!55 = !DILocation(line: 37, column: 5, scope: !54)
!56 = !DILocation(line: 37, column: 40, scope: !54)
!57 = !DILocation(line: 38, column: 3, scope: !54)
!58 = !DILocation(line: 35, column: 25, scope: !50)
!59 = !DILocation(line: 35, column: 3, scope: !50)
!60 = distinct !{!60, !52, !61}
!61 = !DILocation(line: 38, column: 3, scope: !47)
!62 = !DILocation(line: 39, column: 40, scope: !24)
!63 = !DILocation(line: 39, column: 38, scope: !24)
!64 = !DILocation(line: 40, column: 36, scope: !24)
!65 = !DILocation(line: 40, column: 34, scope: !24)
!66 = !DILocation(line: 41, column: 1, scope: !24)
!67 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 43, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 44, column: 36, scope: !67)
!69 = !DILocation(line: 44, column: 34, scope: !67)
!70 = !DILocation(line: 45, column: 36, scope: !67)
!71 = !DILocation(line: 45, column: 34, scope: !67)
!72 = !DILocation(line: 46, column: 36, scope: !67)
!73 = !DILocation(line: 46, column: 34, scope: !67)
!74 = !DILocation(line: 48, column: 3, scope: !67)
!75 = !DILocation(line: 49, column: 1, scope: !67)
!76 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 51, type: !25, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 52, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !76, file: !8, line: 52, column: 9)
!79 = !DILocation(line: 52, column: 40, scope: !78)
!80 = !DILocation(line: 52, column: 9, scope: !76)
!81 = !DILocation(line: 54, column: 38, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !8, line: 53, column: 5)
!83 = !DILocation(line: 55, column: 5, scope: !82)
!84 = !DILocation(line: 58, column: 38, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !8, line: 57, column: 5)
!86 = !DILocation(line: 60, column: 1, scope: !76)
!87 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 62, type: !25, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 63, column: 38, scope: !87)
!89 = !DILocation(line: 63, column: 36, scope: !87)
!90 = !DILocation(line: 64, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 66, type: !25, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocation(line: 67, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !8, line: 67, column: 7)
!94 = !DILocation(line: 67, column: 38, scope: !93)
!95 = !DILocation(line: 67, column: 7, scope: !91)
!96 = !DILocation(line: 69, column: 36, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !8, line: 68, column: 3)
!98 = !DILocation(line: 70, column: 3, scope: !97)
!99 = !DILocation(line: 73, column: 36, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !8, line: 72, column: 3)
!101 = !DILocation(line: 75, column: 1, scope: !91)
!102 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 77, type: !25, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocation(line: 78, column: 36, scope: !102)
!104 = !DILocation(line: 78, column: 34, scope: !102)
!105 = !DILocation(line: 79, column: 1, scope: !102)
!106 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 81, type: !25, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocation(line: 82, column: 34, scope: !106)
!108 = !DILocation(line: 83, column: 1, scope: !106)
