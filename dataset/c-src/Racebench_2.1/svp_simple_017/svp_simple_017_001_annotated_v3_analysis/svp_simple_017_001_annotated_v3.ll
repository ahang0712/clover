; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001_annotated_v3.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001_annotated_v3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_017_001_global_var = common global i32 0, align 4, !dbg !0
@svp_simple_017_001_local_array = common global [100 x i32] zeroinitializer, align 16, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_017_001_main() #0 !dbg !20 {
  %1 = alloca i32, align 4
  call void (...) @init(), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %1, align 4, !dbg !25
  store volatile i32 0, i32* @svp_simple_017_001_global_var, align 4, !dbg !26
  br label %2, !dbg !28

2:                                                ; preds = %11, %0
  %3 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !29
  %4 = icmp slt i32 %3, 100, !dbg !31
  br i1 %4, label %5, label %14, !dbg !32

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4, !dbg !33
  %7 = add nsw i32 %6, 1, !dbg !33
  store i32 %7, i32* %1, align 4, !dbg !33
  %8 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !35
  %9 = sext i32 %8 to i64, !dbg !36
  %10 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %9, !dbg !36
  store volatile i32 %6, i32* %10, align 4, !dbg !37
  br label %11, !dbg !38

11:                                               ; preds = %5
  %12 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !39
  %13 = add nsw i32 %12, 1, !dbg !39
  store volatile i32 %13, i32* @svp_simple_017_001_global_var, align 4, !dbg !39
  br label %2, !dbg !40, !llvm.loop !41

14:                                               ; preds = %2
  ret void, !dbg !43
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_017_001_isr_1() #0 !dbg !44 {
  call void (...) @idlerun(), !dbg !45
  store volatile i32 50, i32* @svp_simple_017_001_global_var, align 4, !dbg !46
  %1 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !47
  %2 = sext i32 %1 to i64, !dbg !48
  %3 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %2, !dbg !48
  store volatile i32 0, i32* %3, align 4, !dbg !49
  ret void, !dbg !50
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_017_001_global_var", scope: !2, file: !8, line: 7, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001_annotated_v3.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_017_001_local_array", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_017/svp_simple_017_001_annotated_v3.c", directory: "/Users/hehang03/code/clover")
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !12)
!10 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!13}
!13 = !DISubrange(count: 100)
!14 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{!"clang version 10.0.0 "}
!20 = distinct !DISubprogram(name: "svp_simple_017_001_main", scope: !8, file: !8, line: 10, type: !21, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocation(line: 11, column: 3, scope: !20)
!24 = !DILocalVariable(name: "i", scope: !20, file: !8, line: 12, type: !11)
!25 = !DILocation(line: 12, column: 7, scope: !20)
!26 = !DILocation(line: 14, column: 38, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !8, line: 14, column: 3)
!28 = !DILocation(line: 14, column: 8, scope: !27)
!29 = !DILocation(line: 14, column: 43, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !8, line: 14, column: 3)
!31 = !DILocation(line: 14, column: 73, scope: !30)
!32 = !DILocation(line: 14, column: 3, scope: !27)
!33 = !DILocation(line: 17, column: 70, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !8, line: 16, column: 3)
!35 = !DILocation(line: 17, column: 36, scope: !34)
!36 = !DILocation(line: 17, column: 5, scope: !34)
!37 = !DILocation(line: 17, column: 67, scope: !34)
!38 = !DILocation(line: 18, column: 3, scope: !34)
!39 = !DILocation(line: 15, column: 37, scope: !30)
!40 = !DILocation(line: 14, column: 3, scope: !30)
!41 = distinct !{!41, !32, !42}
!42 = !DILocation(line: 18, column: 3, scope: !27)
!43 = !DILocation(line: 19, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "svp_simple_017_001_isr_1", scope: !8, file: !8, line: 21, type: !21, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 22, column: 3, scope: !44)
!46 = !DILocation(line: 24, column: 33, scope: !44)
!47 = !DILocation(line: 26, column: 34, scope: !44)
!48 = !DILocation(line: 26, column: 3, scope: !44)
!49 = !DILocation(line: 26, column: 65, scope: !44)
!50 = !DILocation(line: 27, column: 1, scope: !44)
