; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_023/svp_simple_023_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_023/svp_simple_023_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_023_001_global_var = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_023_001_main() #0 !dbg !15 {
  call void @svp_simple_023_001_init(), !dbg !18
  %1 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !19
  call void @svp_simple_023_001_func_1(i32 %1), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_023_001_func_1(i32 %0) #0 !dbg !22 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !25, metadata !DIExpression()), !dbg !26
  %3 = load i32, i32* %2, align 4, !dbg !27
  %4 = icmp sgt i32 %3, 0, !dbg !29
  br i1 %4, label %5, label %11, !dbg !30

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4, !dbg !31
  %7 = icmp slt i32 %6, 12, !dbg !32
  br i1 %7, label %8, label %11, !dbg !33

8:                                                ; preds = %5
  %9 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !34
  %10 = add nsw i32 %9, 1, !dbg !36
  store volatile i32 %10, i32* @svp_simple_023_001_global_var, align 4, !dbg !37
  br label %11, !dbg !38

11:                                               ; preds = %8, %5, %1
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_023_001_init() #0 !dbg !40 {
  call void (...) @init(), !dbg !41
  ret void, !dbg !42
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_023_001_isr_1() #0 !dbg !43 {
  store volatile i32 0, i32* @svp_simple_023_001_global_var, align 4, !dbg !44
  ret void, !dbg !45
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_023_001_global_var", scope: !2, file: !6, line: 4, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_023/svp_simple_023_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_023/svp_simple_023_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !6, file: !6, line: 8, type: !16, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 9, column: 3, scope: !15)
!19 = !DILocation(line: 10, column: 29, scope: !15)
!20 = !DILocation(line: 10, column: 3, scope: !15)
!21 = !DILocation(line: 11, column: 1, scope: !15)
!22 = distinct !DISubprogram(name: "svp_simple_023_001_func_1", scope: !6, file: !6, line: 18, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !8}
!25 = !DILocalVariable(name: "var", arg: 1, scope: !22, file: !6, line: 18, type: !8)
!26 = !DILocation(line: 18, column: 36, scope: !22)
!27 = !DILocation(line: 19, column: 7, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !6, line: 19, column: 7)
!29 = !DILocation(line: 19, column: 11, scope: !28)
!30 = !DILocation(line: 19, column: 15, scope: !28)
!31 = !DILocation(line: 19, column: 18, scope: !28)
!32 = !DILocation(line: 19, column: 22, scope: !28)
!33 = !DILocation(line: 19, column: 7, scope: !22)
!34 = !DILocation(line: 20, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !6, line: 19, column: 28)
!36 = !DILocation(line: 20, column: 67, scope: !35)
!37 = !DILocation(line: 20, column: 35, scope: !35)
!38 = !DILocation(line: 21, column: 3, scope: !35)
!39 = !DILocation(line: 22, column: 1, scope: !22)
!40 = distinct !DISubprogram(name: "svp_simple_023_001_init", scope: !6, file: !6, line: 12, type: !16, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 15, column: 3, scope: !40)
!42 = !DILocation(line: 16, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "svp_simple_023_001_isr_1", scope: !6, file: !6, line: 23, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 24, column: 33, scope: !43)
!45 = !DILocation(line: 25, column: 1, scope: !43)
