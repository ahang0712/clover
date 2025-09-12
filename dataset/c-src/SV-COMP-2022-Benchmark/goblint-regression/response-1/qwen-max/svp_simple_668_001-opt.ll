; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/qwen-max/svp_simple_668_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_668_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@g1 = common local_unnamed_addr global i32 0, align 4, !dbg !0
@g2 = common local_unnamed_addr global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_668_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !16 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* @g1, align 4, !dbg !22
  %call = call i32 (i32, ...) bitcast (i32 (...)* @access to i32 (i32, ...)*)(i32 %0), !dbg !23
  %1 = load i32, i32* @g2, align 4, !dbg !24
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @access to i32 (i32, ...)*)(i32 %1), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @access(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_668_001_main() local_unnamed_addr #0 !dbg !27 {
entry:
  %0 = load i32, i32* @g1, align 4, !dbg !30
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %0), !dbg !31
  %1 = load i32, i32* @g1, align 4, !dbg !32
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %1), !dbg !33
  %2 = load i32, i32* @g2, align 4, !dbg !34
  %call2 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %2), !dbg !35
  %3 = load i32, i32* @g1, align 4, !dbg !36
  %call3 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %3), !dbg !37
  ret i32 0, !dbg !38
}

declare i32 @assert_racefree(...) local_unnamed_addr #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g1", scope: !2, file: !8, line: 1, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_668_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g2", scope: !2, file: !8, line: 1, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_668_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "svp_simple_668_001_isr_1", scope: !8, file: !8, line: 3, type: !17, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "arg", arg: 1, scope: !16, file: !8, line: 3, type: !19)
!21 = !DILocation(line: 3, column: 37, scope: !16)
!22 = !DILocation(line: 5, column: 10, scope: !16)
!23 = !DILocation(line: 5, column: 3, scope: !16)
!24 = !DILocation(line: 7, column: 10, scope: !16)
!25 = !DILocation(line: 7, column: 3, scope: !16)
!26 = !DILocation(line: 9, column: 1, scope: !16)
!27 = distinct !DISubprogram(name: "svp_simple_668_001_main", scope: !8, file: !8, line: 11, type: !28, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{!9}
!30 = !DILocation(line: 13, column: 19, scope: !27)
!31 = !DILocation(line: 13, column: 3, scope: !27)
!32 = !DILocation(line: 15, column: 19, scope: !27)
!33 = !DILocation(line: 15, column: 3, scope: !27)
!34 = !DILocation(line: 16, column: 19, scope: !27)
!35 = !DILocation(line: 16, column: 3, scope: !27)
!36 = !DILocation(line: 19, column: 19, scope: !27)
!37 = !DILocation(line: 19, column: 3, scope: !27)
!38 = !DILocation(line: 22, column: 3, scope: !27)
