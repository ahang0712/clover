; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_500_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_500_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_500_001_isr_1(i8* %0) #0 !dbg !13 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %3, metadata !19, metadata !DIExpression()), !dbg !20
  %4 = load i32, i32* @glob, align 4, !dbg !21
  %5 = add nsw i32 %4, 1, !dbg !22
  store i32 %5, i32* %3, align 4, !dbg !20
  %6 = load i32, i32* %3, align 4, !dbg !23
  store i32 %6, i32* @glob, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_500_001_main() #0 !dbg !26 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = load i32, i32* @glob, align 4, !dbg !31
  %3 = add nsw i32 %2, 1, !dbg !32
  store i32 %3, i32* %1, align 4, !dbg !30
  %4 = load i32, i32* %1, align 4, !dbg !33
  store i32 %4, i32* @glob, align 4, !dbg !34
  ret i32 0, !dbg !35
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 3, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_500_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_500_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "svp_simple_500_001_isr_1", scope: !6, file: !6, line: 5, type: !14, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "arg", arg: 1, scope: !13, file: !6, line: 5, type: !16)
!18 = !DILocation(line: 5, column: 37, scope: !13)
!19 = !DILocalVariable(name: "tmp", scope: !13, file: !6, line: 6, type: !7)
!20 = !DILocation(line: 6, column: 7, scope: !13)
!21 = !DILocation(line: 6, column: 13, scope: !13)
!22 = !DILocation(line: 6, column: 18, scope: !13)
!23 = !DILocation(line: 7, column: 10, scope: !13)
!24 = !DILocation(line: 7, column: 8, scope: !13)
!25 = !DILocation(line: 10, column: 1, scope: !13)
!26 = distinct !DISubprogram(name: "svp_simple_500_001_main", scope: !6, file: !6, line: 12, type: !27, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{!7}
!29 = !DILocalVariable(name: "tmp", scope: !26, file: !6, line: 13, type: !7)
!30 = !DILocation(line: 13, column: 7, scope: !26)
!31 = !DILocation(line: 13, column: 13, scope: !26)
!32 = !DILocation(line: 13, column: 18, scope: !26)
!33 = !DILocation(line: 14, column: 10, scope: !26)
!34 = !DILocation(line: 14, column: 8, scope: !26)
!35 = !DILocation(line: 16, column: 3, scope: !26)
