; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_004/svp_simple_004_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_004/svp_simple_004_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_004_001_condition1 = global i32 1, align 4, !dbg !0
@svp_simple_004_001_condition2 = global i32 1, align 4, !dbg !6
@svp_simple_004_001_condition3 = global i32 1, align 4, !dbg !11
@svp_simple_004_001_condition4 = global i32 1, align 4, !dbg !13
@svp_simple_004_001_condition5 = global i32 1, align 4, !dbg !15
@svp_simple_004_001_condition6 = global i32 1, align 4, !dbg !17
@svp_simple_004_001_global_var1 = global i32 17, align 4, !dbg !19
@svp_simple_004_001_global_var2 = global i32 34, align 4, !dbg !21
@svp_simple_004_001_global_var3 = global i32 51, align 4, !dbg !23

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_004_001_main() #0 !dbg !31 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void (...) @init(), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %1, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %2, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %3, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %4, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %5, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %6, metadata !45, metadata !DIExpression()), !dbg !46
  call void @disable_isr(i32 2), !dbg !47
  %7 = load volatile i32, i32* @svp_simple_004_001_condition1, align 4, !dbg !48
  %8 = icmp eq i32 %7, 1, !dbg !50
  br i1 %8, label %9, label %12, !dbg !51

9:                                                ; preds = %0
  %10 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !52
  store i32 %10, i32* %1, align 4, !dbg !54
  %11 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !55
  store i32 %11, i32* %5, align 4, !dbg !56
  br label %12, !dbg !57

12:                                               ; preds = %9, %0
  %13 = load volatile i32, i32* @svp_simple_004_001_condition2, align 4, !dbg !58
  %14 = icmp eq i32 %13, 1, !dbg !60
  br i1 %14, label %15, label %18, !dbg !61

15:                                               ; preds = %12
  %16 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !62
  store i32 %16, i32* %2, align 4, !dbg !64
  %17 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !65
  store i32 %17, i32* %6, align 4, !dbg !66
  br label %18, !dbg !67

18:                                               ; preds = %15, %12
  %19 = load volatile i32, i32* @svp_simple_004_001_condition4, align 4, !dbg !68
  %20 = icmp eq i32 %19, 1, !dbg !70
  br i1 %20, label %21, label %23, !dbg !71

21:                                               ; preds = %18
  %22 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !72
  store i32 %22, i32* %3, align 4, !dbg !73
  br label %23, !dbg !74

23:                                               ; preds = %21, %18
  %24 = load volatile i32, i32* @svp_simple_004_001_condition5, align 4, !dbg !75
  %25 = icmp eq i32 %24, 1, !dbg !77
  br i1 %25, label %26, label %28, !dbg !78

26:                                               ; preds = %23
  %27 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !79
  store i32 %27, i32* %4, align 4, !dbg !80
  br label %28, !dbg !81

28:                                               ; preds = %26, %23
  ret void, !dbg !82
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare void @disable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_004_001_isr_1() #0 !dbg !83 {
  store volatile i32 0, i32* @svp_simple_004_001_condition6, align 4, !dbg !84
  %1 = load volatile i32, i32* @svp_simple_004_001_condition3, align 4, !dbg !85
  %2 = icmp eq i32 %1, 1, !dbg !87
  br i1 %2, label %3, label %4, !dbg !88

3:                                                ; preds = %0
  store volatile i32 170, i32* @svp_simple_004_001_global_var1, align 4, !dbg !89
  br label %5, !dbg !90

4:                                                ; preds = %0
  store volatile i32 204, i32* @svp_simple_004_001_global_var3, align 4, !dbg !91
  br label %5

5:                                                ; preds = %4, %3
  call void @enable_isr(i32 2), !dbg !92
  ret void, !dbg !93
}

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_004_001_isr_2() #0 !dbg !94 {
  %1 = load volatile i32, i32* @svp_simple_004_001_condition6, align 4, !dbg !95
  %2 = icmp eq i32 %1, 1, !dbg !97
  br i1 %2, label %3, label %4, !dbg !98

3:                                                ; preds = %0
  store volatile i32 34, i32* @svp_simple_004_001_global_var2, align 4, !dbg !99
  br label %4, !dbg !100

4:                                                ; preds = %3, %0
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!25, !26, !27, !28, !29}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition1", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_004/svp_simple_004_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11, !13, !15, !17, !19, !21, !23}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition2", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_004/svp_simple_004_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition3", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition4", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition5", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "svp_simple_004_001_condition6", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "svp_simple_004_001_global_var1", scope: !2, file: !8, line: 14, type: !9, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "svp_simple_004_001_global_var2", scope: !2, file: !8, line: 15, type: !9, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "svp_simple_004_001_global_var3", scope: !2, file: !8, line: 16, type: !9, isLocal: false, isDefinition: true)
!25 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"PIC Level", i32 2}
!30 = !{!"clang version 10.0.0 "}
!31 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !8, file: !8, line: 18, type: !32, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocation(line: 19, column: 3, scope: !31)
!35 = !DILocalVariable(name: "reader1", scope: !31, file: !8, line: 20, type: !10)
!36 = !DILocation(line: 20, column: 7, scope: !31)
!37 = !DILocalVariable(name: "reader2", scope: !31, file: !8, line: 20, type: !10)
!38 = !DILocation(line: 20, column: 16, scope: !31)
!39 = !DILocalVariable(name: "reader3", scope: !31, file: !8, line: 21, type: !10)
!40 = !DILocation(line: 21, column: 7, scope: !31)
!41 = !DILocalVariable(name: "reader4", scope: !31, file: !8, line: 21, type: !10)
!42 = !DILocation(line: 21, column: 16, scope: !31)
!43 = !DILocalVariable(name: "reader5", scope: !31, file: !8, line: 22, type: !10)
!44 = !DILocation(line: 22, column: 7, scope: !31)
!45 = !DILocalVariable(name: "reader6", scope: !31, file: !8, line: 22, type: !10)
!46 = !DILocation(line: 22, column: 16, scope: !31)
!47 = !DILocation(line: 23, column: 3, scope: !31)
!48 = !DILocation(line: 25, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !8, line: 25, column: 7)
!50 = !DILocation(line: 25, column: 37, scope: !49)
!51 = !DILocation(line: 25, column: 7, scope: !31)
!52 = !DILocation(line: 26, column: 15, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 25, column: 43)
!54 = !DILocation(line: 26, column: 13, scope: !53)
!55 = !DILocation(line: 27, column: 15, scope: !53)
!56 = !DILocation(line: 27, column: 13, scope: !53)
!57 = !DILocation(line: 28, column: 3, scope: !53)
!58 = !DILocation(line: 30, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !31, file: !8, line: 30, column: 7)
!60 = !DILocation(line: 30, column: 37, scope: !59)
!61 = !DILocation(line: 30, column: 7, scope: !31)
!62 = !DILocation(line: 31, column: 15, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 30, column: 43)
!64 = !DILocation(line: 31, column: 13, scope: !63)
!65 = !DILocation(line: 32, column: 15, scope: !63)
!66 = !DILocation(line: 32, column: 13, scope: !63)
!67 = !DILocation(line: 33, column: 3, scope: !63)
!68 = !DILocation(line: 35, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !31, file: !8, line: 35, column: 7)
!70 = !DILocation(line: 35, column: 37, scope: !69)
!71 = !DILocation(line: 35, column: 7, scope: !31)
!72 = !DILocation(line: 35, column: 53, scope: !69)
!73 = !DILocation(line: 35, column: 51, scope: !69)
!74 = !DILocation(line: 35, column: 43, scope: !69)
!75 = !DILocation(line: 37, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !31, file: !8, line: 37, column: 7)
!77 = !DILocation(line: 37, column: 37, scope: !76)
!78 = !DILocation(line: 37, column: 7, scope: !31)
!79 = !DILocation(line: 37, column: 53, scope: !76)
!80 = !DILocation(line: 37, column: 51, scope: !76)
!81 = !DILocation(line: 37, column: 43, scope: !76)
!82 = !DILocation(line: 38, column: 1, scope: !31)
!83 = distinct !DISubprogram(name: "svp_simple_004_001_isr_1", scope: !8, file: !8, line: 40, type: !32, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 41, column: 33, scope: !83)
!85 = !DILocation(line: 43, column: 7, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !8, line: 43, column: 7)
!87 = !DILocation(line: 43, column: 37, scope: !86)
!88 = !DILocation(line: 43, column: 7, scope: !83)
!89 = !DILocation(line: 44, column: 36, scope: !86)
!90 = !DILocation(line: 44, column: 5, scope: !86)
!91 = !DILocation(line: 46, column: 36, scope: !86)
!92 = !DILocation(line: 48, column: 3, scope: !83)
!93 = !DILocation(line: 49, column: 1, scope: !83)
!94 = distinct !DISubprogram(name: "svp_simple_004_001_isr_2", scope: !8, file: !8, line: 51, type: !32, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 52, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !8, line: 52, column: 7)
!97 = !DILocation(line: 52, column: 37, scope: !96)
!98 = !DILocation(line: 52, column: 7, scope: !94)
!99 = !DILocation(line: 53, column: 36, scope: !96)
!100 = !DILocation(line: 53, column: 5, scope: !96)
!101 = !DILocation(line: 54, column: 1, scope: !94)
