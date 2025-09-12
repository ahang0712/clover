; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_002_001_global_array = common global [100000 x i32] zeroinitializer, align 16, !dbg !0
@casee2_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_main() #0 !dbg !20 {
  call void (...) @init(), !dbg !23
  call void (...) @idlerun(), !dbg !24
  ret void, !dbg !25
}

declare void @init(...) #1

declare void @idlerun(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_isr_1() #0 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %2, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %3, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %3, align 4, !dbg !33
  br label %4, !dbg !34

4:                                                ; preds = %16, %0
  %5 = load i32, i32* %3, align 4, !dbg !35
  %6 = icmp slt i32 %5, 100000, !dbg !37
  br i1 %6, label %7, label %19, !dbg !38

7:                                                ; preds = %4
  %8 = load i32, i32* %3, align 4, !dbg !39
  %9 = icmp eq i32 %8, 9999, !dbg !42
  br i1 %9, label %10, label %11, !dbg !43

10:                                               ; preds = %7
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !44
  br label %11, !dbg !45

11:                                               ; preds = %10, %7
  %12 = load i32, i32* %3, align 4, !dbg !46
  %13 = icmp eq i32 %12, 100001, !dbg !48
  br i1 %13, label %14, label %15, !dbg !49

14:                                               ; preds = %11
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !50
  br label %15, !dbg !51

15:                                               ; preds = %14, %11
  br label %16, !dbg !52

16:                                               ; preds = %15
  %17 = load i32, i32* %3, align 4, !dbg !53
  %18 = add nsw i32 %17, 1, !dbg !53
  store i32 %18, i32* %3, align 4, !dbg !53
  br label %4, !dbg !54, !llvm.loop !55

19:                                               ; preds = %4
  %20 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !57
  %21 = sub nsw i32 %20, 10, !dbg !58
  store i32 %21, i32* %1, align 4, !dbg !59
  %22 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 0), align 16, !dbg !60
  %23 = add nsw i32 %22, 10, !dbg !61
  store i32 %23, i32* %2, align 4, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_002_001_isr_2() #0 !dbg !64 {
  call void (...) @idlerun(), !dbg !65
  store volatile i32 999, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !66
  ret void, !dbg !67
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_002_001_global_array", scope: !2, file: !8, line: 7, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "casee2_global_var", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_002/svp_simple_002_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200000, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 100000)
!14 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !8, file: !8, line: 10, type: !21, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 11, column: 3, scope: !20)
!24 = !DILocation(line: 12, column: 3, scope: !20)
!25 = !DILocation(line: 13, column: 1, scope: !20)
!26 = distinct !DISubprogram(name: "svp_simple_002_001_isr_1", scope: !8, file: !8, line: 15, type: !21, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DILocalVariable(name: "mininum", scope: !26, file: !8, line: 16, type: !10)
!28 = !DILocation(line: 16, column: 7, scope: !26)
!29 = !DILocalVariable(name: "maxnum", scope: !26, file: !8, line: 16, type: !10)
!30 = !DILocation(line: 16, column: 16, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !8, line: 17, type: !10)
!32 = distinct !DILexicalBlock(scope: !26, file: !8, line: 17, column: 3)
!33 = !DILocation(line: 17, column: 12, scope: !32)
!34 = !DILocation(line: 17, column: 8, scope: !32)
!35 = !DILocation(line: 17, column: 19, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 17, column: 3)
!37 = !DILocation(line: 17, column: 21, scope: !36)
!38 = !DILocation(line: 17, column: 3, scope: !32)
!39 = !DILocation(line: 18, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !8, line: 18, column: 9)
!41 = distinct !DILexicalBlock(scope: !36, file: !8, line: 17, column: 40)
!42 = !DILocation(line: 18, column: 11, scope: !40)
!43 = !DILocation(line: 18, column: 9, scope: !41)
!44 = !DILocation(line: 18, column: 64, scope: !40)
!45 = !DILocation(line: 18, column: 23, scope: !40)
!46 = !DILocation(line: 19, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !8, line: 19, column: 9)
!48 = !DILocation(line: 19, column: 11, scope: !47)
!49 = !DILocation(line: 19, column: 9, scope: !41)
!50 = !DILocation(line: 20, column: 48, scope: !47)
!51 = !DILocation(line: 20, column: 7, scope: !47)
!52 = !DILocation(line: 21, column: 3, scope: !41)
!53 = !DILocation(line: 17, column: 36, scope: !36)
!54 = !DILocation(line: 17, column: 3, scope: !36)
!55 = distinct !{!55, !38, !56}
!56 = !DILocation(line: 21, column: 3, scope: !32)
!57 = !DILocation(line: 22, column: 13, scope: !26)
!58 = !DILocation(line: 22, column: 54, scope: !26)
!59 = !DILocation(line: 22, column: 11, scope: !26)
!60 = !DILocation(line: 24, column: 12, scope: !26)
!61 = !DILocation(line: 24, column: 47, scope: !26)
!62 = !DILocation(line: 24, column: 10, scope: !26)
!63 = !DILocation(line: 25, column: 1, scope: !26)
!64 = distinct !DISubprogram(name: "svp_simple_002_001_isr_2", scope: !8, file: !8, line: 27, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 28, column: 3, scope: !64)
!66 = !DILocation(line: 29, column: 44, scope: !64)
!67 = !DILocation(line: 31, column: 1, scope: !64)
