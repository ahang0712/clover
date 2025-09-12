; ModuleID = 'svp_simple_538_001.c'
source_filename = "svp_simple_538_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0
@debug = common global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_538_001_isr_1(i8* %0) #0 !dbg !14 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !21
  %4 = load i32, i32* @myglobal, align 4, !dbg !22
  %5 = add nsw i32 %4, 1, !dbg !23
  store i32 %5, i32* %3, align 4, !dbg !21
  %6 = load i32, i32* %3, align 4, !dbg !24
  store i32 %6, i32* @myglobal, align 4, !dbg !25
  store i32 3, i32* @debug, align 4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_538_001_main() #0 !dbg !28 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* @debug, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %1, metadata !32, metadata !DIExpression()), !dbg !33
  %3 = load i32, i32* @myglobal, align 4, !dbg !34
  %4 = add nsw i32 %3, 1, !dbg !35
  store i32 %4, i32* %1, align 4, !dbg !33
  %5 = load i32, i32* %1, align 4, !dbg !36
  store i32 %5, i32* @myglobal, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %2, metadata !38, metadata !DIExpression()), !dbg !39
  %6 = load i32, i32* @debug, align 4, !dbg !40
  %7 = add nsw i32 %6, 1, !dbg !41
  store i32 %7, i32* %2, align 4, !dbg !39
  %8 = load i32, i32* %2, align 4, !dbg !42
  store i32 %8, i32* @debug, align 4, !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_538_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "debug", scope: !2, file: !3, line: 2, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "svp_simple_538_001_isr_1", scope: !3, file: !3, line: 4, type: !15, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "arg", arg: 1, scope: !14, file: !3, line: 4, type: !17)
!19 = !DILocation(line: 4, column: 37, scope: !14)
!20 = !DILocalVariable(name: "tmp", scope: !14, file: !3, line: 5, type: !8)
!21 = !DILocation(line: 5, column: 7, scope: !14)
!22 = !DILocation(line: 5, column: 11, scope: !14)
!23 = !DILocation(line: 5, column: 19, scope: !14)
!24 = !DILocation(line: 6, column: 14, scope: !14)
!25 = !DILocation(line: 6, column: 12, scope: !14)
!26 = !DILocation(line: 9, column: 9, scope: !14)
!27 = !DILocation(line: 11, column: 1, scope: !14)
!28 = distinct !DISubprogram(name: "svp_simple_538_001_main", scope: !3, file: !3, line: 13, type: !29, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{!8}
!31 = !DILocation(line: 15, column: 9, scope: !28)
!32 = !DILocalVariable(name: "tmp", scope: !28, file: !3, line: 17, type: !8)
!33 = !DILocation(line: 17, column: 7, scope: !28)
!34 = !DILocation(line: 17, column: 11, scope: !28)
!35 = !DILocation(line: 17, column: 19, scope: !28)
!36 = !DILocation(line: 18, column: 14, scope: !28)
!37 = !DILocation(line: 18, column: 12, scope: !28)
!38 = !DILocalVariable(name: "tmp1", scope: !28, file: !3, line: 21, type: !8)
!39 = !DILocation(line: 21, column: 7, scope: !28)
!40 = !DILocation(line: 21, column: 12, scope: !28)
!41 = !DILocation(line: 21, column: 17, scope: !28)
!42 = !DILocation(line: 22, column: 11, scope: !28)
!43 = !DILocation(line: 22, column: 9, scope: !28)
!44 = !DILocation(line: 24, column: 3, scope: !28)
