; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_008/svp_simple_008_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_008/svp_simple_008_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_008_001_global_array = common global [100 x i32] zeroinitializer, align 16, !dbg !0
@svp_simple_008_001_global_var = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_008_001_main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 1, i32* %1, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %2, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 2, i32* %2, align 4, !dbg !27
  %3 = load i32, i32* %1, align 4, !dbg !28
  %4 = load i32, i32* %2, align 4, !dbg !29
  %5 = add nsw i32 %3, %4, !dbg !30
  %6 = sext i32 %5 to i64, !dbg !31
  %7 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %6, !dbg !31
  store volatile i32 9, i32* %7, align 4, !dbg !32
  store volatile i32 1, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 40), align 16, !dbg !33
  call void @svp_simple_008_001_func_1(), !dbg !34
  ret void, !dbg !35
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_008_001_func_1() #0 !dbg !36 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %2, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %3, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 1, i32* %3, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %4, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 2, i32* %4, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %5, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 1, i32* %5, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %6, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 3, i32* %6, align 4, !dbg !48
  %7 = load i32, i32* %3, align 4, !dbg !49
  %8 = mul nsw i32 %7, 20, !dbg !50
  %9 = load i32, i32* %4, align 4, !dbg !51
  %10 = mul nsw i32 %9, 10, !dbg !52
  %11 = add nsw i32 %8, %10, !dbg !53
  %12 = sext i32 %11 to i64, !dbg !54
  %13 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %12, !dbg !54
  %14 = load volatile i32, i32* %13, align 4, !dbg !54
  store i32 %14, i32* %1, align 4, !dbg !55
  %15 = load i32, i32* %5, align 4, !dbg !56
  %16 = load i32, i32* %6, align 4, !dbg !57
  %17 = add nsw i32 %15, %16, !dbg !58
  %18 = sext i32 %17 to i64, !dbg !59
  %19 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %18, !dbg !59
  %20 = load volatile i32, i32* %19, align 4, !dbg !59
  store i32 %20, i32* %2, align 4, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_008_001_isr_1() #0 !dbg !62 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !63, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %1, align 4, !dbg !65
  br label %2, !dbg !66

2:                                                ; preds = %9, %0
  %3 = load i32, i32* %1, align 4, !dbg !67
  %4 = icmp slt i32 %3, 100, !dbg !69
  br i1 %4, label %5, label %12, !dbg !70

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !71
  %7 = sext i32 %6 to i64, !dbg !72
  %8 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %7, !dbg !72
  store volatile i32 5, i32* %8, align 4, !dbg !73
  br label %9, !dbg !72

9:                                                ; preds = %5
  %10 = load i32, i32* %1, align 4, !dbg !74
  %11 = add nsw i32 %10, 1, !dbg !74
  store i32 %11, i32* %1, align 4, !dbg !74
  br label %2, !dbg !75, !llvm.loop !76

12:                                               ; preds = %2
  ret void, !dbg !78
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_008_001_global_array", scope: !2, file: !8, line: 11, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_008/svp_simple_008_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!6, !0}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_008_001_global_var", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_008/svp_simple_008_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 100)
!14 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_008_001_main", scope: !8, file: !8, line: 13, type: !21, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 14, column: 3, scope: !20)
!24 = !DILocalVariable(name: "p", scope: !20, file: !8, line: 15, type: !10)
!25 = !DILocation(line: 15, column: 7, scope: !20)
!26 = !DILocalVariable(name: "q", scope: !20, file: !8, line: 16, type: !10)
!27 = !DILocation(line: 16, column: 7, scope: !20)
!28 = !DILocation(line: 18, column: 35, scope: !20)
!29 = !DILocation(line: 18, column: 39, scope: !20)
!30 = !DILocation(line: 18, column: 37, scope: !20)
!31 = !DILocation(line: 18, column: 3, scope: !20)
!32 = !DILocation(line: 18, column: 42, scope: !20)
!33 = !DILocation(line: 20, column: 39, scope: !20)
!34 = !DILocation(line: 22, column: 3, scope: !20)
!35 = !DILocation(line: 23, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "svp_simple_008_001_func_1", scope: !8, file: !8, line: 25, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocalVariable(name: "reader1", scope: !36, file: !8, line: 26, type: !10)
!38 = !DILocation(line: 26, column: 7, scope: !36)
!39 = !DILocalVariable(name: "reader2", scope: !36, file: !8, line: 26, type: !10)
!40 = !DILocation(line: 26, column: 16, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !8, line: 27, type: !10)
!42 = !DILocation(line: 27, column: 7, scope: !36)
!43 = !DILocalVariable(name: "j", scope: !36, file: !8, line: 28, type: !10)
!44 = !DILocation(line: 28, column: 7, scope: !36)
!45 = !DILocalVariable(name: "p", scope: !36, file: !8, line: 29, type: !10)
!46 = !DILocation(line: 29, column: 7, scope: !36)
!47 = !DILocalVariable(name: "q", scope: !36, file: !8, line: 30, type: !10)
!48 = !DILocation(line: 30, column: 7, scope: !36)
!49 = !DILocation(line: 31, column: 45, scope: !36)
!50 = !DILocation(line: 31, column: 47, scope: !36)
!51 = !DILocation(line: 31, column: 54, scope: !36)
!52 = !DILocation(line: 31, column: 56, scope: !36)
!53 = !DILocation(line: 31, column: 52, scope: !36)
!54 = !DILocation(line: 31, column: 13, scope: !36)
!55 = !DILocation(line: 31, column: 11, scope: !36)
!56 = !DILocation(line: 33, column: 45, scope: !36)
!57 = !DILocation(line: 33, column: 49, scope: !36)
!58 = !DILocation(line: 33, column: 47, scope: !36)
!59 = !DILocation(line: 33, column: 13, scope: !36)
!60 = !DILocation(line: 33, column: 11, scope: !36)
!61 = !DILocation(line: 34, column: 1, scope: !36)
!62 = distinct !DISubprogram(name: "svp_simple_008_001_isr_1", scope: !8, file: !8, line: 36, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "k", scope: !64, file: !8, line: 37, type: !10)
!64 = distinct !DILexicalBlock(scope: !62, file: !8, line: 37, column: 3)
!65 = !DILocation(line: 37, column: 12, scope: !64)
!66 = !DILocation(line: 37, column: 8, scope: !64)
!67 = !DILocation(line: 37, column: 19, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !8, line: 37, column: 3)
!69 = !DILocation(line: 37, column: 21, scope: !68)
!70 = !DILocation(line: 37, column: 3, scope: !64)
!71 = !DILocation(line: 37, column: 65, scope: !68)
!72 = !DILocation(line: 37, column: 33, scope: !68)
!73 = !DILocation(line: 37, column: 68, scope: !68)
!74 = !DILocation(line: 37, column: 29, scope: !68)
!75 = !DILocation(line: 37, column: 3, scope: !68)
!76 = distinct !{!76, !70, !77}
!77 = !DILocation(line: 37, column: 70, scope: !64)
!78 = !DILocation(line: 38, column: 1, scope: !62)
