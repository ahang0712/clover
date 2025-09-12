; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_016/svp_simple_016_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_016/svp_simple_016_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_016_001_global_var1 = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_016_001_main() #0 !dbg !15 {
  %1 = alloca i32, align 4
  call void (...) @init(), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %1, metadata !19, metadata !DIExpression()), !dbg !20
  store volatile i32 1, i32* @svp_simple_016_001_global_var1, align 4, !dbg !21
  %2 = load volatile i32, i32* @svp_simple_016_001_global_var1, align 4, !dbg !22
  %3 = load volatile i32, i32* @svp_simple_016_001_global_var1, align 4, !dbg !23
  %4 = add nsw i32 %2, %3, !dbg !24
  %5 = load volatile i32, i32* @svp_simple_016_001_global_var1, align 4, !dbg !25
  %6 = add nsw i32 %4, %5, !dbg !26
  store i32 %6, i32* %1, align 4, !dbg !27
  ret void, !dbg !28
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_016_001_isr_1() #0 !dbg !29 {
  call void (...) @idlerun(), !dbg !30
  store volatile i32 9, i32* @svp_simple_016_001_global_var1, align 4, !dbg !31
  ret void, !dbg !32
}

declare void @idlerun(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_016_001_global_var1", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_016/svp_simple_016_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_016/svp_simple_016_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "svp_simple_016_001_main", scope: !6, file: !6, line: 6, type: !16, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 7, column: 3, scope: !15)
!19 = !DILocalVariable(name: "reader1", scope: !15, file: !6, line: 8, type: !8)
!20 = !DILocation(line: 8, column: 7, scope: !15)
!21 = !DILocation(line: 9, column: 34, scope: !15)
!22 = !DILocation(line: 10, column: 13, scope: !15)
!23 = !DILocation(line: 11, column: 13, scope: !15)
!24 = !DILocation(line: 10, column: 44, scope: !15)
!25 = !DILocation(line: 12, column: 13, scope: !15)
!26 = !DILocation(line: 11, column: 44, scope: !15)
!27 = !DILocation(line: 10, column: 11, scope: !15)
!28 = !DILocation(line: 14, column: 1, scope: !15)
!29 = distinct !DISubprogram(name: "svp_simple_016_001_isr_1", scope: !6, file: !6, line: 16, type: !16, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DILocation(line: 17, column: 3, scope: !29)
!31 = !DILocation(line: 18, column: 34, scope: !29)
!32 = !DILocation(line: 19, column: 1, scope: !29)
