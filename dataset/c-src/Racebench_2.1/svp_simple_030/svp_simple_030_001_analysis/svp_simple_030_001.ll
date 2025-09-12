; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_030/svp_simple_030_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_030/svp_simple_030_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_030_001_gloable_var = common global i32 0, align 4, !dbg !0
@svp_simple_030_001_isr_1_flag = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_030_001_main() #0 !dbg !17 {
  call void @svp_simple_030_001_init(), !dbg !20
  call void @disable_isr(i32 -1), !dbg !21
  call void @enable_isr(i32 1), !dbg !22
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !23
  %2 = icmp sgt i32 %1, 12, !dbg !25
  br i1 %2, label %3, label %4, !dbg !26

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !27
  br label %4, !dbg !29

4:                                                ; preds = %3, %0
  ret i32 0, !dbg !30
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_030_001_init() #0 !dbg !31 {
  call void (...) @init(), !dbg !34
  ret void, !dbg !35
}

declare void @init(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @addData() #0 !dbg !36 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !37
  %2 = add nsw i32 %1, 1, !dbg !37
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_030_001_isr_1() #0 !dbg !39 {
  call void @addData(), !dbg !40
  store volatile i32 0, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !41
  call void @enable_isr(i32 2), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_030_001_isr_2() #0 !dbg !44 {
  %1 = load volatile i32, i32* @svp_simple_030_001_isr_1_flag, align 4, !dbg !45
  %2 = icmp ne i32 %1, 0, !dbg !45
  br i1 %2, label %3, label %6, !dbg !47

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !48
  %5 = add nsw i32 %4, 1, !dbg !48
  store volatile i32 %5, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !48
  br label %6, !dbg !50

6:                                                ; preds = %3, %0
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_030_001_isr_3() #0 !dbg !52 {
  %1 = load volatile i32, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !53
  %2 = add nsw i32 %1, 1, !dbg !53
  store volatile i32 %2, i32* @svp_simple_030_001_gloable_var, align 4, !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_030_001_gloable_var", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_030/svp_simple_030_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!6, !0}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_030_001_isr_1_flag", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_030/svp_simple_030_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "svp_simple_030_001_main", scope: !8, file: !8, line: 9, type: !18, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{!10}
!20 = !DILocation(line: 10, column: 3, scope: !17)
!21 = !DILocation(line: 12, column: 3, scope: !17)
!22 = !DILocation(line: 13, column: 3, scope: !17)
!23 = !DILocation(line: 14, column: 7, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !8, line: 14, column: 7)
!25 = !DILocation(line: 14, column: 38, scope: !24)
!26 = !DILocation(line: 14, column: 7, scope: !17)
!27 = !DILocation(line: 15, column: 36, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !8, line: 14, column: 44)
!29 = !DILocation(line: 16, column: 3, scope: !28)
!30 = !DILocation(line: 17, column: 3, scope: !17)
!31 = distinct !DISubprogram(name: "svp_simple_030_001_init", scope: !8, file: !8, line: 20, type: !32, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocation(line: 24, column: 3, scope: !31)
!35 = !DILocation(line: 25, column: 1, scope: !31)
!36 = distinct !DISubprogram(name: "addData", scope: !8, file: !8, line: 27, type: !32, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocation(line: 28, column: 33, scope: !36)
!38 = !DILocation(line: 29, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "svp_simple_030_001_isr_1", scope: !8, file: !8, line: 30, type: !32, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 31, column: 3, scope: !39)
!41 = !DILocation(line: 32, column: 33, scope: !39)
!42 = !DILocation(line: 33, column: 3, scope: !39)
!43 = !DILocation(line: 34, column: 1, scope: !39)
!44 = distinct !DISubprogram(name: "svp_simple_030_001_isr_2", scope: !8, file: !8, line: 35, type: !32, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 36, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !44, file: !8, line: 36, column: 7)
!47 = !DILocation(line: 36, column: 7, scope: !44)
!48 = !DILocation(line: 37, column: 35, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !8, line: 36, column: 38)
!50 = !DILocation(line: 38, column: 3, scope: !49)
!51 = !DILocation(line: 39, column: 1, scope: !44)
!52 = distinct !DISubprogram(name: "svp_simple_030_001_isr_3", scope: !8, file: !8, line: 40, type: !32, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 41, column: 33, scope: !52)
!54 = !DILocation(line: 42, column: 1, scope: !52)
