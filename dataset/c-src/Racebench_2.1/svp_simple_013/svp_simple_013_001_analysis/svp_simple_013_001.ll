; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_013/svp_simple_013_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_013/svp_simple_013_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_013_001_global_flag1 = global i32 0, align 4, !dbg !0
@svp_simple_013_001_global_flag2 = global i32 1, align 4, !dbg !6
@svp_simple_013_001_global_var1 = common global i32 0, align 4, !dbg !10
@svp_simple_013_001_global_var2 = common global i32 0, align 4, !dbg !13

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_013_001_main() #0 !dbg !21 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void (...) @init(), !dbg !24
  call void @disable_isr(i32 2), !dbg !25
  call void @disable_isr(i32 3), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %1, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %2, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %3, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %5, align 4, !dbg !37
  br label %6, !dbg !38

6:                                                ; preds = %15, %0
  %7 = load i32, i32* %5, align 4, !dbg !39
  %8 = icmp slt i32 %7, 100, !dbg !41
  br i1 %8, label %9, label %18, !dbg !42

9:                                                ; preds = %6
  %10 = load i32, i32* %5, align 4, !dbg !43
  %11 = icmp eq i32 %10, 99, !dbg !45
  br i1 %11, label %12, label %14, !dbg !46

12:                                               ; preds = %9
  %13 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !47
  store i32 %13, i32* %1, align 4, !dbg !48
  br label %14, !dbg !49

14:                                               ; preds = %12, %9
  br label %15, !dbg !50

15:                                               ; preds = %14
  %16 = load i32, i32* %5, align 4, !dbg !51
  %17 = add nsw i32 %16, 1, !dbg !51
  store i32 %17, i32* %5, align 4, !dbg !51
  br label %6, !dbg !52, !llvm.loop !53

18:                                               ; preds = %6
  %19 = load volatile i32, i32* @svp_simple_013_001_global_var1, align 4, !dbg !55
  store i32 %19, i32* %2, align 4, !dbg !56
  %20 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !57
  store i32 %20, i32* %3, align 4, !dbg !58
  %21 = load volatile i32, i32* @svp_simple_013_001_global_var2, align 4, !dbg !59
  store i32 %21, i32* %4, align 4, !dbg !60
  ret void, !dbg !61
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_013_001_isr_1() #0 !dbg !62 {
  call void (...) @idlerun(), !dbg !63
  call void @enable_isr(i32 2), !dbg !64
  call void (...) @idlerun(), !dbg !65
  ret void, !dbg !66
}

declare void @idlerun(...) #1

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_013_001_isr_2() #0 !dbg !67 {
  call void (...) @idlerun(), !dbg !68
  store i32 1, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !69
  store i32 0, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !70
  call void @enable_isr(i32 3), !dbg !71
  call void (...) @idlerun(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_013_001_isr_3() #0 !dbg !74 {
  %1 = load i32, i32* @svp_simple_013_001_global_flag1, align 4, !dbg !75
  %2 = icmp eq i32 %1, 1, !dbg !77
  br i1 %2, label %3, label %4, !dbg !78

3:                                                ; preds = %0
  store volatile i32 1, i32* @svp_simple_013_001_global_var1, align 4, !dbg !79
  br label %4, !dbg !80

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @svp_simple_013_001_global_flag2, align 4, !dbg !81
  %6 = icmp eq i32 %5, 1, !dbg !83
  br i1 %6, label %7, label %8, !dbg !84

7:                                                ; preds = %4
  store volatile i32 1, i32* @svp_simple_013_001_global_var2, align 4, !dbg !85
  br label %8, !dbg !86

8:                                                ; preds = %7, %4
  ret void, !dbg !87
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_013_001_global_flag1", scope: !2, file: !8, line: 10, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_013/svp_simple_013_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !10, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_013_001_global_flag2", scope: !2, file: !8, line: 11, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_013/svp_simple_013_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "svp_simple_013_001_global_var1", scope: !2, file: !8, line: 7, type: !12, isLocal: false, isDefinition: true)
!12 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !9)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "svp_simple_013_001_global_var2", scope: !2, file: !8, line: 8, type: !12, isLocal: false, isDefinition: true)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{!"clang version 10.0.0 "}
!21 = distinct !DISubprogram(name: "svp_simple_013_001_main", scope: !8, file: !8, line: 13, type: !22, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocation(line: 14, column: 3, scope: !21)
!25 = !DILocation(line: 15, column: 3, scope: !21)
!26 = !DILocation(line: 16, column: 3, scope: !21)
!27 = !DILocalVariable(name: "reader1", scope: !21, file: !8, line: 20, type: !9)
!28 = !DILocation(line: 20, column: 7, scope: !21)
!29 = !DILocalVariable(name: "reader2", scope: !21, file: !8, line: 20, type: !9)
!30 = !DILocation(line: 20, column: 16, scope: !21)
!31 = !DILocalVariable(name: "reader3", scope: !21, file: !8, line: 21, type: !9)
!32 = !DILocation(line: 21, column: 7, scope: !21)
!33 = !DILocalVariable(name: "reader4", scope: !21, file: !8, line: 21, type: !9)
!34 = !DILocation(line: 21, column: 16, scope: !21)
!35 = !DILocalVariable(name: "i", scope: !36, file: !8, line: 23, type: !9)
!36 = distinct !DILexicalBlock(scope: !21, file: !8, line: 23, column: 3)
!37 = !DILocation(line: 23, column: 12, scope: !36)
!38 = !DILocation(line: 23, column: 8, scope: !36)
!39 = !DILocation(line: 23, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !8, line: 23, column: 3)
!41 = !DILocation(line: 23, column: 21, scope: !40)
!42 = !DILocation(line: 23, column: 3, scope: !36)
!43 = !DILocation(line: 24, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !8, line: 24, column: 9)
!45 = !DILocation(line: 24, column: 11, scope: !44)
!46 = !DILocation(line: 24, column: 9, scope: !40)
!47 = !DILocation(line: 24, column: 33, scope: !44)
!48 = !DILocation(line: 24, column: 31, scope: !44)
!49 = !DILocation(line: 24, column: 23, scope: !44)
!50 = !DILocation(line: 24, column: 14, scope: !44)
!51 = !DILocation(line: 23, column: 36, scope: !40)
!52 = !DILocation(line: 23, column: 3, scope: !40)
!53 = distinct !{!53, !42, !54}
!54 = !DILocation(line: 24, column: 33, scope: !36)
!55 = !DILocation(line: 26, column: 13, scope: !21)
!56 = !DILocation(line: 26, column: 11, scope: !21)
!57 = !DILocation(line: 28, column: 13, scope: !21)
!58 = !DILocation(line: 28, column: 11, scope: !21)
!59 = !DILocation(line: 30, column: 13, scope: !21)
!60 = !DILocation(line: 30, column: 11, scope: !21)
!61 = !DILocation(line: 31, column: 1, scope: !21)
!62 = distinct !DISubprogram(name: "svp_simple_013_001_isr_1", scope: !8, file: !8, line: 33, type: !22, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 34, column: 3, scope: !62)
!64 = !DILocation(line: 35, column: 3, scope: !62)
!65 = !DILocation(line: 36, column: 3, scope: !62)
!66 = !DILocation(line: 37, column: 1, scope: !62)
!67 = distinct !DISubprogram(name: "svp_simple_013_001_isr_2", scope: !8, file: !8, line: 39, type: !22, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 40, column: 3, scope: !67)
!69 = !DILocation(line: 41, column: 35, scope: !67)
!70 = !DILocation(line: 43, column: 35, scope: !67)
!71 = !DILocation(line: 45, column: 3, scope: !67)
!72 = !DILocation(line: 46, column: 3, scope: !67)
!73 = !DILocation(line: 47, column: 1, scope: !67)
!74 = distinct !DISubprogram(name: "svp_simple_013_001_isr_3", scope: !8, file: !8, line: 49, type: !22, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 50, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !74, file: !8, line: 50, column: 7)
!77 = !DILocation(line: 50, column: 39, scope: !76)
!78 = !DILocation(line: 50, column: 7, scope: !74)
!79 = !DILocation(line: 50, column: 76, scope: !76)
!80 = !DILocation(line: 50, column: 45, scope: !76)
!81 = !DILocation(line: 51, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !8, line: 51, column: 7)
!83 = !DILocation(line: 51, column: 39, scope: !82)
!84 = !DILocation(line: 51, column: 7, scope: !74)
!85 = !DILocation(line: 51, column: 76, scope: !82)
!86 = !DILocation(line: 51, column: 45, scope: !82)
!87 = !DILocation(line: 52, column: 1, scope: !74)
