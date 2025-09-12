; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_519_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_519_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [20 x i8] c"myglobal equals %dn\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_519_001_isr_1(i8* %0) #0 !dbg !14 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !18, metadata !DIExpression()), !dbg !19
  %3 = load i32, i32* @myglobal, align 4, !dbg !20
  %4 = add nsw i32 %3, 1, !dbg !21
  store i32 %4, i32* @myglobal, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @add1(i32 %0) #0 !dbg !24 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !27, metadata !DIExpression()), !dbg !28
  %3 = load i32, i32* %2, align 4, !dbg !29
  %4 = add nsw i32 %3, 1, !dbg !30
  ret i32 %4, !dbg !31
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_519_001_main() #0 !dbg !32 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !35
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !36
  %3 = load i32, i32* @myglobal, align 4, !dbg !37
  %4 = call i32 @add1(i32 %3), !dbg !38
  ret i32 0, !dbg !39
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 2, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_519_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_519_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "svp_simple_519_001_isr_1", scope: !6, file: !6, line: 5, type: !15, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "arg", arg: 1, scope: !14, file: !6, line: 5, type: !17)
!19 = !DILocation(line: 5, column: 37, scope: !14)
!20 = !DILocation(line: 6, column: 12, scope: !14)
!21 = !DILocation(line: 6, column: 20, scope: !14)
!22 = !DILocation(line: 6, column: 11, scope: !14)
!23 = !DILocation(line: 7, column: 1, scope: !14)
!24 = distinct !DISubprogram(name: "add1", scope: !6, file: !6, line: 9, type: !25, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{!7, !7}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !6, line: 9, type: !7)
!28 = !DILocation(line: 9, column: 15, scope: !24)
!29 = !DILocation(line: 10, column: 10, scope: !24)
!30 = !DILocation(line: 10, column: 11, scope: !24)
!31 = !DILocation(line: 10, column: 3, scope: !24)
!32 = distinct !DISubprogram(name: "svp_simple_519_001_main", scope: !6, file: !6, line: 13, type: !33, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{!7}
!35 = !DILocation(line: 15, column: 32, scope: !32)
!36 = !DILocation(line: 15, column: 3, scope: !32)
!37 = !DILocation(line: 17, column: 8, scope: !32)
!38 = !DILocation(line: 17, column: 3, scope: !32)
!39 = !DILocation(line: 19, column: 3, scope: !32)
