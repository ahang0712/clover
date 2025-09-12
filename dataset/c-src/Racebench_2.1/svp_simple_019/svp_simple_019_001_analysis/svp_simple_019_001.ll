; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_019/svp_simple_019_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_019/svp_simple_019_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_019_001_global_condition1 = global i32 1, align 4, !dbg !0
@svp_simple_019_001_global_condiiton2 = global i32 1, align 4, !dbg !6
@svp_simple_019_001_global_condition3 = global i32 1, align 4, !dbg !11
@svp_simple_019_001_global_para1 = common global i32 0, align 4, !dbg !13
@svp_simple_019_001_global_para2 = common global i32 0, align 4, !dbg !15
@svp_simple_019_001_global_para3 = common global i32 0, align 4, !dbg !17
@svp_simple_019_001_global_var2 = common global i32 0, align 4, !dbg !21
@svp_simple_019_001_global_var1 = common global i32 0, align 4, !dbg !19

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_019_001_main() #0 !dbg !29 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %3, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %4, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void (...) @init(), !dbg !42
  %6 = call i32 (...) @rand(), !dbg !43
  %7 = srem i32 %6, 10, !dbg !44
  store volatile i32 %7, i32* @svp_simple_019_001_global_para1, align 4, !dbg !45
  %8 = call i32 (...) @rand(), !dbg !46
  %9 = srem i32 %8, 10, !dbg !47
  store volatile i32 %9, i32* @svp_simple_019_001_global_para2, align 4, !dbg !48
  %10 = call i32 (...) @rand(), !dbg !49
  %11 = srem i32 %10, 10, !dbg !50
  store volatile i32 %11, i32* @svp_simple_019_001_global_para3, align 4, !dbg !51
  %12 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !52
  %13 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !54
  %14 = add nsw i32 %12, %13, !dbg !55
  %15 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !56
  %16 = icmp sgt i32 %14, %15, !dbg !57
  br i1 %16, label %17, label %19, !dbg !58

17:                                               ; preds = %0
  %18 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !59
  store i32 %18, i32* %1, align 4, !dbg !60
  br label %19, !dbg !61

19:                                               ; preds = %17, %0
  %20 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !62
  store i32 %20, i32* %2, align 4, !dbg !63
  %21 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !64
  %22 = icmp eq i32 %21, 1, !dbg !66
  br i1 %22, label %23, label %28, !dbg !67

23:                                               ; preds = %19
  %24 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !68
  %25 = icmp eq i32 %24, 1, !dbg !69
  br i1 %25, label %26, label %28, !dbg !70

26:                                               ; preds = %23
  %27 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !71
  store i32 %27, i32* %3, align 4, !dbg !72
  br label %28, !dbg !73

28:                                               ; preds = %26, %23, %19
  call void (...) @idlerun(), !dbg !74
  call void @disable_isr(i32 1), !dbg !75
  %29 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !76
  %30 = icmp eq i32 %29, 1, !dbg !78
  br i1 %30, label %31, label %36, !dbg !79

31:                                               ; preds = %28
  %32 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !80
  %33 = icmp eq i32 %32, 1, !dbg !81
  br i1 %33, label %34, label %36, !dbg !82

34:                                               ; preds = %31
  %35 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !83
  store i32 %35, i32* %4, align 4, !dbg !84
  br label %36, !dbg !85

36:                                               ; preds = %34, %31, %28
  call void @enable_isr(i32 1), !dbg !86
  call void (...) @idlerun(), !dbg !87
  call void @disable_isr(i32 1), !dbg !88
  %37 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !89
  %38 = icmp eq i32 %37, 1, !dbg !91
  br i1 %38, label %39, label %44, !dbg !92

39:                                               ; preds = %36
  %40 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !93
  %41 = icmp eq i32 %40, 0, !dbg !94
  br i1 %41, label %42, label %44, !dbg !95

42:                                               ; preds = %39
  %43 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !96
  store i32 %43, i32* %5, align 4, !dbg !97
  br label %44, !dbg !98

44:                                               ; preds = %42, %39, %36
  call void @enable_isr(i32 1), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @init(...) #2

declare i32 @rand(...) #2

declare void @idlerun(...) #2

declare void @disable_isr(i32) #2

declare void @enable_isr(i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_019_001_isr_1() #0 !dbg !101 {
  call void (...) @idlerun(), !dbg !102
  %1 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !103
  %2 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !105
  %3 = add nsw i32 %1, %2, !dbg !106
  %4 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !107
  %5 = icmp slt i32 %3, %4, !dbg !108
  br i1 %5, label %6, label %7, !dbg !109

6:                                                ; preds = %0
  store volatile i32 85, i32* @svp_simple_019_001_global_var2, align 4, !dbg !110
  br label %7, !dbg !111

7:                                                ; preds = %6, %0
  store volatile i32 0, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !112
  store volatile i32 1, i32* @svp_simple_019_001_global_var1, align 4, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!23, !24, !25, !26, !27}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_condition1", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_019/svp_simple_019_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11, !13, !15, !17, !19, !21}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_condiiton2", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_019/svp_simple_019_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_condition3", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_para1", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_para2", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_para3", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_var1", scope: !2, file: !8, line: 12, type: !9, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "svp_simple_019_001_global_var2", scope: !2, file: !8, line: 13, type: !9, isLocal: false, isDefinition: true)
!23 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{!"clang version 10.0.0 "}
!29 = distinct !DISubprogram(name: "svp_simple_019_001_main", scope: !8, file: !8, line: 15, type: !30, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocalVariable(name: "reader1", scope: !29, file: !8, line: 16, type: !10)
!33 = !DILocation(line: 16, column: 7, scope: !29)
!34 = !DILocalVariable(name: "reader2", scope: !29, file: !8, line: 16, type: !10)
!35 = !DILocation(line: 16, column: 16, scope: !29)
!36 = !DILocalVariable(name: "reader3", scope: !29, file: !8, line: 16, type: !10)
!37 = !DILocation(line: 16, column: 25, scope: !29)
!38 = !DILocalVariable(name: "reader4", scope: !29, file: !8, line: 16, type: !10)
!39 = !DILocation(line: 16, column: 34, scope: !29)
!40 = !DILocalVariable(name: "reader5", scope: !29, file: !8, line: 16, type: !10)
!41 = !DILocation(line: 16, column: 43, scope: !29)
!42 = !DILocation(line: 17, column: 3, scope: !29)
!43 = !DILocation(line: 18, column: 37, scope: !29)
!44 = !DILocation(line: 18, column: 44, scope: !29)
!45 = !DILocation(line: 18, column: 35, scope: !29)
!46 = !DILocation(line: 19, column: 37, scope: !29)
!47 = !DILocation(line: 19, column: 44, scope: !29)
!48 = !DILocation(line: 19, column: 35, scope: !29)
!49 = !DILocation(line: 20, column: 37, scope: !29)
!50 = !DILocation(line: 20, column: 44, scope: !29)
!51 = !DILocation(line: 20, column: 35, scope: !29)
!52 = !DILocation(line: 23, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !29, file: !8, line: 23, column: 7)
!54 = !DILocation(line: 23, column: 42, scope: !53)
!55 = !DILocation(line: 23, column: 40, scope: !53)
!56 = !DILocation(line: 23, column: 77, scope: !53)
!57 = !DILocation(line: 23, column: 75, scope: !53)
!58 = !DILocation(line: 23, column: 7, scope: !29)
!59 = !DILocation(line: 24, column: 15, scope: !53)
!60 = !DILocation(line: 24, column: 13, scope: !53)
!61 = !DILocation(line: 24, column: 5, scope: !53)
!62 = !DILocation(line: 26, column: 13, scope: !29)
!63 = !DILocation(line: 26, column: 11, scope: !29)
!64 = !DILocation(line: 28, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !29, file: !8, line: 28, column: 7)
!66 = !DILocation(line: 28, column: 45, scope: !65)
!67 = !DILocation(line: 28, column: 51, scope: !65)
!68 = !DILocation(line: 28, column: 55, scope: !65)
!69 = !DILocation(line: 28, column: 92, scope: !65)
!70 = !DILocation(line: 28, column: 7, scope: !29)
!71 = !DILocation(line: 29, column: 15, scope: !65)
!72 = !DILocation(line: 29, column: 13, scope: !65)
!73 = !DILocation(line: 29, column: 5, scope: !65)
!74 = !DILocation(line: 30, column: 3, scope: !29)
!75 = !DILocation(line: 31, column: 3, scope: !29)
!76 = !DILocation(line: 32, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !29, file: !8, line: 32, column: 7)
!78 = !DILocation(line: 32, column: 45, scope: !77)
!79 = !DILocation(line: 32, column: 51, scope: !77)
!80 = !DILocation(line: 32, column: 55, scope: !77)
!81 = !DILocation(line: 32, column: 92, scope: !77)
!82 = !DILocation(line: 32, column: 7, scope: !29)
!83 = !DILocation(line: 33, column: 15, scope: !77)
!84 = !DILocation(line: 33, column: 13, scope: !77)
!85 = !DILocation(line: 33, column: 5, scope: !77)
!86 = !DILocation(line: 34, column: 3, scope: !29)
!87 = !DILocation(line: 35, column: 3, scope: !29)
!88 = !DILocation(line: 36, column: 3, scope: !29)
!89 = !DILocation(line: 37, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !29, file: !8, line: 37, column: 7)
!91 = !DILocation(line: 37, column: 45, scope: !90)
!92 = !DILocation(line: 37, column: 51, scope: !90)
!93 = !DILocation(line: 37, column: 55, scope: !90)
!94 = !DILocation(line: 37, column: 92, scope: !90)
!95 = !DILocation(line: 37, column: 7, scope: !29)
!96 = !DILocation(line: 38, column: 15, scope: !90)
!97 = !DILocation(line: 38, column: 13, scope: !90)
!98 = !DILocation(line: 38, column: 5, scope: !90)
!99 = !DILocation(line: 39, column: 3, scope: !29)
!100 = !DILocation(line: 40, column: 1, scope: !29)
!101 = distinct !DISubprogram(name: "svp_simple_019_001_isr_1", scope: !8, file: !8, line: 42, type: !30, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocation(line: 43, column: 3, scope: !101)
!103 = !DILocation(line: 44, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !8, line: 44, column: 7)
!105 = !DILocation(line: 44, column: 42, scope: !104)
!106 = !DILocation(line: 44, column: 40, scope: !104)
!107 = !DILocation(line: 44, column: 77, scope: !104)
!108 = !DILocation(line: 44, column: 75, scope: !104)
!109 = !DILocation(line: 44, column: 7, scope: !101)
!110 = !DILocation(line: 45, column: 36, scope: !104)
!111 = !DILocation(line: 45, column: 5, scope: !104)
!112 = !DILocation(line: 47, column: 40, scope: !101)
!113 = !DILocation(line: 49, column: 34, scope: !101)
!114 = !DILocation(line: 50, column: 1, scope: !101)
