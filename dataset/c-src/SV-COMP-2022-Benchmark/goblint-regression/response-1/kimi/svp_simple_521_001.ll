; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_521_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_521_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [14 x i8] c"Do the work? \00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_521_001_isr_1(i8* %0) #0 !dbg !14 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !18, metadata !DIExpression()), !dbg !19
  %3 = load i32, i32* @glob, align 4, !dbg !20
  %4 = add nsw i32 %3, 1, !dbg !20
  store i32 %4, i32* @glob, align 4, !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_521_001_main() #0 !dbg !22 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !27
  store i32 %2, i32* %1, align 4, !dbg !26
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)), !dbg !28
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0)), !dbg !29
  %5 = load i32, i32* %1, align 4, !dbg !30
  %6 = add nsw i32 %5, 1, !dbg !30
  store i32 %6, i32* %1, align 4, !dbg !30
  %7 = load i32, i32* %1, align 4, !dbg !31
  %8 = sub nsw i32 %7, 1, !dbg !33
  %9 = icmp ne i32 %8, 0, !dbg !33
  br i1 %9, label %10, label %13, !dbg !34

10:                                               ; preds = %0
  %11 = load i32, i32* @glob, align 4, !dbg !35
  %12 = add nsw i32 %11, 1, !dbg !35
  store i32 %12, i32* @glob, align 4, !dbg !35
  br label %13, !dbg !36

13:                                               ; preds = %10, %0
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i64 0, i64 0)), !dbg !37
  %15 = load i32, i32* %1, align 4, !dbg !38
  %16 = add nsw i32 %15, -1, !dbg !38
  store i32 %16, i32* %1, align 4, !dbg !38
  ret i32 0, !dbg !39
}

declare i32 @__VERIFIER_nondet_int(...) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 6, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_521_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_521_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "svp_simple_521_001_isr_1", scope: !6, file: !6, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "arg", arg: 1, scope: !14, file: !6, line: 9, type: !17)
!19 = !DILocation(line: 9, column: 37, scope: !14)
!20 = !DILocation(line: 11, column: 7, scope: !14)
!21 = !DILocation(line: 13, column: 1, scope: !14)
!22 = distinct !DISubprogram(name: "svp_simple_521_001_main", scope: !6, file: !6, line: 15, type: !23, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!7}
!25 = !DILocalVariable(name: "i", scope: !22, file: !6, line: 16, type: !7)
!26 = !DILocation(line: 16, column: 7, scope: !22)
!27 = !DILocation(line: 16, column: 11, scope: !22)
!28 = !DILocation(line: 19, column: 3, scope: !22)
!29 = !DILocation(line: 21, column: 3, scope: !22)
!30 = !DILocation(line: 22, column: 4, scope: !22)
!31 = !DILocation(line: 23, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !6, line: 23, column: 7)
!33 = !DILocation(line: 23, column: 8, scope: !32)
!34 = !DILocation(line: 23, column: 7, scope: !22)
!35 = !DILocation(line: 24, column: 9, scope: !32)
!36 = !DILocation(line: 24, column: 5, scope: !32)
!37 = !DILocation(line: 25, column: 3, scope: !22)
!38 = !DILocation(line: 26, column: 4, scope: !22)
!39 = !DILocation(line: 29, column: 3, scope: !22)
