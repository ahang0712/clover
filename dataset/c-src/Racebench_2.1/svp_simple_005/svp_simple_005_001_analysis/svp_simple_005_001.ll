; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_005_001_global_condition = global i32 0, align 4, !dbg !0
@svp_simple_005_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_005_001_main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %1, align 4, !dbg !23
  br label %3, !dbg !24

3:                                                ; preds = %22, %0
  %4 = load i32, i32* %1, align 4, !dbg !25
  %5 = icmp slt i32 %4, 10000, !dbg !27
  br i1 %5, label %6, label %25, !dbg !28

6:                                                ; preds = %3
  call void @llvm.dbg.declare(metadata i32* %2, metadata !29, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %2, align 4, !dbg !32
  br label %7, !dbg !33

7:                                                ; preds = %18, %6
  %8 = load i32, i32* %2, align 4, !dbg !34
  %9 = icmp slt i32 %8, 10000, !dbg !36
  br i1 %9, label %10, label %21, !dbg !37

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4, !dbg !38
  %12 = icmp eq i32 %11, 9999, !dbg !41
  br i1 %12, label %13, label %17, !dbg !42

13:                                               ; preds = %10
  %14 = load i32, i32* %2, align 4, !dbg !43
  %15 = icmp eq i32 %14, 1000, !dbg !44
  br i1 %15, label %16, label %17, !dbg !45

16:                                               ; preds = %13
  store volatile i32 1, i32* @svp_simple_005_001_global_var, align 4, !dbg !46
  br label %17, !dbg !47

17:                                               ; preds = %16, %13, %10
  br label %18, !dbg !48

18:                                               ; preds = %17
  %19 = load i32, i32* %2, align 4, !dbg !49
  %20 = add nsw i32 %19, 1, !dbg !49
  store i32 %20, i32* %2, align 4, !dbg !49
  br label %7, !dbg !50, !llvm.loop !51

21:                                               ; preds = %7
  br label %22, !dbg !53

22:                                               ; preds = %21
  %23 = load i32, i32* %1, align 4, !dbg !54
  %24 = add nsw i32 %23, 1, !dbg !54
  store i32 %24, i32* %1, align 4, !dbg !54
  br label %3, !dbg !55, !llvm.loop !56

25:                                               ; preds = %3
  %26 = load volatile i32, i32* @svp_simple_005_001_global_condition, align 4, !dbg !58
  %27 = icmp eq i32 %26, 1, !dbg !60
  br i1 %27, label %28, label %29, !dbg !61

28:                                               ; preds = %25
  store volatile i32 9, i32* @svp_simple_005_001_global_var, align 4, !dbg !62
  br label %29, !dbg !64

29:                                               ; preds = %28, %25
  store volatile i32 5, i32* @svp_simple_005_001_global_var, align 4, !dbg !65
  ret void, !dbg !66
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_005_001_isr_1() #0 !dbg !67 {
  %1 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !68
  call void @llvm.dbg.declare(metadata i32* %1, metadata !69, metadata !DIExpression()), !dbg !70
  %2 = load volatile i32, i32* @svp_simple_005_001_global_var, align 4, !dbg !71
  store i32 %2, i32* %1, align 4, !dbg !72
  ret void, !dbg !73
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_005_001_global_condition", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_005_001_global_var", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "svp_simple_005_001_main", scope: !8, file: !8, line: 12, type: !18, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 13, column: 3, scope: !17)
!21 = !DILocalVariable(name: "i", scope: !22, file: !8, line: 14, type: !10)
!22 = distinct !DILexicalBlock(scope: !17, file: !8, line: 14, column: 3)
!23 = !DILocation(line: 14, column: 12, scope: !22)
!24 = !DILocation(line: 14, column: 8, scope: !22)
!25 = !DILocation(line: 14, column: 19, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !8, line: 14, column: 3)
!27 = !DILocation(line: 14, column: 21, scope: !26)
!28 = !DILocation(line: 14, column: 3, scope: !22)
!29 = !DILocalVariable(name: "j", scope: !30, file: !8, line: 15, type: !10)
!30 = distinct !DILexicalBlock(scope: !31, file: !8, line: 15, column: 5)
!31 = distinct !DILexicalBlock(scope: !26, file: !8, line: 14, column: 40)
!32 = !DILocation(line: 15, column: 14, scope: !30)
!33 = !DILocation(line: 15, column: 10, scope: !30)
!34 = !DILocation(line: 15, column: 21, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !8, line: 15, column: 5)
!36 = !DILocation(line: 15, column: 23, scope: !35)
!37 = !DILocation(line: 15, column: 5, scope: !30)
!38 = !DILocation(line: 16, column: 12, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !8, line: 16, column: 11)
!40 = distinct !DILexicalBlock(scope: !35, file: !8, line: 15, column: 42)
!41 = !DILocation(line: 16, column: 14, scope: !39)
!42 = !DILocation(line: 16, column: 26, scope: !39)
!43 = !DILocation(line: 16, column: 30, scope: !39)
!44 = !DILocation(line: 16, column: 32, scope: !39)
!45 = !DILocation(line: 16, column: 11, scope: !40)
!46 = !DILocation(line: 17, column: 39, scope: !39)
!47 = !DILocation(line: 17, column: 9, scope: !39)
!48 = !DILocation(line: 18, column: 5, scope: !40)
!49 = !DILocation(line: 15, column: 38, scope: !35)
!50 = !DILocation(line: 15, column: 5, scope: !35)
!51 = distinct !{!51, !37, !52}
!52 = !DILocation(line: 18, column: 5, scope: !30)
!53 = !DILocation(line: 19, column: 3, scope: !31)
!54 = !DILocation(line: 14, column: 36, scope: !26)
!55 = !DILocation(line: 14, column: 3, scope: !26)
!56 = distinct !{!56, !28, !57}
!57 = !DILocation(line: 19, column: 3, scope: !22)
!58 = !DILocation(line: 21, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !17, file: !8, line: 21, column: 7)
!60 = !DILocation(line: 21, column: 43, scope: !59)
!61 = !DILocation(line: 21, column: 7, scope: !17)
!62 = !DILocation(line: 23, column: 35, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 21, column: 48)
!64 = !DILocation(line: 24, column: 3, scope: !63)
!65 = !DILocation(line: 25, column: 33, scope: !17)
!66 = !DILocation(line: 26, column: 1, scope: !17)
!67 = distinct !DISubprogram(name: "svp_simple_005_001_isr_1", scope: !8, file: !8, line: 28, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 29, column: 3, scope: !67)
!69 = !DILocalVariable(name: "reader", scope: !67, file: !8, line: 30, type: !10)
!70 = !DILocation(line: 30, column: 7, scope: !67)
!71 = !DILocation(line: 31, column: 12, scope: !67)
!72 = !DILocation(line: 31, column: 10, scope: !67)
!73 = !DILocation(line: 32, column: 1, scope: !67)
