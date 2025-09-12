; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_012/svp_simple_012_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_012/svp_simple_012_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_012_001_global_var = common global i32 0, align 4, !dbg !0
@svp_simple_012_001_global_pointer = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_012_001_main() #0 !dbg !16 {
  %1 = alloca i32*, align 8
  call void (...) @init(), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32* @svp_simple_012_001_global_var, i32** %1, align 8, !dbg !22
  store i32 1, i32* @svp_simple_012_001_global_var, align 4, !dbg !23
  %2 = load i32*, i32** %1, align 8, !dbg !24
  store i32 2, i32* %2, align 4, !dbg !25
  ret void, !dbg !26
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_012_001_isr_1() #0 !dbg !27 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i32, i32* @svp_simple_012_001_global_var, align 4, !dbg !30
  store i32 %2, i32* %1, align 4, !dbg !31
  ret void, !dbg !32
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_012_001_global_var", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_012/svp_simple_012_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_012_001_global_pointer", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_012/svp_simple_012_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !8, file: !8, line: 8, type: !17, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 9, column: 3, scope: !16)
!20 = !DILocalVariable(name: "p", scope: !16, file: !8, line: 10, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!22 = !DILocation(line: 10, column: 8, scope: !16)
!23 = !DILocation(line: 12, column: 33, scope: !16)
!24 = !DILocation(line: 14, column: 4, scope: !16)
!25 = !DILocation(line: 14, column: 6, scope: !16)
!26 = !DILocation(line: 15, column: 1, scope: !16)
!27 = distinct !DISubprogram(name: "svp_simple_012_001_isr_1", scope: !8, file: !8, line: 17, type: !17, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DILocalVariable(name: "reader1", scope: !27, file: !8, line: 18, type: !9)
!29 = !DILocation(line: 18, column: 7, scope: !27)
!30 = !DILocation(line: 19, column: 13, scope: !27)
!31 = !DILocation(line: 19, column: 11, scope: !27)
!32 = !DILocation(line: 20, column: 1, scope: !27)
