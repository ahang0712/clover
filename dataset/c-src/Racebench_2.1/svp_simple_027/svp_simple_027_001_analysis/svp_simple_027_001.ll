; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_027/svp_simple_027_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_027/svp_simple_027_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_027_001_gloable_var = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_027_001_main() #0 !dbg !15 {
  call void @disable_isr(i32 -1), !dbg !18
  call void @svp_simple_027_001_init(), !dbg !19
  call void @enable_isr(i32 1), !dbg !20
  %1 = load volatile i32, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !21
  %2 = icmp slt i32 %1, 12, !dbg !23
  br i1 %2, label %3, label %4, !dbg !24

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !25
  br label %4, !dbg !27

4:                                                ; preds = %3, %0
  ret void, !dbg !28
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_027_001_init() #0 !dbg !29 {
  call void (...) @init(), !dbg !30
  ret void, !dbg !31
}

declare void @init(...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_027_001_isr_1() #0 !dbg !32 {
  %1 = load volatile i32, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !33
  %2 = add nsw i32 %1, 1, !dbg !33
  store volatile i32 %2, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !33
  call void @enable_isr(i32 2), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_027_001_isr_2() #0 !dbg !36 {
  %1 = load volatile i32, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !37
  %2 = add nsw i32 %1, 2, !dbg !37
  store volatile i32 %2, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_027_001_isr_3() #0 !dbg !39 {
  %1 = load volatile i32, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !40
  %2 = add nsw i32 %1, 3, !dbg !40
  store volatile i32 %2, i32* @svp_simple_027_001_gloable_var, align 4, !dbg !40
  ret void, !dbg !41
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_027_001_gloable_var", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_027/svp_simple_027_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_027/svp_simple_027_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "svp_simple_027_001_main", scope: !6, file: !6, line: 6, type: !16, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 7, column: 3, scope: !15)
!19 = !DILocation(line: 8, column: 3, scope: !15)
!20 = !DILocation(line: 10, column: 3, scope: !15)
!21 = !DILocation(line: 11, column: 7, scope: !22)
!22 = distinct !DILexicalBlock(scope: !15, file: !6, line: 11, column: 7)
!23 = !DILocation(line: 11, column: 38, scope: !22)
!24 = !DILocation(line: 11, column: 7, scope: !15)
!25 = !DILocation(line: 12, column: 36, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !6, line: 11, column: 44)
!27 = !DILocation(line: 13, column: 3, scope: !26)
!28 = !DILocation(line: 15, column: 3, scope: !15)
!29 = distinct !DISubprogram(name: "svp_simple_027_001_init", scope: !6, file: !6, line: 18, type: !16, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DILocation(line: 21, column: 3, scope: !29)
!31 = !DILocation(line: 22, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "svp_simple_027_001_isr_1", scope: !6, file: !6, line: 24, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 25, column: 33, scope: !32)
!34 = !DILocation(line: 26, column: 3, scope: !32)
!35 = !DILocation(line: 27, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "svp_simple_027_001_isr_2", scope: !6, file: !6, line: 28, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocation(line: 29, column: 34, scope: !36)
!38 = !DILocation(line: 30, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "svp_simple_027_001_isr_3", scope: !6, file: !6, line: 31, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 32, column: 34, scope: !39)
!41 = !DILocation(line: 33, column: 1, scope: !39)
