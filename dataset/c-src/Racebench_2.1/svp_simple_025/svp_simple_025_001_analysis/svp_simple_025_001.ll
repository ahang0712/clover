; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_025/svp_simple_025_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_025/svp_simple_025_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_025_001_global_var = common global i32 0, align 4, !dbg !0
@svp_simple_025_001_global_array = common global [100 x i32*] zeroinitializer, align 16, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_025_001_main() #0 !dbg !21 {
  call void @svp_simple_025_001_init(), !dbg !24
  call void @svp_simple_025_001_func_1(i32* @svp_simple_025_001_global_var), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_025_001_func_1(i32* %0) #0 !dbg !27 {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  call void @llvm.dbg.declare(metadata i32** %2, metadata !31, metadata !DIExpression()), !dbg !32
  %3 = load i32*, i32** %2, align 8, !dbg !33
  %4 = load i32, i32* %3, align 4, !dbg !34
  %5 = add nsw i32 %4, 1, !dbg !35
  %6 = load i32*, i32** %2, align 8, !dbg !36
  store i32 %5, i32* %6, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_025_001_init() #0 !dbg !39 {
  call void (...) @init(), !dbg !40
  ret void, !dbg !41
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_025_001_isr_1() #0 !dbg !42 {
  store volatile i32 0, i32* @svp_simple_025_001_global_var, align 4, !dbg !43
  ret void, !dbg !44
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_025_001_global_var", scope: !2, file: !8, line: 4, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_025/svp_simple_025_001.c", directory: "/Users/hehang03/code/clover/agent/ablation_experiments/ablation_2_expert_plan")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_025_001_global_array", scope: !2, file: !8, line: 5, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/Racebench_2.1/svp_simple_025/svp_simple_025_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 6400, elements: !13)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !12)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DISubrange(count: 100)
!15 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{!"clang version 10.0.0 "}
!21 = distinct !DISubprogram(name: "svp_simple_025_001_main", scope: !8, file: !8, line: 9, type: !22, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocation(line: 10, column: 3, scope: !21)
!25 = !DILocation(line: 11, column: 3, scope: !21)
!26 = !DILocation(line: 12, column: 1, scope: !21)
!27 = distinct !DISubprogram(name: "svp_simple_025_001_func_1", scope: !8, file: !8, line: 19, type: !28, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !30}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!31 = !DILocalVariable(name: "ptr_var", arg: 1, scope: !27, file: !8, line: 19, type: !30)
!32 = !DILocation(line: 19, column: 37, scope: !27)
!33 = !DILocation(line: 20, column: 15, scope: !27)
!34 = !DILocation(line: 20, column: 14, scope: !27)
!35 = !DILocation(line: 20, column: 23, scope: !27)
!36 = !DILocation(line: 20, column: 4, scope: !27)
!37 = !DILocation(line: 20, column: 12, scope: !27)
!38 = !DILocation(line: 21, column: 1, scope: !27)
!39 = distinct !DISubprogram(name: "svp_simple_025_001_init", scope: !8, file: !8, line: 13, type: !22, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 16, column: 3, scope: !39)
!41 = !DILocation(line: 17, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "svp_simple_025_001_isr_1", scope: !8, file: !8, line: 22, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 23, column: 33, scope: !42)
!44 = !DILocation(line: 24, column: 1, scope: !42)
