; ModuleID = '../Highlight/test_12.c'
source_filename = "../Highlight/test_12.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_012_001_global_var = common global i32 0, align 4, !dbg !0
@svp_simple_012_001_global_pointer = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_012_001_main() #0 !dbg !15 {
entry:
  %p = alloca i32*, align 8
  call void (...) @init(), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %p, metadata !19, metadata !DIExpression()), !dbg !21
  store i32* @svp_simple_012_001_global_var, i32** %p, align 8, !dbg !21
  store i32 1, i32* @svp_simple_012_001_global_var, align 4, !dbg !22
  %0 = load i32*, i32** %p, align 8, !dbg !23
  store i32 2, i32* %0, align 4, !dbg !24
  ret void, !dbg !25
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_012_001_isr_1() #0 !dbg !26 {
entry:
  %reader1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %reader1, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @svp_simple_012_001_global_var, align 4, !dbg !29
  store i32 %0, i32* %reader1, align 4, !dbg !30
  ret void, !dbg !31
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_012_001_global_var", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "../Highlight/test_12.c", directory: "/Users/hehang03/code/clover/tool/Operation_Analyzer")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_012_001_global_pointer", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !3, file: !3, line: 8, type: !16, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocation(line: 9, column: 3, scope: !15)
!19 = !DILocalVariable(name: "p", scope: !15, file: !3, line: 10, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!21 = !DILocation(line: 10, column: 8, scope: !15)
!22 = !DILocation(line: 12, column: 33, scope: !15)
!23 = !DILocation(line: 14, column: 4, scope: !15)
!24 = !DILocation(line: 14, column: 6, scope: !15)
!25 = !DILocation(line: 15, column: 1, scope: !15)
!26 = distinct !DISubprogram(name: "svp_simple_012_001_isr_1", scope: !3, file: !3, line: 17, type: !16, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DILocalVariable(name: "reader1", scope: !26, file: !3, line: 18, type: !8)
!28 = !DILocation(line: 18, column: 7, scope: !26)
!29 = !DILocation(line: 19, column: 13, scope: !26)
!30 = !DILocation(line: 19, column: 11, scope: !26)
!31 = !DILocation(line: 20, column: 1, scope: !26)
