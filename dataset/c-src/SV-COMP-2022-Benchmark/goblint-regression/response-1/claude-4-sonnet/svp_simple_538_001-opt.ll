; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_538_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_538_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common local_unnamed_addr global i32 0, align 4, !dbg !0
@debug = common local_unnamed_addr global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_538_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !15 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !22
  %4 = load i32, i32* @myglobal, align 4, !dbg !23
  %5 = add nsw i32 %4, 1, !dbg !24
  store i32 %5, i32* %3, align 4, !dbg !22
  %6 = load i32, i32* %3, align 4, !dbg !25
  store i32 %6, i32* @myglobal, align 4, !dbg !26
  store i32 3, i32* @debug, align 4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_538_001_main() local_unnamed_addr #0 !dbg !29 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* @debug, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %1, metadata !33, metadata !DIExpression()), !dbg !34
  %3 = load i32, i32* @myglobal, align 4, !dbg !35
  %4 = add nsw i32 %3, 1, !dbg !36
  store i32 %4, i32* %1, align 4, !dbg !34
  %5 = load i32, i32* %1, align 4, !dbg !37
  store i32 %5, i32* @myglobal, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %2, metadata !39, metadata !DIExpression()), !dbg !40
  %6 = load i32, i32* @debug, align 4, !dbg !41
  %7 = add nsw i32 %6, 1, !dbg !42
  store i32 %7, i32* %2, align 4, !dbg !40
  %8 = load i32, i32* %2, align 4, !dbg !43
  store i32 %8, i32* @debug, align 4, !dbg !44
  ret i32 0, !dbg !45
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !8, line: 1, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_538_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "debug", scope: !2, file: !8, line: 2, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_538_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{!"clang version 10.0.0 "}
!15 = distinct !DISubprogram(name: "svp_simple_538_001_isr_1", scope: !8, file: !8, line: 4, type: !16, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!19 = !DILocalVariable(name: "arg", arg: 1, scope: !15, file: !8, line: 4, type: !18)
!20 = !DILocation(line: 4, column: 37, scope: !15)
!21 = !DILocalVariable(name: "tmp", scope: !15, file: !8, line: 5, type: !9)
!22 = !DILocation(line: 5, column: 7, scope: !15)
!23 = !DILocation(line: 5, column: 11, scope: !15)
!24 = !DILocation(line: 5, column: 19, scope: !15)
!25 = !DILocation(line: 6, column: 14, scope: !15)
!26 = !DILocation(line: 6, column: 12, scope: !15)
!27 = !DILocation(line: 9, column: 9, scope: !15)
!28 = !DILocation(line: 11, column: 1, scope: !15)
!29 = distinct !DISubprogram(name: "svp_simple_538_001_main", scope: !8, file: !8, line: 13, type: !30, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{!9}
!32 = !DILocation(line: 15, column: 9, scope: !29)
!33 = !DILocalVariable(name: "tmp", scope: !29, file: !8, line: 17, type: !9)
!34 = !DILocation(line: 17, column: 7, scope: !29)
!35 = !DILocation(line: 17, column: 11, scope: !29)
!36 = !DILocation(line: 17, column: 19, scope: !29)
!37 = !DILocation(line: 18, column: 14, scope: !29)
!38 = !DILocation(line: 18, column: 12, scope: !29)
!39 = !DILocalVariable(name: "tmp1", scope: !29, file: !8, line: 21, type: !9)
!40 = !DILocation(line: 21, column: 7, scope: !29)
!41 = !DILocation(line: 21, column: 12, scope: !29)
!42 = !DILocation(line: 21, column: 17, scope: !29)
!43 = !DILocation(line: 22, column: 11, scope: !29)
!44 = !DILocation(line: 22, column: 9, scope: !29)
!45 = !DILocation(line: 24, column: 3, scope: !29)
