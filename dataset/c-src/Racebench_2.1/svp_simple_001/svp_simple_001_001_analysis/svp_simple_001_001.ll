; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_001/svp_simple_001_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_001/svp_simple_001_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_001_001_global_flag = global i32 0, align 4, !dbg !0
@svp_simple_001_001_global_array = common global [10000 x i32] zeroinitializer, align 16, !dbg !11
@svp_simple_001_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_main() #0 !dbg !22 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !25
  call void @disable_isr(i32 2), !dbg !26
  call void (...) @idlerun(), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %1, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %1, align 4, !dbg !30
  br label %3, !dbg !31

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %1, align 4, !dbg !32
  %5 = icmp slt i32 %4, 10000, !dbg !34
  br i1 %5, label %6, label %13, !dbg !35

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4, !dbg !36
  %8 = sext i32 %7 to i64, !dbg !37
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %8, !dbg !37
  store volatile i32 0, i32* %9, align 4, !dbg !38
  br label %10, !dbg !37

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !39
  %12 = add nsw i32 %11, 1, !dbg !39
  store i32 %12, i32* %1, align 4, !dbg !39
  br label %3, !dbg !40, !llvm.loop !41

13:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata i32* %2, metadata !43, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %2, align 4, !dbg !45
  br label %14, !dbg !46

14:                                               ; preds = %25, %13
  %15 = load i32, i32* %2, align 4, !dbg !47
  %16 = icmp slt i32 %15, 10000, !dbg !49
  br i1 %16, label %17, label %28, !dbg !50

17:                                               ; preds = %14
  %18 = load i32, i32* %2, align 4, !dbg !51
  %19 = icmp eq i32 %18, 9999, !dbg !54
  br i1 %19, label %20, label %24, !dbg !55

20:                                               ; preds = %17
  %21 = load i32, i32* %2, align 4, !dbg !56
  %22 = sext i32 %21 to i64, !dbg !57
  %23 = getelementptr inbounds [10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 %22, !dbg !57
  store volatile i32 1, i32* %23, align 4, !dbg !58
  br label %24, !dbg !57

24:                                               ; preds = %20, %17
  br label %25, !dbg !59

25:                                               ; preds = %24
  %26 = load i32, i32* %2, align 4, !dbg !60
  %27 = add nsw i32 %26, 1, !dbg !60
  store i32 %27, i32* %2, align 4, !dbg !60
  br label %14, !dbg !61, !llvm.loop !62

28:                                               ; preds = %14
  ret void, !dbg !64
}

declare void @init(...) #1

declare void @disable_isr(i32) #1

declare void @idlerun(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_isr_1() #0 !dbg !65 {
  call void (...) @idlerun(), !dbg !66
  store volatile i32 1, i32* @svp_simple_001_001_global_flag, align 4, !dbg !67
  store volatile i32 0, i32* @svp_simple_001_001_global_var, align 4, !dbg !68
  store volatile i32 1, i32* @svp_simple_001_001_global_var, align 4, !dbg !69
  call void @enable_isr(i32 2), !dbg !70
  call void (...) @idlerun(), !dbg !71
  ret void, !dbg !72
}

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_001_001_isr_2() #0 !dbg !73 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %2, metadata !76, metadata !DIExpression()), !dbg !77
  %4 = load volatile i32, i32* @svp_simple_001_001_global_flag, align 4, !dbg !78
  %5 = icmp eq i32 %4, 1, !dbg !80
  br i1 %5, label %6, label %8, !dbg !81

6:                                                ; preds = %0
  %7 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 9999), align 4, !dbg !82
  store i32 %7, i32* %1, align 4, !dbg !83
  br label %10, !dbg !84

8:                                                ; preds = %0
  %9 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 0), align 16, !dbg !85
  store i32 %9, i32* %1, align 4, !dbg !87
  br label %10

10:                                               ; preds = %8, %6
  %11 = load volatile i32, i32* getelementptr inbounds ([10000 x i32], [10000 x i32]* @svp_simple_001_001_global_array, i64 0, i64 1000), align 16, !dbg !88
  store i32 %11, i32* %2, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata i32* %3, metadata !90, metadata !DIExpression()), !dbg !91
  %12 = load volatile i32, i32* @svp_simple_001_001_global_var, align 4, !dbg !92
  store i32 %12, i32* %3, align 4, !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_flag", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_001/svp_simple_001_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6, !11}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_var", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_001/svp_simple_001_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "svp_simple_001_001_global_array", scope: !2, file: !8, line: 5, type: !13, isLocal: false, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 320000, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 10000)
!16 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{!"clang version 10.0.0 "}
!22 = distinct !DISubprogram(name: "svp_simple_001_001_main", scope: !8, file: !8, line: 10, type: !23, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocation(line: 12, column: 3, scope: !22)
!26 = !DILocation(line: 14, column: 3, scope: !22)
!27 = !DILocation(line: 16, column: 3, scope: !22)
!28 = !DILocalVariable(name: "i", scope: !29, file: !8, line: 18, type: !10)
!29 = distinct !DILexicalBlock(scope: !22, file: !8, line: 18, column: 3)
!30 = !DILocation(line: 18, column: 12, scope: !29)
!31 = !DILocation(line: 18, column: 8, scope: !29)
!32 = !DILocation(line: 18, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !8, line: 18, column: 3)
!34 = !DILocation(line: 18, column: 21, scope: !33)
!35 = !DILocation(line: 18, column: 3, scope: !29)
!36 = !DILocation(line: 19, column: 37, scope: !33)
!37 = !DILocation(line: 19, column: 5, scope: !33)
!38 = !DILocation(line: 19, column: 40, scope: !33)
!39 = !DILocation(line: 18, column: 31, scope: !33)
!40 = !DILocation(line: 18, column: 3, scope: !33)
!41 = distinct !{!41, !35, !42}
!42 = !DILocation(line: 19, column: 42, scope: !29)
!43 = !DILocalVariable(name: "i", scope: !44, file: !8, line: 21, type: !10)
!44 = distinct !DILexicalBlock(scope: !22, file: !8, line: 21, column: 3)
!45 = !DILocation(line: 21, column: 12, scope: !44)
!46 = !DILocation(line: 21, column: 8, scope: !44)
!47 = !DILocation(line: 21, column: 19, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !8, line: 21, column: 3)
!49 = !DILocation(line: 21, column: 21, scope: !48)
!50 = !DILocation(line: 21, column: 3, scope: !44)
!51 = !DILocation(line: 23, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !53, file: !8, line: 23, column: 9)
!53 = distinct !DILexicalBlock(scope: !48, file: !8, line: 22, column: 3)
!54 = !DILocation(line: 23, column: 11, scope: !52)
!55 = !DILocation(line: 23, column: 9, scope: !53)
!56 = !DILocation(line: 24, column: 39, scope: !52)
!57 = !DILocation(line: 24, column: 7, scope: !52)
!58 = !DILocation(line: 24, column: 42, scope: !52)
!59 = !DILocation(line: 25, column: 3, scope: !53)
!60 = !DILocation(line: 21, column: 31, scope: !48)
!61 = !DILocation(line: 21, column: 3, scope: !48)
!62 = distinct !{!62, !50, !63}
!63 = !DILocation(line: 25, column: 3, scope: !44)
!64 = !DILocation(line: 26, column: 1, scope: !22)
!65 = distinct !DISubprogram(name: "svp_simple_001_001_isr_1", scope: !8, file: !8, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 30, column: 3, scope: !65)
!67 = !DILocation(line: 31, column: 34, scope: !65)
!68 = !DILocation(line: 33, column: 33, scope: !65)
!69 = !DILocation(line: 34, column: 33, scope: !65)
!70 = !DILocation(line: 36, column: 3, scope: !65)
!71 = !DILocation(line: 38, column: 3, scope: !65)
!72 = !DILocation(line: 39, column: 1, scope: !65)
!73 = distinct !DISubprogram(name: "svp_simple_001_001_isr_2", scope: !8, file: !8, line: 41, type: !23, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "reader1", scope: !73, file: !8, line: 43, type: !10)
!75 = !DILocation(line: 43, column: 7, scope: !73)
!76 = !DILocalVariable(name: "reader3", scope: !73, file: !8, line: 43, type: !10)
!77 = !DILocation(line: 43, column: 16, scope: !73)
!78 = !DILocation(line: 44, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !8, line: 44, column: 7)
!80 = !DILocation(line: 44, column: 38, scope: !79)
!81 = !DILocation(line: 44, column: 7, scope: !73)
!82 = !DILocation(line: 46, column: 15, scope: !79)
!83 = !DILocation(line: 46, column: 13, scope: !79)
!84 = !DILocation(line: 46, column: 5, scope: !79)
!85 = !DILocation(line: 50, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !8, line: 48, column: 3)
!87 = !DILocation(line: 49, column: 13, scope: !86)
!88 = !DILocation(line: 53, column: 13, scope: !73)
!89 = !DILocation(line: 53, column: 11, scope: !73)
!90 = !DILocalVariable(name: "reader2", scope: !73, file: !8, line: 55, type: !10)
!91 = !DILocation(line: 55, column: 7, scope: !73)
!92 = !DILocation(line: 56, column: 13, scope: !73)
!93 = !DILocation(line: 56, column: 11, scope: !73)
!94 = !DILocation(line: 57, column: 1, scope: !73)
