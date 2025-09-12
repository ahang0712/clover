; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/claude-4-sonnet/svp_simple_522_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_522_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common local_unnamed_addr global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"How do you do?n\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Hello!n\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_522_001_isr_1(i8* %0) local_unnamed_addr #0 !dbg !13 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !17, metadata !DIExpression()), !dbg !18
  %3 = load i32, i32* @myglobal, align 4, !dbg !19
  %4 = icmp ne i32 %3, 0, !dbg !19
  br i1 %4, label %5, label %7, !dbg !21

5:                                                ; preds = %1
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !22
  br label %7, !dbg !22

7:                                                ; preds = %5, %1
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_522_001_main() local_unnamed_addr #0 !dbg !24 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !29
  store i32 %2, i32* %1, align 4, !dbg !28
  %3 = load i32, i32* %1, align 4, !dbg !30
  store i32 %3, i32* @myglobal, align 4, !dbg !31
  %4 = load i32, i32* @myglobal, align 4, !dbg !32
  %5 = icmp ne i32 %4, 0, !dbg !32
  br i1 %5, label %6, label %8, !dbg !34

6:                                                ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !35
  br label %8, !dbg !35

8:                                                ; preds = %6, %0
  ret i32 0, !dbg !36
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 6, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_522_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_522_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "svp_simple_522_001_isr_1", scope: !6, file: !6, line: 9, type: !14, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "arg", arg: 1, scope: !13, file: !6, line: 9, type: !16)
!18 = !DILocation(line: 9, column: 37, scope: !13)
!19 = !DILocation(line: 10, column: 7, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !6, line: 10, column: 7)
!21 = !DILocation(line: 10, column: 7, scope: !13)
!22 = !DILocation(line: 11, column: 5, scope: !20)
!23 = !DILocation(line: 12, column: 1, scope: !13)
!24 = distinct !DISubprogram(name: "svp_simple_522_001_main", scope: !6, file: !6, line: 14, type: !25, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{!7}
!27 = !DILocalVariable(name: "k", scope: !24, file: !6, line: 16, type: !7)
!28 = !DILocation(line: 16, column: 7, scope: !24)
!29 = !DILocation(line: 16, column: 11, scope: !24)
!30 = !DILocation(line: 17, column: 14, scope: !24)
!31 = !DILocation(line: 17, column: 12, scope: !24)
!32 = !DILocation(line: 19, column: 7, scope: !33)
!33 = distinct !DILexicalBlock(scope: !24, file: !6, line: 19, column: 7)
!34 = !DILocation(line: 19, column: 7, scope: !24)
!35 = !DILocation(line: 20, column: 5, scope: !33)
!36 = !DILocation(line: 21, column: 3, scope: !24)
